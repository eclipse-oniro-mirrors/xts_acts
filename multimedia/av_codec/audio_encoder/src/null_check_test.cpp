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
class NullCheckTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void NullCheckTest::SetUpTestCase() {}
void NullCheckTest::TearDownTestCase() {}
void NullCheckTest::SetUp() {}
void NullCheckTest::TearDown() {}

} // namespace

/**
 * @tc.name   NULL_CHECK_001
 * @tc.number NULL_CHECK_001
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_002
 * @tc.number NULL_CHECK_002
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByName(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_003
 * @tc.number NULL_CHECK_003
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_004
 * @tc.number NULL_CHECK_004
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_005
 * @tc.number NULL_CHECK_005
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_005, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Configure(nullptr, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_006
 * @tc.number NULL_CHECK_006
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_006, TestSize.Level2)
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
    format = nullptr;
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_007
 * @tc.number NULL_CHECK_007
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Prepare(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_008
 * @tc.number NULL_CHECK_008
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_008, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Start(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_009
 * @tc.number NULL_CHECK_009
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_009, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_010
 * @tc.number NULL_CHECK_010
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_010, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_011
 * @tc.number NULL_CHECK_011
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_011, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_012
 * @tc.number NULL_CHECK_012
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_012, TestSize.Level2)
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
    OH_AVFormat *result1;
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
    result1 = audioBufferAacEncDemo->GetOutputDescription(nullptr);
    ASSERT_EQ(result1, nullptr);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_013
 * @tc.number NULL_CHECK_013
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_013, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(nullptr, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_014
 * @tc.number NULL_CHECK_014
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_014, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(nullptr, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_015
 * @tc.number NULL_CHECK_015
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_015, TestSize.Level2)
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
    ASSERT_NE(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetOutputIndex();
    result0 = audioBufferAacEncDemo->FreeOutputData(nullptr, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_016
 * @tc.number NULL_CHECK_016
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_016, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->IsValid(nullptr, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_017
 * @tc.number NULL_CHECK_017
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_017, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    isValid = nullptr;
    result0 = audioBufferAacEncDemo->IsValid(codec, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   NULL_CHECK_018
 * @tc.number NULL_CHECK_018
 * @tc.desc   OH_AudioCodec_QueryInputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_018, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    uint32_t index = 0;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(nullptr, &index, timeoutUs);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}

/**
 * @tc.name   NULL_CHECK_019
 * @tc.number NULL_CHECK_019
 * @tc.desc   OH_AudioCodec_QueryInputBuffer - index null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_019, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(codec, nullptr, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}

/**
 * @tc.name   NULL_CHECK_020
 * @tc.number NULL_CHECK_020
 * @tc.desc   OH_AudioCodec_GetInputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_020, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    OH_AVBuffer* buffer = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    uint32_t index = 0;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_OK);
    buffer = OH_AudioCodec_GetInputBuffer(nullptr, index);
    ASSERT_EQ(buffer, nullptr);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}

/**
 * @tc.name   NULL_CHECK_021
 * @tc.number NULL_CHECK_021
 * @tc.desc   OH_AudioCodec_QueryOutputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_021, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    OH_AVBuffer* buffer = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    uint32_t index = 0;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_OK);
    buffer = OH_AudioCodec_GetInputBuffer(codec, index);
    ASSERT_NE(buffer, nullptr);
    OH_AVCodecBufferAttr attr;
    memset_s(&attr, sizeof(attr), 0, sizeof(attr));
    attr.size = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    result0 = OH_AVBuffer_SetBufferAttr(buffer, &attr);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_PushInputBuffer(codec, index);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryOutputBuffer(nullptr, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}

/**
 * @tc.name   NULL_CHECK_022
 * @tc.number NULL_CHECK_022
 * @tc.desc   OH_AudioCodec_QueryOutputBuffer - index null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_022, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    OH_AVBuffer* buffer = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    uint32_t index = 0;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_OK);
    buffer = OH_AudioCodec_GetInputBuffer(codec, index);
    ASSERT_NE(buffer, nullptr);
    OH_AVCodecBufferAttr attr;
    memset_s(&attr, sizeof(attr), 0, sizeof(attr));
    attr.size = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    result0 = OH_AVBuffer_SetBufferAttr(buffer, &attr);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_PushInputBuffer(codec, index);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryOutputBuffer(codec, nullptr, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}

/**
 * @tc.name   NULL_CHECK_023
 * @tc.number NULL_CHECK_023
 * @tc.desc   OH_AudioCodec_GetOutputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(NullCheckTest, NULL_CHECK_023, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat* format = nullptr;
    OH_AVBuffer* buffer = nullptr;
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t syncMode = 1;
    int64_t timeoutUs = 2000000;
    uint32_t index = 0;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    format = OH_AVFormat_Create();
    result0 = audioBufferEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, syncMode);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_OK);
    buffer = OH_AudioCodec_GetInputBuffer(codec, index);
    ASSERT_NE(buffer, nullptr);
    OH_AVCodecBufferAttr attr;
    memset_s(&attr, sizeof(attr), 0, sizeof(attr));
    attr.size = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    result0 = OH_AVBuffer_SetBufferAttr(buffer, &attr);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_PushInputBuffer(codec, index);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = OH_AudioCodec_QueryOutputBuffer(codec, &index, timeoutUs);
    ASSERT_EQ(result0, AV_ERR_OK);
    buffer = OH_AudioCodec_GetOutputBuffer(nullptr, index);
    ASSERT_EQ(buffer, nullptr);
    result0 = OH_AudioCodec_Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    codec = nullptr;
    delete audioBufferEncDemo;
}