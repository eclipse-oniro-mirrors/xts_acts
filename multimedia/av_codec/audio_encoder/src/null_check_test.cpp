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
 * @tc.number    : NULL_CHECK_001
 * @tc.name      : CreateByMime - mime null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_002
 * @tc.name      : CreateByName - mime null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_003
 * @tc.name      : Destroy - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_004
 * @tc.name      : SetCallback - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_005
 * @tc.name      : Configure - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_006
 * @tc.name      : Configure - format null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_007
 * @tc.name      : Prepare - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_008
 * @tc.name      : Start - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_009
 * @tc.name      : Stop - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_010
 * @tc.name      : Flush - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_011
 * @tc.name      : Reset - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_012
 * @tc.name      : GetOutputDescription - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_013
 * @tc.name      : PushInputData - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_014
 * @tc.name      : PushInputDataEOS - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_015
 * @tc.name      : FreeOutputData - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_016
 * @tc.name      : IsValid - codec null check
 * @tc.desc      : null check test
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
 * @tc.number    : NULL_CHECK_017
 * @tc.name      : IsValid - isValid null check
 * @tc.desc      : null check test
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
