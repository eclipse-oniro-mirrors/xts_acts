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

#include "lpp_audio_streamer.h"
#include "lppCallback.h"
#include "multimedia/player_framework/lowpower_audio_sink.h"
#include "multimedia/player_framework/lowpower_audio_sink_base.h"

#undef LOG_TAG
#define LOG_TAG "LppAudioStreamer"

LppAudioStreamer::~LppAudioStreamer()
{
    if (lppAudioStreamer_ != nullptr) {
        AVCODEC_SAMPLE_LOGI("lppAudioStreamer_  is nullptr");
        Release();
    }
}

int32_t LppAudioStreamer::Create(const std::string &codecMime)
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Create ======");
    lppAudioStreamer_ = OH_LowPowerAudioSink_CreateByMime(codecMime.c_str());
    AVCODEC_SAMPLE_LOGI("codecMime.c_str()  %{public}s", codecMime.c_str());
    CHECK_AND_RETURN_RET_LOG(lppAudioStreamer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t LppAudioStreamer::SetCallbackCreateNull(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetCallbackCreateNull ======");
    lppAudioStreamerCallback_ = OH_LowPowerAudioSinkCallback_Create();
    lppAudioStreamerCallback_ = nullptr;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ RegisterCallbackNull ======");
    ret = OH_LowPowerAudioSink_RegisterCallback(lppAudioStreamer_, lppAudioStreamerCallback_);
    AVCODEC_SAMPLE_LOGI("RegisterCallbackNull ret:::%{public}d ", ret);
    return ret;
}
int32_t LppAudioStreamer::SetCallbackCreate(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetCallbackCreate ======");
    lppAudioStreamerCallback_ = OH_LowPowerAudioSinkCallback_Create();
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ RegisterCallback ======");
    ret = OH_LowPowerAudioSink_RegisterCallback(lppAudioStreamer_, lppAudioStreamerCallback_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("RegisterCallback ret:::%{public}d ", ret);
    return ret;
}
int32_t LppAudioStreamer::SetDataNeededListener(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetDataNeededListener ======");
    ret = OH_LowPowerAudioSinkCallback_SetDataNeededListener(lppAudioStreamerCallback_,
        LppCallback::OnDataNeeded, lppUserData);
    AVCODEC_SAMPLE_LOGI("SetDataNeededListener ret:::%{public}d ", ret);
    return ret;
}
int32_t LppAudioStreamer::SetPositionUpdateListener(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetPositionUpdateListener ======");
    ret = OH_LowPowerAudioSinkCallback_SetPositionUpdateListener(lppAudioStreamerCallback_,
        LppCallback::OnPositionUpdated, lppUserData);
    AVCODEC_SAMPLE_LOGI("SetPositionUpdateListener ret:::%{public}d ", ret);
    return ret;
}
int32_t LppAudioStreamer::SetCallback(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetCallback ======");
    lppAudioStreamerCallback_ = OH_LowPowerAudioSinkCallback_Create();
    ret = OH_LowPowerAudioSinkCallback_SetDataNeededListener(lppAudioStreamerCallback_,
        LppCallback::OnDataNeeded, lppUserData);
    AVCODEC_SAMPLE_LOGI("SetDataNeededListener ret:::%{public}d ", ret);
    ret = OH_LowPowerAudioSinkCallback_SetPositionUpdateListener(lppAudioStreamerCallback_,
        LppCallback::OnPositionUpdated, lppUserData);
    AVCODEC_SAMPLE_LOGI("SetPositionUpdateListener ret:::%{public}d ", ret);
    ret = OH_LowPowerAudioSink_RegisterCallback(lppAudioStreamer_, lppAudioStreamerCallback_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);

    AVCODEC_SAMPLE_LOGI("RegisterCallback ret:::%{public}d ", ret);
    return ret;
}

int32_t LppAudioStreamer::SetErrorCallback(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetErrorCallback ======");
    ret = OH_LowPowerAudioSinkCallback_SetErrorListener(lppAudioStreamerCallback_, LppCallback::OnAudioError,
                                                        lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);
    AVCODEC_SAMPLE_LOGI("OnAudioError ret:::%{public}d ", ret);
    return ret;
}
int32_t LppAudioStreamer::SetInterruptListener(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetInterruptListener ======");
    ret = OH_LowPowerAudioSinkCallback_SetInterruptListener(lppAudioStreamerCallback_,
        LppCallback::OnInterrupted, lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);
    AVCODEC_SAMPLE_LOGI("OnInterrupted ret:::%{public}d ", ret);
    return ret;
}

int32_t LppAudioStreamer::SetEosCallback(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetEosCallback ======");
    ret = OH_LowPowerAudioSinkCallback_SetEosListener(lppAudioStreamerCallback_, LppCallback::OnEos,
                                                      lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);
    AVCODEC_SAMPLE_LOGI("OnEos ret:::%{public}d ", ret);
    return ret;
}

int32_t LppAudioStreamer::SetOnDeviceChanged(LppUserData *lppUserData)
{
    int32_t ret = AV_ERR_OK;
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetOnDeviceChanged ======");
    ret = OH_LowPowerAudioSinkCallback_SetDeviceChangeListener(lppAudioStreamerCallback_, LppCallback::OnDeviceChanged,
                                                               lppUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Set callback failed, ret::: %{public}d", ret);
    AVCODEC_SAMPLE_LOGI("OnDeviceChanged ret:::%{public}d ", ret);
    return ret;
}

int32_t LppAudioStreamer::Configure(const SampleInfo &sampleInfo)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Configure ======");
    if (sampleInfo.audioCodecConfig != nullptr) {
        OH_AVFormat_SetBuffer(format, "codec_config", sampleInfo.audioCodecConfig, sampleInfo.audioCodecSize);
    }
    const int STREAM_USAGE_ASYNC = 10;
    OH_AVFormat_SetIntValue(format, "STREAM_USAGE", STREAM_USAGE_ASYNC);
    OH_AVFormat_SetIntValue(format, "SAMPLE_RATE", sampleInfo.audioSampleRate);
    AVCODEC_SAMPLE_LOGI("audioSampleRate  %{public}d", sampleInfo.audioSampleRate);
    const int RENDERER_FLAG_ASYNC = 5;
    OH_AVFormat_SetIntValue(format, "RENDERER_FLAG", RENDERER_FLAG_ASYNC);
//     ENCODING_PCM = 0,
    const int ENCODING_PCM = 0;
    OH_AVFormat_SetIntValue(format, "ENCODING", ENCODING_PCM);
//     SAMPLE_S16LE = 1,
    OH_AVFormat_SetIntValue(format, "SAMPLE_FORMAT", SAMPLE_S16LE);
//     CHANNEL_6 = 6,
    OH_AVFormat_SetIntValue(format, "CHANNEL", sampleInfo.audioChannelCount);
    
//     音频解码
    OH_AVFormat_SetIntValue(format, "audio_sample_format", SAMPLE_S16LE);

    OH_AVFormat_SetIntValue(format, "channel_count", sampleInfo.audioChannelCount);
    AVCODEC_SAMPLE_LOGI("audioChannelCount  %{public}d", sampleInfo.audioChannelCount);
    OH_AVFormat_SetIntValue(format, "sample_rate", sampleInfo.audioSampleRate);
    OH_AVFormat_SetLongValue(format, "channel_layout", sampleInfo.audioChannelLayout);
    int ret = OH_LowPowerAudioSink_Configure(lppAudioStreamer_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Configure failed, ret::: %{public}d", ret);
    return ret;
}

int32_t LppAudioStreamer::SetVolume(const float volume)
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetVolume ======");
    int ret = OH_LowPowerAudioSink_SetVolume(lppAudioStreamer_, volume);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "SetVolume failed, ret::: %{public}d", ret);
    return ret;
}

int32_t LppAudioStreamer::SetPlayBackSpeed(const float speed)
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetPlayBackSpeed ======");
    int ret = OH_LowPowerAudioSink_SetPlaybackSpeed(lppAudioStreamer_, speed);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "SetSpeed failed, ret::: %{public}d", ret);
    return ret;
}


int32_t LppAudioStreamer::Start()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Start ======");
    int ret = OH_LowPowerAudioSink_Start(lppAudioStreamer_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Start failed, ret::: %{public}d", ret);
    return ret;
}

int32_t LppAudioStreamer::returnFrames(LppUserData *lppUserData)
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ returnFrames ======");
    int ret = OH_LowPowerAudioSink_ReturnSamples(lppAudioStreamer_, lppUserData->framePacket_);
    return ret;
}

int32_t LppAudioStreamer::SetParameter(const SampleInfo &sampleInfo)
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetParameter ======");
    OH_AVFormat *format = OH_AVFormat_Create();
    if (sampleInfo.audioCodecConfig != nullptr) {
        OH_AVFormat_SetBuffer(format, "codec_config", sampleInfo.audioCodecConfig, sampleInfo.audioCodecSize);
    }
    const int STREAM_USAGE_ASYNC = 10;
    OH_AVFormat_SetIntValue(format, "STREAM_USAGE", STREAM_USAGE_ASYNC);
    OH_AVFormat_SetIntValue(format, "SAMPLE_RATE", sampleInfo.audioSampleRate);
    AVCODEC_SAMPLE_LOGI("audioSampleRate  %{public}d", sampleInfo.audioSampleRate);
    const int RENDERER_FLAG_ASYNC = 5;
    OH_AVFormat_SetIntValue(format, "RENDERER_FLAG", RENDERER_FLAG_ASYNC);
//     ENCODING_PCM = 0,
    const int ENCODING_PCM = 0;
    OH_AVFormat_SetIntValue(format, "ENCODING", ENCODING_PCM);
//     SAMPLE_S16LE = 1,
    OH_AVFormat_SetIntValue(format, "SAMPLE_FORMAT", SAMPLE_S16LE);
//     CHANNEL_6 = 6,
    OH_AVFormat_SetIntValue(format, "CHANNEL", sampleInfo.audioChannelCount);
    
//     音频解码
    OH_AVFormat_SetIntValue(format, "audio_sample_format", SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, "channel_count", sampleInfo.audioChannelCount);
    AVCODEC_SAMPLE_LOGI("audioChannelCount  %{public}d", sampleInfo.audioChannelCount);
    OH_AVFormat_SetIntValue(format, "sample_rate", sampleInfo.audioSampleRate);
    OH_AVFormat_SetLongValue(format, "channel_layout", sampleInfo.audioChannelLayout);
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ SetParameter ======");
    int ret = OH_LowPowerAudioSink_SetParameter(lppAudioStreamer_, format);
    return ret;
}

int32_t LppAudioStreamer::GetParameter(const SampleInfo &sampleInfo)
{
    AVCODEC_SAMPLE_LOGI("====== LppAudioStreamer GetParameter ======");
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");
    int ret = OH_LowPowerAudioSink_GetParameter(lppAudioStreamer_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, ret, "Configure failed, ret::: %{public}d", ret);
    return ret;
}
int32_t LppAudioStreamer::Prepare()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Prepare ======");
    int ret = OH_LowPowerAudioSink_Prepare(lppAudioStreamer_);
    return ret;
}

int32_t LppAudioStreamer::Pause()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Pause ======");
    int ret = OH_LowPowerAudioSink_Pause(lppAudioStreamer_);
    return ret;
}

int32_t LppAudioStreamer::Resume()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Resume ======");
    int ret = OH_LowPowerAudioSink_Resume(lppAudioStreamer_);
    return ret;
}

int32_t LppAudioStreamer::Flush()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Flush ======");
    int ret = OH_LowPowerAudioSink_Flush(lppAudioStreamer_);
    return ret;
}

int32_t LppAudioStreamer::Stop()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Stop ======");
    int ret = OH_LowPowerAudioSink_Stop(lppAudioStreamer_);
    return ret;
}

int32_t LppAudioStreamer::Reset()
{
    AVCODEC_SAMPLE_LOGI("====== lppAudioStreamer_ Reset ======");
    AVCODEC_SAMPLE_LOGI("reset in3");
    int ret = OH_LowPowerAudioSink_Reset(lppAudioStreamer_);
    AVCODEC_SAMPLE_LOGI("reset in6");
    return ret;
}

int32_t LppAudioStreamer::Destroy()
{
    AVCODEC_SAMPLE_LOGI("====== LppAudioStreamer Destroy ======");
    int ret = OH_LowPowerAudioSink_Destroy(lppAudioStreamer_);
        AVCODEC_SAMPLE_LOGW("LppAudioStreamer Destroy ret:::%{public}d", ret);
    lppAudioStreamer_ = nullptr;
    return ret;
}
int32_t LppAudioStreamer::CallbackDestroy()
{
    AVCODEC_SAMPLE_LOGI("====== LppAudioStreamer Destroy ======");
    int ret = OH_LowPowerAudioSinkCallback_Destroy(lppAudioStreamerCallback_);
        AVCODEC_SAMPLE_LOGW("LppAudioStreamer CallbackDestroy ret:::%{public}d", ret);
    lppAudioStreamerCallback_ = nullptr;
    return ret;
}

int32_t LppAudioStreamer::Release()
{
    Destroy();
    CallbackDestroy();
    return AVCODEC_SAMPLE_ERR_OK;
}
