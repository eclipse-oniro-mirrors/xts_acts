/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <iostream>
#include <cstdio>
#include <string>

#include "gtest/gtest.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"
#include "native_avcodec_videoencoder.h"
#include "VideoencApi11Sample.h"
#include "native_avcapability.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace {
OH_AVCodec* gVenc = nullptr;
OH_AVCapability* g_capEnc = nullptr;
const char* CODEC_NAME = "";
OH_AVFormat* gFormat = nullptr;
} // namespace

namespace OHOS {
namespace Media {
class HwEncBFuncTest : public testing::Test {
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
    const char* INP_DIR_1080_30 = "/data/test/media/1080_1920_nv12.yuv";
    const char* INP_DIR_720_30 = "/data/test/media/1280_720_yuv420p_01.yuv";
};

void HwEncBFuncTest::SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "g_codecname: " << CODEC_NAME << endl;
}
void HwEncBFuncTest::TearDownTestCase() {}
void HwEncBFuncTest::SetUp() {}
void HwEncBFuncTest::TearDown()
{
    if (gVenc != NULL) {
        OH_VideoEncoder_Destroy(gVenc);
        gVenc = nullptr;
    }
    if (gFormat != nullptr) {
        OH_AVFormat_Destroy(gFormat);
        gFormat = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_001
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_001
 * @tc.desc   test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_001, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_YUV420_01.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->B_ENABLE = true;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->DEFAULT_BFRAME = 0;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->INP_DIR = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_002
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_002, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_YUV420_02.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->B_ENABLE = true;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->DEFAULT_BFRAME = 1;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->INP_DIR = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_003
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_003, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->OUT_DIR = "/data/test/media/1280_720_YUV420_03.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->B_ENABLE = true;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->DEFAULT_BFRAME = 0;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->INP_DIR = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_004
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_004, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_03.h265";
    vEncSample->SURF_INPUT = true;
    vEncSample->B_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_BFRAME = 1;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_005
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_005, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_03.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->B_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_BFRAME = -1;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_B_FUNC_006
 * @tc.number VIDEO_HW_ENCODE_B_FUNC_006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncBFuncTest, VIDEO_HW_ENCODE_B_FUNC_006, TestSize.Level2)
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_04.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->B_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_BFRAME = 100;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    ASSERT_NE(NULL, gFormat);
    int32_t ret_1 = vEncSample->GetBframes(gFormat);
    ASSERT_GT(ret_1, 0);
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}
} // namespace