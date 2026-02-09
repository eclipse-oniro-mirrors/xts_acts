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
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <arpa/nameser.h>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <hilog/log.h>
#include <iostream>
#include <js_native_api.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/avrecorder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <sstream>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <typeinfo>
#include <unistd.h>
#include <vector>
#define LOG_TAG "MY_NDKDEMO_"

void OnStateChange(OH_AVRecorder *recorder, OH_AVRecorder_State state, OH_AVRecorder_StateChangeReason reason,
                   void *userData){};
void OnError(OH_AVRecorder *recorder, int32_t errorCode, const char *errorMsg, void *userData){};
void OnUri(OH_AVRecorder *recorder, OH_MediaAsset *asset, void *userData){};

static napi_value OH_AVRecorder_Prepare0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder_Config *config;
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(nullptr, config);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetAVRecorderConfig0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder_Config *config;
    OH_AVErrCode errcode = OH_AVRecorder_GetAVRecorderConfig(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetInputSurface0101(napi_env env, napi_callback_info info)
{
    OHNativeWindow *window;
    OH_AVErrCode errcode = OH_AVRecorder_GetInputSurface(nullptr, &window);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_UpdateRotation0100(napi_env env, napi_callback_info info)
{
    int32_t rotation = 0;
    OH_AVErrCode errcode = OH_AVRecorder_UpdateRotation(nullptr, rotation);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Start0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Start(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Pause0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Pause(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Resume0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Resume(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Stop0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Stop(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Reset0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Reset(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetAvailableEncoder0100(napi_env env, napi_callback_info info)
{
    int32_t length = 0;
    OH_AVErrCode errcode = OH_AVRecorder_GetAvailableEncoder(nullptr, nullptr, &length);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetStateCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetStateCallback(Recorder, OnStateChange, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetStateCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetStateCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetErrorCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetErrorCallback(Recorder, OnError, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetErrorCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetErrorCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetUriCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetUriCallback(Recorder, OnUri, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetUriCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetUriCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetWillMuteWhenInterrupted0100(napi_env env, napi_callback_info info)
{
    bool muteWhenInterrupted = true;
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetWillMuteWhenInterrupted(nullptr, muteWhenInterrupted);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_STATE) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_ContainerFormatType0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    char url[20] = {0};
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    OH_AVRecorder_Profile profile = {
        audioBitrate : 112000,             // 音频比特率。
        audioChannels : 2,                 // 音频声道数。
        audioCodec : AVRECORDER_AUDIO_MP3, // 音频编码格式，当前支持AAC，MP3，G711MU。
        audioSampleRate : 48000,           // 音频采样率。
        fileFormat : AVRECORDER_CFT_AMR,   // 封装格式，当前支持MP4，M4A，MP3，WAV，AMR，AAC。
    };
    OH_AVRecorder_Config config;
    std::ostringstream oss;
    oss << "fd://" << fd;
    const std::string &urlStr = oss.str();
    for (size_t i = 0; i < urlStr.size(); ++i) {
        url[i] = urlStr[i];
    }
    char *urlPtr = url;
    config = {
        .audioSourceType = AVRECORDER_MIC,
        .profile = profile,
        .url = urlPtr, // 使用文件描述符或沙箱路径
    };
    void *userData;
    OH_AVRecorder *AVRecorder = OH_AVRecorder_Create();
    auto aa = OH_AVRecorder_SetStateCallback(AVRecorder, OnStateChange, userData);
    auto aw = OH_AVRecorder_SetErrorCallback(AVRecorder, OnError, userData);
    auto ew = OH_AVRecorder_SetUriCallback(AVRecorder, OnUri, userData);
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(AVRecorder, &config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_MetadataTemplate0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    char url[20] = {0};
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    OH_AVRecorder_Profile profile = {
        audioBitrate : 112000,             // 音频比特率。
        audioChannels : 2,                 // 音频声道数。
        audioCodec : AVRECORDER_AUDIO_MP3, // 音频编码格式，当前支持AAC，MP3，G711MU。
        audioSampleRate : 48000,           // 音频采样率。
        fileFormat : AVRECORDER_CFT_AMR,   // 封装格式，当前支持MP4，M4A，MP3，WAV，AMR，AAC。
    };
    OH_AVRecorder_Config config;
    std::ostringstream oss;
    oss << "fd://" << fd;
    const std::string &urlStr = oss.str();
    for (size_t i = 0; i < urlStr.size(); ++i) {
        url[i] = urlStr[i];
    }
    char *urlPtr = url;
    config = {
        .audioSourceType = AVRECORDER_MIC,
        .profile = profile,
        .url = urlPtr, // 使用文件描述符或沙箱路径
    };
    OH_AVRecorder_MetadataTemplate MetadataTemplate = {.value = "1", .key = "1"};
    config.metadata.customInfo = MetadataTemplate;
    void *userData;
    OH_AVRecorder *AVRecorder = OH_AVRecorder_Create();
    auto aa = OH_AVRecorder_SetStateCallback(AVRecorder, OnStateChange, userData);
    auto aw = OH_AVRecorder_SetErrorCallback(AVRecorder, OnError, userData);
    auto ew = OH_AVRecorder_SetUriCallback(AVRecorder, OnUri, userData);
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(AVRecorder, &config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_MetadataTemplate0101(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    char url[20] = {0};
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    OH_AVRecorder_Profile profile = {
        audioBitrate : 112000,             // 音频比特率。
        audioChannels : 2,                 // 音频声道数。
        audioCodec : AVRECORDER_AUDIO_MP3, // 音频编码格式，当前支持AAC，MP3，G711MU。
        audioSampleRate : 48000,           // 音频采样率。
        fileFormat : AVRECORDER_CFT_AMR,   // 封装格式，当前支持MP4，M4A，MP3，WAV，AMR，AAC。
    };
    OH_AVRecorder_Config config;
    std::ostringstream oss;
    oss << "fd://" << fd;
    const std::string &urlStr = oss.str();
    for (size_t i = 0; i < urlStr.size(); ++i) {
        url[i] = urlStr[i];
    }
    char *urlPtr = url;
    config = {
        .audioSourceType = AVRECORDER_MIC,
        .profile = profile,
        .url = urlPtr, // 使用文件描述符或沙箱路径
    };
    config.metadata.customInfo.key = "1";
    config.metadata.customInfo.value = "1";
    void *userData;
    OH_AVRecorder *AVRecorder = OH_AVRecorder_Create();
    auto aa = OH_AVRecorder_SetStateCallback(AVRecorder, OnStateChange, userData);
    auto aw = OH_AVRecorder_SetErrorCallback(AVRecorder, OnError, userData);
    auto ew = OH_AVRecorder_SetUriCallback(AVRecorder, OnUri, userData);
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(AVRecorder, &config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Metadata0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    char url[20] = {0};
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    OH_AVRecorder_Profile profile = {
        audioBitrate : 112000,             // 音频比特率。
        audioChannels : 2,                 // 音频声道数。
        audioCodec : AVRECORDER_AUDIO_MP3, // 音频编码格式，当前支持AAC，MP3，G711MU。
        audioSampleRate : 48000,           // 音频采样率。
        fileFormat : AVRECORDER_CFT_AMR,   // 封装格式，当前支持MP4，M4A，MP3，WAV，AMR，AAC。
    };
    OH_AVRecorder_Config config;
    std::ostringstream oss;
    oss << "fd://" << fd;
    const std::string &urlStr = oss.str();
    for (size_t i = 0; i < urlStr.size(); ++i) {
        url[i] = urlStr[i];
    }
    if (url != nullptr) {
        char *urlPtr = url;
        config = {
            .audioSourceType = AVRECORDER_MIC,
            .profile = profile,
            .url = urlPtr, // 使用文件描述符或沙箱路径
        };
    };
    OH_AVRecorder_MetadataTemplate MetadataTemplate = {.value = "1", .key = "1"};
    config.metadata.genre = "audio";
    config.metadata.videoOrientation = "0";
    config.metadata.customInfo = MetadataTemplate;
    void *userData;
    OH_AVRecorder *AVRecorder = OH_AVRecorder_Create();
    auto aa = OH_AVRecorder_SetStateCallback(AVRecorder, OnStateChange, userData);
    auto aw = OH_AVRecorder_SetErrorCallback(AVRecorder, OnError, userData);
    auto ew = OH_AVRecorder_SetUriCallback(AVRecorder, OnUri, userData);
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(AVRecorder, &config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Config0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    size_t argc = 1;
    char url[20] = {0};
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    OH_AVRecorder_Profile profile = {
        audioBitrate : 112000,             // 音频比特率。
        audioChannels : 2,                 // 音频声道数。
        audioCodec : AVRECORDER_AUDIO_MP3, // 音频编码格式，当前支持AAC，MP3，G711MU。
        audioSampleRate : 48000,           // 音频采样率。
        fileFormat : AVRECORDER_CFT_AMR,   // 封装格式，当前支持MP4，M4A，MP3，WAV，AMR，AAC。
    };
    OH_AVRecorder_Config config;
    std::ostringstream oss;
    oss << "fd://" << fd;
    const std::string &urlStr = oss.str();
    for (size_t i = 0; i < urlStr.size(); ++i) {
        url[i] = urlStr[i];
    }
    char *urlPtr = url;
    config = {
        .audioSourceType = AVRECORDER_MIC,
        .profile = profile,
        .url = urlPtr, // 使用文件描述符或沙箱路径
    };
    config.maxDuration = 1;
    void *userData;
    OH_AVRecorder *AVRecorder = OH_AVRecorder_Create();
    auto aa = OH_AVRecorder_SetStateCallback(AVRecorder, OnStateChange, userData);
    auto aw = OH_AVRecorder_SetErrorCallback(AVRecorder, OnError, userData);
    auto ew = OH_AVRecorder_SetUriCallback(AVRecorder, OnUri, userData);
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(AVRecorder, &config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

napi_property_descriptor desc[] = {
    {"OH_AVRecorder_Prepare0100", nullptr, OH_AVRecorder_Prepare0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_GetAVRecorderConfig0100", nullptr, OH_AVRecorder_GetAVRecorderConfig0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_GetInputSurface0101", nullptr, OH_AVRecorder_GetInputSurface0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_UpdateRotation0100", nullptr, OH_AVRecorder_UpdateRotation0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_Start0100", nullptr, OH_AVRecorder_Start0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Pause0100", nullptr, OH_AVRecorder_Pause0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Resume0100", nullptr, OH_AVRecorder_Resume0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Stop0100", nullptr, OH_AVRecorder_Stop0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Reset0100", nullptr, OH_AVRecorder_Reset0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Release0100", nullptr, OH_AVRecorder_Release0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_GetAvailableEncoder0100", nullptr, OH_AVRecorder_GetAvailableEncoder0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetStateCallback0100", nullptr, OH_AVRecorder_SetStateCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetStateCallback0101", nullptr, OH_AVRecorder_SetStateCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetErrorCallback0100", nullptr, OH_AVRecorder_SetErrorCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetErrorCallback0101", nullptr, OH_AVRecorder_SetErrorCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetUriCallback0100", nullptr, OH_AVRecorder_SetUriCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetUriCallback0101", nullptr, OH_AVRecorder_SetUriCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetWillMuteWhenInterrupted0100", nullptr, OH_AVRecorder_SetWillMuteWhenInterrupted0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_ContainerFormatType0100", nullptr, OH_AVRecorder_ContainerFormatType0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_MetadataTemplate0100", nullptr, OH_AVRecorder_MetadataTemplate0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_MetadataTemplate0101", nullptr, OH_AVRecorder_MetadataTemplate0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_Metadata0100", nullptr, OH_AVRecorder_Metadata0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVRecorder_Config0100", nullptr, OH_AVRecorder_Config0100, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "avrecorderndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
