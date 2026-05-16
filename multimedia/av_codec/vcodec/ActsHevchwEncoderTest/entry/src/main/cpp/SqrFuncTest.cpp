/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcapability.h>
#include "include/VideoencApi11Sample.h"
#include "include/CommonToolTest.h"
#include "include/BframeFuncTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCodec *g_venc = nullptr;
OH_AVCapability* g_cap = nullptr;
OH_AVCapability* g_capEnc = nullptr;
constexpr int32_t SQR = 3;  // SQR mode
const char* CODEC_NAME = "";
const char* OUT_DIR = "/data/storage/el2/base/files/videoEncodeFileRoi.h265";
constexpr int32_t DEFAULT_WIDTH_1080 = 1080;
constexpr int32_t DEFAULT_HEIGHT_1920 = 1920;
constexpr int64_t DEFAULT_BITRATE_10000000 = 10000000;
constexpr int64_t DEFAULT_BITRATE_20000000 = 20000000;
constexpr int64_t DEFAULT_MAX_BITRATE_20000000 = 20000000;
constexpr int64_t DEFAULT_MAX_BITRATE_50000000 = 50000000;
constexpr int64_t DEFAULT_MAX_BITRATE_100000000 = 100000000;
constexpr int64_t DEFAULT_MAX_BITRATE_150000000 = 150000000;
constexpr int32_t DEFAULT_SQR_FACTOR_30 = 30;
constexpr int32_t DEFAULT_SQR_FACTOR_32 = 32;
constexpr int32_t DEFAULT_SQR_FACTOR_100 = 100;
constexpr int32_t DEFAULT_QUALITY_28 = 28;
} // namespace

namespace OHOS {
namespace Media {
class HwEncFuncSqrTest {
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

namespace SqrFuncTest {
void SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "codecname: " << CODEC_NAME << endl;
}
void TearDown()
{
    if (g_venc != nullptr) {
        OH_VideoEncoder_Destroy(g_venc);
        g_venc = nullptr;
    }
}
} //SqrFuncTest

int VIDEO_HW_ENCODE_SQR_FUNC_001()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_20000000; //20000000
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_20000000; //20000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_002()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_20000000; //20000000
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_20000000; //20000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_003()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_100000000; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_004()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->modeEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_005()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->factorEnable = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_006()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_007()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_100000000; //100000000
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_008()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->factorEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_100000000; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_100; //100
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_009()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->factorEnable = true;
    vEncSample->qualityEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_150000000; //150000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultQuality = DEFAULT_QUALITY_28; //28
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_010()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    g_cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *codecNameAvc = OH_AVCapability_GetName(g_cap);
    cout << "codecNameAvc: " << codecNameAvc << endl;
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->factorEnable = true;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_50000000; //50000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_30; //30
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(codecNameAvc));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_011()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_100000000; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_012()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->modeEnable = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_013()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->factorEnable = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoderSqr());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_SQR_FUNC_014()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = OUT_DIR;
    vEncSample->setbirate = true;
    vEncSample->surfInput = true;
    vEncSample->modeEnable = true;
    vEncSample->defaultBitrate = DEFAULT_BITRATE_10000000; //10000000
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = OHOS::Media::INP_DIR_1080_30;
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