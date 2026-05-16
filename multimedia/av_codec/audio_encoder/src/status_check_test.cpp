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
class StatusCheckTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void StatusCheckTest::SetUpTestCase() {}
void StatusCheckTest::TearDownTestCase() {}
void StatusCheckTest::SetUp() {}
void StatusCheckTest::TearDown() {}

} // namespace

/**
 * @tc.name   STATUS_CHECK_001
 * @tc.number STATUS_CHECK_001
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_002
 * @tc.number STATUS_CHECK_002
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_003
 * @tc.number STATUS_CHECK_003
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_004
 * @tc.number STATUS_CHECK_004
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_005
 * @tc.number STATUS_CHECK_005
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_005, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_006
 * @tc.number STATUS_CHECK_006
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_006, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_007
 * @tc.number STATUS_CHECK_007
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_008
 * @tc.number STATUS_CHECK_008
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_008, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_009
 * @tc.number STATUS_CHECK_009
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_009, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_010
 * @tc.number STATUS_CHECK_010
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_010, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_011
 * @tc.number STATUS_CHECK_011
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_011, TestSize.Level2)
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
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_012
 * @tc.number STATUS_CHECK_012
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_012, TestSize.Level2)
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
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_013
 * @tc.number STATUS_CHECK_013
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_013, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_014
 * @tc.number STATUS_CHECK_014
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_014, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_015
 * @tc.number STATUS_CHECK_015
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_015, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_016
 * @tc.number STATUS_CHECK_016
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_016, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_017
 * @tc.number STATUS_CHECK_017
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_017, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_018
 * @tc.number STATUS_CHECK_018
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_018, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_019
 * @tc.number STATUS_CHECK_019
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_019, TestSize.Level2)
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
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_020
 * @tc.number STATUS_CHECK_020
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_020, TestSize.Level2)
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
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_021
 * @tc.number STATUS_CHECK_021
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_021, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_022
 * @tc.number STATUS_CHECK_022
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_022, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_023
 * @tc.number STATUS_CHECK_023
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_023, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_024
 * @tc.number STATUS_CHECK_024
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_024, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_025
 * @tc.number STATUS_CHECK_025
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_025, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_026
 * @tc.number STATUS_CHECK_026
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_026, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_027
 * @tc.number STATUS_CHECK_027
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_027, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_028
 * @tc.number STATUS_CHECK_028
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_028, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_029
 * @tc.number STATUS_CHECK_029
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_029, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_030
 * @tc.number STATUS_CHECK_030
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_030, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_031
 * @tc.number STATUS_CHECK_031
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_031, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_032
 * @tc.number STATUS_CHECK_032
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_032, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_033
 * @tc.number STATUS_CHECK_033
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_033, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_034
 * @tc.number STATUS_CHECK_034
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_034, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_035
 * @tc.number STATUS_CHECK_035
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_035, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_036
 * @tc.number STATUS_CHECK_036
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_036, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_037
 * @tc.number STATUS_CHECK_037
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_037, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_038
 * @tc.number STATUS_CHECK_038
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_038, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_039
 * @tc.number STATUS_CHECK_039
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_039, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_040
 * @tc.number STATUS_CHECK_040
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_040, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_041
 * @tc.number STATUS_CHECK_041
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_041, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_042
 * @tc.number STATUS_CHECK_042
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_042, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_043
 * @tc.number STATUS_CHECK_043
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_043, TestSize.Level2)
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
    uint32_t index;
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_044
 * @tc.number STATUS_CHECK_044
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_044, TestSize.Level2)
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
    uint32_t index;
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_045
 * @tc.number STATUS_CHECK_045
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_045, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_046
 * @tc.number STATUS_CHECK_046
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_046, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_047
 * @tc.number STATUS_CHECK_047
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_047, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_048
 * @tc.number STATUS_CHECK_048
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_048, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_049
 * @tc.number STATUS_CHECK_049
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_049, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_050
 * @tc.number STATUS_CHECK_050
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_050, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_051
 * @tc.number STATUS_CHECK_051
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_051, TestSize.Level2)
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
    uint32_t index;
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_052
 * @tc.number STATUS_CHECK_052
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_052, TestSize.Level2)
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
    uint32_t index;
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_053
 * @tc.number STATUS_CHECK_053
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_053, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_054
 * @tc.number STATUS_CHECK_054
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_054, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_055
 * @tc.number STATUS_CHECK_055
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_055, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_056
 * @tc.number STATUS_CHECK_056
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_056, TestSize.Level2)
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
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_057
 * @tc.number STATUS_CHECK_057
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_057, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1; //channel1
    int32_t sampleRate = 8000;  // 8000hz
    int64_t bitRate = 64000; //64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Configure(codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit,
                                               complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_058
 * @tc.number STATUS_CHECK_058
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_058, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_059
 * @tc.number STATUS_CHECK_059
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_059, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_060
 * @tc.number STATUS_CHECK_060
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_060, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_061
 * @tc.number STATUS_CHECK_061
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_061, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_062
 * @tc.number STATUS_CHECK_062
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_062, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_063
 * @tc.number STATUS_CHECK_063
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_063, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
}

/**
 * @tc.name   STATUS_CHECK_064
 * @tc.number STATUS_CHECK_064
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_064, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo *audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
}
