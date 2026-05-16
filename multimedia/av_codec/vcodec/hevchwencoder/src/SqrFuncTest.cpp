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
OH_AVCodec *gVenc = nullptr;
OH_AVCapability* gCap = nullptr;
OH_AVCapability* g_capEnc = nullptr;
const char* CODEC_NAME = "";
const char* OUT_DIR = "/data/test/media/videoEncodeFileRoi.h265";
} // namespace

namespace OHOS {
namespace Media {
class HwEncFuncSqrTest : public testing::Test {
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
};

void HwEncFuncSqrTest::SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "codecname: " << CODEC_NAME << endl;
}
void HwEncFuncSqrTest::TearDownTestCase() {}
void HwEncFuncSqrTest::SetUp() {}
void HwEncFuncSqrTest::TearDown()
{
    if (gVenc != nullptr) {
        OH_VideoEncoder_Destroy(gVenc);
        gVenc = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_001
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_001, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = VBR;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->DEFAULT_MAX_BITRATE = 20000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_002
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_002, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE = 20000000;
    vEncSample->DEFAULT_MAX_BITRATE = 20000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_003
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_003, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_004
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_004, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->MODE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_005
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_005, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_006
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_006, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_007
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_007, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_008
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_008, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 100;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_009
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_009, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->QUALITY_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_MAX_BITRATE = 150000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_QUALITY = 28;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_010
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_010, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    gCap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *codecNameAvc = OH_AVCapability_GetName(gCap);
    cout << "codecNameAvc: " << codecNameAvc << endl;
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->DEFAULT_MAX_BITRATE = 50000000;
    vEncSample->DEFAULT_SQR_FACTOR = 30;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameAvc));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_011
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_011
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_011, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_012
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_012
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_012, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->MODE_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_013
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_013
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_013, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.name   VIDEO_HW_ENCODE_SQR_FUNC_014
 * @tc.number VIDEO_HW_ENCODE_SQR_FUNC_014
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFuncSqrTest, VIDEO_HW_ENCODE_SQR_FUNC_014, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SETBIRATE = true;
    vEncSample->SURF_INPUT = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->DEFAULT_BITRATE = 10000000;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}
} // namespace