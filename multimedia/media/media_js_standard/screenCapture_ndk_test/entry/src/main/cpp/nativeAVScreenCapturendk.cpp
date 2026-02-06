/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include <js_native_api.h>
#include <cstring>
#include <iostream>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <unistd.h>
#include <cstdio>
#include <thread>
#include <native_buffer/native_buffer.h>
#include "hilog/log.h"
#include <fcntl.h>
#include <map>
#include "multimedia/player_framework/native_avscreen_capture.h"
#include "multimedia/player_framework/native_avscreen_capture_base.h"
#include "multimedia/player_framework/native_avscreen_capture_errors.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avformat.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include <fstream>
#include <memory>
#include <unistd.h>
#include <atomic>

#define LOG_DOMAIN 0x3200
#define LOG_TAG "avScreenCapture_xts"

using namespace std;
static int32_t g_recordTimeHalf = 500000;
static int32_t g_recordTimeOne = 1000000;
static uint64_t g_displaySelectedId = -1;
static int32_t g_userSelectedType = -1;
static uint64_t g_userSelectedDisplayId = -1;

OH_AVCodec *g_videoEnc;
constexpr uint32_t DEFAULT_WIDTH = 720;
constexpr uint32_t DEFAULT_HEIGHT = 1280;
constexpr OH_AVPixelFormat DEFAULT_PIXELFORMAT = AV_PIXEL_FORMAT_NV12;
static int32_t g_aFlag = 0;
static int32_t g_vFlag = 0;
static int32_t g_FrameRate = 60;
const int32_t TEST_PASS = 0;
const int32_t TEST_FAILED = 1;
static atomic<double> frameNum;
static OH_AVScreenCapture *screenCaptureNormal;
static struct OH_AVScreenCapture_ContentFilter *g_contentFilter;
static OH_AVScreenCapture *screenCaptureRecord;
static OH_AVScreenCapture *screenCaptureRecording;
static OH_AVScreenCapture *screenCaptureSurface;
static OH_AVScreenCapture *screenCaptureContentChange;
static OH_AVScreenCapture *screenCaptureStrategyForPrivacyMaskMode;
static OH_AVSCREEN_CAPTURE_ErrCode screenCaptureResult = AV_SCREEN_CAPTURE_ERR_EXTEND_START;
static OHNativeWindow *nativeWindowTest;
static napi_env screenCaptureEnv;

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

void OnError(OH_AVScreenCapture *capture, int32_t errorCode, void *userData)
{
    (void)capture;
    (void)errorCode;
    (void)userData;
}

void OnStateChange(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    (void)capture;
    (void)stateCode;
    (void)userData;
}

void OnDisplaySelected(struct OH_AVScreenCapture *capture, uint64_t displayId, void *userData)
{
    (void)capture;
    (void)displayId;
    g_displaySelectedId = displayId;
    (void)userData;
}

void OnUserSelected(OH_AVScreenCapture* capture, OH_AVScreenCapture_UserSelectionInfo* selections, void *userData)
{
    (void)capture;
    int* selectType = new int;
    uint64_t* displayId = new uint64_t;
    OH_AVScreenCapture_GetCaptureTypeSelected(selections, selectType);
    OH_AVScreenCapture_GetDisplayIdSelected(selections, displayId);
    g_userSelectedType = *selectType;
    g_userSelectedDisplayId = *displayId;
    OH_LOG_INFO(LOG_APP, "OnUserSelected g_userSelectedType=%{public}d, g_userSelectedDisplayId=%{public}lu",
        g_userSelectedType, g_userSelectedDisplayId);
    (void)userData;
}

void OnBufferAvailable(OH_AVScreenCapture *capture, OH_AVBuffer *buffer, OH_AVScreenCaptureBufferType bufferType,
                       int64_t timestamp, void *userData)
{
    if (bufferType == OH_AVScreenCaptureBufferType::OH_SCREEN_CAPTURE_BUFFERTYPE_VIDEO) {
        frameNum.store(frameNum.load() + 1);
    }
    (void)capture;
    (void)buffer;
    (void)bufferType;
    (void)timestamp;
    (void)userData;
}

void OnCaptureContentChanged(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureContentChangedEvent event,
    OH_Rect* area, void *userData)
{
    (void)capture;
    (void)event;
    (void)area;
    (void)userData;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
static napi_value NormalAVScreenCaptureTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnable is 0 ");
    }
    bool isRotation = true;
    screenCaptureResult = OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetCanvasRotation is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    if (g_contentFilter == nullptr) {
        napi_throw_error((env), nullptr, "error : expect g_contentFilter is not nullptr");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter,
        OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect AddAudioContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddWindowContent(nullptr,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect AddWindowContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect AddWindowContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect ExcludeContent is 0 ");
    }
    //测试错误码：OH_AVScreenCapture_SkipPrivacyMode
    OH_AVSCREEN_CAPTURE_ErrCode skipResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_LOG_INFO(LOG_APP, "SkipPrivacyMode skipResult = %{public}d", skipResult);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "init result1=%{public}d, StartScreenCapture result2=%{public}lu", result1, result2);

    skipResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_LOG_INFO(LOG_APP, "SkipPrivacyMode skipResult = %{public}d", skipResult);
    if (skipResult == AV_SCREEN_CAPTURE_ERR_UNSUPPORT) {
        OH_LOG_INFO(LOG_APP, "unsupport sceneboard SkipPrivacyMode is error");
    } else if (skipResult == AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "support sceneboard SkipPrivacyMode is success");
    } else {
        napi_throw_error((env), nullptr, "error : expect skipResult is 9 or 0");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
static napi_value normalAVScreenCaptureTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeHalf);
    int32_t maxFrameRate = 20;
    double exceedPercentage = 1.2;
    int32_t width = 768;
    int32_t height = 1280;
    //测试错误码：OH_AVScreenCapture_SkipPrivacyMode
    vector<int> windowidsExclude = { -111 };
    OH_AVSCREEN_CAPTURE_ErrCode skipResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_LOG_INFO(LOG_APP, "SkipPrivacyMode skipResult = %{public}d", skipResult);
    if (skipResult == AV_SCREEN_CAPTURE_ERR_UNSUPPORT) {
        OH_LOG_INFO(LOG_APP, "unsupport sceneboard SkipPrivacyMode is error");
    } else if (skipResult == AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "support sceneboard SkipPrivacyMode is success");
    } else {
        napi_throw_error((env), nullptr, "error : expect skipResult is 9 or 0");
    }
    screenCaptureResult = OH_AVScreenCapture_SetMaxVideoFrameRate(nullptr, maxFrameRate);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect SetMaxVideoFrameRate is 3");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_SetMaxVideoFrameRate(screenCaptureNormal, maxFrameRate);
    frameNum.store(0);
    usleep(g_recordTimeOne);
    int32_t totalFrameNum = frameNum.load();
    double averageFrameNum = static_cast<double>(totalFrameNum / (g_recordTimeOne / g_recordTimeOne));
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StopScreenCapture result2 = %{public}d", result2);
    if (result2 != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect StopScreenCapture is 0");
    }
    screenCaptureResult = OH_AVScreenCapture_ReleaseContentFilter(nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect ReleaseContentFilter is 3");
    }
    screenCaptureResult = OH_AVScreenCapture_ReleaseContentFilter(g_contentFilter);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect ReleaseContentFilter is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_Release(screenCaptureNormal);
    int32_t result = TEST_FAILED;
    if (result3 == AV_SCREEN_CAPTURE_ERR_OK && ((result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) ||
        (result1 == AV_SCREEN_CAPTURE_ERR_OK && averageFrameNum < (maxFrameRate * exceedPercentage)))) {
        result = TEST_PASS;
    } else {
        result = TEST_FAILED;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value NormalAVScreenRecordTest(napi_env env, napi_callback_info info)
{
    screenCaptureRecord = OH_AVScreenCapture_Create();
    if (screenCaptureRecord == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureRecord is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    OH_RecorderInfo recorderInfo;
    const std::string screenCaptureRoot = "/data/storage/el2/base/files/";
    int32_t outputFd = open((screenCaptureRoot + "screen01.mp4").c_str(), O_RDWR | O_CREAT, 0777);
    std::string fileUrl = "fd://" + std::to_string(outputFd);
    recorderInfo.url = const_cast<char *>(fileUrl.c_str());
    recorderInfo.fileFormat = OH_ContainerFormatType::CFT_MPEG_4;
    SetConfig(config_);
    config_.dataType = OH_CAPTURE_FILE;
    config_.recorderInfo = recorderInfo;

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureRecord, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureRecord, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureRecord, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureRecord, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureRecord, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenRecording(screenCaptureRecord);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StartScreenRecording result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value NormalAVScreenRecordingTest(napi_env env, napi_callback_info info)
{
    screenCaptureRecording = OH_AVScreenCapture_Create();
    if (screenCaptureRecording == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureRecording is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    OH_RecorderInfo recorderInfo;
    const std::string screenCaptureRoot = "/data/storage/el2/base/files/";
    int32_t outputFd = open((screenCaptureRoot + "screen02.mp4").c_str(), O_RDWR | O_CREAT, 0777);
    std::string fileUrl = "fd://" + std::to_string(outputFd);
    recorderInfo.url = const_cast<char *>(fileUrl.c_str());
    recorderInfo.fileFormat = OH_ContainerFormatType::CFT_MPEG_4;
    SetConfig(config_);
    config_.dataType = OH_CAPTURE_FILE;
    config_.recorderInfo = recorderInfo;

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureRecording, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureRecording, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureRecording, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureRecording, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureRecording, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenRecording(screenCaptureRecording);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StartScreenRecording result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value normalAVScreenRecordTestStoping(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenRecording(screenCaptureRecording);
    OH_LOG_INFO(LOG_APP, "StopScreenRecording result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureRecording);
    OH_LOG_INFO(LOG_APP, "Release result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value normalAVScreenRecordTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenRecording(screenCaptureRecord);
    OH_LOG_INFO(LOG_APP, "StopScreenRecording result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureRecord);
    OH_LOG_INFO(LOG_APP, "Release result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0100
static napi_value normalAVScreenCaptureDisplayCallbackSuccess(napi_env env, napi_callback_info info)
{
    g_displaySelectedId = -1;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }
    bool isRotation = true;
    screenCaptureResult = OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetCanvasRotation = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetCanvasRotation is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDisplayCallback(screenCaptureNormal, OnDisplaySelected, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDisplayCallback is 0 ");
    }
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    if (g_contentFilter == nullptr) {
        napi_throw_error((env), nullptr, "error : expect g_contentFilter is not nullptr");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter,
        OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect AddAudioContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " AddWindowContent = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect AddWindowContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " ExcludeContent = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect ExcludeContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "SkipPrivacyMode SkipPrivacyMode = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SkipPrivacyMode is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    int32_t result = TEST_FAILED;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = TEST_PASS;
    }
    if (result == TEST_PASS) {
        result = g_displaySelectedId >= 0 ? TEST_PASS : TEST_FAILED;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0200
static napi_value normalAVScreenCaptureSetDisplayCallbackFail(napi_env env, napi_callback_info info)
{
    g_displaySelectedId = -1;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }
    bool isRotation = true;
    screenCaptureResult = OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetCanvasRotation = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetCanvasRotation is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    if (g_contentFilter == nullptr) {
        napi_throw_error((env), nullptr, "error : expect g_contentFilter is not nullptr");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter,
        OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect AddAudioContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " AddWindowContent = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect AddWindowContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " ExcludeContent = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect ExcludeContent is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SkipPrivacyMode is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetDisplayCallback(screenCaptureNormal, OnDisplaySelected, nullptr);
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    int32_t result3 = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_STATE) {
        result3 = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, result3, &res);
    return res;
}

void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
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

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
static napi_value NormalAVScreenCaptureSurfaceTest(napi_env env, napi_callback_info info)
{
    screenCaptureSurface = OH_AVScreenCapture_Create();
    if (screenCaptureSurface == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureSurface is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureSurface, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureSurface, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureSurface, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureSurface, OnBufferAvailable, nullptr);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureSurface, config_);
    // 指定surface开始录屏
    OH_AVSCREEN_CAPTURE_ErrCode surfaceResult =
        OH_AVScreenCapture_StartScreenCaptureWithSurface(screenCaptureSurface, nullptr);
    if (surfaceResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect StartScreenCaptureWithSurface is 3");
    }

    // 获取需要输入的Surface，以进行编码
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    const char *name = OH_AVCapability_GetName(capability);
    g_videoEnc = OH_VideoEncoder_CreateByName(name);
    // 配置异步回调，调用 OH_VideoEncoder_SetCallback 接口
    int32_t ret =
        OH_VideoEncoder_RegisterCallback(g_videoEnc,
                                         {OnError, OnStreamChanged,
                                          OnNeedInputBuffer, OnNewOutputBuffer},
                                         nullptr);
    // 配置视频帧速率
    double frameRate = 30.0;
    // 配置视频YUV值范围标志
    bool rangeFlag = false;
    // 配置视频原色
    int32_t primary = static_cast<int32_t>(OH_ColorPrimary::COLOR_PRIMARY_BT709);
    // 配置传输特性
    int32_t transfer = static_cast<int32_t>(OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709);
    // 配置最大矩阵系数
    int32_t matrix = static_cast<int32_t>(OH_MatrixCoefficient::MATRIX_COEFFICIENT_IDENTITY);
    // 配置编码Profile
    int32_t profile = static_cast<int32_t>(OH_AVCProfile::AVC_PROFILE_BASELINE);
    // 配置编码比特率模式
    int32_t rateMode = static_cast<int32_t>(OH_VideoEncodeBitrateMode::CBR);
    // 配置关键帧的间隔，单位为毫秒
    int32_t iFrameInterval = 23000;
    // 配置所需的编码质量。只有在恒定质量模式下配置的编码器才支持此配置
    int32_t quality = 0;
    // 配置比特率
    int64_t bitRate = 3000000;
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, rangeFlag);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, primary);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, transfer);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, matrix);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, iFrameInterval);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, rateMode);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
    int result2 = OH_VideoEncoder_Configure(g_videoEnc, format);
    OH_AVFormat_Destroy(format);

    // 从视频编码器获取输入Surface
    OHNativeWindow *nativeWindow;
    int result3 = OH_VideoEncoder_GetSurface(g_videoEnc, &nativeWindow);
    if (result3 != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Started OH_VideoEncoder_GetSurface ret=%{public}d", result3);
    }
    int result4 = OH_VideoEncoder_Prepare(g_videoEnc);
    std::string_view outputFilePath = "/data/storage/el2/base/files/DemoSurface.h264";
    std::unique_ptr<std::ofstream> outputFile = std::make_unique<std::ofstream>();
    outputFile->open(outputFilePath.data(), std::ios::out | std::ios::binary | std::ios::ate);

    // 启动编码器
    int32_t retEnc = OH_VideoEncoder_Start(g_videoEnc);
    nativeWindowTest = nativeWindow;
    surfaceResult = OH_AVScreenCapture_StartScreenCaptureWithSurface(nullptr, nativeWindow);
    if (surfaceResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect StartScreenCaptureWithSurface is 3");
    }
    // 指定surface开始录屏
    OH_AVSCREEN_CAPTURE_ErrCode result5 =
        OH_AVScreenCapture_StartScreenCaptureWithSurface(screenCaptureSurface, nativeWindow);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result5 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
static napi_value normalAVScreenCaptureSurfaceTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode surfaceResult =
        OH_AVScreenCapture_StartScreenCaptureWithSurface(screenCaptureSurface, nativeWindowTest);
    if (surfaceResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect StartScreenCaptureWithSurface is 2");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureSurface);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureSurface);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

class ScreenCaptureNdkCallBack {
public:
    virtual ~ScreenCaptureNdkCallBack() = default;
    virtual void OnError(int32_t errorCode) = 0;
    virtual void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) = 0;
    virtual void OnVideoBufferAvailable(bool isReady) = 0;
};

class ScreenCaptureNdkTestCallback : public ScreenCaptureNdkCallBack {
public:
    ScreenCaptureNdkTestCallback(OH_AVScreenCapture *ScreenCapture, FILE *audioFile, FILE *iFile, FILE *videoFile)
        : screenCapture_(ScreenCapture), aFile(audioFile), innerFile(iFile), vFile(videoFile) {}
    ~ScreenCaptureNdkTestCallback() override;
    void OnError(int32_t errorCode) override;
    void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) override;
    void OnVideoBufferAvailable(bool isReady) override;

private:
    OH_AVScreenCapture *screenCapture_;
    FILE *aFile = nullptr;
    FILE *innerFile = nullptr;
    FILE *vFile = nullptr;
};

ScreenCaptureNdkTestCallback::~ScreenCaptureNdkTestCallback()
{
    screenCapture_ = nullptr;
    aFile = nullptr;
    innerFile = nullptr;
    vFile = nullptr;
}

void ScreenCaptureNdkTestCallback::OnError(int32_t errorCode)
{
    (void) errorCode;
}

void ScreenCaptureNdkTestCallback::OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type)
{
    if (isReady == true) {
        OH_AudioBuffer *audioBuffer = (OH_AudioBuffer *)malloc(sizeof(OH_AudioBuffer));
        if (audioBuffer == nullptr) {
            OH_LOG_INFO(LOG_APP, "audio buffer is nullptr");
            return;
        }
        if (OH_AVScreenCapture_AcquireAudioBuffer(screenCapture_, &audioBuffer, type) == AV_SCREEN_CAPTURE_ERR_OK) {
            if ((aFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_MIC)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, aFile);
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            } else if ((innerFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_ALL_PLAYBACK)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, innerFile);
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            }
            free(audioBuffer);
            audioBuffer = nullptr;
        }
        if (g_aFlag == 1) {
            OH_AVScreenCapture_ReleaseAudioBuffer(screenCapture_, type);
        }
    } else {
        OH_LOG_INFO(LOG_APP, "AcquireAudioBuffer failed");
    }
}

void ScreenCaptureNdkTestCallback::OnVideoBufferAvailable(bool isReady)
{
    if (isReady == true) {
        int32_t fence = 0;
        int64_t timestamp = 0;
        int32_t size = 4;
        OH_Rect damage;
        OH_NativeBuffer_Config config;
        OH_NativeBuffer *nativeBuffer =
            OH_AVScreenCapture_AcquireVideoBuffer(screenCapture_, &fence, &timestamp, &damage);
        if (nativeBuffer != nullptr) {
            OH_NativeBuffer_GetConfig(nativeBuffer, &config);
            int32_t length = config.height * config.width * size;

            OH_NativeBuffer_Unreference(nativeBuffer);
            if (g_vFlag == 1) {
                OH_AVScreenCapture_ReleaseVideoBuffer(screenCapture_);
            }
        } else {
            OH_LOG_INFO(LOG_APP, "AcquireVideoBuffer failed");
        }
    }
}

std::shared_ptr<ScreenCaptureNdkTestCallback> screenCaptureCb = nullptr;
static char g_filename[100] = {0};
std::mutex mutex_;
std::map<OH_AVScreenCapture *, std::shared_ptr<ScreenCaptureNdkCallBack>> mockCbMap_;

FILE *OpenAFile(FILE *audioFile, string filename)
{
    snprintf(g_filename, sizeof(g_filename), "data/storage/el2/base/files/%s.pcm", filename.c_str());
    audioFile = fopen(g_filename, "w+");
    return audioFile;
}

void CloseFile(FILE *audioFile, FILE *videoFile)
{
    if (audioFile != nullptr) {
        fclose(audioFile);
        audioFile = nullptr;
    }
    if (videoFile != nullptr) {
        fclose(videoFile);
        videoFile = nullptr;
    }
}

void DelCallback(OH_AVScreenCapture *screenCapture)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return;
    }
    auto it = mockCbMap_.find(screenCapture);
    if (it != mockCbMap_.end()) {
        mockCbMap_.erase(it);
    }
}

std::shared_ptr<ScreenCaptureNdkCallBack> GetCallback(OH_AVScreenCapture *screenCapture)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return nullptr;
    }
    if (mockCbMap_.find(screenCapture) != mockCbMap_.end()) {
        return mockCbMap_.at(screenCapture);
    }
    return nullptr;
}

void OnError(OH_AVScreenCapture *screenCapture, int32_t errorCode)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnError(errorCode);
    }
}

void OnAudioBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady, OH_AudioCaptureSourceType type)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnAudioBufferAvailable(isReady, type);
    }
}

void OnVideoBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnVideoBufferAvailable(isReady);
    }
}

void SetScreenCaptureCallback(OH_AVScreenCapture *screenCapture, std::shared_ptr<ScreenCaptureNdkTestCallback> &cb)
{
    if (cb != nullptr) {
        std::lock_guard<std::mutex> lock(mutex_);
        mockCbMap_[screenCapture] = cb;
        struct OH_AVScreenCaptureCallback callback;
        callback.onError = OnError;
        callback.onAudioBufferAvailable = OnAudioBufferAvailable;
        callback.onVideoBufferAvailable = OnVideoBufferAvailable;
        OH_AVScreenCapture_SetCallback(screenCapture, callback);
    }
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400
static napi_value OriginAVScreenCaptureTest(napi_env env, napi_callback_info info)
{
    FILE *audioFile = nullptr;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    if (screenCapture == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCapture is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_0004");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, nullptr);

    bool isMicrophone = true;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }

    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetScreenCaptureCallback is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect OH_AVScreenCapture_Init is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    screenCaptureResult = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect StartScreenCapture is 0 ");
    }
    DelCallback(screenCapture);
    screenCaptureResult = OH_AVScreenCapture_Release(screenCapture);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect Release is 0 ");
    }
    CloseFile(audioFile, nullptr);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        OH_LOG_INFO(LOG_APP, "init/start/stop failed, init: %d, start: %d", result1, result2);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    screenCaptureResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetMicrophoneEnabled = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetMicrophoneEnabled is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetErrorCallback = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetErrorCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetStateCallback = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetStateCallback is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " SetDataCallback = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect SetDataCallback is 0 ");
    }

    screenCaptureResult = OH_AVScreenCapture_ShowCursor(screenCaptureNormal, false);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " ShowCursor = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect ShowCursor is 0 ");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    screenCaptureResult = OH_AVScreenCapture_ShowCursor(screenCaptureNormal, false);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect ShowCursor is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorBeforeTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    screenCaptureResult = OH_AVScreenCapture_ShowCursor(screenCaptureNormal, true);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect ShowCursor is 0 ");
    }
    usleep(g_recordTimeOne);
    screenCaptureResult = OH_AVScreenCapture_ShowCursor(screenCaptureNormal, false);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, " ShowCursor = %{public}d", screenCaptureResult);
        napi_throw_error((env), nullptr, "error : expect ShowCursor is 0 ");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value normalAVScreenCaptureShowCursorWithParaNullFalse(napi_env env, napi_callback_info info)
{
    bool isMicrophone = false;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_ShowCursor(nullptr, false);
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        resCapture = TEST_PASS;
    }
    OH_AVScreenCapture_Release(screenCaptureNormal);
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}


static napi_value normalAVScreenCaptureShowCursorWithParaNullTrue(napi_env env, napi_callback_info info)
{
    bool isMicrophone = false;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_ShowCursor(nullptr, true);
    OH_AVSCREEN_CAPTURE_ErrCode setDateResult = OH_AVScreenCapture_SetDataCallback(nullptr,
        OnBufferAvailable, nullptr);
    if (setDateResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect setDateResult is 2");
    }
    setDateResult = OH_AVScreenCapture_SetDataCallback(screenCaptureNormal,
        OnBufferAvailable, nullptr);
    if (setDateResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect setDateResult is 0 ");
    }

    OH_AudioBuffer *audioBuffer = (OH_AudioBuffer *)malloc(sizeof(OH_AudioBuffer));
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    if (audioBuffer != nullptr) {
        OH_LOG_INFO(LOG_APP, "audio buffer is not nullptr");
        //测试错误码：OH_AVScreenCapture_AcquireAudioBuffer
        OH_AVSCREEN_CAPTURE_ErrCode audioBufferResult = OH_AVScreenCapture_AcquireAudioBuffer(screenCaptureNormal,
            &audioBuffer, type);
        OH_LOG_INFO(LOG_APP, "AcquireAudioBuffer audioBufferResult = %{public}d", audioBufferResult);
        if (audioBufferResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
            napi_throw_error((env), nullptr, "error : expect audioBufferResult is 2");
        }

        //测试错误码：OH_AVScreenCapture_ReleaseAudioBuffer
        OH_AVSCREEN_CAPTURE_ErrCode relwaseAudioBufferResult = OH_AVScreenCapture_ReleaseAudioBuffer(
            screenCaptureNormal, type);
        OH_LOG_INFO(LOG_APP, "ReleaseAudioBuffer relwaseAudioBufferResult = %{public}d", relwaseAudioBufferResult);
        if (audioBufferResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
            napi_throw_error((env), nullptr, "error : expect relwaseAudioBufferResult is 2");
        }
    }

    //测试错误码：OH_AVScreenCapture_ReleaseVideoBuffer
    OH_AVSCREEN_CAPTURE_ErrCode releaseBufferResult = OH_AVScreenCapture_ReleaseVideoBuffer(screenCaptureNormal);
    if (releaseBufferResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect releaseBufferResult is 2");
    }

    //测试错误码：OH_AVScreenCapture_ReleaseVideoBuffer
    OH_AVSCREEN_CAPTURE_ErrCode microResult = OH_AVScreenCapture_SetMicrophoneEnabled(nullptr,
        isMicrophone);
    if (microResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect microResult is 3");
    }
    microResult = OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal,
        isMicrophone);
    if (microResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect microResult is 0 ");
    }

    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        resCapture = TEST_PASS;
    }
    OH_AVScreenCapture_Release(screenCaptureNormal);
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForKeepCaptureDuringCallFalse(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForKeepCaptureDuringCall(strategy, false);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForKeepCaptureDuringCallTrue(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();

    OH_AVSCREEN_CAPTURE_ErrCode result0 = AV_SCREEN_CAPTURE_ERR_OK;
    result0 = OH_AVScreenCapture_StrategyForKeepCaptureDuringCall(nullptr, true);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StrategyForKeepCaptureDuringCall result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect StrategyForKeepCaptureDuringCall is Error");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForKeepCaptureDuringCall(strategy, true);
    OH_LOG_INFO(LOG_APP, "StrategyForKeepCaptureDuringCall result = %{public}d", result);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureContentChangedCallback(napi_env env, napi_callback_info info)
{
    screenCaptureContentChange = OH_AVScreenCapture_Create();
    if (screenCaptureContentChange == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureContentChange is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureContentChange, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureContentChange, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureContentChange, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureContentChange, OnBufferAvailable, nullptr);

    OH_AVScreenCapture_SetCaptureContentChangedCallback(screenCaptureContentChange, OnCaptureContentChanged, nullptr);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureContentChange, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureContentChange);
    OH_LOG_INFO(LOG_APP, "StartScreenCapture result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_CHANGED_0100
static napi_value normalAVScreenCaptureContentChangedTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureContentChange);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureContentChange);
    OH_LOG_INFO(LOG_APP, "Release result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureSetCaptureAreaTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);

    OH_Rect* area = new OH_Rect;
    area->x = 0;
    area->y = 0;
    area->width = 5;
    area->height = 5;
    OH_AVScreenCapture_SetCaptureArea(screenCaptureNormal, 0, area);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StartScreenCapture result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureSetCaptureAreaTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_Rect* area = new OH_Rect;
    area->x = 0;
    area->y = 0;
    area->width = 10;
    area->height = 10;
    OH_AVScreenCapture_SetCaptureArea(screenCaptureNormal, 0, area);
    usleep(g_recordTimeOne);
    OH_Rect* areaInvalid = new OH_Rect;
    area->x = 0;
    area->y = 0;
    area->width = 5000;
    area->height = 5000;
    OH_AVScreenCapture_SetCaptureArea(screenCaptureNormal, 0, areaInvalid);
    usleep(g_recordTimeOne);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForPrivacyMaskModeScreen(napi_env env, napi_callback_info info)
{
    screenCaptureStrategyForPrivacyMaskMode = OH_AVScreenCapture_Create();
    if (screenCaptureStrategyForPrivacyMaskMode == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureStrategyForPrivacyMaskMode is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureStrategyForPrivacyMaskMode, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureStrategyForPrivacyMaskMode, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureStrategyForPrivacyMaskMode, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureStrategyForPrivacyMaskMode, OnBufferAvailable, nullptr);

    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVScreenCapture_StrategyForPrivacyMaskMode(strategy, 0);
    OH_AVScreenCapture_StrategyForCanvasFollowRotation(strategy, true);
    OH_AVScreenCapture_SetCaptureStrategy(screenCaptureStrategyForPrivacyMaskMode, strategy);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureStrategyForPrivacyMaskMode, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(
        screenCaptureStrategyForPrivacyMaskMode);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay(napi_env env, napi_callback_info info)
{
    screenCaptureStrategyForPrivacyMaskMode = OH_AVScreenCapture_Create();
    if (screenCaptureStrategyForPrivacyMaskMode == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureStrategyForPrivacyMaskMode is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureStrategyForPrivacyMaskMode, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureStrategyForPrivacyMaskMode, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureStrategyForPrivacyMaskMode, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureStrategyForPrivacyMaskMode, OnBufferAvailable, nullptr);

    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVScreenCapture_StrategyForPrivacyMaskMode(strategy, 1);
    OH_AVScreenCapture_StrategyForCanvasFollowRotation(strategy, false);
    OH_AVScreenCapture_SetCaptureStrategy(screenCaptureStrategyForPrivacyMaskMode, strategy);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureStrategyForPrivacyMaskMode, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(
        screenCaptureStrategyForPrivacyMaskMode);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StartScreenCapture result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE
static napi_value normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(
        screenCaptureStrategyForPrivacyMaskMode);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StopScreenCapture result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureStrategyForPrivacyMaskMode);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetSelectionCallback_0100
static napi_value normalAVScreenCaptureSelectionCallbackSuccess(napi_env env, napi_callback_info info)
{
    g_userSelectedType = -1;
    g_userSelectedDisplayId = -1;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    OH_AVScreenCapture_SetSelectionCallback(screenCaptureNormal, OnUserSelected, nullptr);

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StartScreenCapture result2 = %{public}d", result2);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "g_userSelectedType=%{public}d, g_userSelectedDisplayId=%{public}lu",
            g_userSelectedType, g_userSelectedDisplayId);
        result = g_userSelectedType >= 0 ? AV_SCREEN_CAPTURE_ERR_OK : AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
        result = g_userSelectedDisplayId >= 0 ? AV_SCREEN_CAPTURE_ERR_OK : AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetSelectionCallback_0100
static napi_value normalAVScreenCaptureSelectionCallbackStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeHalf);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StopScreenCapture result1 = %{public}d", result1);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    int32_t result = TEST_FAILED;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = TEST_PASS;
    } else {
        result = TEST_FAILED;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value multiAVScreenCaptureCreate(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCaptureCreate11 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate11 == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate11 is not nullptr");
    }
    OH_AVScreenCapture *screenCaptureCreate12 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate12 == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate12 is not nullptr");
    }
    OH_AVScreenCapture *screenCaptureCreate13 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate13 == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate13 is not nullptr");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Release(screenCaptureCreate11);
    OH_AVScreenCapture *screenCaptureCreate14 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate14 == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate14 is not nullptr");
    }
    OH_AVScreenCapture *screenCaptureCreate15 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate15 == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate15 is not nullptr");
    }
    OH_AVScreenCapture *screenCaptureCreate16 = OH_AVScreenCapture_Create();
    if (screenCaptureCreate16 != nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate16 is not nullptr");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureCreate12);
    result2 = OH_AVScreenCapture_Release(screenCaptureCreate13);
    if (result2 != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate13 is not Fail");
    }
    result2 = OH_AVScreenCapture_Release(screenCaptureCreate14);
    if (result2 != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate14 is not Fail");
    }
    result2 = OH_AVScreenCapture_Release(screenCaptureCreate15);
    if (result2 != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate15 is not Fail");
    }
    result2 = OH_AVScreenCapture_Release(screenCaptureCreate16);
    if (result2 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureCreate16 is not Fail");
    }
    OH_LOG_INFO(LOG_APP, "multiAVScreenCaptureCreate release result2 = %{public}d", result2);
    napi_value res;
    napi_create_int32(env, result2, &res);
    return res;
}
// SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0400
static napi_value normalAVScreenCaptureErrorTest(napi_env env, napi_callback_info info)
{
    FILE *audioFile = nullptr;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    if (screenCapture == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCapture is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_ES;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_0004");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, nullptr);

    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result1 = %{public}d", result1);
    if (result1 != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect OH_VIDEO_SOURCE_SURFACE_ES is Error");
    }

    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_YUV;
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result2 = %{public}d", result2);
    if (result2 != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect OH_VIDEO_SOURCE_SURFACE_YUV is Error");
    }

    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_BUTT;
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result3 = %{public}d", result3);
    if (result3 != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect OH_VIDEO_SOURCE_BUTT is Error");
    }

    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, nullptr);
    screenCaptureCb = nullptr;
    napi_value res;
    napi_create_int32(env, result1, &res);
    return res;
}
static napi_value normalAreaTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    OH_Rect* area = new OH_Rect;
    int32_t areawh = 5;
    area->x = 0;
    area->y = 0;
    area->width = areawh;
    area->height = areawh;
    OH_AVSCREEN_CAPTURE_ErrCode result0 = OH_AVScreenCapture_SetCaptureArea(screenCaptureNormal, -1, area);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_SetCaptureArea result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect displayId is Error");
    }

    OH_Rect* area2 = new OH_Rect;
    area2->x = -1;
    area2->y = -1;
    area2->width = -1;
    area2->height = -1;
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_SetCaptureArea(screenCaptureNormal, 0, area2);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_SetCaptureArea result0 = %{public}d", result1);
    if (result1 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect OH_Rect is Error");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_SetCaptureArea(nullptr, 0, area);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_SetCaptureArea result3 = %{public}d", result3);
    if (result3 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is Error");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result4 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init result4 = %{public}d", result4);
    OH_AVScreenCapture_Release(screenCaptureNormal);

    napi_value res;
    napi_create_int32(env, result0, &res);
    return res;
}

static napi_value normalStrategyTest(napi_env env, napi_callback_info info)
{
    screenCaptureStrategyForPrivacyMaskMode = OH_AVScreenCapture_Create();
    if (screenCaptureStrategyForPrivacyMaskMode == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureStrategyForPrivacyMaskMode is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    OH_AVScreenCapture_CaptureStrategy* strategyNull = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode result0 = AV_SCREEN_CAPTURE_ERR_OK;
    result0 = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureStrategyForPrivacyMaskMode, strategyNull);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_SetCaptureStrategy result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect strategy is not nullptr");
    }

    result0 = OH_AVScreenCapture_StrategyForPrivacyMaskMode(nullptr, 0);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StrategyForPrivacyMaskMode result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect result0 is 3");
    }

    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    int32_t maskmode = 2;
    result0 = OH_AVScreenCapture_StrategyForPrivacyMaskMode(strategy, maskmode);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_StrategyForPrivacyMaskMode result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect result0 is 3");
    }

    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureStrategyForPrivacyMaskMode, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(
        screenCaptureStrategyForPrivacyMaskMode);

    result0 = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureStrategyForPrivacyMaskMode, strategy);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_SetCaptureStrategy result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_STATE) {
        napi_throw_error((env), nullptr, "error : expect strategy is not support");
    }

    result0 = OH_AVScreenCapture_SetSelectionCallback(nullptr, OnUserSelected, nullptr);
    OH_LOG_INFO(LOG_APP, "SetSelectionCallback result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect result0 is 3");
    }

    OH_AVScreenCapture_Release(screenCaptureStrategyForPrivacyMaskMode);
    napi_value res;
    napi_create_int32(env, result0, &res);
    return res;
}

void OnUserSelectedError(OH_AVScreenCapture* capture, OH_AVScreenCapture_UserSelectionInfo* selections, void *userData)
{
    (void)capture;
    int* selectType = new int;
    uint64_t* displayId = new uint64_t;
    OH_AVSCREEN_CAPTURE_ErrCode result0 = AV_SCREEN_CAPTURE_ERR_OK;
    OH_AVScreenCapture_UserSelectionInfo* selectionsnull = nullptr;
    result0 = OH_AVScreenCapture_GetCaptureTypeSelected(selectionsnull, selectType);
    OH_LOG_INFO(LOG_APP, "GetCaptureTypeSelected result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((screenCaptureEnv), nullptr, "error : expect GetCaptureTypeSelected is not nullptr");
    }

    result0 = OH_AVScreenCapture_GetDisplayIdSelected(selectionsnull, displayId);
    OH_LOG_INFO(LOG_APP, "GetDisplayIdSelected result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((screenCaptureEnv), nullptr, "error : expect GetDisplayIdSelected is not nullptr");
    }
    g_userSelectedType = *selectType;
    g_userSelectedDisplayId = *displayId;
    OH_LOG_INFO(LOG_APP, "OnUserSelected g_userSelectedType=%{public}d, g_userSelectedDisplayId=%{public}lu",
        g_userSelectedType, g_userSelectedDisplayId);
    (void)userData;
}
static napi_value normalSelectionCallback(napi_env env, napi_callback_info info)
{
    g_userSelectedType = -1;
    g_userSelectedDisplayId = -1;
    screenCaptureEnv = env;
    OH_AVSCREEN_CAPTURE_ErrCode result0 = AV_SCREEN_CAPTURE_ERR_OK;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error : expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    result0 = OH_AVScreenCapture_SetSelectionCallback(nullptr, OnUserSelectedError, nullptr);
    OH_LOG_INFO(LOG_APP, "SetSelectionCallback result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect result0 is 3");
    }
    result0 = OH_AVScreenCapture_SetSelectionCallback(screenCaptureNormal, OnUserSelectedError, nullptr);
    OH_LOG_INFO(LOG_APP, "SetSelectionCallback result0 = %{public}d", result0);
    if (result0 != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect result0 is 0 ");
    }
    //测试错误码：OH_AVScreenCapture_StartScreenRecording
    OH_AVSCREEN_CAPTURE_ErrCode startingResult = OH_AVScreenCapture_StartScreenRecording(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StartScreenRecording startingResult = %{public}d", startingResult);
    if (startingResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect startingResult is 2");
    }
    //测试错误码：OH_AVScreenCapture_StartScreenCapture
    OH_AVSCREEN_CAPTURE_ErrCode startResult = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StartScreenCapture startResult = %{public}d", startResult);
    if (startResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect startResult is 2");
    }
    //测试错误码：OH_AVScreenCapture_StopScreenRecording
    OH_AVSCREEN_CAPTURE_ErrCode stopingResult = OH_AVScreenCapture_StopScreenRecording(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StopScreenRecording stopingResult = %{public}d", stopingResult);
    if (stopingResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect stopingResult is 2");
    }
    //测试错误码：OH_AVScreenCapture_StopScreenCapture
    OH_AVSCREEN_CAPTURE_ErrCode stopResult = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture stopResult = %{public}d", stopResult);
    if (stopResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect stopResult is 2");
    }

    //测试错误码：OH_AVScreenCapture_SkipPrivacyMode
    vector<int> windowidsExclude = { -111 };
    OH_AVSCREEN_CAPTURE_ErrCode skipResult = OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_LOG_INFO(LOG_APP, "SkipPrivacyMode initResult = %{public}d", skipResult);
    if (skipResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect skipResult is 0 ");
    }
    skipResult = OH_AVScreenCapture_SkipPrivacyMode(nullptr, &windowidsExclude[0],
        static_cast<int32_t>(windowidsExclude.size()));
    OH_LOG_INFO(LOG_APP, "SkipPrivacyMode skipResult = %{public}d", skipResult);
    if (skipResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect skipResult is 3");
    }

    //测试错误码：OH_AVScreenCapture_SetCanvasRotation
    bool isRotation = true;
    screenCaptureResult = OH_AVScreenCapture_SetCanvasRotation(nullptr, isRotation);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect SetCanvasRotation is 3");
    }
    //测试错误码：OH_AVScreenCapture_ExcludeContent
    screenCaptureResult = OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, nullptr);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect ExcludeContent is 3");
    }

    //测试错误码：OH_AVScreenCapture_Init
    OH_AVSCREEN_CAPTURE_ErrCode initResult = OH_AVScreenCapture_Init(nullptr, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init initResult = %{public}d", initResult);
    if (initResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect result1 is 3");
    }
    initResult = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init initResult = %{public}d", initResult);
    if (initResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect initResult is 0 ");
    }
    //测试错误码：OH_AVScreenCapture_StartScreenRecording
    startingResult = OH_AVScreenCapture_StartScreenRecording(nullptr);
    OH_LOG_INFO(LOG_APP, "StartScreenRecording startingResult = %{public}d", startingResult);
    if (startingResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect startResult is 3");
    }

    //测试错误码：OH_AVScreenCapture_StartScreenCapture
    startResult = OH_AVScreenCapture_StartScreenCapture(nullptr);
    OH_LOG_INFO(LOG_APP, "StartScreenCapture startResult = %{public}d", startResult);
    if (startResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect startResult is 3");
    }
    startResult = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StartScreenCapture startResult = %{public}d", startResult);
    if (startResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect startResult is 0 ");
    }

    initResult = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Init initResult = %{public}d", initResult);
    if (initResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect initResult is 2");
    }
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (startResult == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "g_userSelectedType=%{public}d, g_userSelectedDisplayId=%{public}lu",
            g_userSelectedType, g_userSelectedDisplayId);
        result = g_userSelectedType >= 0 ? AV_SCREEN_CAPTURE_ERR_OK : AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
        result = g_userSelectedDisplayId >= 0 ? AV_SCREEN_CAPTURE_ERR_OK : AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalSelectionCallbackStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeHalf);
    OH_AudioBuffer *audioBuffer = (OH_AudioBuffer *)malloc(sizeof(OH_AudioBuffer));
    OH_AudioCaptureSourceType type = OH_SOURCE_DEFAULT;
    if (audioBuffer != nullptr) {
        OH_LOG_INFO(LOG_APP, "audio buffer is not nullptr");
        //测试错误码：OH_AVScreenCapture_AcquireAudioBuffer
        OH_AVSCREEN_CAPTURE_ErrCode audioBufferResult = OH_AVScreenCapture_AcquireAudioBuffer(nullptr,
            &audioBuffer, type);
        OH_LOG_INFO(LOG_APP, "AcquireAudioBuffer audioBufferResult = %{public}d", audioBufferResult);
        if (audioBufferResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
            napi_throw_error((env), nullptr, "error : expect audioBufferResult is 3");
        }

        //测试错误码：OH_AVScreenCapture_ReleaseAudioBuffer
        OH_AVSCREEN_CAPTURE_ErrCode relwaseAudioBufferResult = OH_AVScreenCapture_ReleaseAudioBuffer(nullptr, type);
        OH_LOG_INFO(LOG_APP, "ReleaseAudioBuffer relwaseAudioBufferResult = %{public}d", relwaseAudioBufferResult);
        if (audioBufferResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
            napi_throw_error((env), nullptr, "error : expect relwaseAudioBufferResult is 3");
        }
    }
    //测试错误码：OH_AVScreenCapture_ReleaseVideoBuffer
    OH_AVSCREEN_CAPTURE_ErrCode releaseBufferResult = OH_AVScreenCapture_ReleaseVideoBuffer(nullptr);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture releaseBufferResult = %{public}d", releaseBufferResult);
    if (releaseBufferResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect releaseBufferResult is 3");
    }
    //测试错误码：OH_AVScreenCapture_SetCanvasRotation
    bool isRotation = true;
    screenCaptureResult = OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture SetCanvasRotation = %{public}d", screenCaptureResult);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetCanvasRotation is 2");
    }
    //测试错误码：OH_AVScreenCapture_ExcludeContent
    screenCaptureResult = OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, nullptr);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture ExcludeContent = %{public}d", screenCaptureResult);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect ExcludeContent is 2");
    }
    screenCaptureResult = OH_AVScreenCapture_ResizeCanvas(nullptr,
        DEFAULT_WIDTH, DEFAULT_HEIGHT); // 768 width 1280 height
    OH_LOG_INFO(LOG_APP, "StopScreenCapture ResizeCanvas = %{public}d", screenCaptureResult);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect ResizeCanvas is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_SetMaxVideoFrameRate(screenCaptureNormal, g_aFlag);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture SetMaxVideoFrameRate = %{public}d", screenCaptureResult);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect SetMaxVideoFrameRate is 3");
    }
    screenCaptureResult = OH_AVScreenCapture_SetMaxVideoFrameRate(screenCaptureNormal, g_FrameRate);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture SetMaxVideoFrameRate = %{public}d", screenCaptureResult);
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect SetMaxVideoFrameRate is 2");
    }

    //测试错误码：OH_AVScreenCapture_StopScreenCapture
    OH_AVSCREEN_CAPTURE_ErrCode stopResult = OH_AVScreenCapture_StopScreenCapture(nullptr);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture stopResult = %{public}d", stopResult);
    if (stopResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect stopResult is 3");
    }
    stopResult = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "StopScreenCapture stopResult = %{public}d", stopResult);
    if (stopResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect stopResult is 0 ");
    }
    screenCaptureResult = OH_AVScreenCapture_ResizeCanvas(screenCaptureNormal, DEFAULT_WIDTH,
        DEFAULT_HEIGHT); // 768 width 1280 height
    if (screenCaptureResult != AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        napi_throw_error((env), nullptr, "error : expect ResizeCanvas is 2 ");
    }

    //测试错误码：OH_AVScreenCapture_StopScreenCapture
    OH_AVSCREEN_CAPTURE_ErrCode releaseResult = OH_AVScreenCapture_Release(nullptr);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Release releaseResult = %{public}d", releaseResult);
    if (releaseResult != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect releaseResult is 3");
    }
    releaseResult = OH_AVScreenCapture_Release(screenCaptureNormal);
    OH_LOG_INFO(LOG_APP, "OH_AVScreenCapture_Release releaseResult = %{public}d", releaseResult);
    if (releaseResult != AV_SCREEN_CAPTURE_ERR_OK) {
        napi_throw_error((env), nullptr, "error : expect releaseResult is 0 ");
    }

    napi_value res;
    napi_create_int32(env, releaseResult, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForBFramesEncodingFalse(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode resultStrategy = OH_AVScreenCapture_StrategyForBFramesEncoding(strategy, false);
    OH_LOG_INFO(LOG_APP, "StrategyForBFramesEncoding resultStrategy = %{public}d", resultStrategy);
    if (resultStrategy != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect resultStrategy is 3 ");
    }
    resultStrategy = OH_AVScreenCapture_StrategyForPickerPopUp(strategy, false);
    OH_LOG_INFO(LOG_APP, "StrategyForBFramesEncoding resultStrategy = %{public}d", resultStrategy);
    if (resultStrategy != AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        napi_throw_error((env), nullptr, "error : expect resultStrategy is 3 ");
    }
    strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForBFramesEncoding(strategy, false);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForBFramesEncodingTrue(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForBFramesEncoding(strategy, true);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForPickerPopUpTrue(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForPickerPopUp(strategy, true);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForPickerPopUpFalse(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy* strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForPickerPopUp(strategy, false);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForFillModeAspect(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy *strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForFillMode(
        strategy, OH_AVScreenCapture_FillMode::OH_SCREENCAPTURE_FILLMODE_ASPECT_SCALE_FIT);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    } else {
        napi_throw_error((env), nullptr, "error: expect set result is 0");
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    } else {
        napi_throw_error((env), nullptr, "error: expect release result is 0");
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

static napi_value normalAVScreenCaptureStrategyForFillModeScale(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    if (screenCaptureNormal == nullptr) {
        napi_throw_error((env), nullptr, "error: expect screenCaptureNormal is not nullptr");
    }
    OH_AVScreenCapture_CaptureStrategy *strategy = OH_AVScreenCapture_CreateCaptureStrategy();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_StrategyForFillMode(
        strategy, OH_AVScreenCapture_FillMode::OH_SCREENCAPTURE_FILLMODE_SCALE_TO_FILL);
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetCaptureStrategy(screenCaptureNormal, strategy);
    } else {
        napi_throw_error((env), nullptr, "error: expect set result is 0");
    }
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_ReleaseCaptureStrategy(strategy);
    } else {
        napi_throw_error((env), nullptr, "error: expect release result is 0");
    }
    if (screenCaptureNormal) {
        result = OH_AVScreenCapture_Release(screenCaptureNormal);
    }
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_OK) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"normalAVScreenCaptureTest", nullptr, NormalAVScreenCaptureTest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenRecordTest", nullptr, NormalAVScreenRecordTest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenRecordingTest", nullptr, NormalAVScreenRecordingTest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenRecordTestStoping", nullptr, normalAVScreenRecordTestStoping, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureSurfaceTest", nullptr, NormalAVScreenCaptureSurfaceTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"originAVScreenCaptureTest", nullptr, OriginAVScreenCaptureTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureTestStop", nullptr, normalAVScreenCaptureTestStop, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenRecordTestStop", nullptr, normalAVScreenRecordTestStop, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureSurfaceTestStop", nullptr, normalAVScreenCaptureSurfaceTestStop, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorTest", nullptr, normalAVScreenCaptureShowCursorTest, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorTestStop", nullptr, normalAVScreenCaptureShowCursorTestStop, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorWithParaNullTrue", nullptr, normalAVScreenCaptureShowCursorWithParaNullTrue,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorWithParaNullFalse", nullptr, normalAVScreenCaptureShowCursorWithParaNullFalse,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorBeforeTestStop", nullptr, normalAVScreenCaptureShowCursorBeforeTestStop,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSetDisplayCallbackFail", nullptr, normalAVScreenCaptureSetDisplayCallbackFail,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureDisplayCallbackSuccess", nullptr, normalAVScreenCaptureDisplayCallbackSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForKeepCaptureDuringCallFalse", nullptr,
            normalAVScreenCaptureStrategyForKeepCaptureDuringCallFalse, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenCaptureStrategyForKeepCaptureDuringCallTrue", nullptr,
            normalAVScreenCaptureStrategyForKeepCaptureDuringCallTrue, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenCaptureContentChangedCallback", nullptr, normalAVScreenCaptureContentChangedCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureContentChangedTestStop", nullptr, normalAVScreenCaptureContentChangedTestStop,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSetCaptureAreaTest", nullptr, normalAVScreenCaptureSetCaptureAreaTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSetCaptureAreaTestStop", nullptr, normalAVScreenCaptureSetCaptureAreaTestStop,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForPrivacyMaskModeScreen", nullptr,
            normalAVScreenCaptureStrategyForPrivacyMaskModeScreen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay", nullptr,
            normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop", nullptr,
            normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSelectionCallbackSuccess", nullptr, normalAVScreenCaptureSelectionCallbackSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSelectionCallbackStop", nullptr, normalAVScreenCaptureSelectionCallbackStop,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"multiAVScreenCaptureCreate", nullptr, multiAVScreenCaptureCreate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureErrorTest", nullptr, normalAVScreenCaptureErrorTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAreaTest", nullptr, normalAreaTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalStrategyTest", nullptr, normalStrategyTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalSelectionCallback", nullptr, normalSelectionCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalSelectionCallbackStop", nullptr, normalSelectionCallbackStop, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForBFramesEncodingFalse", nullptr,
            normalAVScreenCaptureStrategyForBFramesEncodingFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForBFramesEncodingTrue", nullptr,
            normalAVScreenCaptureStrategyForBFramesEncodingTrue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForPickerPopUpFalse", nullptr,
            normalAVScreenCaptureStrategyForPickerPopUpFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForPickerPopUpTrue", nullptr,
            normalAVScreenCaptureStrategyForPickerPopUpTrue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForFillModeAspect", nullptr,
            normalAVScreenCaptureStrategyForFillModeAspect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureStrategyForFillModeScale", nullptr,
            normalAVScreenCaptureStrategyForFillModeScale, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeAVScreenCapturendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
