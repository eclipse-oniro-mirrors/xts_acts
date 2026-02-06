/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "Player.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "lppCallback.h"
#include "video_encoder.h"
#include <bits/alltypes.h>
#include <netinet/tcp.h>
#include <queue>

#undef LOG_TAG
#define LOG_TAG "player"

namespace {
constexpr int BALANCE_VALUE = 5;
using namespace std::chrono_literals;
static const int MS_TO_S = 1000;
constexpr int64_t WAIT_TIME_US_THRESHOLD_WARNING = -1 * 40 * 1000; // warning threshold 40ms
constexpr int64_t WAIT_TIME_US_THRESHOLD = 1 * 1000 * 1000;        // max sleep time 1s
constexpr int64_t SINK_TIME_US_THRESHOLD = 100000;                 // max sink time 100ms
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;                          // 2 bytes per sample
constexpr double VSYNC_TIME = 1000 / 60;                           // frame time
constexpr double LIP_SYNC_BALANCE_VALUE = 2;                       // the balance value of sync sound and picture
constexpr int32_t MAX_BUFFER_SIZE = 2 * 1024 * 1024;
constexpr int64_t WAIT_OUT_TIME = 50000; // 等待时间MS
constexpr int32_t VIDEO_FRAME_COUNT = 5; // 视频聚包帧数
const int BUFFER_INFO_TYPE = 11; // 假设11表示某种缓冲区类型
enum AVSinkState {
    IDLE,
    INIT,
    PREPARED,
    PLAYING,
    PAUSE,
    STOP,
};
} // namespace

Player::~Player() { Player::StartRelease(); }

bool Player::Intercept()
{
    if (demuxer_ == nullptr || lppVideoStreamer_ == nullptr || lppAudioStreamer_ == nullptr) {
        return true;
    }
    return false;
}

int32_t Player::CreateLppSet()
{
    AVCODEC_SAMPLE_LOGW("CreateLppSet Set IN");
    
    if (!sampleInfo_.isInit) {
        return 0;
    }
    std::unique_lock<std::mutex> lock(mutex_);
    if (demuxer_ == nullptr) {
        demuxer_ = std::make_unique<Demuxer>();
    }
    int32_t ret = demuxer_->Create(sampleInfo_);

    AVCODEC_SAMPLE_LOGW("CreateLppSet Set OUT");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::SyncAudio()
{
    int retSync = lppVideoStreamer_->SetSyncAudioStreamer(lppAudioStreamer_->lppAudioStreamer_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetSyncAudioStreamer retSync:::%{public}d", retSync);
    isReleased_ = false;
    isStarted_ = true;
    if (lppVideoContext_) {
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start");
        if (lppVideoDataNeededThread_ == nullptr) {
            lppVideoDataNeededThread_ = std::make_unique<std::thread>(&Player::LppVideoDataNeededThread, this);
        }
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread END");
    }
    if (lppContext_) {
        AVCODEC_SAMPLE_LOGE("Create audioThread Start");
        if (LppDataNeededThread_ == nullptr) {
            LppDataNeededThread_ = std::make_unique<std::thread>(&Player::LppDataNeededThread1, this);
        }
        AVCODEC_SAMPLE_LOGE("Create audioThread END");
    }
    return retSync;
}

int32_t Player::CreateLppAudioStreamer()
{
    AVCODEC_SAMPLE_LOGW("Create IN");
    if (lppAudioStreamer_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("lppAudioStreamer_ is Release, should init");
        return -1;
    }
    lppAudioStreamer_->Create(sampleInfo_.audioCodecMime);
    lppContext_ = new LppUserData;
    lppAudioStreamer_->SetCallback(lppContext_);
    AVCODEC_SAMPLE_LOGW("Create OUT");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::CreateLppAudioStreamerNull()
{
    AVCODEC_SAMPLE_LOGW("Create IN");
    lppAudioStreamer_->Create("");
    lppContext_ = new LppUserData;
    AVCODEC_SAMPLE_LOGW("Create OUT");
    return -1;
}

int32_t Player::AudioStreamerSetParameter()
{
    int32_t ret = lppAudioStreamer_->SetParameter(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetParameter ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerGetParameter()
{
    int32_t ret = lppAudioStreamer_->GetParameter(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ getParameter ret:::%{public}d", ret);
    return ret;
}

int32_t Player::AudioStreamerConfigure()
{
    int32_t ret = lppAudioStreamer_->Configure(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Configure ret:::%{public}d", ret);
    return ret;
}

int32_t Player::AudioStreamerPrepare()
{
    int32_t ret = lppAudioStreamer_->Prepare();
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Prepare ret:::%{public}d", ret);
    return ret;
}

int32_t Player::AudioSetErrorCallback()
{
    int32_t ret = lppAudioStreamer_->SetErrorCallback(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetErrorCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerSetCallbackCreateNull()
{
    int32_t ret = lppAudioStreamer_->SetCallbackCreateNull(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetCallbackCreateNull ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerSetCallbackCreate()
{
    int32_t ret = lppAudioStreamer_->SetCallbackCreate(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetCallbackCreate ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerSetDataNeededListener()
{
    int32_t ret = lppAudioStreamer_->SetDataNeededListener(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetDataNeededListener ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerSetPositionUpdateListener()
{
    int32_t ret = lppAudioStreamer_->SetPositionUpdateListener(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetPositionUpdateListener ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioStreamerSetCallback()
{
    int32_t ret = lppAudioStreamer_->SetCallback(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioSetInterruptListener()
{
    int32_t ret = lppAudioStreamer_->SetInterruptListener(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetInterruptListener ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioSetEosCallback()
{
    int32_t ret = lppAudioStreamer_->SetEosCallback(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetEosCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioSetOnDeviceChanged()
{
    int32_t ret = lppAudioStreamer_->SetOnDeviceChanged(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetOnDeviceChanged ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioreturnFrames()
{
    int32_t ret = lppAudioStreamer_->returnFrames(lppContext_);
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ returnFrames ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioCallbackDestroy()
{
    int32_t ret = lppAudioStreamer_->CallbackDestroy();
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ CallbackDestroy ret:::%{public}d", ret);
    return ret;
}
int32_t Player::AudioDestroy()
{
    int32_t ret = lppAudioStreamer_->Destroy();
    AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Destroy ret:::%{public}d", ret);
    return ret;
}

int32_t Player::CreateLppVideoStreamer()
{
    AVCODEC_SAMPLE_LOGW("Create IN");
    if (lppVideoStreamer_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("lppVideoStreamer_ is Release, should init");
        return -1;
    }
    AVCODEC_SAMPLE_LOGI("QZM FORMAT : %{public}s", sampleInfo_.videoCodecMime.c_str());
    sampleInfo_.window = NativeXComponentSample::PluginManager::GetInstance()->pluginWindow_;
//     video/avc
    lppVideoStreamer_->Create(sampleInfo_.videoCodecMime.c_str());
    lppVideoContext_ = new LppUserData;
    int64_t durationNum = 100012;
    lppVideoContext_->num = durationNum;
    int32_t ret = lppVideoStreamer_->SetCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetCallback ret:::%{public}d", ret);
    ret = lppVideoStreamer_->SetErrorCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetErrorCallback ret:::%{public}d", ret);
    ret = lppVideoStreamer_->SetFirstFrameDecodedCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetFirstFrameDecoded ret:::%{public}d", ret);
    AVCODEC_SAMPLE_LOGW("Create OUT");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::CreateLppVideoStreamerNull()
{
    AVCODEC_SAMPLE_LOGW("Create IN");
    AVCODEC_SAMPLE_LOGI("QZM FORMAT : %{public}s", sampleInfo_.videoCodecMime.c_str());
    sampleInfo_.window = NativeXComponentSample::PluginManager::GetInstance()->pluginWindow_;
//     video/avc
    lppVideoStreamer_->Create("");
    lppVideoContext_ = new LppUserData;
    int64_t durationNum = 100012;
    lppVideoContext_->num = durationNum;
    AVCODEC_SAMPLE_LOGW("Create OUT");
    return -1;
}

int32_t Player::VideoStreamerSetCallbackCreateNull()
{
    int32_t ret = lppVideoStreamer_->SetCallbackCreateNull(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetCallbackCreateNull ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetDataNeededListener()
{
    int32_t ret = lppVideoStreamer_->SetDataNeededListener(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetDataNeededListener ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetStreamChangedListener()
{
    int32_t ret = lppVideoStreamer_->SetStreamChangedListener(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetStreamChangedListener ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetCallback()
{
    int32_t ret = lppVideoStreamer_->SetCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetErrorCallback()
{
    int32_t ret = lppVideoStreamer_->SetErrorCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetErrorCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetFirstFrameDecodedCallback()
{
    int32_t ret = lppVideoStreamer_->SetFirstFrameDecodedCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetFirstFrameDecodedCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetRenderStartCallback()
{
    int32_t ret = lppVideoStreamer_->SetRenderStartCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetRenderStartCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetEosCallback()
{
    int32_t ret = lppVideoStreamer_->SetEosCallback(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetEosCallback ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerCallbackDestroy()
{
    int32_t ret = lppVideoStreamer_->CallbackDestroy();
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ CallbackDestroy ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerDestroy()
{
    int32_t ret = lppVideoStreamer_->Destroy();
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Destroy ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerreturnFrames()
{
    int32_t ret = lppVideoStreamer_->returnFrames(lppVideoContext_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ returnFrames ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetTargetStartFrame()
{
    AVCODEC_SAMPLE_LOGI("============== Seek ACC IN ===============");
    int64_t targetPts = LIP_SYNC_BALANCE_VALUE * 1000;
    AVCODEC_SAMPLE_LOGI("SetTargetStartFrame %{public}ld", targetPts);
    int ret = 0;
    // 给视频设置回调和TargetPts
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->SetTargetStartFrame(targetPts, LppCallback::OnTargetArrived, WAIT_OUT_TIME,
                                                         lppVideoContext_);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetTargetStartFrame ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGI("============== Seek ACC OUT ===============");
    return ret;
}
int32_t Player::VideoStreamerConfigure()
{
    int32_t ret = lppVideoStreamer_->Configure(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Configure ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetParameter()
{
    int32_t ret = lppVideoStreamer_->SetParameter(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetParameter ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerGetParameter()
{
    int32_t ret = lppVideoStreamer_->GetParameter(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ GetParameter ret:::%{public}d", ret);
    return ret;
}
int32_t Player::VideoStreamerSetSurface()
{
    int32_t ret = lppVideoStreamer_->SetVideoSurface(sampleInfo_);
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetVideoSurface ret:::%{public}d", ret);
    return ret;
}

int32_t Player::VideoStreamerPrepare()
{
    int32_t ret = lppVideoStreamer_->Prepare();
    AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Prepare ret:::%{public}d", ret);
    return ret;
}

int32_t Player::VideoSetErrorCallback()
{
    int32_t ret = lppVideoStreamer_->SetErrorCallback(lppVideoContext_);
    return ret;
}
int32_t Player::Init(SampleInfo &sampleInfo)
{
    Stop();
    Reset();
    Release();
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    sampleInfo_ = sampleInfo;
    sampleInfo_.isInit = true;
    CHECK_AND_RETURN_RET_LOG(demuxer_ == nullptr && videoDecoder_ == nullptr && audioDecoder_ == nullptr,
                             AVCODEC_SAMPLE_ERR_ERROR, "Already started.");

    videoDecoder_ = std::make_unique<VideoDecoder>();
    audioDecoder_ = std::make_unique<AudioDecoder>();
    demuxer_ = std::make_unique<Demuxer>();
    AVCODEC_SAMPLE_LOGI("Create lppAudioStreamer_ Init SUCC");
    lppAudioStreamer_ = std::make_shared<LppAudioStreamer>();
    lppVideoStreamer_ = std::make_shared<LppVideoStreamer>();

    isReleased_ = false;
    AVCODEC_SAMPLE_LOGI("Init Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::Configure()
{
    CreatePrepare();
    Start1();
    return 0;
}

int32_t Player::CreatePrepare()
{
    AVCODEC_SAMPLE_LOGW("Prepare IN");
    if (!sampleInfo_.isInit) {
        return 0;
    }
    std::unique_lock<std::mutex> lock(mutex_);
    if (demuxer_ == nullptr) {
        demuxer_ = std::make_unique<Demuxer>();
    }
    int32_t ret = demuxer_->Create(sampleInfo_);

    CreateLppAudioStreamer();
    AudioStreamerConfigure();

    CreateLppVideoStreamer();
    VideoStreamerConfigure();
    VideoStreamerSetSurface();
    
    int retSync = lppVideoStreamer_->SetSyncAudioStreamer(lppAudioStreamer_->lppAudioStreamer_);
    VideoStreamerPrepare();
    AudioStreamerPrepare();

    isReleased_ = false;

    isStarted_ = true;
    if (lppVideoContext_) {
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start");
        if (lppVideoDataNeededThread_ == nullptr) {
            lppVideoDataNeededThread_ = std::make_unique<std::thread>(&Player::LppVideoDataNeededThread, this);
        }
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread END");
    }
    if (lppContext_) {
        AVCODEC_SAMPLE_LOGE("Create audioThread Start");
        if (LppDataNeededThread_ == nullptr) {
            LppDataNeededThread_ = std::make_unique<std::thread>(&Player::LppDataNeededThread1, this);
        }
        AVCODEC_SAMPLE_LOGE("Create audioThread END");
    }
    AVCODEC_SAMPLE_LOGW("Prepare OUT");
    return 0;
}

int32_t Player::Start()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    int32_t ret;
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    AVCODEC_SAMPLE_LOGW("aStart IN");
    isStarted_ = true;
    if (lppContext_) {
        AVCODEC_SAMPLE_LOGE("Create thread Start");
        ret = lppAudioStreamer_->Start();
        LppDataNeededThread_ = std::make_unique<std::thread>(&Player::LppDataNeededThread1, this);
        AVCODEC_SAMPLE_LOGE("Create thread END");
    }

    if (lppVideoContext_) {
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start");
        ret = lppVideoStreamer_->StartDecode(true);
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start1");
        ret = lppVideoStreamer_->StartRender();
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start2");
        isStarted_ = true;
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start3");
        lppVideoDataNeededThread_ = std::make_unique<std::thread>(&Player::LppVideoDataNeededThread, this);
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread END");
    }

    AVCODEC_SAMPLE_LOGI("Succeed");
    doneCond_.notify_all();
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartDecoder()
{
    isStarted_ = true;
    int32_t ret;
    if (lppVideoContext_) {
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread Start");
        ret = lppVideoStreamer_->StartDecode(true);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ StartDecode ret:::%{public}d", ret);
        AVCODEC_SAMPLE_LOGE("Create lppVideo thread END");
    }
    return ret;
}

int32_t Player::RenderFirstFrame()
{
    int32_t retVideo;
    if (lppVideoContext_ && lppVideoStreamer_) {
        AVCODEC_SAMPLE_LOGE("RenderFirstFrame Start");
        retVideo = lppVideoStreamer_->RenderFirstFrame();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ RenderFirstFrame retVideo:::%{public}d", retVideo);
        AVCODEC_SAMPLE_LOGE("RenderFirstFrame END");
    }
    return retVideo;
}

int32_t Player::StartRender()
{
    isStarted_ = true;
    int32_t ret;
    if (lppVideoContext_ && lppVideoStreamer_) {
        AVCODEC_SAMPLE_LOGE("StartRender Start");
        ret = lppVideoStreamer_->StartRender();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ StartRender ret:::%{public}d", ret);
        AVCODEC_SAMPLE_LOGE("StartRender END");
    }
    return ret;
}

int32_t Player::StartAudio()
{
    isStarted_ = true;
    int32_t ret;
    if (lppContext_) {
        AVCODEC_SAMPLE_LOGE("Create audioThread Start");
        ret = lppAudioStreamer_->Start();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Start ret:::%{public}d", ret);
        AVCODEC_SAMPLE_LOGE("Create audioThread END");
    }
    return ret;
}

int32_t Player::Start1()
{
    StartDecoder();
    usleep(WAIT_OUT_TIME);
    RenderFirstFrame();
    StartRender();
    StartAudio();
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::Stop()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("stop in");
    isStarted_ = false;
    int32_t ret;
    int32_t retVideo;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Stop();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Stop ret:::%{public}d", ret);
    }
    if (lppVideoStreamer_ != nullptr) {
        retVideo = lppVideoStreamer_->Stop();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Stop retVideo:::%{public}d", retVideo);
    }
    if (retVideo != AVCODEC_SAMPLE_ERR_OK) {
        ret = retVideo;
    }
    AVCODEC_SAMPLE_LOGW("stop out");
    lock.unlock();
    return ret;
}

int32_t Player::AudioStop()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("AudioStop in");
    isStarted_ = false;
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Stop();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Stop ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("AudioStop out");
    lock.unlock();
    return ret;
}

int32_t Player::VideoStop()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("VideoStop in");
    isStarted_ = false;
    int32_t ret;
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Stop();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Stop ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("VideoStop out");
    lock.unlock();
    return ret;
}

int32_t Player::Reset()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    isStarted_ = false;
    int32_t ret;
    int32_t retVideo;
    ReleaseThread();
    AVCODEC_SAMPLE_LOGW("reset in1");
    if (demuxer_ != nullptr) {
        demuxer_->Release();
        demuxer_.reset();
    }
    AVCODEC_SAMPLE_LOGW("reset in");
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Reset();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Reset ret:::%{public}d", ret);
    }
    if (lppVideoStreamer_ != nullptr) {
        retVideo = lppVideoStreamer_->Reset();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Reset retVideo:::%{public}d", retVideo);
    }
    if (retVideo != AVCODEC_SAMPLE_ERR_OK) {
        ret = retVideo;
    }
    AVCODEC_SAMPLE_LOGW("reset out");
    lock.unlock();
    return ret;
}

int32_t Player::AudioReset()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    isStarted_ = false;
    int32_t ret;
    ReleaseThread();
    AVCODEC_SAMPLE_LOGW("reset in1");
    if (demuxer_ != nullptr) {
        demuxer_->Release();
        demuxer_.reset();
    }
    AVCODEC_SAMPLE_LOGW("reset in");
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Reset();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Reset ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("reset out");
    lock.unlock();
    return ret;
}
int32_t Player::VideoReset()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    isStarted_ = false;
    int32_t ret;
    ReleaseThread();
    AVCODEC_SAMPLE_LOGW("reset in1");
    if (demuxer_ != nullptr) {
        demuxer_->Release();
        demuxer_.reset();
    }
    AVCODEC_SAMPLE_LOGW("reset in");
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Reset();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Reset ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("reset out");
    lock.unlock();
    return ret;
}

int32_t Player::Pause()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Pause in");
    int32_t ret;
    int32_t retVideo;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Pause();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Pause ret:::%{public}d", ret);
    }
    if (lppVideoStreamer_ != nullptr) {
        retVideo = lppVideoStreamer_->Pause();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Pause retVideo:::%{public}d", retVideo);
    }
    if (retVideo != AVCODEC_SAMPLE_ERR_OK) {
        ret = retVideo;
    }
    AVCODEC_SAMPLE_LOGW("Pause out");
    lock.unlock();
    return ret;
}

int32_t Player::AudioPause()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Pause in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Pause();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Pause ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Pause out");
    lock.unlock();
    return ret;
}

int32_t Player::VideoPause()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Pause in");
    int32_t ret;
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Pause();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Pause ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Pause out");
    lock.unlock();
    return ret;
}

int32_t Player::Resume()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Resume in");
    int32_t ret;
    int32_t retVideo;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Resume();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Resume ret:::%{public}d", ret);
    }
    if (lppVideoStreamer_ != nullptr) {
        retVideo = lppVideoStreamer_->Resume();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Resume retVideo:::%{public}d", retVideo);
    }
    if (retVideo != AVCODEC_SAMPLE_ERR_OK) {
        ret = retVideo;
    }
    AVCODEC_SAMPLE_LOGW("Resume out");
    lock.unlock();
    return ret;
}
int32_t Player::AudioResume()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Resume in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Resume();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Resume ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Resume out");
    lock.unlock();
    return ret;
}
int32_t Player::VideoResume()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Resume in");
    int32_t ret;
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Resume();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Resume ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Resume out");
    lock.unlock();
    return ret;
}

int32_t Player::Start2()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Resume in");
    if (lppAudioStreamer_ != nullptr) {
        lppAudioStreamer_->Start();
    }
    if (lppVideoStreamer_ != nullptr) {
        lppVideoStreamer_->Resume();
    }
    AVCODEC_SAMPLE_LOGW("Resume out");
    lock.unlock();
    return 0;
}

int32_t Player::Flush()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Flush in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Flush();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Flush ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Flush out1");
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Flush();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Flush ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Flush out2");
    lock.unlock();
    return ret;
}
int32_t Player::AudioFlush()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Flush in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->Flush();
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ Flush ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Flush out1");
    lock.unlock();
    return ret;
}
int32_t Player::VideoFlush()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("Flush in");
    int32_t ret;
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->Flush();
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Flush ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("Flush out2");
    lock.unlock();
    return ret;
}

int32_t Player::SetSpeed(double speed)
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("SetSpeed in");
    int32_t ret;
    int32_t retVideo;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->SetPlayBackSpeed(speed);
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetPlayBackSpeed ret:::%{public}d", ret);
    }
    if (lppVideoStreamer_ != nullptr) {
        retVideo = lppVideoStreamer_->SetPlaybackSpeed(speed);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetPlayBackSpeed retVideo:::%{public}d", retVideo);
    }
    if (retVideo != AVCODEC_SAMPLE_ERR_OK) {
        ret = retVideo;
    }
    AVCODEC_SAMPLE_LOGW("SetSpeed out");
    lock.unlock();
    return ret;
}
int32_t Player::SetAudioSpeed(double speed)
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("SetSpeed in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->SetPlayBackSpeed(speed);
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ SetPlayBackSpeed ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("SetSpeed out");
    lock.unlock();
    return ret;
}
int32_t Player::SetVideoSpeed(double speed)
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("SetSpeed in");
    int32_t ret;
    if (lppVideoStreamer_ != nullptr) {
        ret = lppVideoStreamer_->SetPlaybackSpeed(speed);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetPlayBackSpeed ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("SetSpeed out");
    lock.unlock();
    return ret;
}

int32_t Player::SetVolume(double volume)
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGW("SetVolume in");
    int32_t ret;
    if (lppAudioStreamer_ != nullptr) {
        ret = lppAudioStreamer_->SetVolume(volume);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetVolume ret:::%{public}d", ret);
    }
    AVCODEC_SAMPLE_LOGW("SetVolume out");
    lock.unlock();
    return ret;
}

// pause/flush/seek/resume
int32_t Player::Seek(int64_t seekTime, int32_t mode, bool acc)
{
    auto start = std::chrono::high_resolution_clock::now();
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    int64_t durationTime = 1000;
    if (sampleInfo_.duration < seekTime * durationTime) {
        AVCODEC_SAMPLE_LOGI("Seek over duration %{public}ld", sampleInfo_.duration);
        return 0;
    }
    Pause();
    std::unique_lock<std::mutex> lock(mutex_);
    AVCODEC_SAMPLE_LOGW("Seek in");
    OH_AVSeekMode enumNum = static_cast<OH_AVSeekMode>(mode);
    AVCODEC_SAMPLE_LOGI("OH_AVSeekMode  %{public}d", mode);
    demuxer_->Seek(seekTime, enumNum);

    // Seek后唤醒
    {
        std::unique_lock<std::mutex> eosFlagMutexLock(lppContext_->eosFlagMutex);
        lppContext_->eosFlag_ = false;
        AVCODEC_SAMPLE_LOGI("AUDIO eosFlag_ %{public}d", lppContext_->eosFlag_);
        lppContext_->eosCond_.notify_all();
        eosFlagMutexLock.unlock();
    }
    {
        std::unique_lock<std::mutex> eosFlagMutexLock(lppVideoContext_->eosFlagMutex);
        lppVideoContext_->eosFlag_ = false;
        AVCODEC_SAMPLE_LOGI("VIDEO eosFlag_ %{public}d", lppContext_->eosFlag_);
        lppVideoContext_->eosCond_.notify_all();
        eosFlagMutexLock.unlock();
    }

    AVCODEC_SAMPLE_LOGW("Seek out");
    lock.unlock();
    AVCODEC_SAMPLE_LOGW("Seek out1");
    Flush();
    AVCODEC_SAMPLE_LOGW("Seek out2");
    Start2();
    AVCODEC_SAMPLE_LOGW("Seek out3");
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    AVCODEC_SAMPLE_LOGI("seek duration %lld", duration);
    return 0;
}

int64_t Player::ReadToAudioTargetPts(int64_t targetPts)
{

    OH_AVBuffer *avbuffer = OH_AVBuffer_Create(MAX_BUFFER_SIZE);
    CodecBufferInfo bufferInfo(BUFFER_INFO_TYPE, avbuffer);
    while (true) {
        demuxer_->ReadSample(demuxer_->GetAudioTrackId(), reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer),
                             bufferInfo.attr);
        if (targetPts <= bufferInfo.attr.pts) {
            break;
        }
        if (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            break;
        }
    }
    return bufferInfo.attr.pts;
}

int32_t Player::Seek(int64_t seekTime, int32_t mode)
{
    CHECK_AND_RETURN_RET_LOG(!Intercept(), AVCODEC_SAMPLE_ERR_ERROR, "Intercept nullptr.");
    int64_t durationTime = 1000;
    if (sampleInfo_.duration < seekTime * durationTime) {
        AVCODEC_SAMPLE_LOGI("Seek over duration %{public}ld", sampleInfo_.duration);
        return 0;
    }
    lppSeekThread_ = std::make_unique<std::thread>(&Player::SeekInner, this, seekTime, mode);
    lppSeekThread_->join();
    return 0;
}

void Player::SeekInner(int64_t seekTime, int32_t mode)
{
    AVCODEC_SAMPLE_LOGI("============== Seek ACC IN ===============");
    int64_t targetPts = seekTime * 1000;
    AVCODEC_SAMPLE_LOGI("SetTargetStartFrame %{public}ld", targetPts);
    // 暂停
    Pause();
    // Flush
    Flush();
    // seek
    demuxer_->Seek(seekTime, SEEK_MODE_PREVIOUS_SYNC);
    // 音频读取到对应帧
    ReadToAudioTargetPts(targetPts);
    // 给视频设置回调和TargetPts
    if (lppVideoStreamer_ != nullptr) {
        int ret = lppVideoStreamer_->SetTargetStartFrame(targetPts, LppCallback::OnTargetArrived, WAIT_OUT_TIME,
                                                         lppVideoContext_);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ SetTargetStartFrame ret:::%{public}d", ret);
        lppVideoStreamer_->Resume();
    }
    // 等待返回
    std::unique_lock<std::mutex> lock(lppVideoContext_->seekMutex_);

    lppVideoContext_->seekReturn_ = false;
    lock.unlock();
    // 返回成功，启动音频
    if (lppAudioStreamer_ != nullptr) {
        lppAudioStreamer_->Start();
    }
    AVCODEC_SAMPLE_LOGI("============== Seek ACC OUT ===============");
}

void Player::StartRelease()
{
    CHECK_AND_RETURN_LOG(!Intercept(), "Intercept nullptr.");
    AVCODEC_SAMPLE_LOGI("StartRelease");
    std::unique_lock<std::mutex> lock(doneMutex);
    if (audioRenderer_) {
        OH_AudioRenderer_Stop(audioRenderer_);
    }
    if (!isReleased_) {
        isReleased_ = true;
        Release();
    }
    lock.unlock();
}

int64_t Player::GetDurationTime()
{
    AVCODEC_SAMPLE_LOGI("GetDurationTime %{public}ld", sampleInfo_.duration);
    return sampleInfo_.duration;
}

int64_t Player::GetProgressTime()
{
    if (lppContext_ == nullptr) {
        return 0;
    }
    AVCODEC_SAMPLE_LOGI("GetProgressTime position %{public}ld", lppContext_->position);
    int64_t tmp = sampleInfo_.duration / 1000000 < (lppContext_->position / 1000)
                      ? sampleInfo_.duration
                      : ((lppContext_->position / 1000) * 1000000);
    return tmp;
}

void Player::ReleaseThread()
{
    if (lppContext_) {
        std::unique_lock<std::mutex> eosFlagMutexLock(lppContext_->eosFlagMutex);
        lppContext_->eosFlag_ = false;
        lppContext_->eosCond_.notify_all();
        eosFlagMutexLock.unlock();
        std::unique_lock<std::mutex> lock(lppContext_->inputMutex);
        lppContext_->returnFrame = true;
        lppContext_->inputCond.notify_all();
        lock.unlock();
    }

    if (lppVideoContext_) {
        std::unique_lock<std::mutex> eosFlagMutexLock(lppVideoContext_->eosFlagMutex);
        lppVideoContext_->eosFlag_ = false;
        lppVideoContext_->eosCond_.notify_all();
        eosFlagMutexLock.unlock();
        std::unique_lock<std::mutex> lockVideo(lppVideoContext_->inputMutex);
        lppVideoContext_->returnFrame = true;
        lppVideoContext_->inputCond.notify_all();
        lockVideo.unlock();
    }
    if (LppDataNeededThread_ && LppDataNeededThread_->joinable()) {
        LppDataNeededThread_->join();
        LppDataNeededThread_.reset();
    }
    if (lppVideoDataNeededThread_ && lppVideoDataNeededThread_->joinable()) {
        lppVideoDataNeededThread_->join();
        lppVideoDataNeededThread_.reset();
    }
}

void Player::Release()
{
    std::lock_guard<std::mutex> lock(mutex_);
    isStarted_ = false;
    isAudioDone = false;
    isVideoDone = false;
    // 清空队列
    while (audioDecContext_ && !audioDecContext_->renderQueue.empty()) {
        audioDecContext_->renderQueue.pop();
    }
    if (audioRenderer_ != nullptr) {
        OH_AudioRenderer_Release(audioRenderer_);
        audioRenderer_ = nullptr;
    }
#ifdef DEBUG_DECODE
    if (audioOutputFile_.is_open()) {
        audioOutputFile_.close();
    }
#endif
    ReleaseThread();

    if (demuxer_ != nullptr) {
        demuxer_->Release();
        demuxer_.reset();
    }
    if (videoDecoder_ != nullptr) {
        videoDecoder_->Release();
        videoDecoder_.reset();
    }
    if (audioDecoder_ != nullptr) {
        audioDecoder_->Release();
        audioDecoder_.reset();
    }
    if (lppAudioStreamer_ != nullptr) {
        lppAudioStreamer_->Release();
        lppAudioStreamer_.reset();
    }
    if (lppVideoStreamer_ != nullptr) {
        lppVideoStreamer_->Release();
        lppVideoStreamer_.reset();
    }
    ReleaseDone();
    if (builder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
    }
    doneCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Succeed");
}

void Player::ReleaseDone()
{
    if (videoDecContext_ != nullptr) {
        delete videoDecContext_;
        videoDecContext_ = nullptr;
    }
    if (audioDecContext_ != nullptr) {
        delete audioDecContext_;
        audioDecContext_ = nullptr;
    }
    if (lppContext_ != nullptr) {
        delete lppContext_;
        lppContext_ = nullptr;
    }
    if (lppVideoContext_ != nullptr) {
        delete lppVideoContext_;
        lppVideoContext_ = nullptr;
    }
}

void Player::LppDataNeededThread1()
{
    int32_t totalSize = 4467270;
    AVCODEC_SAMPLE_LOGI("====== AVBUFFER1234 CREATE ======");
    OH_AVBuffer *avbuffer = OH_AVBuffer_Create(totalSize);
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        // 到达EOS帧后不再送数据，直到Seek
        std::unique_lock<std::mutex> eosLock(lppContext_->eosMutex);
        lppContext_->eosCond_.wait_for(eosLock, 150000s, [this]() { return !lppContext_->eosFlag_; });
        eosLock.unlock();
        // 等待数据回调到达
        std::unique_lock<std::mutex> lock(lppContext_->inputMutex);
        lppContext_->inputCond.wait_for(lock, 150000s, [this]() { return lppContext_->returnFrame; });
        lppContext_->returnFrame = false;
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        lppContext_->count = 1;
        // 聚包数量
        int count = 10;
        while (count > 0) {
            CHECK_AND_BREAK_LOG(!lppContext_->eosFlag_, "AUDIO is EOS");
            count--;
            CodecBufferInfo bufferInfo(BUFFER_INFO_TYPE, avbuffer);
            demuxer_->ReadSample(demuxer_->GetAudioTrackId(), reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer),
                                 bufferInfo.attr);
            AVCODEC_SAMPLE_LOGI("size %{public}d", bufferInfo.attr.size);
            AVCODEC_SAMPLE_LOGI("pts %{public}ld", bufferInfo.attr.pts);
            this->progress = bufferInfo.attr.pts;
            int32_t remain = OH_AVSamplesBuffer_GetRemainedCapacity(lppContext_->framePacket_);
            AVCODEC_SAMPLE_LOGI("remain %{public}d", remain);
            AVCODEC_SAMPLE_LOGI("count %{public}d", count);
            AVCODEC_SAMPLE_LOGI("AUDIO  pts %{public}ld", bufferInfo.attr.pts);
            // EOS帧置位
            if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS)) {
                AVCODEC_SAMPLE_LOGI("Catch EOS, audio thread out");
                OH_AVBuffer_SetBufferAttr(reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer), &bufferInfo.attr);
                std::unique_lock<std::mutex> eosFlagMutexLock(lppContext_->eosFlagMutex);
                lppContext_->eosFlag_ = true;
                AVCODEC_SAMPLE_LOGI("AUDIO eosFlag_ %{public}d", lppContext_->eosFlag_);
                eosFlagMutexLock.unlock();
            }
            OH_AVSamplesBuffer_AppendOneBuffer(lppContext_->framePacket_,
                                               reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer));
        }
        usleep(BALANCE_VALUE);
        usleep(BALANCE_VALUE);
        int ret = lppAudioStreamer_->returnFrames(lppContext_);
        AVCODEC_SAMPLE_LOGW("lppAudioStreamer_ returnFrames ret:::%{public}d", ret);
        // 一次回调处理完再下一次
        lock.unlock();
    }
    AVCODEC_SAMPLE_LOGI("====== AVBUFFER1234 DESTROY ======");
    OH_AVBuffer_Destroy(avbuffer);
}

void Player::LppVideoDataNeededThread()
{
    bool eosFlag = 0;
    int32_t totalSize = 4467270;
    AVCODEC_SAMPLE_LOGI("====== AVBUFFER1234 CREATE1 ======");
    OH_AVBuffer *avbuffer = OH_AVBuffer_Create(totalSize);
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> eosLock(lppVideoContext_->eosMutex);
        lppVideoContext_->eosCond_.wait_for(eosLock, 150000s, [this]() { return !lppVideoContext_->eosFlag_; });
        std::unique_lock<std::mutex> lock(lppVideoContext_->inputMutex);
        lppVideoContext_->inputCond.wait_for(lock, 150000s, [this]() { return lppVideoContext_->returnFrame; });
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        lppVideoContext_->returnFrame = false;
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        lppVideoContext_->count = VIDEO_FRAME_COUNT;
        AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread count %{public}d", lppVideoContext_->count);
        while (lppVideoContext_->count > 0) {
            CHECK_AND_BREAK_LOG(!lppVideoContext_->eosFlag_, "VIDEO is EOS");
            CodecBufferInfo bufferInfo(BUFFER_INFO_TYPE, avbuffer);
            demuxer_->ReadSample(demuxer_->GetVideoTrackId(), reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer),
                                 bufferInfo.attr);
            AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread ptsacc %{public}ld", bufferInfo.attr.pts);
            int32_t remain = OH_AVSamplesBuffer_GetRemainedCapacity(lppVideoContext_->framePacket_);
            if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS)) {
                AVCODEC_SAMPLE_LOGI("Catch EOS, video thread out");
                OH_AVBuffer_SetBufferAttr(reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer), &bufferInfo.attr);
                std::unique_lock<std::mutex> eosFlagMutexLock(lppVideoContext_->eosFlagMutex);
                lppVideoContext_->eosFlag_ = true;
                AVCODEC_SAMPLE_LOGI("VIDEO eosFlag_ %{public}d", lppContext_->eosFlag_);
                eosFlagMutexLock.unlock();
            }
            OH_AVSamplesBuffer_AppendOneBuffer(lppVideoContext_->framePacket_,
                                               reinterpret_cast<OH_AVBuffer *>(bufferInfo.buffer));
            lppVideoContext_->count--;
            AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread count %{public}d", lppVideoContext_->count);
        }
        AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread returnFrames");
        AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread count %{public}d", lppVideoContext_->count);
        if (lppVideoContext_->count == VIDEO_FRAME_COUNT) {
            continue;
        }
        int ret = lppVideoStreamer_->returnFrames(lppVideoContext_);
        AVCODEC_SAMPLE_LOGI("LppVideoDataNeededThread returnFrames end");
        lock.unlock();
    }
    AVCODEC_SAMPLE_LOGI("====== AVBUFFER1234 DESTROY1 ======");
    OH_AVBuffer_Destroy(avbuffer);
}
