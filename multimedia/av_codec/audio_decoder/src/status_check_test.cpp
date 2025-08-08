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
 * @tc.number    : STATUS_CHECK_001
 * @tc.name      : Create -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_002
 * @tc.name      : Create -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_003
 * @tc.name      : Create -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_004
 * @tc.name      : Create -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_005
 * @tc.name      : Create -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_005, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_006
 * @tc.name      : Create -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_006, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_007
 * @tc.name      : Create -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_008
 * @tc.name      : Create -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_008, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_009
 * @tc.name      : Configure -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_009, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_010
 * @tc.name      : Configure -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_010, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_011
 * @tc.name      : Configure -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_011, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_012
 * @tc.name      : Configure -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_012, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_013
 * @tc.name      : Configure -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_013, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_014
 * @tc.name      : Configure -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_014, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_015
 * @tc.name      : Configure -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_015, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_016
 * @tc.name      : Configure -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_016, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_017
 * @tc.name      : Start -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_017, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_018
 * @tc.name      : Start -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_018, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_019
 * @tc.name      : Start -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_019, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_020
 * @tc.name      : Start -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_020, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_021
 * @tc.name      : Start -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_021, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_022
 * @tc.name      : Start -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_022, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_023
 * @tc.name      : Start -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_023, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_024
 * @tc.name      : Start -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_024, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_025
 * @tc.name      : Running -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_025, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_026
 * @tc.name      : Running -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_026, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_027
 * @tc.name      : Running -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_027, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_028
 * @tc.name      : Running -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_028, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_029
 * @tc.name      : Running -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_029, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_030
 * @tc.name      : Running -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_030, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_031
 * @tc.name      : Running -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_031, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_032
 * @tc.name      : Running -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_032, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_033
 * @tc.name      : EOS -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_033, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_034
 * @tc.name      : EOS -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_034, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_035
 * @tc.name      : EOS -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_035, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_036
 * @tc.name      : EOS -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_036, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_037
 * @tc.name      : EOS -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_037, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_038
 * @tc.name      : EOS -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_038, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_039
 * @tc.name      : EOS -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_039, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_040
 * @tc.name      : EOS -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_040, TestSize.Level2)
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_041
 * @tc.name      : Flush -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_041, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_042
 * @tc.name      : Flush -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_042, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_043
 * @tc.name      : Flush -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_043, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_044
 * @tc.name      : Flush -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_044, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_045
 * @tc.name      : Flush -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_045, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_046
 * @tc.name      : Flush -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_046, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_047
 * @tc.name      : Flush -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_047, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_048
 * @tc.name      : Flush -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_048, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_049
 * @tc.name      : Stop -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_049, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_050
 * @tc.name      : Stop -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_050, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_051
 * @tc.name      : Stop -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_051, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_052
 * @tc.name      : Stop -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_052, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_053
 * @tc.name      : Stop -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_053, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_054
 * @tc.name      : Stop -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_054, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_055
 * @tc.name      : Stop -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_055, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_056
 * @tc.name      : Stop -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_056, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_057
 * @tc.name      : Reset -> Configure
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_057, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000;  // 8000hz
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_058
 * @tc.name      : Reset -> Start
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_058, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_059
 * @tc.name      : Reset -> Running
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_059, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_060
 * @tc.name      : Reset -> EOS
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_060, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_061
 * @tc.name      : Reset -> Flush
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_061, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_062
 * @tc.name      : Reset -> Stop
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_062, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_063
 * @tc.name      : Reset -> Reset
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_063, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : STATUS_CHECK_064
 * @tc.name      : Reset -> Release
 * @tc.desc      : status check test
 */
HWTEST_F(StatusCheckTest, STATUS_CHECK_064, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}
