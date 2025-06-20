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
#include "napi/native_api.h"
#include "main.h"
#include <cstdio>
#include <cstdlib>
#include <iostream>

#define LOG_DOMIN 0x3200
#define LOG_TAG "MY_NDKDEMO_"
#define FOCUS_MODE_INDEX 0
#define CAMERA_DEVICE_INDEX 1
#define SCENE_MODE_INDEX 2
#define PREVIEW_ID_INDEX 3
#define PHOTO_ID_INDEX 4
#define VIDEO_FRAME_WIDTH_INDEX 6
#define VIDEO_FRAME_HHEIGHT_INDEX 7


#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include "GLES3/gl32.h"
#include <typeinfo>
#include <fcntl.h>
#include <string>
#include <arpa/nameser.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <sys/stat.h>
#include <unistd.h>
#include <vector>
#include <thread>

using namespace std;

static OH_AVRecorder_Config *config;
// 设置状态回调
void OnStateChange(OH_AVRecorder *recorder, OH_AVRecorder_State state, OH_AVRecorder_StateChangeReason reason,
                   void *userData)
{
    (void)recorder;
    (void)userData;
    const char *reasonStr = (reason == AVRECORDER_USER)         ? "USER"
                            : (reason == AVRECORDER_BACKGROUND) ? "BACKGROUND"
                                                                : "UNKNOWN";
    switch (state) {
        case AVRECORDER_IDLE:
            break;
        case AVRECORDER_PREPARED:
            break;
        case AVRECORDER_STARTED:
            break;
        case AVRECORDER_PAUSED:
            break;
        case AVRECORDER_STOPPED:
            break;
        case AVRECORDER_RELEASED:
            break;
        case AVRECORDER_ERROR:
            break;
        default:
            break;
    }
}
void OnError(OH_AVRecorder *recorder, int32_t errorCode, const char *errorMsg, void *userData)
{
    (void)recorder;
    (void)userData;
}

static napi_value createAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = AV_ERR_OK;
    g_avRecorder = OH_AVRecorder_Create();
    if (g_avRecorder == nullptr) {
        result = AV_ERR_UNKNOWN;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value setPreviewSurfaceId(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = AV_ERR_OK;
    if (result != AV_ERR_OK) {
        result = AV_ERR_UNKNOWN;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static bool GetInt32Property(napi_env env, napi_value root, const char *utf8name, int32_t *res)
{
    napi_value property = nullptr;
    auto status = napi_get_named_property(env, root, utf8name, &property);
    if (status != napi_ok || property == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get property error %{public}s", utf8name);
        return false;
    }
    return (napi_get_value_int32(env, property, res) == napi_ok);
}

static bool parseSetConfigOps(napi_env env, napi_value arg, struct OH_AVRecorder_Config &config)
{
    int32_t videoSourceType = 0;
    GetInt32Property(env, arg, "videoSourceType", &videoSourceType);
    int32_t fileGenerationMode = 0;
    GetInt32Property(env, arg, "fileGenerationMode", &fileGenerationMode);
    int32_t videoCodec = 2;
    GetInt32Property(env, arg, "videoCodec", &videoCodec);
    int32_t fileFormat = -1;
    GetInt32Property(env, arg, "fileFormat", &fileFormat);
    const int VIDEO_BITRATE_20KHZ = 20000;
    switch (fileFormat) {
        case AVRECORDER_CFT_MPEG_4:
            config.profile.fileFormat = AVRECORDER_CFT_MPEG_4;
            config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
            config.videoSourceType = AVRECORDER_SURFACE_YUV;
            if (videoSourceType == AVRECORDER_SURFACE_YUV) {
                config.videoSourceType = AVRECORDER_SURFACE_YUV;
            } else if (videoSourceType == AVRECORDER_SURFACE_ES) {
                config.videoSourceType = AVRECORDER_SURFACE_ES;
            }
            config.profile.videoCodec = AVRECORDER_VIDEO_AVC;
            if (videoCodec == AVRECORDER_VIDEO_AVC) {
                config.profile.videoCodec = AVRECORDER_VIDEO_AVC;
            } else if (videoCodec == AVRECORDER_VIDEO_MPEG4) {
                config.profile.videoCodec = AVRECORDER_VIDEO_MPEG4;
            } else if (videoCodec == AVRECORDER_VIDEO_HEVC) {
                config.profile.videoCodec = AVRECORDER_VIDEO_HEVC;
            }
            config.profile.isHdr = false;
            config.profile.enableTemporalScale = true;
            if (fileGenerationMode == AVRECORDER_APP_CREATE) {
                config.fileGenerationMode = AVRECORDER_APP_CREATE;
            } else if (fileGenerationMode == AVRECORDER_AUTO_CREATE_CAMERA_SCENE) {
                config.fileGenerationMode = AVRECORDER_AUTO_CREATE_CAMERA_SCENE;
            }
            config.profile.videoBitrate = VIDEO_BITRATE_20KHZ;
            GetInt32Property(env, arg, "videoFrameWidth", &(config.profile.videoFrameWidth));
            GetInt32Property(env, arg, "videoFrameHeight", &(config.profile.videoFrameHeight));
            GetInt32Property(env, arg, "videoFrameRate", &(config.profile.videoFrameRate));
            break;
        default:
            break;
    }
    return true;
}

static bool parseSetConfigFileFormatOps(napi_env env, napi_value arg, struct OH_AVRecorder_Config &config)
{
    if (env == nullptr) {
        OH_LOG_ERROR(LOG_APP, "env is nullptr");
        return false;
    }
    if (arg == nullptr) {
        OH_LOG_ERROR(LOG_APP, "arg is nullptr");
        return false;
    }
    int32_t fileFormat = -1;
    GetInt32Property(env, arg, "fileFormat", &fileFormat);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Config fileFormat :%{public}d", fileFormat);
    switch (fileFormat) {
        case AVRECORDER_CFT_MPEG_4A:
            config.profile.fileFormat = AVRECORDER_CFT_MPEG_4A;
            config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
            break;
        case AVRECORDER_CFT_MP3:
            config.profile.fileFormat = AVRECORDER_CFT_MP3;
            config.profile.audioCodec = AVRECORDER_AUDIO_MP3;
            break;
        case AVRECORDER_CFT_WAV:
            config.profile.fileFormat = AVRECORDER_CFT_WAV;
            config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
            break;
        default:
            config.profile.fileFormat = AVRECORDER_CFT_MPEG_4;
            break;
    }
    return true;
}

static bool parseSetConfigAudioSourceType(napi_env env, napi_value arg, struct OH_AVRecorder_Config &config)
{
    if (env == nullptr) {
        OH_LOG_ERROR(LOG_APP, "env is nullptr");
        return false;
    }
    if (arg == nullptr) {
        OH_LOG_ERROR(LOG_APP, "arg is nullptr");
        return false;
    }
    
    // Optional parameters, no need check error.
    GetInt32Property(env, arg, "audioBitrate", &(config.profile.audioBitrate));
    GetInt32Property(env, arg, "audioSampleRate", &(config.profile.audioSampleRate));

    int32_t audioSourceType = 0;
    GetInt32Property(env, arg, "audioSourceType", &audioSourceType);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Config audioSourceType :%{public}d", audioSourceType);
    switch (audioSourceType) {
        case AVRECORDER_DEFAULT:
            config.audioSourceType = AVRECORDER_DEFAULT;
            break;
        case AVRECORDER_MIC:
            config.audioSourceType = AVRECORDER_MIC;
            break;
        case AVRECORDER_VOICE_RECOGNITION:
            config.audioSourceType = AVRECORDER_VOICE_RECOGNITION;
            break;
        case AVRECORDER_VOICE_COMMUNICATION:
            config.audioSourceType = AVRECORDER_VOICE_COMMUNICATION;
            break;
        case AVRECORDER_VOICE_MESSAGE:
            config.audioSourceType = AVRECORDER_VOICE_MESSAGE;
            break;
        case AVRECORDER_CAMCORDER:
            config.audioSourceType = AVRECORDER_CAMCORDER;
            break;
        default:
            config.audioSourceType = AVRECORDER_DEFAULT;
            break;
    }
    return true;
}

static bool parseSetConfigAudioCodec(napi_env env, napi_value arg, struct OH_AVRecorder_Config &config)
{
    if (env == nullptr) {
        OH_LOG_ERROR(LOG_APP, "env is nullptr");
        return false;
    }
    if (arg == nullptr) {
        OH_LOG_ERROR(LOG_APP, "arg is nullptr");
        return false;
    }
    int32_t audioCodec = 3;
    GetInt32Property(env, arg, "audioCodec", &audioCodec);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Config audioCodec :%{public}d", audioCodec);
    switch (audioCodec) {
        case AVRECORDER_AUDIO_AAC:
            config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
            break;
        case AVRECORDER_AUDIO_MP3:
            config.profile.audioCodec = AVRECORDER_AUDIO_MP3;
            break;
        case AVRECORDER_AUDIO_G711MU:
            config.profile.audioCodec = AVRECORDER_AUDIO_G711MU;
            break;
        default:
            config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
            break;
    }
    return true;
}

// 配置参数
void SetConfig(OH_AVRecorder_Config &config)
{
    config.audioSourceType = AVRECORDER_DEFAULT;
    //  设置媒体属性
    const int AUDIO_BITRATE_48KHZ = 48000;
    config.profile.audioBitrate = AUDIO_BITRATE_48KHZ;
    const int AUDIO_CHANNELS_2 = 2;
    config.profile.audioChannels = AUDIO_CHANNELS_2;
    config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
    const int SAMPLE_RATE_48KHZ = 48000;
    config.profile.audioSampleRate = SAMPLE_RATE_48KHZ;
    const int gVideoLocationSize = 27;
    config.metadata.location.latitude = gVideoLocationSize;
    config.metadata.location.longitude = gVideoLocationSize;
}

static napi_value prepareAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AVRecorder_Config *config = new OH_AVRecorder_Config();
    SetConfig(*config);
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *fd = nullptr;
    size_t typeLen = 0;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &typeLen);
    fd = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[1], fd, typeLen + 1, &typeLen);
    config->url = fd;
    parseSetConfigOps(env, args[0], *config);
    parseSetConfigFileFormatOps(env, args[0], *config);
    parseSetConfigAudioSourceType(env, args[0], *config);
    parseSetConfigAudioCodec(env, args[0], *config);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.url = fd: %{public}s", config->url);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.profile.audioSampleRate : %{public}d", config->profile.audioSampleRate);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.profile.audioBitrate : %{public}d", config->profile.audioBitrate);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.profile.videoBitrate : %{public}d", config->profile.videoBitrate);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.profile.videoFrameWidth =  %{public}d", config->profile.videoFrameWidth);
    OH_LOG_INFO(LOG_APP, "AVRecorder config.url.profile.videoFrameHeight =  %{public}d",
                config->profile.videoFrameHeight);
    OH_AVRecorder_SetStateCallback(g_avRecorder, OnStateChange, nullptr);
    OH_AVRecorder_SetErrorCallback(g_avRecorder, OnError, nullptr);

    int result = AV_ERR_OK;
    result = OH_AVRecorder_Prepare(g_avRecorder, config);
    if (result != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Prepare error code :%{public}d", result);
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    OH_LOG_INFO(LOG_APP, "AVRecorder prepare completed");
    return res;
}

static napi_value createPrepareAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = AV_ERR_OK;
    g_avRecorder = OH_AVRecorder_Create();
    if (g_avRecorder == nullptr) {
        OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Create error code :%{public}d", result);
    }
    OH_AVRecorder_Config *config1 = new OH_AVRecorder_Config();
    SetConfig(*config1);

    OH_AVRecorder_SetStateCallback(g_avRecorder, OnStateChange, nullptr);
    OH_AVRecorder_SetErrorCallback(g_avRecorder, OnError, nullptr);
    int result1 = OH_AVRecorder_Prepare(g_avRecorder, config1);
    if (result1 != AV_ERR_OK || result != AV_ERR_OK) {
        result = AV_ERR_UNKNOWN;
        OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Prepare error code :%{public}d", result1);
    }

    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value startAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = OH_AVRecorder_Start(g_avRecorder);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Start result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value pauseAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = OH_AVRecorder_Pause(g_avRecorder);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Pause result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value resumeAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = OH_AVRecorder_Resume(g_avRecorder);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Resume result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value stopAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = OH_AVRecorder_Stop(g_avRecorder);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Stop result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value resetAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    int result = OH_AVRecorder_Reset(g_avRecorder);
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Reset result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value releaseAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    //检查g_avRecorder 是否有效
    if (g_avRecorder == nullptr) {
        OH_LOG_INFO(LOG_APP, "AVRecorder g_avRecorder is nullptr");
        napi_value res;
        napi_create_int32(env, AV_ERR_INVALID_VAL, &res);
        return res;
    }
    int result = OH_AVRecorder_Release(g_avRecorder);
    g_avRecorder = nullptr;
    OH_LOG_INFO(LOG_APP, "AVRecorder OH_AVRecorder_Release result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value getAVRecorderConfig(napi_env env, napi_callback_info info)
{
    (void)info;

    OH_AVRecorder_Config *config = new OH_AVRecorder_Config();
    SetConfig(*config);
    int result = OH_AVRecorder_GetAVRecorderConfig(g_avRecorder, &config);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value getAvailableEncoder(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AVRecorder_EncoderInfo *encoderInfo = nullptr;
    int32_t lengthValue = 0;
    int32_t *length = &lengthValue;
    int result = OH_AVRecorder_GetAvailableEncoder(g_avRecorder, &encoderInfo, length);
    if (encoderInfo != nullptr) {
        OH_LOG_INFO(LOG_APP, "Encorder Info in");
        OH_LOG_INFO(LOG_APP, "Encorder mimeType %{public}d", encoderInfo->mimeType);
        OH_LOG_INFO(LOG_APP, "Encorder mimeType  %{public}d", encoderInfo->type);
        // bitRate
        OH_LOG_INFO(LOG_APP, "Encorder BitRate Min: %{public}d,Max :%{public}d", encoderInfo->bitRate.min,
                    encoderInfo->bitRate.max);
        // frameRate
        OH_LOG_INFO(LOG_APP, "Encorder frameRate Min: %{public}d,Max :%{public}d", encoderInfo->frameRate.min,
                    encoderInfo->frameRate.max);
        // width
        OH_LOG_INFO(LOG_APP, "Encorder width Min: %{public}d,Max :%{public}d", encoderInfo->width.min,
                    encoderInfo->width.max);
        // height
        OH_LOG_INFO(LOG_APP, "Encorder height Min: %{public}d,Max :%{public}d", encoderInfo->height.min,
                    encoderInfo->height.max);
        // channels
        OH_LOG_INFO(LOG_APP, "Encorder channels Min: %{public}d,Max :%{public}d", encoderInfo->channels.min,
                    encoderInfo->channels.max);
        if (encoderInfo->sampleRate != nullptr) {
            for (int i = 0; i < encoderInfo->sampleRateLen; i++) {
                OH_LOG_INFO(LOG_APP, "Encorder mimeType %{public}d", i, encoderInfo->sampleRate[i]);
            }
        }
    } else {
        OH_LOG_INFO(LOG_APP, "EncorderInfo is null");
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value updateRotationAVRecorder(napi_env env, napi_callback_info info)
{
    (void)info;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t videoRotation;
    napi_get_value_int32(env, args[0], &videoRotation);

    int result = AV_ERR_OK;
    result = OH_AVRecorder_UpdateRotation(g_avRecorder, videoRotation);
    OH_LOG_INFO(LOG_APP, "AVRecorder updateRotationAVRecorder result :%{public}d", result);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value prepareCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 8;
    napi_value args[8] = {nullptr};
    size_t typeLen = 0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t focusMode;
    napi_get_value_int32(env, args[FOCUS_MODE_INDEX], &focusMode);

    uint32_t cameraDeviceIndex;
    napi_get_value_uint32(env, args[CAMERA_DEVICE_INDEX], &cameraDeviceIndex);

    uint32_t sceneMode;
    napi_get_value_uint32(env, args[SCENE_MODE_INDEX], &sceneMode);

    char *previewId = nullptr;
    napi_get_value_string_utf8(env, args[PREVIEW_ID_INDEX], nullptr, 0, &typeLen);
    previewId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[PREVIEW_ID_INDEX], previewId, typeLen + 1, &typeLen);

    char *photoId = nullptr;
    napi_get_value_string_utf8(env, args[PHOTO_ID_INDEX], nullptr, 0, &typeLen);
    photoId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[PHOTO_ID_INDEX], photoId, typeLen + 1, &typeLen);

    uint32_t videoFrameWidth;
    napi_get_value_uint32(env, args[VIDEO_FRAME_WIDTH_INDEX], &videoFrameWidth);
    uint32_t videoFrameHeight;
    napi_get_value_uint32(env, args[VIDEO_FRAME_HHEIGHT_INDEX], &videoFrameHeight);

    // 获取surfaceId
    OHNativeWindow *window;
    int resultCode = OH_AVRecorder_GetInputSurface(g_avRecorder, &window);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(window, &surfaceId);
    char videoId[30];
    //     snprintf(LOG_APP,"?")
    OH_LOG_INFO(LOG_APP, "init Camera fouseMode : %{public}d", focusMode);
    OH_LOG_INFO(LOG_APP, "init Camera cameraDeviceIndex : %{public}d", cameraDeviceIndex);
    OH_LOG_INFO(LOG_APP, "init Camera sceneMode : %{public}d", sceneMode);
    OH_LOG_INFO(LOG_APP, "init Camera previewId : %{public}d", previewId);
    OH_LOG_INFO(LOG_APP, "init Camera photo : %{public}d", photoId);
    OH_LOG_INFO(LOG_APP, "init Camera video : %{public}d", videoId);
    OH_LOG_INFO(LOG_APP, "init Camera videoFrameWidth : %{public}d", videoFrameWidth);
    OH_LOG_INFO(LOG_APP, "init Camera videoFrameHeight : %{public}d", videoFrameHeight);

    int result = 6;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createAVRecorder", nullptr, createAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prepareAVRecorder", nullptr, prepareAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPrepareAVRecorder", nullptr, createPrepareAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startAVRecorder", nullptr, startAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pauseAVRecorder", nullptr, pauseAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resumeAVRecorder", nullptr, resumeAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopAVRecorder", nullptr, stopAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetAVRecorder", nullptr, resetAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseAVRecorder", nullptr, releaseAVRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateRotationAVRecorder", nullptr, updateRotationAVRecorder, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"prepareCamera", nullptr, prepareCamera, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPreviewSurfaceId", nullptr, setPreviewSurfaceId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAVRecorderConfig", nullptr, getAVRecorderConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAvailableEncoder", nullptr, getAvailableEncoder, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "avrecorderndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }