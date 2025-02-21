/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <exception>
#include <sys/types.h>
#include <sys/socket.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <js_native_api_types.h>
#include <unistd.h>
#include <iostream>
#include "hilog/log.h"

#define FAIL (-1)
#define SUCCESS 0

constexpr uint32_t DEFAULT_SAMPLERATE = 44100;
constexpr uint32_t DEFAULT_BITRATE_MIN = 8000;
constexpr uint32_t DEFAULT_BITRATE_MAX = 320000;
constexpr uint32_t DEFAULT_CHANNEL_COUNT_ONE = 1;
constexpr uint32_t DEFAULT_CHANNEL_COUNT_TWO = 1;
constexpr uint32_t DEFAULT_MAX_INPUT_SIZE = 1152;
constexpr uint32_t DEFAULT_AAC_TYPE = 1;
constexpr uint8_t DEFAULT_VORBIS_TYPE = 10;
constexpr uint8_t DEFAULT_VORBISTWO_TYPE = 20;

static napi_value AudioDecoderFlushFirst(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE_MIN);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT_ONE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderFlushSecond(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE_MAX);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT_TWO);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_AudioCodec_Flush_First", nullptr, AudioDecoderFlushFirst, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Flush_Second", nullptr, AudioDecoderFlushSecond, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "pcsAudioTest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
