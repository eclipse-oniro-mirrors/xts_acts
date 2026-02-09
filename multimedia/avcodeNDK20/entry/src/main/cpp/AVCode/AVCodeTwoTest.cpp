/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include <cstdint>
#include <fstream>
#include <multimedia/player_framework/avcodec_audio_channel_layout.h>
#include <multimedia/player_framework/media_types.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <multimedia/player_framework/native_avcodec_audioencoder.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avsource.h>
#include <mutex>
#include <ohaudio/native_audiostreambuilder.h>
#include <queue>

using namespace std;
static bool g_isFirstFrame = true;
static int32_t g_qpAverage = 20;
static double g_mseValue = 0.0;
static int32_t g_widthStride = 0;
static int32_t g_heightStride = 0;
class AEncBufferSignal {
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

// OH_AVCodecOnError回调函数的实现。
static void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}

// OH_AVCodecOnStreamChanged回调函数的实现。
static void OnOutputFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}

// OH_AVCodecOnNeedInputBuffer回调函数的实现。
static void OnInputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    // 编码输入码流送入InputBuffer队列。
    AEncBufferSignal *signal = static_cast<AEncBufferSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

// OH_AVCodecOnNewOutputBuffer回调函数的实现。
static void OnOutputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    // 将对应输出buffer的index送入OutputQueue_队列。
    // 将对应编码完成的数据data送入outBuffer队列。
    AEncBufferSignal *signal = static_cast<AEncBufferSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

napi_value EnumAudioChannelSet25(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(LOW_FREQUENCY_2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet26(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_SIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet27(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_SIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet28(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BOTTOM_FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet29(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BOTTOM_FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet30(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BOTTOM_FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet31(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN1);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet32(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet33(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN3);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet34(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_W);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet35(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_Y);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet36(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_Z);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet37(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_X);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet38(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN4);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet39(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN5);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet40(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN6);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet41(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN7);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet42(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN8);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet43(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN9);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet44(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN10);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet45(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN11);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet46(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN12);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet47(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN13);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet48(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN14);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet49(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN15);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet50(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMBISONICS_ACN0);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout1(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_2_1);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout2(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(SURROUND);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout3(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_4POINT0);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout4(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_2_2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout5(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(QUAD);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout6(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_5POINT0);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout7(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_5POINT0_BACK);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout8(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_5POINT1_BACK);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout9(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_6POINT0);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout10(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_6POINT0_FRONT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout11(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(HEXAGONAL);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout12(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_6POINT1_BACK);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout13(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_6POINT1_FRONT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout14(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT0);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout15(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT0_FRONT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout16(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT1_WIDE);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout17(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT1_WIDE_BACK);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout18(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_3POINT1POINT2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout19(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_5POINT1POINT2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout20(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_5POINT1POINT4);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout21(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT1POINT2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout22(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_7POINT1POINT4);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout23(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_9POINT1POINT4);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout24(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_9POINT1POINT6);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout25(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_10POINT2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout26(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_22POINT2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout27(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(OCTAGONAL);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout28(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(HEXADECAGONAL);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout29(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(STEREO_DOWNMIX);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout30(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(HOA_FIRST);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout31(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(HOA_SECOND);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);

    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelLayout32(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(HOA_THIRD);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue = nullptr;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeAVBufferDestroyErrInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVBuffer *buffer = nullptr;
    int32_t desResult = OH_AVBuffer_Destroy(buffer);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeAVBufferDestroyErrOperateNotPermit(napi_env env, napi_callback_info info)
{
    OH_AVBuffer *buffer = nullptr;
    int32_t capacity = PARAM_1024;
    buffer = OH_AVBuffer_Create(capacity);
    OH_AVBuffer_Destroy(buffer);
    int32_t desResult = OH_AVBuffer_Destroy(buffer);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_OPERATE_NOT_PERMIT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeAVBufferGetBufferAttrErrInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVBuffer *buffer = nullptr;
    OH_AVCodecBufferAttr *attr = nullptr;
    int32_t getResult = OH_AVBuffer_GetBufferAttr(buffer, attr);
    napi_value retValue = nullptr;
    if (getResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeAVBufferSetBufferAttrErrInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVBuffer *buffer = nullptr;
    OH_AVCodecBufferAttr *attr = nullptr;
    int32_t setResult = OH_AVBuffer_SetBufferAttr(buffer, attr);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeAVBufferSetParameterErrInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVBuffer *buffer = nullptr;
    OH_AVFormat *format = nullptr;
    int32_t setResult = OH_AVBuffer_SetParameter(buffer, format);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAVCapabilityGetAudioSupportedSampleRates(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = nullptr;
    const int32_t **sampleRates = nullptr;
    uint32_t *sampleRateNum = nullptr;
    int32_t getResult = OH_AVCapability_GetAudioSupportedSampleRates(capability, sampleRates, sampleRateNum);
    napi_value retValue = nullptr;
    if (getResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAVCapabilityGetAudioChannelCountRange(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = nullptr;
    OH_AVRange *channelCountRange = nullptr;
    int32_t getResult = OH_AVCapability_GetAudioChannelCountRange(capability, channelCountRange);
    napi_value retValue = nullptr;
    if (getResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioCodecDestroyAVErrInvalidState(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    int32_t desResult;
    if (capability != nullptr) {
        const char *codecName = OH_AVCapability_GetName(capability);
        OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(codecName);
        OH_VideoEncoder_Prepare(videoDec);
        desResult = OH_AudioCodec_Destroy(videoDec);
    }
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, desResult, &retValue);
    }
    return retValue;
}

static void OnStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}

static void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    if (g_isFirstFrame) {
        auto format = std::shared_ptr<OH_AVFormat>(OH_VideoEncoder_GetInputDescription(codec), OH_AVFormat_Destroy);
        if (format == nullptr) {
            // 异常处理。
        }
        bool ret = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_STRIDE, &g_widthStride) &&
                   OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_SLICE_HEIGHT, &g_heightStride);
        if (!ret) {
            // 异常处理。
        }
        g_isFirstFrame = false;
    }
    (void)codec;
    (void)userData;
}

static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    (void)userData;
}

napi_value AVCodeOHAudioCodecRegisterCallback(napi_env env, napi_callback_info info)
{
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_AVCodecCallback cb = {&OnError, &OnStreamChanged, &OnNeedInputBuffer, &OnNewOutputBuffer};
    OH_VideoEncoder_Prepare(videoEnc);
    int32_t registerCallbackResult = OH_VideoEncoder_RegisterCallback(videoEnc, cb, nullptr);
    napi_value retValue = nullptr;
    if (registerCallbackResult == AV_ERR_OPERATE_NOT_PERMIT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}


napi_value AVCodeOHAudioCodecPrepareInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    bool isEncoder = true;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, isEncoder);
    OH_AVFormat *invalidFormat = OH_AVFormat_Create();
    // 配置音频采样率（必须）
    constexpr uint32_t defaultSampleRate = PARAM_44100;
    // 配置音频码率（必须）
    constexpr uint64_t defaultBitrate = PARAM_32000;
    // 配置音频声道数（必须）
    constexpr uint32_t defaultChannelCount = PARAM_2;
    // 配置音频声道类型（必须）
    constexpr OH_AudioChannelLayout CHANNEL_LAYOUT = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    // 配置音频位深（必须）
    constexpr OH_BitsPerSample SAMPLE_FORMAT = OH_BitsPerSample::SAMPLE_S16LE;
    OH_AVFormat_SetIntValue(invalidFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, defaultSampleRate);
    OH_AVFormat_SetIntValue(invalidFormat, OH_MD_KEY_AUD_SAMPLE_RATE, defaultBitrate);
    OH_AVFormat_SetLongValue(invalidFormat, OH_MD_KEY_BITRATE, defaultChannelCount);
    OH_AVFormat_SetIntValue(invalidFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(invalidFormat, OH_MD_KEY_CHANNEL_LAYOUT, CHANNEL_LAYOUT);
    OH_AudioCodec_Configure(codec, invalidFormat);
    OH_AudioCodec_Start(codec);
    int32_t configureResult = OH_AudioCodec_Prepare(codec);
    napi_value retValue = nullptr;
    if (configureResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderDestroySuccess(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    int32_t desResult = OH_AudioDecoder_Destroy(codec);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_OK) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderDestroyInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t desResult = OH_AudioDecoder_Destroy(codec);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderConfigureInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = nullptr;
    int32_t configureResult = OH_AudioDecoder_Configure(codec, format);
    napi_value retValue = nullptr;
    if (configureResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderConfigureUnsupport(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t configureResult = OH_AudioDecoder_Configure(codec, format);
    napi_value retValue = nullptr;
    if (configureResult == AV_ERR_UNSUPPORT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPrepareInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t prepareResult = OH_AudioDecoder_Prepare(codec);
    napi_value retValue = nullptr;
    if (prepareResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPrepareUnsupport(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AudioDecoder_Configure(codec, format);
    int32_t prepareResult = OH_AudioDecoder_Prepare(codec);
    napi_value retValue = nullptr;
    if (prepareResult == AV_ERR_UNSUPPORT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderStartInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t startResult = OH_AudioDecoder_Start(codec);
    napi_value retValue = nullptr;
    if (startResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderStartInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AudioDecoder_Configure(codec, format);
    OH_AudioDecoder_Prepare(codec);
    int32_t startResult = OH_AudioDecoder_Start(codec);
    napi_value retValue = nullptr;
    if (startResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderStopInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t desResult = OH_AudioDecoder_Start(codec);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderStopInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    int32_t stopResult = OH_AudioDecoder_Start(codec);
    napi_value retValue = nullptr;
    if (stopResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderFlushInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t flushResult = OH_AudioDecoder_Flush(codec);
    napi_value retValue = nullptr;
    if (flushResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderFlushInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    int32_t flushResult = OH_AudioDecoder_Flush(codec);
    napi_value retValue = nullptr;
    if (flushResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderResetInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t resetResult = OH_AudioDecoder_Reset(codec);
    napi_value retValue = nullptr;
    if (resetResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderSetParameterInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = nullptr;
    int32_t setResult = OH_AudioDecoder_SetParameter(codec, format);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPushInputDataInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    OH_AVCodecBufferAttr attr;
    int32_t setResult = OH_AudioDecoder_PushInputData(codec, index, attr);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, setResult, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPushInputDataInvalidState(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    int64_t pts = PARAM_162000000;
    int32_t size = PARAM_1;
    int32_t offset = PARAM_4096;
    uint32_t flags = PARAM_FLAG;
    OH_AVCodecBufferAttr attr = {pts, size, offset, flags};
    int32_t inputResult = OH_AudioDecoder_PushInputData(codec, index, attr);
    napi_value retValue = nullptr;
    if (inputResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, inputResult, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    int32_t outputResult = OH_AudioDecoder_FreeOutputData(codec, index);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderPushFreeOutputDataInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioDecoder_CreateByMime(mime);
    uint32_t index = PARAM_0;
    OH_AVCodecBufferAttr attr;
    int32_t outputResult = OH_AudioDecoder_FreeOutputData(codec, index);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderIsValidInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    int32_t outputResult = OH_AudioDecoder_IsValid(codec, isValid);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderDestroySuccess(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    int32_t outputResult = OH_AudioEncoder_Destroy(codec);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_OK) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderDestroyInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    int32_t outputResult = OH_AudioEncoder_IsValid(codec, isValid);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderConfigureInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = nullptr;
    int32_t configureResult = OH_AudioEncoder_Configure(codec, format);
    napi_value retValue = nullptr;
    if (configureResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderConfigureUnsupport(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t configureResult = OH_AudioEncoder_Configure(codec, format);
    napi_value retValue = nullptr;
    if (configureResult == AV_ERR_UNSUPPORT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPrepareInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t prepareResult = OH_AudioEncoder_Prepare(codec);
    napi_value retValue = nullptr;
    if (prepareResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPrepareUnsupport(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AudioEncoder_Configure(codec, format);
    int32_t prepareResult = OH_AudioEncoder_Prepare(codec);
    napi_value retValue = nullptr;
    if (prepareResult == AV_ERR_UNSUPPORT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderStartInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t startResult = OH_AudioEncoder_Start(codec);
    napi_value retValue = nullptr;
    if (startResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderStartInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AudioEncoder_Configure(codec, format);
    OH_AudioEncoder_Prepare(codec);
    int32_t startResult = OH_AudioEncoder_Start(codec);
    napi_value retValue = nullptr;
    if (startResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderStopInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t desResult = OH_AudioEncoder_Stop(codec);
    napi_value retValue = nullptr;
    if (desResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderStopInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    int32_t stopResult = OH_AudioEncoder_Stop(codec);
    napi_value retValue = nullptr;
    if (stopResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderFlushInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t flushResult = OH_AudioEncoder_Flush(codec);
    napi_value retValue = nullptr;
    if (flushResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderFlushInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    int32_t flushResult = OH_AudioEncoder_Flush(codec);
    napi_value retValue = nullptr;
    if (flushResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderResetInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    int32_t resetResult = OH_AudioEncoder_Reset(codec);
    napi_value retValue = nullptr;
    if (resetResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderSetParameterInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = nullptr;
    int32_t setResult = OH_AudioEncoder_SetParameter(codec, format);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPushInputDataInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    OH_AVCodecBufferAttr attr;
    int32_t setResult = OH_AudioEncoder_PushInputData(codec, index, attr);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPushInputDataInvalidState(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    int64_t pts = PARAM_162000000;
    int32_t size = PARAM_1;
    int32_t offset = PARAM_4096;
    uint32_t flags = PARAM_FLAG;
    OH_AVCodecBufferAttr attr = {pts, size, offset, flags};
    int32_t inputResult = OH_AudioEncoder_PushInputData(codec, index, attr);
    napi_value retValue = nullptr;
    if (inputResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPushFreeOutputDataInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index = PARAM_0;
    int32_t outputResult = OH_AudioEncoder_FreeOutputData(codec, index);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderPushFreeOutputDataInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioEncoder_CreateByMime(mime);
    uint32_t index = PARAM_0;
    OH_AVCodecBufferAttr attr;
    int32_t outputResult = OH_AudioEncoder_PushInputData(codec, index, attr);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderIsValidInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    int32_t outputResult = OH_AudioEncoder_IsValid(codec, isValid);
    napi_value retValue = nullptr;
    if (outputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioCodecSetParameterInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    const OH_AVFormat *format = nullptr;
    int32_t setResult = OH_AudioCodec_SetParameter(codec, format);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioCodecSetParameterOperateNotPermit(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    bool isEncoder = true;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, isEncoder);
    OH_AVFormat *baseFormat = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(baseFormat, OH_MD_KEY_AUD_SAMPLE_RATE, PARAM_44100);
    OH_AudioCodec_Configure(codec, baseFormat);
    OH_AudioCodec_Start(codec);
    OH_AVFormat *dynamicFormat = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(dynamicFormat, OH_MD_KEY_BITRATE, PARAM_192000);
    int32_t setResult = OH_AudioCodec_SetParameter(codec, dynamicFormat);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_OPERATE_NOT_PERMIT) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioCodecSetParameterOperateInvalidState(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    bool isEncoder = true;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, isEncoder);
    OH_AVFormat *dynamicFormat = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(dynamicFormat, OH_MD_KEY_BITRATE, PARAM_192000);
    int32_t setResult = OH_AudioCodec_SetParameter(codec, dynamicFormat);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_INVALID_STATE) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
