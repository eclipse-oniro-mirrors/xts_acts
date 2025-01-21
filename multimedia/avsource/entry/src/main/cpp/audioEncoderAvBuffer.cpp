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
#include <condition_variable>
#include <js_native_api_types.h>
#include <multimedia/native_audio_channel_layout.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <pthread.h>
#include <queue>
#include <iostream>
#include <fstream>

#define FAIL (-1)
#define SUCCESS 0
#define WIDTH 1920
#define HEIGHT 1080
#define FRAMERATETHIRTY 30
constexpr uint32_t DEFAULT_SAMPLERATE = 44100;
constexpr uint64_t DEFAULT_BITRATE = 32000;
constexpr uint32_t DEFAULT_CHANNEL_COUNT = 2;
constexpr uint32_t AUDIO_32BITS_PRE_SAMPLE = 3;
constexpr uint32_t AUDIO_LEVEL_0 = 0;
constexpr OH_AudioChannelLayout CHANNEL_LAYOUT = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
constexpr OH_BitsPerSample SAMPLE_FORMAT = OH_BitsPerSample::SAMPLE_F32LE;
constexpr OH_BitsPerSample SAMPLE_FORMAT_S32 = OH_BitsPerSample::SAMPLE_S32LE;
constexpr int32_t COMPLIANCE_LEVEL = 0;
constexpr OH_BitsPerSample BITS_PER_CODED_SAMPLE = OH_BitsPerSample::SAMPLE_S24LE;
constexpr uint32_t DEFAULT_MAX_INPUT_SIZE = 1024*DEFAULT_CHANNEL_COUNT *sizeof(float);
using namespace std;

static napi_value AudioEncoderCreateByMime(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    OH_AVCodec *checkParam = nullptr;
    checkParam = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderCreateByName(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    OH_AVCodec *checkParam = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, true);
    const char *name = OH_AVCapability_GetName(capability);
    checkParam = OH_AudioCodec_CreateByName(name);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderDestroy(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    checkParam = OH_AudioCodec_Destroy(audioEnc);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

class AEncSignal {
public:
    mutex inMutex_;
    mutex outMutex_;
    mutex startMutex_;
    condition_variable inCond_;
    condition_variable outCond_;
    condition_variable startCond_;
    queue<uint32_t> inQueue_;
    queue<uint32_t> outQueue_;
    queue<OH_AVBuffer *> inBufferQueue_;
    queue<OH_AVBuffer *> outBufferQueue_;
};
AEncSignal *signal_ = new AEncSignal();
static void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}
static void OnStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}
static void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(buffer);
    signal->inCond_.notify_all();
}
static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(buffer);
}

static napi_value AudioEncoderRegisterCallback(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    signal_ = new AEncSignal();
    OH_AVCodecCallback callback = {&OnError, &OnStreamChanged, &OnNeedInputBuffer, &OnNewOutputBuffer};
    checkParam = OH_AudioCodec_RegisterCallback(audioEnc, callback, signal_);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Destroy(audioEnc);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderConfigure(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_COMPLIANCE_LEVEL, COMPLIANCE_LEVEL);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    checkParam = OH_AudioCodec_Configure(audioEnc, format);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderPrepare(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    checkParam = OH_AudioCodec_Prepare(audioEnc);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderStart(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    checkParam = OH_AudioCodec_Start(audioEnc);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderStop(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Stop(audioEnc);
        if(checkParam == AV_ERR_OK){
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderFlush(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioEnc);
        if(checkParam == AV_ERR_OK){
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioEnc);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderReset(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Reset(audioEnc);
        if(checkParam == AV_ERR_OK){
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderGetOutputDescription(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_GetOutputDescription(audioEnc);
        if(checkParam != nullptr){
            backParam = SUCCESS;
            free(checkParam);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderSetParameter(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT_S32);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_COMPRESSION_LEVEL, AUDIO_LEVEL_0);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, AUDIO_32BITS_PRE_SAMPLE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        format = OH_AudioCodec_GetOutputDescription(audioEnc);
        if(format != nullptr){
            checkParam = OH_AudioCodec_SetParameter(audioEnc, format);
            if(checkParam == AV_ERR_OK){
                backParam = SUCCESS;
                free(format);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioEncoderIsValid(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioEnc = nullptr;
    OH_AVErrCode checkParam;
    bool status = true;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AudioCodec_Configure(audioEnc, format);
    OH_AudioCodec_Prepare(audioEnc);
    if (OH_AudioCodec_Start(audioEnc) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioEnc);
        if (checkParam == AV_ERR_OK) {
            checkParam = OH_AudioCodec_IsValid(audioEnc, &status);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                OH_AudioCodec_Stop(audioEnc);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"OH_AudioCodec_CreateByMime", nullptr, AudioEncoderCreateByMime, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_CreateByName", nullptr, AudioEncoderCreateByName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Destroy", nullptr, AudioEncoderDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_RegisterCallback", nullptr, AudioEncoderRegisterCallback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Configure", nullptr, AudioEncoderConfigure, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Prepare", nullptr, AudioEncoderPrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Start", nullptr, AudioEncoderStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Stop", nullptr, AudioEncoderStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Flush", nullptr, AudioEncoderFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Reset", nullptr, AudioEncoderReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_GetOutputDescription", nullptr, AudioEncoderGetOutputDescription, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AudioCodec_SetParameter", nullptr, AudioEncoderSetParameter, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_IsValid", nullptr, AudioEncoderIsValid, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libaudioEncoderAvBuffer",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) {
    napi_module_register(&demoModule);
}
