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

#include "EGL/egl.h"
#include "GLES3/gl32.h"
#include "hilog/log.h"
#include "js_native_api.h"
#include "js_native_api_types.h"
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/avtranscoder.h"
#include "multimedia/player_framework/avtranscoder_base.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avcodec_videoencoder.h"
#include "multimedia/player_framework/native_averrors.h"
#include "multimedia/player_framework/native_avformat.h"
#include "multimedia/player_framework/native_avscreen_capture.h"
#include "multimedia/player_framework/native_avscreen_capture_base.h"
#include "multimedia/player_framework/native_avscreen_capture_errors.h"
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arpa/nameser.h>
#include <chrono>
#include <cstdint>
#include <fcntl.h>
#include <fstream>
#include <future>
#include <hilog/log.h>
#include <js_native_api.h>
#include <map>
#include <multimedia/player_framework/avtranscoder.h>
#include <native_buffer/native_buffer.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>
#include <vector>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_0666 0666
#define DST_ERROR_PATH "/data/storage/el2/base/files/dst_error.mp4"
#define LOG_MSG_TAG "AVTransCoderNdk"
#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGD(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))

static napi_value OH_AVTranscoderConfig_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    OH_AVErrCode errcode = OH_AVTranscoderConfig_Release(Config);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetSrcFD0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    int32_t srcFd = 1;
    int64_t srcOffset = 1;
    int64_t length = 1;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetSrcFD(nullptr, srcFd, srcOffset, length);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetDstFD0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    int32_t dstFd = 1;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetDstFD(Config, dstFd);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetDstAudioType0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    const char *mimeType = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetDstAudioType(Config, mimeType);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetDstAudioType0101(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    const char *mimeType = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetDstAudioType(nullptr, mimeType);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetDstVideoResolution0100(napi_env env, napi_callback_info info)
{
    int32_t width = 240;
    int32_t height = 240;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetDstVideoResolution(nullptr, width, height);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

// OH_AVTranscoder_Pause
static napi_value OH_AVTranscoder_Pause0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    auto errcode = OH_AVTranscoder_Pause(transcoder);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_Pause0101(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    auto errcode = OH_AVTranscoder_Pause(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

// OH_AVTranscoder_Resume
static napi_value OH_AVTranscoder_Resume0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    auto errcode = OH_AVTranscoder_Resume(transcoder);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_Resume0101(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    auto errcode = OH_AVTranscoder_Resume(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

// OH_AVTranscoder_Cancel
static napi_value OH_AVTranscoder_Cancel0101(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    OH_AVTranscoder_Resume(transcoder);
    auto errcode = OH_AVTranscoder_Cancel(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

// OH_AVTranscoder_Release
static napi_value OH_AVTranscoder_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    OH_AVTranscoder_Resume(transcoder);
    OH_AVTranscoder_Cancel(transcoder);
    auto errcode = OH_AVTranscoder_Release(transcoder);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_Release0101(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    OH_AVTranscoder_Resume(transcoder);
    OH_AVTranscoder_Cancel(transcoder);
    OH_AVTranscoder_Release(transcoder);
    auto errcode = OH_AVTranscoder_Release(transcoder);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnStateChange(OH_AVTranscoder *transcoder, OH_AVTranscoder_State state, void *userData){};
static napi_value OH_AVTranscoder_SetStateCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetStateCallback(transcoder, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_SetStateCallback0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetStateCallback(nullptr, OnStateChange, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnError(OH_AVTranscoder *transcoder, int32_t errorCode, const char *errorMsg, void *userData){};
static napi_value OH_AVTranscoder_SetErrorCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetErrorCallback(transcoder, OnError, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_SetErrorCallback0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetErrorCallback(nullptr, OnError, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnProgressUpdate(OH_AVTranscoder *transcoder, int32_t progress, void *userData){};
static napi_value OH_AVTranscoder_SetProgressUpdateCallback0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetProgressUpdateCallback(transcoder, OnProgressUpdate, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_SetProgressUpdateCallback0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    auto errcode = OH_AVTranscoder_SetProgressUpdateCallback(nullptr, OnProgressUpdate, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_EnableBFrame0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    auto errcode = OH_AVTranscoderConfig_EnableBFrame(nullptr, false);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}


static napi_value OH_AVTranscoderConfig_Create100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder_Config *Config = OH_AVTranscoderConfig_Create();
    int32_t res = 1;
    if (Config != nullptr) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(Config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_Release200(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVTranscoderConfig_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoderConfig_SetDstFD200(napi_env env, napi_callback_info info)
{
    int32_t dstFd = 1;
    OH_AVErrCode errcode = OH_AVTranscoderConfig_SetDstFD(nullptr, dstFd);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_Cancel100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    OH_AVTranscoder_Start(transcoder);
    OH_AVTranscoder_Pause(transcoder);
    OH_AVTranscoder_Resume(transcoder);
    OH_AVTranscoder_Cancel(transcoder);
    auto errcode = OH_AVTranscoder_Cancel(transcoder);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVTranscoder_Start100(napi_env env, napi_callback_info info)
{
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoder_Prepare(transcoder, config);
    auto errcode = OH_AVTranscoder_Start(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    OH_AVTranscoderConfig_Release(config);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_AVTranscoderConfig_Release0100", nullptr, OH_AVTranscoderConfig_Release0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AVTranscoderConfig_SetSrcFD0100", nullptr, OH_AVTranscoderConfig_SetSrcFD0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AVTranscoderConfig_SetDstFD0100", nullptr, OH_AVTranscoderConfig_SetDstFD0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AVTranscoderConfig_SetDstAudioType0100", nullptr, OH_AVTranscoderConfig_SetDstAudioType0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_AVTranscoderConfig_SetDstAudioType0101", nullptr, OH_AVTranscoderConfig_SetDstAudioType0101, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_AVTranscoderConfig_SetDstVideoResolution0100", nullptr, OH_AVTranscoderConfig_SetDstVideoResolution0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_Pause0100", nullptr, OH_AVTranscoder_Pause0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Pause0101", nullptr, OH_AVTranscoder_Pause0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Resume0100", nullptr, OH_AVTranscoder_Resume0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Resume0101", nullptr, OH_AVTranscoder_Resume0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Cancel0101", nullptr, OH_AVTranscoder_Cancel0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Release0100", nullptr, OH_AVTranscoder_Release0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_Release0101", nullptr, OH_AVTranscoder_Release0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AVTranscoder_SetStateCallback0100", nullptr, OH_AVTranscoder_SetStateCallback0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_SetStateCallback0101", nullptr, OH_AVTranscoder_SetStateCallback0101, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_SetErrorCallback0100", nullptr, OH_AVTranscoder_SetErrorCallback0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_SetErrorCallback0101", nullptr, OH_AVTranscoder_SetErrorCallback0101, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_SetProgressUpdateCallback0100", nullptr, OH_AVTranscoder_SetProgressUpdateCallback0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AVTranscoder_SetProgressUpdateCallback0101", nullptr, OH_AVTranscoder_SetProgressUpdateCallback0101,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AVTranscoderConfig_EnableBFrame0100", nullptr, OH_AVTranscoderConfig_EnableBFrame0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Create100", nullptr, OH_AVTranscoderConfig_Create100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Release200", nullptr, OH_AVTranscoderConfig_Release200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetDstFD200", nullptr, OH_AVTranscoderConfig_SetDstFD200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Cancel100", nullptr, OH_AVTranscoder_Cancel100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Start100", nullptr, OH_AVTranscoder_Start100, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "avtranscoderconfigndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
