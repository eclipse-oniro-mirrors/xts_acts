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
} // namespace

namespace OHOS {
namespace Media {
class HwEncApiNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

void HwEncApiNdkTest::SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "CODEC_NAME: " << CODEC_NAME << endl;
}
void HwEncApiNdkTest::TearDownTestCase() {}
void HwEncApiNdkTest::SetUp() {}
void HwEncApiNdkTest::TearDown()
{
    if (gVenc != NULL) {
        OH_VideoEncoder_Destroy(gVenc);
        gVenc = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_001
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_001
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_001, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_01_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_002
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_002
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_002, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_04_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_003
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_003
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_003, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_07_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_004
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_004
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_004, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_01_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_005
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_005
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_005, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_04_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_PTS_FUNC_006
 * @tc.name      : VIDEO_HW_ENCODE_PTS_FUNC_006
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_HW_ENCODE_PTS_FUNC_006, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/test/media/xtscase_07_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->MAXBITE_ENABLE = true;
    vEncSample->INP_DIR = input;
    vEncSample->OUT_DIR = output;
    vEncSample->DEFAULT_WIDTH = width;
    vEncSample->DEFAULT_HEIGHT = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->DEFAULT_MAX_BITRATE = bitRate;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = surfaceMode;
    vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 2000;
    vEncSample->enablePTSBasedRateControl = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}
} // namespace