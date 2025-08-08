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
#include "avcodec_audio_avbuffer_decoder_demo.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;

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
 * @tc.number    : PARAM_CHECK_001
 * @tc.name      : CreateByMime - mime param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
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
}

/**
 * @tc.number    : PARAM_CHECK_002
 * @tc.name      : CreateByName - mime param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
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
}

/**
 * @tc.number    : PARAM_CHECK_003
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_AAC) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;
    int32_t sampleRate = 48000;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 8;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_004
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_AAC) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 11025;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 12000;  // 12000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16000;  // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 22050;  // 22050hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 24000;  // 24000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 32000;  // 32000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 44100;  // 44100hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 48000;  // 48000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 64000;  // 64000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 88200;  // 88200hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 96000;  // 96000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 7999;  // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 96001;  // 96001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_005
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_FLAC) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_005, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;
    int32_t sampleRate = 48000;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 8;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_006
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_FLAC) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_006, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;         // 2 channel
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16000;  // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 22050;  // 22050hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 24000;  // 24000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 32000;  // 32000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 44100;  // 44100hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 48000;  // 48000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 88200;  // 88200hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 96000;  // 96000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 96001;  // 96001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 192000;  // 192000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_FLAC);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 384000;  // 384000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_007
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_MPEG) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;
    int32_t sampleRate = 48000;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 2;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 9;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_008
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_MPEG) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_008, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 2;         // 2 chan
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 11025;  // 11025hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 12000;  // 12000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16000;  // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 22050;  // 22050hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 24000;  // 24000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 32000;  // 32000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 44100;  // 44100hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 48000;  // 48000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 7999;  // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 48001;  // 48001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_011
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_011, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 2;  // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_012
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_012, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 7999;  // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8001;  // 8001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_013
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_013, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;  // 16000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 2;  // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_014
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_014, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;  // 16000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16000;  // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 15999;  // 15999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16001;  // 16001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_016
 * @tc.name      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_G711MU) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_016, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 2;  // 2 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_017
 * @tc.name      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_G711MU) param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_017, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 7999;  // 7999hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8001;  // 8001hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_021
 * @tc.name      : FreeOutputData - index param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_021, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = 8;
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetOutputIndex();
    index = -1;
    result0 = aDecBufferDemo->FreeOutputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_022
 * @tc.name      : PushInputDataEOS - index param check
 * @tc.desc      : param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_022, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
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
    index = 8;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_023
 * @tc.name      : PARAM_CHECK_023
 * @tc.desc      : Configure - channel(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_023, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 1;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    
    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 0;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    channel = 7;  // 7 channel
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    delete aDecBufferDemo;
}

/**
 * @tc.number    : PARAM_CHECK_024
 * @tc.name      : PARAM_CHECK_024
 * @tc.desc      : Configure - sampleRate(OH_AVCODEC_MIMETYPE_AUDIO_G711A) param check test
 */
HWTEST_F(ParamCheckTest, PARAM_CHECK_024, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 8000;  // 8000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 16000;  // 16000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 44100;  // 44100hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);

    format = OH_AVFormat_Create();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711A);
    result0 = aDecBufferDemo->SetCallback(codec);
    sampleRate = 48000;  // 48000hz
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    delete aDecBufferDemo;
}