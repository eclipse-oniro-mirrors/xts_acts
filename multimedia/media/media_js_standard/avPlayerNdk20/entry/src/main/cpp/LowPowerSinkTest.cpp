/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing fpermissions and
 * limitations under the License.
 */

#include "GLES3/gl32.h"


#include "multimedia/player_framework/lowpower_audio_sink.h"
#include "multimedia/player_framework/lowpower_audio_sink_base.h"
#include "multimedia/player_framework/lowpower_video_sink_base.h"
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <arpa/nameser.h>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <iostream>
#include <js_native_api.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avrecorder.h>
#include <multimedia/player_framework/lowpower_avsink_base.h>
#include <multimedia/player_framework/lowpower_video_sink.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avsource.h>
#include <native_buffer/native_buffer.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <typeinfo>
#include <unistd.h>
#include <vector>

#define AVCODEC_SAMPLE_ERR_OK = 0,
#define AVCODEC_SAMPLE_ERR_ERROR = -1,
OH_AVSamplesBuffer *g_samples;

struct SampleInfo {
    int32_t inputFd = -1;
    int32_t outputFd = -1;
    int64_t inputFileOffset = 0;
    int64_t inputFileSize = 0;
    std::string inputFilePath;

    std::string videoCodecMime = "";
    std::string audioCodecMime = "";
    int32_t videoWidth = 0;
    int32_t videoHeight = 0;
    double frameRate = 0.0;
    int64_t bitrate = 10 * 1024 * 1024; // 10Mbps
    int64_t frameInterval = 0;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    uint32_t bitrateMode = 0;
    int32_t iFrameInterval = 100;
    int32_t rangFlag = 1;

    int32_t audioSampleFormat = 0;
    int32_t audioSampleRate = 0;
    int32_t audioChannelCount = 0;
    int64_t audioChannelLayout = 0;

    int32_t videoIndex = 0;
    int8_t processType = 0; // 0none，1scale，2meta，3color

    int32_t isHDRVivid = 0;
    int32_t hevcProfile = HEVC_PROFILE_MAIN;
    OH_ColorPrimary primary = COLOR_PRIMARY_BT2020;
    OH_TransferCharacteristic transfer = TRANSFER_CHARACTERISTIC_PQ;
    OH_MatrixCoefficient matrix = MATRIX_COEFFICIENT_BT2020_CL;

    int32_t rotation = 0;
    OHNativeWindow *window = nullptr;
    int8_t zoomLevel;
    int8_t metaData = OH_VIDEO_NONE;
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_BT709_LIMIT;
    OH_NativeBuffer_Format format = NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;

    int8_t vpErrorCode = 0;
    void (*playDoneCallback)(void *context) = nullptr;
    void *playDoneCallbackData = nullptr;
};

static napi_value OH_LowPowerAudioSink_Configure0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, 0, 0);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Configure(AudioSink, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_UNSUPPORT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Configure0101(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Configure(nullptr, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_SetParameter0100(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_SetParameter(AudioSink, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_SetParameter0101(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSink_SetParameter(nullptr, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Prepare0102(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Prepare(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Prepare0100(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Prepare(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Prepare0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 16000;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_AVErrCode Configure = OH_LowPowerAudioSink_Configure(AudioSink, Format);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Prepare(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Start0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Start(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Pause0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Pause(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Resume0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Resume(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Flush0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Flush(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Stop0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Stop(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Reset0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Reset(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Destroy0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Destroy(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_SetVolume0100(napi_env env, napi_callback_info info)
{
    const float volume = 0.5;
    OH_AVErrCode errcode = OH_LowPowerAudioSink_SetVolume(nullptr, volume);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_SetPlaybackSpeed0100(napi_env env, napi_callback_info info)
{
    const float volume = 0.5;
    OH_AVErrCode errcode = OH_LowPowerAudioSink_SetPlaybackSpeed(nullptr, volume);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_ReturnSamples0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_ReturnSamples(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_RegisterCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSink_RegisterCallback(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_Destroy0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_Destroy(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_Destroy0101(napi_env env, napi_callback_info info)
{
    OH_LowPowerAudioSinkCallback *Callback = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_Destroy(Callback);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetPositionUpdateListener(nullptr, NULL, NULL);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnPositionUpdated(OH_LowPowerAudioSink *sink, int64_t currentPosition, void *userData){};
static napi_value OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetPositionUpdateListener(LPASC, OnPositionUpdated, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnDataNeeded(OH_LowPowerAudioSink *sink, OH_AVSamplesBuffer *samples, void *userData) { g_samples = samples; };
static napi_value OH_LowPowerAudioSinkCallback_SetDataNeededListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetDataNeededListener(LPASC, OnDataNeeded, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetDataNeededListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetDataNeededListener(nullptr, OnDataNeeded, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnError(OH_LowPowerAudioSink *sink, OH_AVErrCode errCode, const char *errorMsg, void *userData){};
static napi_value OH_LowPowerAudioSinkCallback_SetErrorListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetErrorListener(LPASC, OnError, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetErrorListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetErrorListener(nullptr, OnError, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnInterrupted(OH_LowPowerAudioSink *sink, OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint,
                   void *userData){};
static napi_value OH_LowPowerAudioSinkCallback_SetInterruptListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetInterruptListener(LPASC, OnInterrupted, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetInterruptListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetInterruptListener(nullptr, OnInterrupted, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnDeviceChanged(OH_LowPowerAudioSink *sink, OH_AudioStream_DeviceChangeReason reason, void *userData){};
static napi_value OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetDeviceChangeListener(LPASC, OnDeviceChanged, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetDeviceChangeListener(nullptr, OnDeviceChanged, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnEos(OH_LowPowerAudioSink *sink, void *userData){};
static napi_value OH_LowPowerAudioSinkCallback_SetEosListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetEosListener(LPASC, OnEos, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSinkCallback_SetEosListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerAudioSinkCallback *LPASC = OH_LowPowerAudioSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerAudioSinkCallback_SetEosListener(nullptr, OnEos, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Configure0101(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_VVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1, 1);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Configure(nullptr, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetParameter0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetParameter(nullptr, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetVideoSurface0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetVideoSurface(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Prepare0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Prepare(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartDecoder0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartDecoder(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_RenderFirstFrame0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_RenderFirstFrame(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartRenderer0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartRenderer(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Pause0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Pause(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Resume0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Resume(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Flush0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Flush(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Stop0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Stop(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Reset0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Reset(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Destroy0100(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateVideoFormat(mime, 1920, 1080);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Destroy(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetSyncAudioSink0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetSyncAudioSink(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetTargetStartFrame0100(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived;
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetTargetStartFrame(nullptr, NULL, onTargetArrived, NULL, NULL);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetPlaybackSpeed0100(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived;
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetPlaybackSpeed(nullptr, 1);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_ReturnSamples0100(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived;
    OH_AVErrCode errcode = OH_LowPowerVideoSink_ReturnSamples(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_RegisterCallback0100(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived;
    OH_AVErrCode errcode = OH_LowPowerVideoSink_RegisterCallback(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_Destroy0100(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSink_OnTargetArrived onTargetArrived;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_Destroy(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetDataNeededListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetDataNeededListener(nullptr, onDataNeeded, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetErrorListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetErrorListener(nullptr, NULL, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetRenderStartListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetRenderStartListener(nullptr, NULL, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetStreamChangedListener(nullptr, NULL, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener(nullptr, NULL, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_SetEosListener0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSink_OnDataNeeded onDataNeeded;
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetEosListener(nullptr, NULL, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVSamplesBuffer_AppendOneBuffer0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVSamplesBuffer_AppendOneBuffer(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}


napi_property_descriptor desc[] = {
    {"OH_LowPowerAudioSink_Configure0100", nullptr, OH_LowPowerAudioSink_Configure0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Configure0101", nullptr, OH_LowPowerAudioSink_Configure0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_SetParameter0100", nullptr, OH_LowPowerAudioSink_SetParameter0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_SetParameter0101", nullptr, OH_LowPowerAudioSink_SetParameter0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Prepare0102", nullptr, OH_LowPowerAudioSink_Prepare0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Prepare0100", nullptr, OH_LowPowerAudioSink_Prepare0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Prepare0101", nullptr, OH_LowPowerAudioSink_Prepare0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Start0100", nullptr, OH_LowPowerAudioSink_Start0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Pause0100", nullptr, OH_LowPowerAudioSink_Pause0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Resume0100", nullptr, OH_LowPowerAudioSink_Resume0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Flush0100", nullptr, OH_LowPowerAudioSink_Flush0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Stop0100", nullptr, OH_LowPowerAudioSink_Stop0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Reset0100", nullptr, OH_LowPowerAudioSink_Reset0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Destroy0100", nullptr, OH_LowPowerAudioSink_Destroy0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_SetVolume0100", nullptr, OH_LowPowerAudioSink_SetVolume0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_SetPlaybackSpeed0100", nullptr, OH_LowPowerAudioSink_SetPlaybackSpeed0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSink_ReturnSamples0100", nullptr, OH_LowPowerAudioSink_ReturnSamples0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSink_RegisterCallback0100", nullptr, OH_LowPowerAudioSink_RegisterCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_Destroy0100", nullptr, OH_LowPowerAudioSinkCallback_Destroy0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_Destroy0101", nullptr, OH_LowPowerAudioSinkCallback_Destroy0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0100", nullptr,
     OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0101", nullptr,
     OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetDataNeededListener0100", nullptr,
     OH_LowPowerAudioSinkCallback_SetDataNeededListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetDataNeededListener0101", nullptr,
     OH_LowPowerAudioSinkCallback_SetDataNeededListener0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetErrorListener0101", nullptr, OH_LowPowerAudioSinkCallback_SetErrorListener0101,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetInterruptListener0101", nullptr,
     OH_LowPowerAudioSinkCallback_SetInterruptListener0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0101", nullptr,
     OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerAudioSinkCallback_SetEosListener0101", nullptr, OH_LowPowerAudioSinkCallback_SetEosListener0101,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_Configure0101", nullptr, OH_LowPowerVideoSink_Configure0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetParameter0100", nullptr, OH_LowPowerVideoSink_SetParameter0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetVideoSurface0100", nullptr, OH_LowPowerVideoSink_SetVideoSurface0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_Prepare0100", nullptr, OH_LowPowerVideoSink_Prepare0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartDecoder0100", nullptr, OH_LowPowerVideoSink_StartDecoder0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_RenderFirstFrame0100", nullptr, OH_LowPowerVideoSink_RenderFirstFrame0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartRenderer0100", nullptr, OH_LowPowerVideoSink_StartRenderer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_Pause0100", nullptr, OH_LowPowerVideoSink_Pause0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Resume0100", nullptr, OH_LowPowerVideoSink_Resume0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_Flush0100", nullptr, OH_LowPowerVideoSink_Flush0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Stop0100", nullptr, OH_LowPowerVideoSink_Stop0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Reset0100", nullptr, OH_LowPowerVideoSink_Reset0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Destroy0100", nullptr, OH_LowPowerVideoSink_Destroy0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetSyncAudioSink0100", nullptr, OH_LowPowerVideoSink_SetSyncAudioSink0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetTargetStartFrame0100", nullptr, OH_LowPowerVideoSink_SetTargetStartFrame0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetPlaybackSpeed0100", nullptr, OH_LowPowerVideoSink_SetPlaybackSpeed0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_ReturnSamples0100", nullptr, OH_LowPowerVideoSink_ReturnSamples0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_RegisterCallback0100", nullptr, OH_LowPowerVideoSink_RegisterCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_Destroy0100", nullptr, OH_LowPowerVideoSinkCallback_Destroy0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetDataNeededListener0100", nullptr,
     OH_LowPowerVideoSinkCallback_SetDataNeededListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetErrorListener0100", nullptr, OH_LowPowerVideoSinkCallback_SetErrorListener0100,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetRenderStartListener0100", nullptr,
     OH_LowPowerVideoSinkCallback_SetRenderStartListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100", nullptr,
     OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100", nullptr,
     OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_SetEosListener0100", nullptr, OH_LowPowerVideoSinkCallback_SetEosListener0100,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVSamplesBuffer_AppendOneBuffer0100", nullptr, OH_AVSamplesBuffer_AppendOneBuffer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},

};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "lowpoweraudiosinkndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
