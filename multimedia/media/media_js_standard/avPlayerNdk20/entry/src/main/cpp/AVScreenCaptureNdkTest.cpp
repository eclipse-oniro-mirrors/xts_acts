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


#include "hilog/log.h"
#include "js_native_api.h"
#include "js_native_api_types.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avcodec_videoencoder.h"
#include "multimedia/player_framework/native_avformat.h"
#include "multimedia/player_framework/native_avscreen_capture.h"
#include "multimedia/player_framework/native_avscreen_capture_base.h"
#include "multimedia/player_framework/native_avscreen_capture_errors.h"
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <fstream>
#include <iostream>
#include <js_native_api.h>
#include <map>
#include <memory>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <native_buffer/native_buffer.h>
#include <thread>
#include <unistd.h>

#define PARAM_1 1

namespace {
constexpr uint32_t DEFAULT_WIDTH = 720;
constexpr uint32_t DEFAULT_HEIGHT = 1280;
static ArkUI_NodeHandle g_Node;
static ArkUI_NodeHandle g_columnNode;
constexpr OH_AVPixelFormat DEFAULT_PIXELFORMAT = AV_PIXEL_FORMAT_NV12;
static OH_AVSCREEN_CAPTURE_ErrCode res1;
static OH_AVSCREEN_CAPTURE_ErrCode res2;
} // namespace

// 配置文件
void SetConfig(OH_AVScreenCaptureConfig &config)
{
    int32_t width = 720;
    int32_t height = 1280;
    OH_AudioCaptureInfo micCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_MIC};
    OH_AudioCaptureInfo innerCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_ALL_PLAYBACK};
    OH_AudioEncInfo audioEncInfo = {.audioBitrate = 48000, .audioCodecformat = OH_AudioCodecFormat::OH_AAC_LC};
    OH_AudioInfo audioInfo = {.micCapInfo = micCapInfo, .innerCapInfo = innerCapInfo, .audioEncInfo = audioEncInfo};

    OH_VideoCaptureInfo videoCapInfo = {
        .videoFrameWidth = width, .videoFrameHeight = height, .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA};
    OH_VideoEncInfo videoEncInfo = {
        .videoCodec = OH_VideoCodecFormat::OH_H264, .videoBitrate = 2000000, .videoFrameRate = 30};
    OH_VideoInfo videoInfo = {.videoCapInfo = videoCapInfo, .videoEncInfo = videoEncInfo};

    config = {
        .captureMode = OH_CAPTURE_HOME_SCREEN,
        .dataType = OH_ORIGINAL_STREAM,
        .audioInfo = audioInfo,
        .videoInfo = videoInfo,
    };
}

void OnStateChange(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    switch (stateCode) {
        case OH_SCREEN_CAPTURE_STATE_STARTED:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Started");
            break;
        case OH_SCREEN_CAPTURE_STATE_CANCELED:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Canceled");
            break;
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Stopped by User");
            break;
        case OH_SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Interrupted by Other");
            break;
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_CALL:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Stopped by Call");
            break;
        default:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Unknown state: %d", stateCode);
            break;
    }
    switch (stateCode) {
        case OH_SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Microphone Unavailable");
            break;
        case OH_SCREEN_CAPTURE_STATE_MIC_MUTED_BY_USER:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Microphone Muted by User");
            break;
        case OH_SCREEN_CAPTURE_STATE_MIC_UNMUTED_BY_USER:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Microphone Unmuted by User");
            break;
        case OH_SCREEN_CAPTURE_STATE_ENTER_PRIVATE_SCENE:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Enter Private Scene");
            break;
        case OH_SCREEN_CAPTURE_STATE_EXIT_PRIVATE_SCENE:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Exit Private Scene");
            break;
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Stopped by User Switches");
            break;
        default:
            OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Unknown state: %d", stateCode);
            break;
    }
};
void OnError(OH_AVScreenCapture *capture, int32_t errorCode, void *userData){};
void OnErrorCallback(OH_AVScreenCapture *capture, int32_t errorCode) {}
void OnAudioBufferAvailable(OH_AVScreenCapture *capture, bool isReady, OH_AudioCaptureSourceType type) {}
void OnVideoBufferAvailable(OH_AVScreenCapture *capture, bool isReady) {}

void OnErrorWithSurface(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}

void OnStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}

void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)userData;
    (void)index;
    (void)buffer;
}

void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    OH_AVCodecBufferAttr info;
    int32_t ret = OH_AVBuffer_GetBufferAttr(buffer, &info);
    ret = OH_VideoEncoder_FreeOutputBuffer(codec, index);
}

void OnDisplaySelected(OH_AVScreenCapture *capture, uint64_t displayId, void *userData){};

void OnCaptureContentChanged(OH_AVScreenCapture *capture, OH_AVScreenCaptureContentChangedEvent event, OH_Rect *area,
                             void *userData)
{
    switch (event) {
        case OH_SCREEN_CAPTURE_CONTENT_HIDE:
            OH_LOG_INFO(LOG_APP, "==DEMO== OH_SCREEN_CAPTURE_CONTENT_HIDE");
            break;
        case OH_SCREEN_CAPTURE_CONTENT_VISIBLE:
            OH_LOG_INFO(LOG_APP, "==DEMO== OH_SCREEN_CAPTURE_CONTENT_VISIBLE");
            break;
        case OH_SCREEN_CAPTURE_CONTENT_UNAVAILABLE:
            OH_LOG_INFO(LOG_APP, "==DEMO== OH_SCREEN_CAPTURE_CONTENT_UNAVAILABLE");
            break;
        default:
            OH_LOG_INFO(LOG_APP, "==DEMO== Event Unknown state: %d", event);
            break;
    }
};

OH_AVScreenCapture *g_screenCapturee = OH_AVScreenCapture_Create();

static napi_value OH_AVScreenCapture_Init0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCaptureConfig config;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_Init(nullptr, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenCapture0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StartScreenCapture(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenCapture0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StartScreenCapture(g_screenCapturee);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StopScreenCapture0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StopScreenCapture(g_screenCapturee);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StopScreenCapture0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StopScreenCapture(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenRecording0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StartScreenRecording(g_screenCapturee);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenRecording0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StartScreenRecording(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StopScreenRecording0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StopScreenRecording(g_screenCapturee);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StopScreenRecording0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StopScreenRecording(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_AcquireAudioBuffer0100(napi_env env, napi_callback_info info)
{
    OH_AudioBuffer *audiobuffer;
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_AcquireAudioBuffer(g_screenCapturee, &audiobuffer, type);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_AcquireAudioBuffer0101(napi_env env, napi_callback_info info)
{
    OH_AudioBuffer *audiobuffer;
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_AcquireAudioBuffer(nullptr, &audiobuffer, type);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseAudioBuffer0100(napi_env env, napi_callback_info info)
{
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseAudioBuffer(g_screenCapturee, type);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseAudioBuffer0101(napi_env env, napi_callback_info info)
{
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseAudioBuffer(nullptr, type);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseVideoBuffer0100(napi_env env, napi_callback_info info)
{
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseVideoBuffer(g_screenCapturee);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseVideoBuffer0101(napi_env env, napi_callback_info info)
{
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseVideoBuffer(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapturee = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureCallback callback = {OnErrorCallback, OnAudioBufferAvailable, OnVideoBufferAvailable};
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCallback(screenCapturee, callback);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCaptureCallback callback;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCallback(nullptr, callback);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetMicrophoneEnabled0101(napi_env env, napi_callback_info info)
{
    bool isMicrophone = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetMicrophoneEnabled(nullptr, isMicrophone);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetStateCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetStateCallback(g_screenCapturee, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetStateCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_OnStateChange callback;
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(nullptr, callback, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetDataCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_OnBufferAvailable callback;
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetDataCallback(nullptr, callback, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}


static napi_value OH_AVScreenCapture_SetErrorCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetErrorCallback(g_screenCapturee, OnError, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetErrorCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_OnError callback;
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetErrorCallback(nullptr, callback, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenCaptureWithSurface0100(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);

    const char *name = OH_AVCapability_GetName(capability);
    auto videoEnc = OH_VideoEncoder_CreateByName(name);

    int32_t ret = OH_VideoEncoder_RegisterCallback(
        videoEnc, {OnErrorWithSurface, OnStreamChanged, OnNeedInputBuffer, OnNewOutputBuffer}, nullptr);
    auto qaz = 23000;
    auto wsx = 3000000;
    auto edc = 30.0;
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, edc);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, false);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES,
                            static_cast<int32_t>(OH_ColorPrimary::COLOR_PRIMARY_BT709));
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            static_cast<int32_t>(OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709));
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            static_cast<int32_t>(OH_MatrixCoefficient::MATRIX_COEFFICIENT_IDENTITY));
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, qaz);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, static_cast<int32_t>(OH_AVCProfile::AVC_PROFILE_BASELINE));
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                            static_cast<int32_t>(OH_VideoEncodeBitrateMode::CBR));
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, wsx);

    int result2 = OH_VideoEncoder_Configure(videoEnc, format);
    OH_AVFormat_Destroy(format); // 释放格式对象

    OHNativeWindow *nativeWindow;
    int result3 = OH_VideoEncoder_GetSurface(videoEnc, &nativeWindow);
    if (result3 != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Started OH_VideoEncoder_GetSurface ret=%{public}d", result3);
    }

    int result4 = OH_VideoEncoder_Prepare(videoEnc);
    OH_ArkUI_SurfaceHolder *SurfaceHolder = OH_ArkUI_SurfaceHolder_Create(g_columnNode);
    OHNativeWindow *window = OH_ArkUI_XComponent_GetNativeWindow(SurfaceHolder);
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_StartScreenCaptureWithSurface(g_screenCapturee, nativeWindow);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StartScreenCaptureWithSurface0101(napi_env env, napi_callback_info info)
{
    OHNativeWindow *window;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StartScreenCaptureWithSurface(nullptr, window);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCanvasRotation0100(napi_env env, napi_callback_info info)
{
    bool canvasRotation = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCanvasRotation(g_screenCapturee, canvasRotation);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCanvasRotation0101(napi_env env, napi_callback_info info)
{
    bool canvasRotation = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCanvasRotation(nullptr, canvasRotation);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseContentFilter0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_ContentFilter *ContentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseContentFilter(ContentFilter);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseContentFilter0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseContentFilter(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ContentFilter_AddAudioContent0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_ContentFilter *ContentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVScreenCaptureFilterableAudioContent content = OH_SCREEN_CAPTURE_CURRENT_APP_AUDIO;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ContentFilter_AddAudioContent(ContentFilter, content);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ContentFilter_AddAudioContent0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCaptureFilterableAudioContent content = OH_SCREEN_CAPTURE_CURRENT_APP_AUDIO;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ContentFilter_AddAudioContent(nullptr, content);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ExcludeContent0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_ContentFilter *ContentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ExcludeContent(g_screenCapturee, ContentFilter);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ExcludeContent0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ExcludeContent(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ContentFilter_AddWindowContent0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_ContentFilter *ContentFilter = OH_AVScreenCapture_CreateContentFilter();
    std::vector<int> windowidsExclude = {-111};
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ContentFilter_AddWindowContent(
        ContentFilter, &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ContentFilter_AddWindowContent0101(napi_env env, napi_callback_info info)
{
    std::vector<int> windowidsExclude = {-111};
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ContentFilter_AddWindowContent(
        nullptr, &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ResizeCanvas0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_ResizeCanvas(g_screenCapturee, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ResizeCanvas0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ResizeCanvas(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SkipPrivacyMode0101(napi_env env, napi_callback_info info)
{
    std::vector<int> windowidsExclude = {-111};
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SkipPrivacyMode(
        nullptr, &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetMaxVideoFrameRate0101(napi_env env, napi_callback_info info)
{
    int32_t frameRate = 60;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetMaxVideoFrameRate(nullptr, frameRate);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ShowCursor0100(napi_env env, napi_callback_info info)
{
    bool showCursor = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ShowCursor(g_screenCapturee, showCursor);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetDisplayCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetDisplayCallback(g_screenCapturee, OnDisplaySelected, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetDisplayCallback0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetDisplayCallback(nullptr, OnDisplaySelected, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_ReleaseCaptureStrategy0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ReleaseCaptureStrategy(nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCaptureStrategy0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCaptureStrategy(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCaptureStrategy0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_CaptureStrategy *CaptureStrategy = OH_AVScreenCapture_CreateCaptureStrategy();
    auto qaz = OH_AVScreenCapture_StartScreenCapture(g_screenCapturee);
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCaptureStrategy(nullptr, CaptureStrategy);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100(napi_env env, napi_callback_info info)
{
    bool value = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForKeepCaptureDuringCall(nullptr, value);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCaptureContentChangedCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetCaptureContentChangedCallback(g_screenCapturee, OnCaptureContentChanged, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCaptureContentChangedCallback0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetCaptureContentChangedCallback(nullptr, OnCaptureContentChanged, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_SetCaptureArea0100(napi_env env, napi_callback_info info)
{
    uint64_t displayId = 0;
    auto def = 20;
    OH_Rect *area = new OH_Rect;
    area->x = 1;
    area->y = 1;
    area->width = def;
    area->height = def;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetCaptureArea(g_screenCapturee, displayId, area);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForPrivacyMaskMode0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_CaptureStrategy *CaptureStrategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForPrivacyMaskMode(CaptureStrategy, 0);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForPrivacyMaskMode0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForPrivacyMaskMode(nullptr, 0);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForCanvasFollowRotation0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_CaptureStrategy *CaptureStrategy = OH_AVScreenCapture_CreateCaptureStrategy();
    bool value = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForCanvasFollowRotation(CaptureStrategy, value);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForCanvasFollowRotation0101(napi_env env, napi_callback_info info)
{
    bool value = true;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForCanvasFollowRotation(nullptr, value);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnUserSelected(OH_AVScreenCapture *capture, OH_AVScreenCapture_UserSelectionInfo *selections, void *userData)
{
    res1 = OH_AVScreenCapture_GetCaptureTypeSelected(selections, 0);
    res2 = OH_AVScreenCapture_GetDisplayIdSelected(selections, 0);
};
static napi_value OH_AVScreenCapture_GetCaptureTypeSelected0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    OH_AVScreenCapture_SetSelectionCallback(g_screenCapturee, OnUserSelected, userData);
    auto qaz = OH_AVScreenCapture_Init(g_screenCapturee, config_);
    OH_AVScreenCapture_StartScreenCapture(g_screenCapturee);
    int32_t res = 1;
    if (res1 == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_GetCaptureTypeSelected0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_GetCaptureTypeSelected(nullptr, 0);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_GetDisplayIdSelected0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    OH_AVScreenCapture_SetSelectionCallback(g_screenCapturee, OnUserSelected, userData);
    OH_AVScreenCapture_Init(g_screenCapturee, config);
    OH_AVScreenCapture_StartScreenCapture(g_screenCapturee);
    int32_t res = 1;
    if (res1 == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_GetDisplayIdSelected0101(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_GetDisplayIdSelected(nullptr, 0);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForBFramesEncoding0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForBFramesEncoding(nullptr, false);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForPickerPopUp0100(napi_env env, napi_callback_info info)
{
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForPickerPopUp(nullptr, false);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCapture_StrategyForFillMode0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_FillMode mode = OH_SCREENCAPTURE_FILLMODE_ASPECT_SCALE_FIT;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_StrategyForFillMode(nullptr, mode);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_CaptureMode0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.captureMode = OH_CAPTURE_SPECIFIED_SCREEN;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_CaptureMode0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.captureMode = OH_CAPTURE_SPECIFIED_WINDOW;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_CaptureMode0102(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.captureMode = OH_CAPTURE_SPECIFIED_WINDOW;
    config.captureMode = OH_CAPTURE_INVAILD;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AudioCodecFormat0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.audioInfo.audioEncInfo.audioCodecformat = OH_AUDIO_DEFAULT;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AudioCodecFormat0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.audioInfo.audioEncInfo.audioCodecformat = OH_AUDIO_DEFAULT;
    config.audioInfo.audioEncInfo.audioCodecformat = OH_AUDIO_CODEC_FORMAT_BUTT;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_VIDEO_DEFAULT;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_H265;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0102(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_MPEG4;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0103(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_VP8;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0104(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_VP9;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoCodecFormat0105(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.videoInfo.videoEncInfo.videoCodec = OH_VIDEO_CODEC_FORMAT_BUTT;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_DataType0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.dataType = OH_ENCODED_STREAM;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_DataType0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.dataType = OH_INVAILD;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_ContainerFormatType0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.recorderInfo.fileFormat = CFT_MPEG_4A;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_RecorderInfo0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.recorderInfo.urlLen = 0;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AudioCaptureSourceType0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.audioInfo.innerCapInfo.audioSource = OH_SOURCE_INVALID;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AudioCaptureSourceType0101(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config;
    SetConfig(config);
    config.audioInfo.innerCapInfo.audioSource = OH_APP_PLAYBACK;
    auto errcode = OH_AVScreenCapture_Init(screenCapture, config);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0102(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0103(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0104(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0105(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0106(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0107(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0108(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0109(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureStateCode0110(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnBufferAvailable(OH_AVScreenCapture *capture, OH_AVBuffer *buffer, OH_AVScreenCaptureBufferType bufferType,
                       int64_t timestamp, void *userData)
{
    switch (bufferType) {
        case OH_SCREEN_CAPTURE_BUFFERTYPE_AUDIO_INNER:
            OH_LOG_INFO(LOG_APP, "==DEMO== OH_SCREEN_CAPTURE_BUFFERTYPE_AUDIO_INNER");
            break;
        case OH_SCREEN_CAPTURE_BUFFERTYPE_AUDIO_MIC:
            OH_LOG_INFO(LOG_APP, "==DEMO== OH_SCREEN_CAPTURE_BUFFERTYPE_AUDIO_MIC");
            break;
        default:
            OH_LOG_INFO(LOG_APP, "==DEMO== BufferType Unknown state: %d", bufferType);
            break;
    }
};
static napi_value OH_AVScreenCaptureBufferType0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetDataCallback(screenCapture, OnBufferAvailable, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureBufferType0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetDataCallback(screenCapture, OnBufferAvailable, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureFilterableAudioContent0100(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture_ContentFilter *ContentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVScreenCaptureFilterableAudioContent content = OH_SCREEN_CAPTURE_CURRENT_APP_AUDIO;
    OH_AVSCREEN_CAPTURE_ErrCode errcode = OH_AVScreenCapture_ContentFilter_AddAudioContent(ContentFilter, content);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVScreenCaptureContentChangedEvent0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetCaptureContentChangedCallback(screenCapture, OnCaptureContentChanged, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_OK) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVSCREEN_CAPTURE_ErrCode0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode errcode =
        OH_AVScreenCapture_SetCaptureContentChangedCallback(screenCapture, OnCaptureContentChanged, userData);
    int32_t res = 1;
    if (errcode == AV_SCREEN_CAPTURE_ERR_BASE) {
        res = 0;
    }
    OH_AVScreenCapture_Release(screenCapture);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AudioCaptureSourceTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t mic = 1;
    int32_t playback = 2;
    int32_t res = 1;
    if (OH_AudioCaptureSourceType::OH_MIC == mic &&
        OH_AudioCaptureSourceType::OH_ALL_PLAYBACK == playback) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_CaptureModeEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t screen = 0;
    int32_t res = 1;
    if (OH_CaptureMode::OH_CAPTURE_HOME_SCREEN == screen) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_AudioCodecFormatEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t lc = 3;
    int32_t res = 1;
    if (OH_AudioCodecFormat::OH_AAC_LC == lc) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_VideoCodecFormatEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t h264 = 2;
    int32_t res = 1;
    if (OH_VideoCodecFormat::OH_H264 == h264) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_DataTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t stream = 0;
    int32_t res = 1;
    if (OH_DataType::OH_ORIGINAL_STREAM == stream) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_AVScreenCaptureStateCodeEnum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t started = 0;
    int32_t canceled = 1;
    int32_t stoppedByUser = 2;
    int32_t other = 3;
    int32_t call = 4;
    int32_t unavailable = 5;
    int32_t mutedByUser = 6;
    int32_t unmutedByUser = 7;
    int32_t enter = 8;
    int32_t exit = 9;
    int32_t switches = 10;
    int32_t res = 1;
    if (OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_STARTED == started &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_CANCELED == canceled &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER == stoppedByUser &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER == other &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_STOPPED_BY_CALL == call &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE == unavailable &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_MIC_MUTED_BY_USER == mutedByUser &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_MIC_UNMUTED_BY_USER == unmutedByUser &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_ENTER_PRIVATE_SCENE == enter &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_EXIT_PRIVATE_SCENE == exit &&
        OH_AVScreenCaptureStateCode::OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER_SWITCHES == switches) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_AVScreenCaptureContentChangedEvent_Enum(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t hide = 0;
    int32_t visible = 1;
    int32_t unavailable = 2;
    int32_t res = 1;
    if (OH_AVScreenCaptureContentChangedEvent_Enum::OH_SCREEN_CAPTURE_CONTENT_HIDE == hide &&
        OH_AVScreenCaptureContentChangedEvent_Enum::OH_SCREEN_CAPTURE_CONTENT_VISIBLE == visible &&
        OH_AVScreenCaptureContentChangedEvent_Enum::OH_SCREEN_CAPTURE_CONTENT_UNAVAILABLE == unavailable) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OH_AVScreenCaptureErrCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t start = 100;
    int32_t res = 1;
    if (OH_AVSCREEN_CAPTURE_ErrCode::AV_SCREEN_CAPTURE_ERR_EXTEND_START == start) {
        res = 0;
    }
    napi_create_int32(env, res, &result);
    return result;
}

napi_property_descriptor desc[] = {
    {"OH_AVScreenCapture_Init0100", nullptr, OH_AVScreenCapture_Init0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVScreenCapture_StartScreenCapture0100", nullptr, OH_AVScreenCapture_StartScreenCapture0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StartScreenCapture0101", nullptr, OH_AVScreenCapture_StartScreenCapture0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StopScreenCapture0100", nullptr, OH_AVScreenCapture_StopScreenCapture0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StopScreenCapture0101", nullptr, OH_AVScreenCapture_StopScreenCapture0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StartScreenRecording0100", nullptr, OH_AVScreenCapture_StartScreenRecording0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StartScreenRecording0101", nullptr, OH_AVScreenCapture_StartScreenRecording0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StopScreenRecording0100", nullptr, OH_AVScreenCapture_StopScreenRecording0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StopScreenRecording0101", nullptr, OH_AVScreenCapture_StopScreenRecording0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_AcquireAudioBuffer0100", nullptr, OH_AVScreenCapture_AcquireAudioBuffer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_AcquireAudioBuffer0101", nullptr, OH_AVScreenCapture_AcquireAudioBuffer0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseAudioBuffer0100", nullptr, OH_AVScreenCapture_ReleaseAudioBuffer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseAudioBuffer0101", nullptr, OH_AVScreenCapture_ReleaseAudioBuffer0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseVideoBuffer0100", nullptr, OH_AVScreenCapture_ReleaseVideoBuffer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseVideoBuffer0101", nullptr, OH_AVScreenCapture_ReleaseVideoBuffer0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCallback0100", nullptr, OH_AVScreenCapture_SetCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_SetCallback0101", nullptr, OH_AVScreenCapture_SetCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_SetMicrophoneEnabled0101", nullptr, OH_AVScreenCapture_SetMicrophoneEnabled0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetStateCallback0100", nullptr, OH_AVScreenCapture_SetStateCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetStateCallback0101", nullptr, OH_AVScreenCapture_SetStateCallback0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetDataCallback0101", nullptr, OH_AVScreenCapture_SetDataCallback0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetErrorCallback0100", nullptr, OH_AVScreenCapture_SetErrorCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetErrorCallback0101", nullptr, OH_AVScreenCapture_SetErrorCallback0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StartScreenCaptureWithSurface0100", nullptr,
     OH_AVScreenCapture_StartScreenCaptureWithSurface0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StartScreenCaptureWithSurface0101", nullptr,
     OH_AVScreenCapture_StartScreenCaptureWithSurface0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCanvasRotation0100", nullptr, OH_AVScreenCapture_SetCanvasRotation0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCanvasRotation0101", nullptr, OH_AVScreenCapture_SetCanvasRotation0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseContentFilter0100", nullptr, OH_AVScreenCapture_ReleaseContentFilter0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseContentFilter0101", nullptr, OH_AVScreenCapture_ReleaseContentFilter0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ContentFilter_AddAudioContent0100", nullptr,
     OH_AVScreenCapture_ContentFilter_AddAudioContent0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ContentFilter_AddAudioContent0101", nullptr,
     OH_AVScreenCapture_ContentFilter_AddAudioContent0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ExcludeContent0100", nullptr, OH_AVScreenCapture_ExcludeContent0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_ExcludeContent0101", nullptr, OH_AVScreenCapture_ExcludeContent0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_ContentFilter_AddWindowContent0100", nullptr,
     OH_AVScreenCapture_ContentFilter_AddWindowContent0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ContentFilter_AddWindowContent0101", nullptr,
     OH_AVScreenCapture_ContentFilter_AddWindowContent0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ResizeCanvas0100", nullptr, OH_AVScreenCapture_ResizeCanvas0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_ResizeCanvas0101", nullptr, OH_AVScreenCapture_ResizeCanvas0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_SkipPrivacyMode0101", nullptr, OH_AVScreenCapture_SkipPrivacyMode0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetMaxVideoFrameRate0101", nullptr, OH_AVScreenCapture_SetMaxVideoFrameRate0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ShowCursor0100", nullptr, OH_AVScreenCapture_ShowCursor0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_SetDisplayCallback0100", nullptr, OH_AVScreenCapture_SetDisplayCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetDisplayCallback0101", nullptr, OH_AVScreenCapture_SetDisplayCallback0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_ReleaseCaptureStrategy0100", nullptr, OH_AVScreenCapture_ReleaseCaptureStrategy0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCaptureStrategy0100", nullptr, OH_AVScreenCapture_SetCaptureStrategy0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCaptureStrategy0101", nullptr, OH_AVScreenCapture_SetCaptureStrategy0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100", nullptr,
     OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCaptureContentChangedCallback0100", nullptr,
     OH_AVScreenCapture_SetCaptureContentChangedCallback0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCaptureContentChangedCallback0101", nullptr,
     OH_AVScreenCapture_SetCaptureContentChangedCallback0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_SetCaptureArea0100", nullptr, OH_AVScreenCapture_SetCaptureArea0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForPrivacyMaskMode0100", nullptr, OH_AVScreenCapture_StrategyForPrivacyMaskMode0100,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForPrivacyMaskMode0101", nullptr, OH_AVScreenCapture_StrategyForPrivacyMaskMode0101,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForCanvasFollowRotation0100", nullptr,
     OH_AVScreenCapture_StrategyForCanvasFollowRotation0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForCanvasFollowRotation0101", nullptr,
     OH_AVScreenCapture_StrategyForCanvasFollowRotation0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_GetCaptureTypeSelected0100", nullptr, OH_AVScreenCapture_GetCaptureTypeSelected0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_GetCaptureTypeSelected0101", nullptr, OH_AVScreenCapture_GetCaptureTypeSelected0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_GetDisplayIdSelected0100", nullptr, OH_AVScreenCapture_GetDisplayIdSelected0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_GetDisplayIdSelected0101", nullptr, OH_AVScreenCapture_GetDisplayIdSelected0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForBFramesEncoding0100", nullptr, OH_AVScreenCapture_StrategyForBFramesEncoding0100,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForPickerPopUp0100", nullptr, OH_AVScreenCapture_StrategyForPickerPopUp0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCapture_StrategyForFillMode0100", nullptr, OH_AVScreenCapture_StrategyForFillMode0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_CaptureMode0100", nullptr, OH_CaptureMode0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_CaptureMode0101", nullptr, OH_CaptureMode0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_CaptureMode0102", nullptr, OH_CaptureMode0102, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AudioCodecFormat0100", nullptr, OH_AudioCodecFormat0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AudioCodecFormat0101", nullptr, OH_AudioCodecFormat0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0100", nullptr, OH_VideoCodecFormat0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0101", nullptr, OH_VideoCodecFormat0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0102", nullptr, OH_VideoCodecFormat0102, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0103", nullptr, OH_VideoCodecFormat0103, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0104", nullptr, OH_VideoCodecFormat0104, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormat0105", nullptr, OH_VideoCodecFormat0105, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_DataType0100", nullptr, OH_DataType0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_DataType0101", nullptr, OH_DataType0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_ContainerFormatType0100", nullptr, OH_ContainerFormatType0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_RecorderInfo0100", nullptr, OH_RecorderInfo0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AudioCaptureSourceType0100", nullptr, OH_AudioCaptureSourceType0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AudioCaptureSourceType0101", nullptr, OH_AudioCaptureSourceType0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVScreenCaptureStateCode0100", nullptr, OH_AVScreenCaptureStateCode0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0101", nullptr, OH_AVScreenCaptureStateCode0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0102", nullptr, OH_AVScreenCaptureStateCode0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0103", nullptr, OH_AVScreenCaptureStateCode0103, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0104", nullptr, OH_AVScreenCaptureStateCode0104, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0105", nullptr, OH_AVScreenCaptureStateCode0105, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0106", nullptr, OH_AVScreenCaptureStateCode0106, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0107", nullptr, OH_AVScreenCaptureStateCode0107, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0108", nullptr, OH_AVScreenCaptureStateCode0108, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0109", nullptr, OH_AVScreenCaptureStateCode0109, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureStateCode0110", nullptr, OH_AVScreenCaptureStateCode0110, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureBufferType0100", nullptr, OH_AVScreenCaptureBufferType0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureBufferType0101", nullptr, OH_AVScreenCaptureBufferType0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureFilterableAudioContent0100", nullptr, OH_AVScreenCaptureFilterableAudioContent0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCaptureContentChangedEvent0100", nullptr, OH_AVScreenCaptureContentChangedEvent0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVSCREEN_CAPTURE_ErrCode0100", nullptr, OH_AVSCREEN_CAPTURE_ErrCode0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AudioCaptureSourceTypeEnum", nullptr, OH_AudioCaptureSourceTypeEnum, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_CaptureModeEnum", nullptr, OH_CaptureModeEnum, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AudioCodecFormatEnum", nullptr, OH_AudioCodecFormatEnum, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_VideoCodecFormatEnum", nullptr, OH_VideoCodecFormatEnum, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_DataTypeEnum", nullptr, OH_DataTypeEnum, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCaptureStateCodeEnum", nullptr, OH_AVScreenCaptureStateCodeEnum, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVScreenCaptureContentChangedEventEnum", nullptr, OH_AVScreenCaptureContentChangedEvent_Enum, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVScreenCaptureErrCode", nullptr, OH_AVScreenCaptureErrCode, nullptr,
     nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "avscreencapturendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
