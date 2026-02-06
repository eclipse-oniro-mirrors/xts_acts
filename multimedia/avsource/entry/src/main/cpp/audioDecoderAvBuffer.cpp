/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <pthread.h>
#include <thread>
#include <queue>
#include <fstream>
#include <iostream>

#define FAIL (-1)
#define SUCCESS 0
constexpr uint32_t DEFAULT_SAMPLERATE = 44100;
constexpr uint32_t DEFAULT_BITRATE = 32000;
constexpr uint32_t DEFAULT_CHANNEL_COUNT = 2;
constexpr uint32_t DEFAULT_MAX_INPUT_SIZE = 1152;
constexpr uint32_t DEFAULT_AAC_TYPE = 1;
constexpr uint8_t DEFAULT_VORBIS_TYPE = 10;
constexpr uint8_t DEFAULT_VORBISTWO_TYPE = 20;
using namespace std;

static napi_value TestInitPtr(napi_env env, OH_AVCodec *param)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *checkParam = param;
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value TestInitAVErrCode(napi_env env, OH_AVErrCode param)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam = param;
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderCreateByMimeAudioAac(napi_env env, napi_callback_info info)
{
    return TestInitPtr(env, OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false));
}

static napi_value AudioDecoderCreateByName(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    const char *name = OH_AVCapability_GetName(capability);
    return TestInitPtr(env, OH_AudioCodec_CreateByName(name));
}

static napi_value AudioDecoderDestroy(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    return TestInitAVErrCode(env, OH_AudioCodec_Destroy(audioDec));
}

class ADecSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer *> inBufferQueue_;
    std::queue<OH_AVBuffer *> outBufferQueue_;
};
ADecSignal *signal_;
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
    ADecSignal *signal = static_cast<ADecSignal *>(userData);
    unique_lock<mutex> lock(signal_->inMutex_);
    OH_AVCodecBufferAttr attr = {0};
    attr.flags = 1;
    OH_AVBuffer_SetBufferAttr(buffer, &attr);
    OH_AVErrCode ret = OH_AudioCodec_PushInputBuffer(codec, index);
    signal->inQueue_.push(ret);
    signal->inCond_.notify_all();
}
static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    ADecSignal *signal = static_cast<ADecSignal *>(userData);
    unique_lock<mutex> lock(signal_->outMutex_);
    OH_AVErrCode ret = OH_AudioCodec_FreeOutputBuffer(codec, index);
    signal->outQueue_.push(ret);
    signal->outCond_.notify_all();
}

static napi_value AudioDecoderRegisterCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    signal_ = new ADecSignal();
    OH_AVCodecCallback callback = { &OnError, &OnStreamChanged, &OnNeedInputBuffer, &OnNewOutputBuffer };
    result = TestInitAVErrCode(env, OH_AudioCodec_RegisterCallback(audioDec, callback, signal_));
    OH_AudioCodec_Destroy(audioDec);
    return result;
}

static napi_value AudioDecoderConfigure(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    return TestInitAVErrCode(env, OH_AudioCodec_Configure(audioDec, format));
}

static napi_value AudioDecoderPrepare(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    return TestInitAVErrCode(env, OH_AudioCodec_Prepare(audioDec));
}

static napi_value AudioDecoderStart(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    checkParam = OH_AudioCodec_Configure(audioDec, format);
    checkParam = OH_AudioCodec_Prepare(audioDec);
    checkParam = OH_AudioCodec_Start(audioDec);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderStop(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    checkParam = OH_AudioCodec_Configure(audioDec, format);
    checkParam = OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Stop(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderFlush(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
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

static napi_value AudioDecoderReset(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Reset(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderGetOutputDescription(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_GetOutputDescription(audioDec);
        if (checkParam != nullptr) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
            free(checkParam);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderSetParameter(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    checkParam = OH_AudioCodec_Configure(audioDec, format);
    checkParam = OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        format = OH_AudioCodec_GetOutputDescription(audioDec);
        if (format != nullptr) {
            checkParam = OH_AudioCodec_SetParameter(audioDec, format);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                free(format);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderIsValid(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    bool status = true;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    checkParam = OH_AudioCodec_Configure(audioDec, format);
    checkParam = OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            checkParam = OH_AudioCodec_IsValid(audioDec, &status);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                OH_AudioCodec_Stop(audioDec);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderCreateByNameAnormal(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    const char *name = OH_AVCapability_GetName(capability);
    return TestInitPtr(env, OH_AudioCodec_CreateByName(name));
}

static napi_value OHAudioDecoderCreateByNameBnormal(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    const char *name = OH_AVCapability_GetName(capability);
    return TestInitPtr(env, OH_AudioCodec_CreateByName(name));
}

static napi_value OHAudioDecoderCreateByNameCnormal(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    const char *name = OH_AVCapability_GetName(capability);
    return TestInitPtr(env, OH_AudioCodec_CreateByName(name));
}

static napi_value OHAudioDecoderDestroyAnormal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    return TestInitAVErrCode(env, OH_AudioCodec_Destroy(audioDec));
}

static napi_value OHAudioDecoderDestroyBnormal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    return TestInitAVErrCode(env, OH_AudioCodec_Destroy(audioDec));
}

static napi_value OHAudioDecoderDestroyCnormal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    return TestInitAVErrCode(env, OH_AudioCodec_Destroy(audioDec));
}

static napi_value OHAudioDecoderStartAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    checkParam = OH_AudioCodec_Start(audioDec);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderStartBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    checkParam = OH_AudioCodec_Start(audioDec);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderStartCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    checkParam = OH_AudioCodec_Start(audioDec);
    if (checkParam == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderStopAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Stop(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderStopBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Stop(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderStopCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Stop(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderFlushAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
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

static napi_value OHAudioDecoderFlushBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
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

static napi_value OHAudioDecoderFlushCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
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

static napi_value OHAudioDecoderResetAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Reset(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderResetBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Reset(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderResetCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Reset(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderGetOutputDescriptionAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_GetOutputDescription(audioDec);
        if (checkParam != nullptr) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
            free(checkParam);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderGetOutputDescriptionBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_GetOutputDescription(audioDec);
        if (checkParam != nullptr) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
            free(checkParam);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderGetOutputDescriptionCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_GetOutputDescription(audioDec);
        if (checkParam != nullptr) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
            free(checkParam);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderSetParameterAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        format = OH_AudioCodec_GetOutputDescription(audioDec);
        if (format != nullptr) {
            checkParam = OH_AudioCodec_SetParameter(audioDec, format);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                free(format);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderSetParameterBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        format = OH_AudioCodec_GetOutputDescription(audioDec);
        if (format != nullptr) {
            checkParam = OH_AudioCodec_SetParameter(audioDec, format);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                free(format);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderSetParameterCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        format = OH_AudioCodec_GetOutputDescription(audioDec);
        if (format != nullptr) {
            checkParam = OH_AudioCodec_SetParameter(audioDec, format);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                free(format);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderIsValidAnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    bool status = true;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            checkParam = OH_AudioCodec_IsValid(audioDec, &status);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                OH_AudioCodec_Stop(audioDec);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderIsValidBnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    bool status = true;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            checkParam = OH_AudioCodec_IsValid(audioDec, &status);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                OH_AudioCodec_Stop(audioDec);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderIsValidCnormal(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    bool status = true;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_IDENTIFICATION_HEADER, DEFAULT_VORBISTWO_TYPE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_SETUP_HEADER, DEFAULT_VORBIS_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            checkParam = OH_AudioCodec_IsValid(audioDec, &status);
            if (checkParam == AV_ERR_OK) {
                backParam = SUCCESS;
                OH_AudioCodec_Stop(audioDec);
            }
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderPushInputBuffer(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    uint32_t index = 0;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AVCodecCallback callback = {&OnError, &OnStreamChanged, &OnNeedInputBuffer, &OnNewOutputBuffer};
    signal_ = new ADecSignal();
    OH_AudioCodec_RegisterCallback(audioDec, callback, signal_);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Start(audioDec);
	{
	    unique_lock<mutex> lock(signal_->inMutex_);
	    signal_->inCond_.wait(lock, []() { return (signal_->inQueue_.size() > 0);});
	}
    if (signal_->inQueue_.front() == 0) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Stop(audioDec);
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderFreeOutputBuffer(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    uint32_t index = 0;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AVCodecCallback callback = {&OnError, &OnStreamChanged, &OnNeedInputBuffer, &OnNewOutputBuffer};
    signal_ = new ADecSignal();
    OH_AudioCodec_RegisterCallback(audioDec, callback, signal_);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Start(audioDec);
    {
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, []() { return (signal_->outQueue_.size() > 0); });
    }
    if (signal_->outQueue_.front() == 0) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Stop(audioDec);
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderAmrnb(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
    if (audioDec) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderAmrwb(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
    if (audioDec) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderOpus(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
    backParam = SUCCESS;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderG711Mu(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCodec *audioDec = nullptr;
    audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU, false);
    if (audioDec) {
        backParam = SUCCESS;
    }
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAudioDecoderViVid(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVFormat *checkParam = nullptr;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, false);
    backParam = SUCCESS;
    if (audioDec) {
        OH_AudioCodec_Configure(audioDec, format);
        OH_AudioCodec_Prepare(audioDec);
        if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
            checkParam = OH_AudioCodec_GetOutputDescription(audioDec);
            if (checkParam != nullptr) {
                backParam = SUCCESS;
                int32_t objNum;
                std::vector<uint8_t> metaData;
                uint8_t **addr;
                size_t size;
                OH_AVFormat_GetIntValue(format, OH_MD_KEY_AUDIO_OBJECT_NUMBER, &objNum);
                OH_AVFormat_GetBuffer(format, OH_MD_KEY_AUDIO_VIVID_METADATA, addr, &size);
                OH_AudioCodec_Stop(audioDec);
                free(checkParam);
            }
        }
    }
    OH_AudioCodec_Destroy(audioDec);
    napi_create_int32(env, backParam, &result);
    return result;
}

static uint32_t g_outputFormatChangedTimes = 0;
static int32_t g_outputSampleRate = 0;
static int32_t g_outputChannels = 0;
static OH_AVCodec *g_audioDec = nullptr;
static std::atomic<bool> g_isRunning(false);
static std::ifstream g_inputFile;

static void TestOnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}
static void TestOnStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)userData;
    g_outputFormatChangedTimes++;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, &g_outputChannels);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, &g_outputSampleRate);
}
static void TestOnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    ADecSignal *signal = static_cast<ADecSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(buffer);
    signal->inCond_.notify_all();
}
static void TestOnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)buffer;
    (void)userData;
    OH_AudioCodec_FreeOutputBuffer(codec, index);
}

static bool ReadBuffer(OH_AVBuffer *buffer, uint32_t index)
{
    OH_AVCodecBufferAttr info;
    uint64_t needSize;
    bool readResult = false;
    do {
        g_inputFile.read(reinterpret_cast<char *>(&needSize), sizeof(needSize));
        if (g_inputFile.eof() || g_inputFile.gcount() == 0 || needSize == 0) {
            break;
        }
        if (g_inputFile.gcount() != sizeof(needSize)) {
            break;
        }
        info.size = (int32_t)needSize;
        g_inputFile.read(reinterpret_cast<char *>(&info.pts), sizeof(info.pts));
        if (g_inputFile.gcount() != sizeof(info.pts)) {
            break;
        }
        info.flags = AVCODEC_BUFFER_FLAGS_NONE;
        OH_AVBuffer_SetBufferAttr(buffer, &info);
        g_inputFile.read((char *)OH_AVBuffer_GetAddr(buffer), info.size);
        if (g_inputFile.gcount() != info.size) {
            break;
        }
        readResult = true;
    } while (0);

    if (!readResult) {
        info.size = 1;
        info.flags = AVCODEC_BUFFER_FLAGS_EOS;
        OH_AVBuffer_SetBufferAttr(buffer, &info);
    }
    return readResult;
}

void InputFunc()
{
    g_inputFile.open("/data/storage/el2/base/haps/entry_test/files/aac_2c_44100hz_199k_lc.dat", std::ios::binary);
    if (!g_inputFile.is_open()) {
        return;
    }
    int32_t i = 0;
    while (g_isRunning.load()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, []() { return (signal_->inQueue_.size() > 0 || !g_isRunning.load()); });

        if (!g_isRunning.load()) {
            break;
        }

        uint32_t index = signal_->inQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        if (buffer == nullptr) {
            break;
        }
        if (ReadBuffer(buffer, index) == false) {
            OH_AudioCodec_PushInputBuffer(g_audioDec, index);
            signal_->inBufferQueue_.pop();
            signal_->inQueue_.pop();
            break;
        }
        int32_t ret = OH_AudioCodec_PushInputBuffer(g_audioDec, index);
        signal_->inQueue_.pop();
        signal_->inBufferQueue_.pop();
        if (ret != 0) {
            break;
        }
    }
    g_inputFile.close();
    g_isRunning.store(false);
    signal_->startCond_.notify_all();
}

static napi_value OHAudioDecoderOutputFormatChange(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    uint32_t index = 0;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    signal_ = new ADecSignal();
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE);
    // not match actual channels
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, 1);
    g_audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    OH_AVCodecCallback callback = {&TestOnError, &TestOnStreamChanged, &TestOnNeedInputBuffer, &TestOnNewOutputBuffer};

    OH_AudioCodec_RegisterCallback(g_audioDec, callback, signal_);
    OH_AudioCodec_Configure(g_audioDec, format);
    g_isRunning.store(true);
    std::thread inputLoop(InputFunc);

    OH_AudioCodec_Start(g_audioDec);
    {
        unique_lock<mutex> lock(signal_->startMutex_);
        signal_->startCond_.wait(lock, []() { return (!(g_isRunning.load())); });
    }

    OH_AudioCodec_Stop(g_audioDec);
    OH_AudioCodec_Destroy(g_audioDec);
    OH_AVFormat_Destroy(format);
    if (inputLoop.joinable()) {
        inputLoop.join();
    }
    if (g_outputSampleRate == DEFAULT_SAMPLERATE && g_outputChannels == DEFAULT_CHANNEL_COUNT &&
        g_outputFormatChangedTimes == 1) {
        backParam = SUCCESS;
    }
    g_outputFormatChangedTimes = 0;
    delete signal_;
    signal_ = nullptr;

    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_AudioCodec_CreateByMime", nullptr, AudioDecoderCreateByMimeAudioAac, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AudioCodec_CreateByName", nullptr, AudioDecoderCreateByName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Destroy", nullptr, AudioDecoderDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_RegisterCallback", nullptr, AudioDecoderRegisterCallback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Configure", nullptr, AudioDecoderConfigure, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Prepare", nullptr, AudioDecoderPrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Start", nullptr, AudioDecoderStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Stop", nullptr, AudioDecoderStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Flush", nullptr, AudioDecoderFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_Reset", nullptr, AudioDecoderReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_AudioCodec_GetOutputDescription", nullptr, AudioDecoderGetOutputDescription, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_AudioCodec_SetParameter", nullptr, AudioDecoderSetParameter, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_IsValid", nullptr, AudioDecoderIsValid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHAudioDecoderCreateByNameAnormal", nullptr, OHAudioDecoderCreateByNameAnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderCreateByNameBnormal", nullptr, OHAudioDecoderCreateByNameBnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderCreateByNameCnormal", nullptr, OHAudioDecoderCreateByNameCnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderDestroyAnormal", nullptr, OHAudioDecoderDestroyAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderDestroyBnormal", nullptr, OHAudioDecoderDestroyBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderDestroyCnormal", nullptr, OHAudioDecoderDestroyCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStartAnormal", nullptr, OHAudioDecoderStartAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStartBnormal", nullptr, OHAudioDecoderStartBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStartCnormal", nullptr, OHAudioDecoderStartCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStopAnormal", nullptr, OHAudioDecoderStopAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStopBnormal", nullptr, OHAudioDecoderStopBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderStopCnormal", nullptr, OHAudioDecoderStopCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderFlushAnormal", nullptr, OHAudioDecoderFlushAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderFlushBnormal", nullptr, OHAudioDecoderFlushBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderFlushCnormal", nullptr, OHAudioDecoderFlushCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderResetAnormal", nullptr, OHAudioDecoderResetAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderResetBnormal", nullptr, OHAudioDecoderResetBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderResetCnormal", nullptr, OHAudioDecoderResetCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderGetOutputDescriptionAnormal", nullptr, OHAudioDecoderGetOutputDescriptionAnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHAudioDecoderGetOutputDescriptionBnormal", nullptr, OHAudioDecoderGetOutputDescriptionBnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHAudioDecoderGetOutputDescriptionCnormal", nullptr, OHAudioDecoderGetOutputDescriptionCnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHAudioDecoderSetParameterAnormal", nullptr, OHAudioDecoderSetParameterAnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderSetParameterBnormal", nullptr, OHAudioDecoderSetParameterBnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderSetParameterCnormal", nullptr, OHAudioDecoderSetParameterCnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHAudioDecoderIsValidAnormal", nullptr, OHAudioDecoderIsValidAnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderIsValidBnormal", nullptr, OHAudioDecoderIsValidBnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderIsValidCnormal", nullptr, OHAudioDecoderIsValidCnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderPushInputBuffer", nullptr, OHAudioDecoderPushInputBuffer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderFreeOutputBuffer", nullptr, OHAudioDecoderFreeOutputBuffer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderAmrnb", nullptr, OHAudioDecoderAmrnb, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderAmrwb", nullptr, OHAudioDecoderAmrwb, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderOpus", nullptr, OHAudioDecoderOpus, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderG711Mu", nullptr, OHAudioDecoderG711Mu, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderViVid", nullptr, OHAudioDecoderViVid, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHAudioDecoderOutputFormatChange", nullptr, OHAudioDecoderOutputFormatChange, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "libaudioDecoderAvBuffer",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
