/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "lpp_video_streamer.h"
#include "lppCallback.h"
#include "multimedia/player_framework/lowpower_audio_sink.h"
#include "multimedia/player_framework/lowpower_audio_sink_base.h"
#include "multimedia/player_framework/lowpower_video_sink.h"
#include "multimedia/player_framework/lowpower_video_sink_base.h"
#include <js_native_api_types.h>

#undef LOG_TAG
#define LOG_TAG "LppVideoStreamer"

LppVideoStreamer::~LppVideoStreamer()
{
    if (lppVideoStreamer_ != nullptr) {
        Release();
    }
}

int32_t LppVideoStreamer::Create(const std::string &codecMime)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Create ======");
    lppVideoStreamer_ = OH_LowPowerVideoSink_CreateByMime(codecMime.c_str());
    CHECK_AND_RETURN_RET_LOG(lppVideoStreamer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t LppVideoStreamer::SetCallbackCreateNull(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetCallbackCreateNull ======");
    int32_t ret = AV_ERR_OK;
    lppVideoStreamerCallback_ = OH_LowPowerVideoSinkCallback_Create();
    lppVideoStreamerCallback_ = nullptr;
    ret = OH_LowPowerVideoSink_RegisterCallback(lppVideoStreamer_, lppVideoStreamerCallback_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSink_RegisterCallback ret:::%{public}d ", ret);
    return ret;
}
int32_t LppVideoStreamer::SetDataNeededListener(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetCallback ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetDataNeededListener(lppVideoStreamerCallback_,
        LppCallback::OnDataNeededVideo, lppUserData);
    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSinkCallback_SetDataNeededListener ret:::%{public}d ", ret);
    return ret;
}
int32_t LppVideoStreamer::SetStreamChangedListener(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetStreamChangedListener ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetStreamChangedListener(
        lppVideoStreamerCallback_, LppCallback::OH_LowPowerVideoSink_OnStreamChanged, lppUserData);
    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSinkCallback_SetStreamChangedListener ret:::%{public}d ", ret);
    return ret;
}
int32_t LppVideoStreamer::SetCallback(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetCallback ======");
    int32_t ret = AV_ERR_OK;
    lppVideoStreamerCallback_ = OH_LowPowerVideoSinkCallback_Create();
    ret = OH_LowPowerVideoSinkCallback_SetDataNeededListener(lppVideoStreamerCallback_,
        LppCallback::OnDataNeededVideo, lppUserData);
    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSinkCallback_SetDataNeededListener ret:::%{public}d ", ret);
    ret = OH_LowPowerVideoSinkCallback_SetStreamChangedListener(
        lppVideoStreamerCallback_, LppCallback::OH_LowPowerVideoSink_OnStreamChanged, lppUserData);
    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSinkCallback_SetStreamChangedListener ret:::%{public}d ", ret);
    ret = OH_LowPowerVideoSink_RegisterCallback(lppVideoStreamer_, lppVideoStreamerCallback_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("OH_LowPowerVideoSink_RegisterCallback ret:::%{public}d ", ret);
    return ret;
}

int32_t LppVideoStreamer::SetErrorCallback(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetErrorCallback ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetErrorListener(lppVideoStreamerCallback_,
        LppCallback::OnVideoError, lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("OnVideoError ret:::%{public}d ", ret);
    return ret;
}

int32_t LppVideoStreamer::SetRenderStartCallback(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetRenderStartCallback ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetRenderStartListener(lppVideoStreamerCallback_,
        LppCallback::OnRenderStarted, lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("OnRenderStarted ret:::%{public}d ", ret);
    return ret;
}

int32_t LppVideoStreamer::SetFirstFrameDecodedCallback(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetFirstFrameDecodedCallback ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener(lppVideoStreamerCallback_,
        LppCallback::OnEos, lppUserData);

    AVCODEC_SAMPLE_LOGI("OnEos ret:::%{public}d ", ret);
    return ret;
}

int32_t LppVideoStreamer::SetEosCallback(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetEosCallback ======");
    int32_t ret = AV_ERR_OK;
    ret = OH_LowPowerVideoSinkCallback_SetEosListener(lppVideoStreamerCallback_, LppCallback::OnEos,
                                                      lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("OnEos ret:::%{public}d ", ret);
    return ret;
}

int32_t LppVideoStreamer::Configure(const SampleInfo &sampleInfo)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Configure ======");
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, sampleInfo.rotation);

    AVCODEC_SAMPLE_LOGI("====== VideoDecoder config ======");
    AVCODEC_SAMPLE_LOGI("%{public}d*%{public}d, %{public}.1ffps, qzmmm%{public}d,%{public}d", sampleInfo.videoWidth,
                        sampleInfo.videoHeight, sampleInfo.frameRate, sampleInfo.pixelFormat, sampleInfo.rotation);
    AVCODEC_SAMPLE_LOGI("====== VideoDecoder config ======");
    int ret = OH_LowPowerVideoSink_Configure(lppVideoStreamer_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Configure failed, ret::: %{public}d", ret);
    return ret;
}

int32_t LppVideoStreamer::returnFrames(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ returnFrames ======");
    int ret = OH_LowPowerVideoSink_ReturnSamples(lppVideoStreamer_, lppUserData->framePacket_);
    return ret;
}

int32_t LppVideoStreamer::SetParameter(const SampleInfo &sampleInfo)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetParameter ======");
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, sampleInfo.rotation);
    AVCODEC_SAMPLE_LOGI("====== VideoDecoder config ======");
    AVCODEC_SAMPLE_LOGI("%{public}d*%{public}d, %{public}.1ffps", sampleInfo.videoWidth, sampleInfo.videoHeight,
                        sampleInfo.frameRate);
    AVCODEC_SAMPLE_LOGI("====== VideoDecoder config ======");
    int ret = OH_LowPowerVideoSink_SetParameter(lppVideoStreamer_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Configure failed, ret::: %{public}d", ret);
    return ret;
}
int32_t LppVideoStreamer::GetParameter(const SampleInfo &sampleInfo)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ GetParameter ======");
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");
    int ret = OH_LowPowerVideoSink_GetParameter(lppVideoStreamer_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Configure failed, ret::: %{public}d", ret);
    return ret;
}

int32_t LppVideoStreamer::Prepare()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Prepare ======");
    int ret = OH_LowPowerVideoSink_Prepare(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::Resume()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Resume ======");
    int ret = OH_LowPowerVideoSink_Resume(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::Flush()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Flush ======");
    int ret = OH_LowPowerVideoSink_Flush(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::Stop()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Stop ======");
    int ret = OH_LowPowerVideoSink_Stop(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::Reset()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Reset ======");
    AVCODEC_SAMPLE_LOGI("reset in4");
    int ret = OH_LowPowerVideoSink_Reset(lppVideoStreamer_);
    AVCODEC_SAMPLE_LOGI("reset in5");
    return ret;
}

int32_t LppVideoStreamer::Destroy()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Destroy ======");
    int ret = OH_LowPowerVideoSink_Destroy(lppVideoStreamer_);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ Destroy ret:::%{public}d", ret);
    lppVideoStreamer_ = nullptr;
    return ret;
}

int32_t LppVideoStreamer::CallbackDestroy()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ CallbackDestroy ======");
    int ret = OH_LowPowerVideoSinkCallback_Destroy(lppVideoStreamerCallback_);
        AVCODEC_SAMPLE_LOGW("lppVideoStreamer_ CallbackDestroy ret:::%{public}d", ret);
    lppVideoStreamerCallback_ = nullptr;
    return ret;
}

int32_t LppVideoStreamer::StartDecode(bool flag)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ StartDecode ======");
    int ret = OH_LowPowerVideoSink_StartDecoder(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::StartRender()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ StartRender ======");
    int ret =  OH_LowPowerVideoSink_StartRenderer(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::Pause()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ Pause ======");
    int ret = OH_LowPowerVideoSink_Pause(lppVideoStreamer_);
    return ret;
}

int32_t LppVideoStreamer::SetVideoSurface(const SampleInfo &sampleInfo)
{
    int ret = 1;
    if (sampleInfo.window != nullptr) {
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetVideoSurface ======");
        ret =OH_LowPowerVideoSink_SetVideoSurface(lppVideoStreamer_, sampleInfo.window);
    }
    return ret;
}

int32_t LppVideoStreamer::SetSyncAudioStreamer(OH_LowPowerAudioSink *audioStreamer)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetSyncAudioStreamer ======");
    int ret = OH_LowPowerVideoSink_SetSyncAudioSink(lppVideoStreamer_, audioStreamer);
    return ret;
}

int32_t LppVideoStreamer::SetTargetStartFrame(const int64_t framePts,
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived,
    const int64_t timeoutMs, LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetTargetStartFrame ======");
    int ret = OH_LowPowerVideoSink_SetTargetStartFrame(lppVideoStreamer_,
        framePts, onTargetArrived, timeoutMs, lppUserData);
    return ret;
}

int32_t LppVideoStreamer::SetPlaybackSpeed(const float speed)
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ SetPlaybackSpeed ======");
    int ret = OH_LowPowerVideoSink_SetPlaybackSpeed(lppVideoStreamer_, speed);
    return ret;
}

int32_t LppVideoStreamer::Release()
{
    Destroy();
    CallbackDestroy();
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t LppVideoStreamer::RenderFirstFrame()
{
    AVCODEC_SAMPLE_LOGI("====== lppVideoStreamer_ RenderFirstFrame ======");
    int ret = OH_LowPowerVideoSink_RenderFirstFrame(lppVideoStreamer_);
    return ret;
}
