/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <iostream>
#include <atomic>
#include <fstream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "gtest/gtest.h"
#include "videodec_ndk_sample.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class HwdecStateNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);

protected:
    const ::testing::TestInfo *testInfo_ = nullptr;
    bool createCodecSuccess_ = false;
    OH_AVCapability *cap = nullptr;
};

void HwdecStateNdkTest::SetUpTestCase(void) {}

void HwdecStateNdkTest::TearDownTestCase(void) {}

VDecNdkSample *vDecSample = NULL;

void HwdecStateNdkTest::SetUp(void)
{
    vDecSample = new VDecNdkSample();
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    string codeName = OH_AVCapability_GetName(cap);
    cout << "codeName: " << codeName << endl;
    int32_t ret = vDecSample->CreateVideoDecoder(codeName);
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->INP_DIR = "/data/test/media/1920_1080_10_30Mb.h264";
}

void HwdecStateNdkTest::TearDown(void)
{
    vDecSample->Release();
    delete vDecSample;
    vDecSample = nullptr;
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.name   VIDEO_HWDEC_STATE_0100
 * @tc.number VIDEO_HWDEC_STATE_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0100, TestSize.Level2)
{
    int32_t ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0101
 * @tc.number VIDEO_HWDEC_STATE_0101
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0101, TestSize.Level2)
{
    int32_t ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0200
 * @tc.number VIDEO_HWDEC_STATE_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0200, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0300
 * @tc.number VIDEO_HWDEC_STATE_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0300, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0400
 * @tc.number VIDEO_HWDEC_STATE_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0400, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0500
 * @tc.number VIDEO_HWDEC_STATE_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0500, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0600
 * @tc.number VIDEO_HWDEC_STATE_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0600, TestSize.Level2)
{
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    int32_t ret = vDecSample->StartVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0700
 * @tc.number VIDEO_HWDEC_STATE_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0700, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0800
 * @tc.number VIDEO_HWDEC_STATE_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0800, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0900
 * @tc.number VIDEO_HWDEC_STATE_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_0900, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1000
 * @tc.number VIDEO_HWDEC_STATE_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1000, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1100
 * @tc.number VIDEO_HWDEC_STATE_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1100, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1200
 * @tc.number VIDEO_HWDEC_STATE_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1200, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1300
 * @tc.number VIDEO_HWDEC_STATE_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1300, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1400
 * @tc.number VIDEO_HWDEC_STATE_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1400, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1500
 * @tc.number VIDEO_HWDEC_STATE_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1500, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1600
 * @tc.number VIDEO_HWDEC_STATE_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1600, TestSize.Level2)
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1700
 * @tc.number VIDEO_HWDEC_STATE_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1700, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1800
 * @tc.number VIDEO_HWDEC_STATE_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1800, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->state_EOS();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1900
 * @tc.number VIDEO_HWDEC_STATE_1900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_1900, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2000
 * @tc.number VIDEO_HWDEC_STATE_2000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2000, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2100
 * @tc.number VIDEO_HWDEC_STATE_2100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2100, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2200
 * @tc.number VIDEO_HWDEC_STATE_2200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2200, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "set callback" << endl;
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2300
 * @tc.number VIDEO_HWDEC_STATE_2300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2300, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2400
 * @tc.number VIDEO_HWDEC_STATE_2400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2400, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2500
 * @tc.number VIDEO_HWDEC_STATE_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2500, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2600
 * @tc.number VIDEO_HWDEC_STATE_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2600, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2700
 * @tc.number VIDEO_HWDEC_STATE_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2700, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2800
 * @tc.number VIDEO_HWDEC_STATE_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2800, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2900
 * @tc.number VIDEO_HWDEC_STATE_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_2900, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3000
 * @tc.number VIDEO_HWDEC_STATE_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3000, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3100
 * @tc.number VIDEO_HWDEC_STATE_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3100, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3200
 * @tc.number VIDEO_HWDEC_STATE_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3200, TestSize.Level2)
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3300
 * @tc.number VIDEO_HWDEC_STATE_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3300, TestSize.Level2)
{
    int32_t ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3400
 * @tc.number VIDEO_HWDEC_STATE_3400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3400, TestSize.Level2)
{
    int32_t ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3500
 * @tc.number VIDEO_HWDEC_STATE_3500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3500, TestSize.Level1)
{
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3600
 * @tc.number VIDEO_HWDEC_STATE_3600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3600, TestSize.Level1)
{
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3700
 * @tc.number VIDEO_HWDEC_STATE_3700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3700, TestSize.Level1)
{
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3800
 * @tc.number VIDEO_HWDEC_STATE_3800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3800, TestSize.Level1)
{
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3900
 * @tc.number VIDEO_HWDEC_STATE_3900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_3900, TestSize.Level1)
{
    vDecSample->SF_OUTPUT = true;
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4000
 * @tc.number VIDEO_HWDEC_STATE_4000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_4000, TestSize.Level1)
{
    vDecSample->SF_OUTPUT = true;
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4100
 * @tc.number VIDEO_HWDEC_STATE_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_4100, TestSize.Level1)
{
    vDecSample->SF_OUTPUT = true;
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4200
 * @tc.number VIDEO_HWDEC_STATE_4200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecStateNdkTest, VIDEO_HWDEC_STATE_4200, TestSize.Level1)
{
    vDecSample->SF_OUTPUT = true;
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
}
} // namespace