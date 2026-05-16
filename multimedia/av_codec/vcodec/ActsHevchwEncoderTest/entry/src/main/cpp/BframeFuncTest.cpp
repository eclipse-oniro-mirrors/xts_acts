/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <iostream>
#include <cstdio>
#include <string>
#include "include/VideoencApi11Sample.h"
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "include/CommonToolTest.h"
#include "include/BframeFuncTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCodec* g_venc = nullptr;
OH_AVCapability* g_capEnc = nullptr;
const char* CODEC_NAME = "";
OH_AVFormat* gFormat = nullptr;
constexpr int32_t SQR = 3; // CQ mode
constexpr uint32_t DEFAULT_WIDTH_1280 = 1280;
constexpr uint32_t DEFAULT_HEIGHT_720 = 720;
constexpr uint32_t DEFAULT_WIDTH_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1920 = 1920;
constexpr uint32_t DEFAULT_BFRAME_AUTO = -1;
constexpr uint32_t DEFAULT_BFRAME_DISABLE = 0;
constexpr uint32_t DEFAULT_BFRAME_SINGLE = 1;
constexpr uint32_t DEFAULT_BFRAME_UNLIMITED = 100;
} // namespace

namespace OHOS {
namespace Media {
class HwEncBFuncTest {
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
    static const char* INP_DIR_720_30;
};

const char* INP_DIR_720_30 = "/data/storage/el2/base/files/1280_720_yuv420p_01.yuv";
const char* INP_DIR_1080_30 = "/data/storage/el2/base/files/1080_1920_nv12.yuv";

namespace  BframeFuncTest {
void SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "g_codecname: " << CODEC_NAME << endl;
}
void TearDown()
{
    if (g_venc != NULL) {
        OH_VideoEncoder_Destroy(g_venc);
        g_venc = nullptr;
    }
    if (gFormat != nullptr) {
        OH_AVFormat_Destroy(gFormat);
        gFormat = nullptr;
    }
}
} //BframeFuncTest

int VIDEO_HW_ENCODE_B_FUNC_001()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1280; //1280
    vEncSample->defaultHeight = DEFAULT_HEIGHT_720; //720
    vEncSample->outDir = "/data/storage/el2/base/files/1280_720_YUV420_01.h265";
    vEncSample->modeEnable = true;
    vEncSample->bEnable = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_DISABLE; //0
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->inpDir = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_B_FUNC_002()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1280; //1280
    vEncSample->defaultHeight = DEFAULT_HEIGHT_720; //720
    vEncSample->outDir = "/data/storage/el2/base/files/1280_720_YUV420_02.h265";
    vEncSample->modeEnable = true;
    vEncSample->bEnable = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_SINGLE; //1
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->inpDir = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_B_FUNC_003()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    if (!bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1280; //1280
    vEncSample->defaultHeight = DEFAULT_HEIGHT_720; //720
    vEncSample->outDir = "/data/storage/el2/base/files/1280_720_YUV420_03.h265";
    vEncSample->modeEnable = true;
    vEncSample->bEnable = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_DISABLE; //0
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_YUVI420;
    vEncSample->inpDir = INP_DIR_720_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_B_FUNC_004()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_03.h265";
    vEncSample->bEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_SINGLE; //1
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_B_FUNC_005()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_03.h265";
    vEncSample->modeEnable = true;
    vEncSample->bEnable = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_AUTO; //-1
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_B_FUNC_006()
{
    bool bsupport = OH_AVCapability_IsFeatureSupported(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported || !bsupport) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_04.h265";
    vEncSample->modeEnable = true;
    vEncSample->bEnable = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultBframe = DEFAULT_BFRAME_UNLIMITED; //100
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    gFormat = OH_AVCapability_GetFeatureProperties(g_capEnc, OH_AVCapabilityFeature::VIDEO_ENCODER_B_FRAME);
    EXPECT_NE(nullptr, gFormat);
    int32_t ret1 = vEncSample->GetBframes(gFormat);
    EXPECT_GT(ret1, 0);
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
} // namespace Media
} // namespace OHOS