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
const char* CODEC_NAME = "";
OH_AVCapability* g_capEnc = nullptr;
OH_AVFormat* gFormat = nullptr;
} // namespace

namespace OHOS {
namespace Media {
class HwEncSqrFuncTest : public testing::Test {
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
    const char *INP_DIR_1080_30 = "/data/test/media/1080_1920_nv12.yuv";
};

void HwEncSqrFuncTest::SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "g_codecname: " << CODEC_NAME << endl;
}
void HwEncSqrFuncTest::TearDownTestCase() {}
void HwEncSqrFuncTest::SetUp() {}
void HwEncSqrFuncTest::TearDown()
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_001
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_001
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_001, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported)
    {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case01.h265";
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 1000000;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = 51;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_002
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_002
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_002, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case02.h265";
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 1000000;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = 51;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_003
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_003
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_003, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case03.h265";
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = 51;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_004
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_004
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_004, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case04.h265";
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 32;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 1000000;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_005
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_005
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_005, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case05.h265";
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR = 51;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 1000000;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = 1;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_006
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_006
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_006, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case06.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 4000000;vEncSample->DEFAULT_SQR_FACTOR_RUN = 28;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_007
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_007
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_007, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case07.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = -1;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_008
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_008
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_008, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case08.h265";
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 200000000;
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
 * @tc.number    : VIDEO_HW_ENCODE_FUNC_SQR_009
 * @tc.name      : VIDEO_HW_ENCODE_FUNC_SQR_009
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSqrFuncTest, VIDEO_HW_ENCODE_FUNC_SQR_009, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->OUT_DIR = "/data/test/media/1080_1920_nv12_buffer_case09.h265";
    vEncSample->QUALITY_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE = true;
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->MODE_ENABLE = true;
    vEncSample->enableParameter = true;
    vEncSample->MAXBITE_ENABLE_RUN = true;
    vEncSample->FACTOR_ENABLE_RUN = true;
    vEncSample->SETBIRATE_RUN = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_MAX_BITRATE = 4000000;
    vEncSample->DEFAULT_SQR_FACTOR = 28;
    vEncSample->DEFAULT_MAX_BITRATE_RUN = 10000000;
    vEncSample->DEFAULT_BITRATE_RUN = 100000000;
    vEncSample->DEFAULT_SQR_FACTOR_RUN = 23;
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