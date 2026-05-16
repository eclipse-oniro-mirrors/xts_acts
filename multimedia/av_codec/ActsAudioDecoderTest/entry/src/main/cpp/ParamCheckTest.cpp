/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/ParamCheckTest.h"
#include <atomic>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <queue>
#include <string>
#include <thread>
#include "include/AvcodecAudioAvBufferDecoderDemoTest.h"
#include "include/CommonToolTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;

namespace {
// Sample rate constants
constexpr int32_t SAMPLE_RATE_8000 = 8000;
constexpr int32_t SAMPLE_RATE_11025 = 11025;
constexpr int32_t SAMPLE_RATE_12000 = 12000;
constexpr int32_t SAMPLE_RATE_16000 = 16000;
constexpr int32_t SAMPLE_RATE_22050 = 22050;
constexpr int32_t SAMPLE_RATE_24000 = 24000;
constexpr int32_t SAMPLE_RATE_32000 = 32000;
constexpr int32_t SAMPLE_RATE_44100 = 44100;
constexpr int32_t SAMPLE_RATE_48000 = 48000;
constexpr int32_t SAMPLE_RATE_64000 = 64000;
constexpr int32_t SAMPLE_RATE_88200 = 88200;
constexpr int32_t SAMPLE_RATE_96000 = 96000;
constexpr int32_t SAMPLE_RATE_96001 = 96001;
constexpr int32_t SAMPLE_RATE_192000 = 192000;
constexpr int32_t SAMPLE_RATE_384000 = 384000;
constexpr int32_t SAMPLE_RATE_7999 = 7999;
constexpr int32_t SAMPLE_RATE_8001 = 8001;
constexpr int32_t SAMPLE_RATE_15999 = 15999;
constexpr int32_t SAMPLE_RATE_16001 = 16001;
constexpr int32_t SAMPLE_RATE_48001 = 48001;
constexpr int32_t SAMPLE_RATE_0 = 0;

// Channel count constants
constexpr int32_t CHANNEL_COUNT_0 = 0;
constexpr int32_t CHANNEL_COUNT_1 = 1;
constexpr int32_t CHANNEL_COUNT_2 = 2;
constexpr int32_t CHANNEL_COUNT_7 = 7;
constexpr int32_t CHANNEL_COUNT_8 = 8;
constexpr int32_t CHANNEL_COUNT_9 = 9;

// Index constants
constexpr int32_t INDEX_INVALID = -1;
constexpr int32_t INDEX_0 = 0;
constexpr int32_t INDEX_8 = 8;

// Timeout constants
constexpr int32_t TIMEOUT_20000 = 20000;

// Loop count constants
constexpr int32_t LOOP_COUNT_8 = 8;

// Other constants
constexpr int32_t BLOCK_ALIGN_5462 = 5462;
constexpr int32_t BLOCK_ALIGN_93 = 93;
} // namespace

namespace Acts {
namespace AudioDecoder {

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
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime("aaa");
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.AAC");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.Flac");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.Mpeg");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.Vorbis");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.Amrnb");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.Amrwb");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.G711mu");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("OH.Media.Codec.Decoder.Audio.G711a");
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByName("aaa");
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_2;
    int32_t sampleRate = SAMPLE_RATE_48000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_8;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_004
 * @tc.number PARAM_CHECK_004
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_004()
{
    struct TestCase {
        int32_t sampleRate;
        OH_AVErrCode expectedResult;
    };
    TestCase testCases[] = { { SAMPLE_RATE_8000, AV_ERR_OK },          { SAMPLE_RATE_11025, AV_ERR_OK },
                             { SAMPLE_RATE_12000, AV_ERR_OK },         { SAMPLE_RATE_16000, AV_ERR_OK },
                             { SAMPLE_RATE_22050, AV_ERR_OK },         { SAMPLE_RATE_24000, AV_ERR_OK },
                             { SAMPLE_RATE_32000, AV_ERR_OK },         { SAMPLE_RATE_44100, AV_ERR_OK },
                             { SAMPLE_RATE_48000, AV_ERR_OK },         { SAMPLE_RATE_64000, AV_ERR_OK },
                             { SAMPLE_RATE_88200, AV_ERR_OK },         { SAMPLE_RATE_96000, AV_ERR_OK },
                             { SAMPLE_RATE_7999, AV_ERR_INVALID_VAL }, { SAMPLE_RATE_96001, AV_ERR_INVALID_VAL } };
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = nullptr;
    int32_t channel = CHANNEL_COUNT_2;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    for (size_t i = 0; i < sizeof(testCases) / sizeof(testCases[0]); i++) {
        format = OH_AVFormat_Create();
        codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
        result0 = aDecBufferDemo->SetCallback(codec);
        result0 = aDecBufferDemo->Configure(codec, format, channel, testCases[i].sampleRate);
        ASSERT_EQ(result0, testCases[i].expectedResult);
        result0 = aDecBufferDemo->Destroy(codec);
    }
    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_2;
    int32_t sampleRate = SAMPLE_RATE_48000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_8;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t sampleRates[] = { SAMPLE_RATE_8000,  SAMPLE_RATE_16000, SAMPLE_RATE_22050,  SAMPLE_RATE_24000,
                              SAMPLE_RATE_32000, SAMPLE_RATE_44100, SAMPLE_RATE_48000,  SAMPLE_RATE_88200,
                              SAMPLE_RATE_96000, SAMPLE_RATE_96001, SAMPLE_RATE_192000, SAMPLE_RATE_384000 };
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = nullptr;
    int32_t channel = CHANNEL_COUNT_2;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    for (size_t i = 0; i < sizeof(sampleRates) / sizeof(sampleRates[0]); i++) {
        format = OH_AVFormat_Create();
        codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
        result0 = aDecBufferDemo->SetCallback(codec);
        result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRates[i]);
        ASSERT_EQ(result0, AV_ERR_OK);
        result0 = aDecBufferDemo->Destroy(codec);
    }
    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_2;
    int32_t sampleRate = SAMPLE_RATE_48000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_2;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    struct TestCase {
        int32_t sampleRate;
        OH_AVErrCode expectedResult;
    };
    TestCase testCases[] = { { SAMPLE_RATE_8000, AV_ERR_OK },          { SAMPLE_RATE_11025, AV_ERR_OK },
                             { SAMPLE_RATE_12000, AV_ERR_OK },         { SAMPLE_RATE_16000, AV_ERR_OK },
                             { SAMPLE_RATE_22050, AV_ERR_OK },         { SAMPLE_RATE_24000, AV_ERR_OK },
                             { SAMPLE_RATE_32000, AV_ERR_OK },         { SAMPLE_RATE_44100, AV_ERR_OK },
                             { SAMPLE_RATE_48000, AV_ERR_OK },         { SAMPLE_RATE_7999, AV_ERR_INVALID_VAL },
                             { SAMPLE_RATE_48001, AV_ERR_INVALID_VAL } };
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = nullptr;
    int32_t channel = CHANNEL_COUNT_2;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    for (size_t i = 0; i < sizeof(testCases) / sizeof(testCases[0]); i++) {
        format = OH_AVFormat_Create();
        codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
        result0 = aDecBufferDemo->SetCallback(codec);
        result0 = aDecBufferDemo->Configure(codec, format, channel, testCases[i].sampleRate);
        ASSERT_EQ(result0, testCases[i].expectedResult);
        result0 = aDecBufferDemo->Destroy(codec);
    }
    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_2; // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_8000; // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_7999; // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_8001; // 8001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000; // 16000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_2; // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
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
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000; // 16000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_16000; // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_15999; // 15999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_16001; // 16001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_016
 * @tc.number PARAM_CHECK_016
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_016()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_2; // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_017
 * @tc.number PARAM_CHECK_017
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_017()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_8000; // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_7999; // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_8001; // 8001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_021
 * @tc.number PARAM_CHECK_021
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_021()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = INDEX_8;
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetOutputIndex();
    index = INDEX_INVALID;
    result0 = aDecBufferDemo->FreeOutputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_022
 * @tc.number PARAM_CHECK_022
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_022()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = INDEX_INVALID;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = INDEX_8;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_023
 * @tc.number PARAM_CHECK_023
 * @tc.desc   Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_023()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = CHANNEL_COUNT_7; // 7 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_024
 * @tc.number PARAM_CHECK_024
 * @tc.desc   Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_024()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_8000; // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_16000; // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_44100; // 44100hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = SAMPLE_RATE_48000; // 48000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_025
 * @tc.number PARAM_CHECK_025
 * @tc.desc   Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_WMAPRO) param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_025()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_2;
    int32_t sampleRate = SAMPLE_RATE_44100;
    int32_t blockAlign = BLOCK_ALIGN_5462;
    std::vector<uint8_t> extraData = { 0x10, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                       0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00 };
    uint8_t* dataBuffer = extraData.data();
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_WMAPRO);
    result0 = aDecBufferDemo->SetCallback(codec);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BLOCK_ALIGN, blockAlign);
    OH_AVFormat_SetBuffer(format, OH_MD_KEY_CODEC_CONFIG, dataBuffer, extraData.size());
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_026
 * @tc.number PARAM_CHECK_026
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_026()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_GSM_MS);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_EAC3);
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AC3);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_ALAC);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_GSM);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_WMAV1);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_WMAV2);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_WMAPRO);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_027
 * @tc.number PARAM_CHECK_027
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_027()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index = INDEX_0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    // use all buffer
    for (int32_t i = 0; i < LOOP_COUNT_8; i++) {
        result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, TIMEOUT_20000);
    }

    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_TRY_AGAIN_LATER);

    result0 = OH_AudioCodec_QueryOutputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_TRY_AGAIN_LATER);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_028
 * @tc.number PARAM_CHECK_028
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_028()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_ILBC);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_1;
    sampleRate = SAMPLE_RATE_8000;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_029
 * @tc.number PARAM_CHECK_029
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_029()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_TRUEHD);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_2;
    sampleRate = SAMPLE_RATE_48000;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_030
 * @tc.number PARAM_CHECK_030
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_030()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    std::vector<uint8_t> extradata = { 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8 };
    OH_AVFormat_SetBuffer(format, OH_MD_KEY_CODEC_CONFIG, extradata.data(), extradata.size());

    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_TWINVQ);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_1;
    sampleRate = SAMPLE_RATE_8000;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_031
 * @tc.number PARAM_CHECK_031
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_031()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_DVAUDIO);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_2;
    sampleRate = SAMPLE_RATE_48000;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_032
 * @tc.number PARAM_CHECK_032
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_032()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_DTS);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_2;
    sampleRate = SAMPLE_RATE_48000;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_033
 * @tc.number PARAM_CHECK_033
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_033()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000;
    int32_t blockAlign = BLOCK_ALIGN_93;
    std::vector<uint8_t> extradata = { 1, 0, 0, 3, 8, 0, 0, 32, 0, 0, 0, 0, 0, 2, 0, 4 };
    OH_AVFormat_SetBuffer(format, OH_MD_KEY_CODEC_CONFIG, extradata.data(), extradata.size());
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BLOCK_ALIGN, blockAlign);

    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_COOK);
    ASSERT_NE(codec, nullptr);

    channel = CHANNEL_COUNT_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    sampleRate = SAMPLE_RATE_0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    aDecBufferDemo->Reset(codec);

    channel = CHANNEL_COUNT_2;
    sampleRate = SAMPLE_RATE_44100;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   PARAM_CHECK_034
 * @tc.number PARAM_CHECK_034
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int PARAM_CHECK_034()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_48000;
    std::vector<uint8_t> skipInfo{ 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    OH_AVFormat_SetBuffer(format, OH_MD_KEY_BUFFER_SKIP_SAMPLES_INFO, skipInfo.data(), skipInfo.size());

    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    ASSERT_NE(codec, nullptr);

    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}
} // namespace AudioDecoder
}