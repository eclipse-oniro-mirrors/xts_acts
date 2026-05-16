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
#include "include/PostSqrFuncTest.h"
#include "include/BframeFuncTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCodec* g_venc = nullptr;
const char* CODEC_NAME = "";
OH_AVCapability* g_capEnc = nullptr;
OH_AVFormat* gFormat = nullptr;
constexpr int32_t SQR = 3; // CQ mode
constexpr uint32_t DEFAULT_WIDTH_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1920 = 1920;
constexpr uint64_t DEFAULT_MAX_BITRATE = 100000000;
constexpr uint64_t DEFAULT_MAX_BITRATE_400000 = 4000000;
constexpr uint64_t DEFAULT_SQR_FACTOR_28 = 28;
constexpr uint32_t DEFAULT_SQR_FACTOR_32 = 32;
constexpr uint32_t DEFAULT_SQR_FACTOR_51 = 51;
constexpr uint64_t DEFAULT_BITRATE_RUN_100000000 = 100000000;
constexpr uint64_t DEFAULT_MAX_BITRATE_RUN = 1000000;
constexpr uint64_t DEFAULT_MAX_BITRATE_RUN_4000000 = 4000000;
constexpr uint64_t DEFAULT_MAX_BITRATE_RUN_10000000 = 10000000;
constexpr uint64_t DEFAULT_MAX_BITRATE_RUN_200000000 = 200000000;
constexpr uint64_t DEFAULT_SQR_FACTOR_RUN = -1;
constexpr uint64_t DEFAULT_SQR_FACTOR_RUN_1 = 1;
constexpr uint64_t DEFAULT_SQR_FACTOR_RUN_23 = 23;
constexpr uint64_t DEFAULT_SQR_FACTOR_RUN_28 = 28;
constexpr uint64_t DEFAULT_SQR_FACTOR_RUN_51 = 51;
} // namespace

namespace OHOS {
namespace Media {
class HwEncSqrFuncTest {
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

namespace PostSqrFuncTest {
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
} // PostSqrFuncTest

int VIDEO_HW_ENCODE_FUNC_SQR_001()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case01.h265";
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN; // 1000000
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_51; // 51
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

int VIDEO_HW_ENCODE_FUNC_SQR_002()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case02.h265";
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN; //1000000
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_51; //51
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

int VIDEO_HW_ENCODE_FUNC_SQR_003()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case03.h265";
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_51; //51
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

int VIDEO_HW_ENCODE_FUNC_SQR_004()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case04.h265";
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_32; //32
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN; //1000000
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

int VIDEO_HW_ENCODE_FUNC_SQR_005()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case05.h265";
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE; //100000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_51; //51
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN; //1000000
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_1; //1
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

int VIDEO_HW_ENCODE_FUNC_SQR_006()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case06.h265";
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN_4000000; //4000000
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_28; //28
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

int VIDEO_HW_ENCODE_FUNC_SQR_007()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case07.h265";
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->factorEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN; //-1
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

int VIDEO_HW_ENCODE_FUNC_SQR_008()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case08.h265";
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN_200000000; //200000000
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

int VIDEO_HW_ENCODE_FUNC_SQR_009()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->outDir = "/data/storage/el2/base/files/1080_1920_nv12_buffer_case09.h265";
    vEncSample->qualityEnableRun = true;
    vEncSample->factorEnable = true;
    vEncSample->maxbiteEnable = true;
    vEncSample->modeEnable = true;
    vEncSample->enableParameter = true;
    vEncSample->maxbiteEnableRun = true;
    vEncSample->factorEnableRun = true;
    vEncSample->setbirateRun = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->defaultMaxBitrate = DEFAULT_MAX_BITRATE_400000; //4000000
    vEncSample->defaultSqrFactor = DEFAULT_SQR_FACTOR_28; //20
    vEncSample->defaultMaxBitrateRun = DEFAULT_MAX_BITRATE_RUN_10000000; //10000000
    vEncSample->defaultBitrateRun = DEFAULT_BITRATE_RUN_100000000;       //100000000
    vEncSample->defaultSqrFactorRun = DEFAULT_SQR_FACTOR_RUN_23;
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