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
#include <atomic>
#include <iostream>
#include <fstream>
#include <queue>
#include <string>
#include <thread>
#include "gtest/gtest.h"
#include "avcodec_audio_avbuffer_encoder_demo.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioAacEncDemo;

namespace {
class ParamCheckTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void ParamCheckTest::SetUpTestCase() {}
void ParamCheckTest::TearDownTestCase() {}
void ParamCheckTest::SetUp() {}
void ParamCheckTest::TearDown() {}

} // namespace

/**
 * @tc.name   PARAM_CHECK_001
 * @tc.number PARAM_CHECK_001
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
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
}

/**
 * @tc.name   PARAM_CHECK_002
 * @tc.number PARAM_CHECK_002
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
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
}

/**
 * @tc.name   PARAM_CHECK_003
 * @tc.number PARAM_CHECK_003
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 1;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 2;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 0;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 3;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_004
 * @tc.number PARAM_CHECK_004
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 8000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 12000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 16000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 24000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 48000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 7999;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 48001;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_005
 * @tc.number PARAM_CHECK_005
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_005, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 8000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 48000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_006
 * @tc.number PARAM_CHECK_006
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_006, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleFormat = SAMPLE_S16LE;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_007
 * @tc.number PARAM_CHECK_007
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 1;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 10;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 0;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 11;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_008
 * @tc.number PARAM_CHECK_008
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_008, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 1;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 0;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    channel = 2;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_009
 * @tc.number PARAM_CHECK_009
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_009, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 8000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 7999;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleRate = 8001;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_010
 * @tc.number PARAM_CHECK_010
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_010, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 6000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 510000;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 5999;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    bitRate = 510001;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_011
 * @tc.number PARAM_CHECK_011
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_011, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    sampleFormat = SAMPLE_S16LE;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_012
 * @tc.number PARAM_CHECK_012
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_012, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 1;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 10;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 0;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    complexity = 11;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_013
 * @tc.number PARAM_CHECK_013
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_013, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = 8;
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_014
 * @tc.number PARAM_CHECK_014
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_014, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = 8;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   PARAM_CHECK_015
 * @tc.number PARAM_CHECK_015
 * @tc.desc   param check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_015, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    uint32_t index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetOutputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->FreeOutputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetOutputIndex();
    index = 8;
    result0 = audioBufferAacEncDemo->FreeOutputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);

    delete audioBufferAacEncDemo;
}
