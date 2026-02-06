/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
#include "ParamCheckTest.h"
#include "AvcodecAudioAvbufferEncoderDemo.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioAacEncDemo;

/**
 * @tc.name   PARAM_CHECK_001
 * @tc.number PARAM_CHECK_001
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_001()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    codec = audioBufferAacEncDemo->CreateByMime("aaa");
    ASSERT_EQ(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_002
 * @tc.number PARAM_CHECK_002
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_002()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByName("OH.Media.Codec.Encoder.Audio.AAC");
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    codec = audioBufferAacEncDemo->CreateByName("OH.Media.Codec.Encoder.Audio.G711mu");
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    codec = audioBufferAacEncDemo->CreateByName("aaa");
    ASSERT_EQ(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_003
 * @tc.number PARAM_CHECK_003
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_003()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_ONE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_TWO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_ZERO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_THREE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_004_PART1
 * @tc.number PARAM_CHECK_004_PART1
 * @tc.desc   param check test (part1: 8K/12K/16K sample rate test)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_004_PART1(AudioBufferAacEncDemo* demo, OH_AVCodec** codec, OH_AVFormat* format)
{
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    *codec = demo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = demo->SetCallback(*codec);
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_8K;
    result0 = demo->Configure(
        *codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = demo->Destroy(*codec);
    format = OH_AVFormat_Create();
    *codec = demo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = demo->SetCallback(*codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_12K;
    result0 = demo->Configure(
        *codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = demo->Destroy(*codec);
    format = OH_AVFormat_Create();
    *codec = demo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = demo->SetCallback(*codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_16K;
    result0 = demo->Configure(
        *codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = demo->Destroy(*codec);
    return result0;
}

/**
 * @tc.name   PARAM_CHECK_004
 * @tc.number PARAM_CHECK_004
 * @tc.desc   param check test (main function)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_004()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    PARAM_CHECK_004_PART1(audioBufferAacEncDemo, &codec, format);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_24K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_48K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_8K_LESS;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_48K_GREATER;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_005
 * @tc.number PARAM_CHECK_005
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_005()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_8K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_48K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_006
 * @tc.number PARAM_CHECK_006
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_006()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleFormat = SAMPLE_S16LE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_007
 * @tc.number PARAM_CHECK_007
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_007()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ONE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_TEN;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ZERO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ELEVEN;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_008
 * @tc.number PARAM_CHECK_008
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_008()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_ONE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_ZERO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = PARAM_CHECK_CONFIGURE_CHANNEL_TWO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_009
 * @tc.number PARAM_CHECK_009
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_009()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_8K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_8K_LESS;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_8K_GREATER;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_010
 * @tc.number PARAM_CHECK_010
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_010()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_6K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_510K;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_6K_LESS;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_510K_GREATER;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_011
 * @tc.number PARAM_CHECK_011
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_011()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleFormat = SAMPLE_S16LE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_012
 * @tc.number PARAM_CHECK_012
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_012()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ONE;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_TEN;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ZERO;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_ELEVEN;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_013
 * @tc.number PARAM_CHECK_013
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_013()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_DEFAULT;
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_EIGHT;
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_014
 * @tc.number PARAM_CHECK_014
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_014()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_DEFAULT;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_EIGHT;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   PARAM_CHECK_015_PART1
 * @tc.number PARAM_CHECK_015_PART1
 * @tc.desc   param check test (part1: first codec test)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_015_PART1(AudioBufferAacEncDemo* demo, OH_AVCodec** codec, OH_AVFormat* format)
{
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;       // channel1
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT; // 8000hz
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    OH_AVErrCode result0;
    *codec = demo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(*codec, nullptr);
    result0 = demo->SetCallback(*codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = demo->Configure(
        *codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = demo->Start(*codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    uint32_t index = demo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_DEFAULT;
    result0 = demo->PushInputDataEOS(*codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = demo->GetOutputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_DEFAULT;
    result0 = demo->FreeOutputData(*codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = demo->Destroy(*codec);
    return result0;
}

/**
 * @tc.name   PARAM_CHECK_015
 * @tc.number PARAM_CHECK_015
 * @tc.desc   param check test (main function)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_015()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    PARAM_CHECK_015_PART1(audioBufferAacEncDemo, &codec, format);
    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    OH_AVErrCode result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    int32_t channel = PARAM_CHECK_CONFIGURE_CHANNEL_DEFAULT;
    int32_t sampleRate = PARAM_CHECK_CONFIGURE_SAMPLE_RATE_DEFAULT;
    int64_t bitRate = PARAM_CHECK_CONFIGURE_BIT_RATE_DEFAULT;
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = PARAM_CHECK_CONFIGURE_SAMPLE_BIT_DEFAULT;
    int32_t complexity = PARAM_CHECK_CONFIGURE_COMPLEXITY_DEFAULT;
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    uint32_t index = audioBufferAacEncDemo->GetInputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_DEFAULT;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetOutputIndex();
    index = PARAM_CHECK_PUSH_INPUT_INDEX_EIGHT;
    result0 = audioBufferAacEncDemo->FreeOutputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}