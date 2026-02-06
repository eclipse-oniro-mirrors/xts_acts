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
#include <string>
#include <limits>
#include "meta/format.h"
#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "VideoencApi11Sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "avcodec_info.h"
#include "avcodec_list.h"
#include "avcodec_common.h"

namespace {
OH_AVCodec *gVenc = nullptr;
OH_AVCapability *g_capHevc = nullptr;
OH_AVCapability *gCap = nullptr;
const char *OUT_DIR = "/data/test/media/VIDEO_ENCODE_FILE_ROI.h265";
const char *CODEC_NAME = "";
const char *CODEC_HEVC = "";
} // namespace
namespace OHOS {
namespace Media {
class HwEncFuncRoiTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    const char *INP_DIR_1920_30 = "/data/test/media/1920_1080_nv21.yuv";
    const char *INP_DIR_1080_30 = "/data/test/media/1080_1920_nv12.yuv";
};
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

void HwEncFuncRoiTest::SetUpTestCase()
{
    gCap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(gCap);
    cout << "codecname: " << CODEC_NAME << endl;
    g_capHevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_HEVC = OH_AVCapability_GetName(g_capHevc);
    cout << "codecname_hevc: " << CODEC_HEVC << endl;
}
void HwEncFuncRoiTest::TearDownTestCase() {}
void HwEncFuncRoiTest::SetUp() {}
void HwEncFuncRoiTest::TearDown()
{
    if (gVenc != NULL) {
        OH_VideoEncoder_Destroy(gVenc);
        gVenc = nullptr;
    }
}
namespace {
/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_001
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_001
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_001, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1080;
    vEncSample->roiInfo = "10,10-100,100=-8;100,1-200,200=-4;"
                      "300,350-430,440=-4;510,54050,690=-4;"
                      "700,710-820,1000=-4";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->INP_DIR = INP_DIR_1920_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_002
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_002
 * _002
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_002, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1080;
    vEncSample->roiInfo = "440,1272-1080,1920=-51";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->DEFAULT_BITRATE_MODE = VBR;
    vEncSample->INP_DIR = INP_DIR_1920_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_003
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_003
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_003, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;350,300-400,430=-4;540,510-690,650=51";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

// /**
//  * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_004
//  * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_004
//  * @tc.desc      : function test
//  */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_004, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

// /**
//  * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_005
//  * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_005
//  * @tc.desc      : function test
//  */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_005, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1920;
    vEncSample->DEFAULT_HEIGHT = 1080;
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1920_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_006
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_006
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_006, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "10,10-100,100=-8;100,10-200,200=-4;"
                        "300,350-430,440=-4;510,540650,690=-4;"
                        "700,710-80,1000=-4";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_007
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_007
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_007, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "400,1272-1080,1920=-51";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = VBR;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_008
 * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_008
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_008, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;350,300-400,430=-4;540,510-690,650=51";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = CBR;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

// /**
//  * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_009
//  * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_009
//  * @tc.desc      : function test
//  */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_009, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

// /**
//  * @tc.number    : VIDEO_HW_ENCODE_ROI_FUNC_010
//  * @tc.name      : VIDEO_HW_ENCODE_ROI_FUNC_010
//  * @tc.desc      : function test
//  */
HWTEST_F(HwEncFuncRoiTest, VIDEO_HW_ENCODE_ROI_FUNC_010, TestSize.Level1)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->DEFAULT_WIDTH = 1080;
    vEncSample->DEFAULT_HEIGHT = 1920;
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->OUT_DIR = OUT_DIR;
    vEncSample->SURF_INPUT = true;
    vEncSample->DEFAULT_BITRATE_MODE = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->INP_DIR = INP_DIR_1080_30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}
} // namespace