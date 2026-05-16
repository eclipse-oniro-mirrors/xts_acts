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
#include <string>
#include <limits>
#include <unistd.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include "include/VideoencApi11Sample.h"
#include "include/CommonToolTest.h"
#include "include/RoiFuncTest.h"
#include "include/BframeFuncTest.h"
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsHevchwEncoderTestTag"

namespace {
OH_AVCodec *g_venc = nullptr;
OH_AVCapability *g_capHevc = nullptr;
OH_AVCapability *g_cap = nullptr;
const char *OUT_DIR = "/data/storage/el2/base/files/VIDEO_ENCODE_FILE_ROI.h265";
const char *CODEC_NAME = "";
const char *CODEC_HEVC = "";
constexpr int32_t SQR = 3; // CQ mode
constexpr uint32_t DEFAULT_WIDTH_1920 = 1920;
constexpr uint32_t DEFAULT_WIDTH_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1920 = 1920;
} // namespace

namespace OHOS {
namespace Media {
class HwEncFuncRoiTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    static const char *INP_DIR_1920_30;
};


const char *INP_DIR_1920_30 = "/data/storage/el2/base/files/1920_1080_nv21.yuv";

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace RoiFuncTest {
void SetUpTestCase()
{
    g_cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (g_cap != nullptr) {
        CODEC_NAME = OH_AVCapability_GetName(g_cap);
        cout << "codecname: " << CODEC_NAME << endl;
    }
    g_capHevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (g_capHevc != nullptr) {
        CODEC_HEVC = OH_AVCapability_GetName(g_capHevc);
        cout << "codecname_hevc: " << CODEC_HEVC << endl;
    }
}
void TearDown()
{
    if (g_venc != NULL) {
        OH_VideoEncoder_Destroy(g_venc);
        g_venc = nullptr;
    }
    g_flagValue = true;
}
} // RoiFuncTest

int VIDEO_HW_ENCODE_ROI_FUNC_001()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920; //1920
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080; //1080
    vEncSample->roiInfo = "10,10-100,100=-8;100,1-200,200=-4;"
                      "300,350-430,440=-4;510,540-650,690=-4;"
                      "700,710-820,1000=-4";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1920_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_002()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920; //1920
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080; //1080
    vEncSample->roiInfo = "440,1272-1080,1920=-51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->inpDir = INP_DIR_1920_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_003()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;350,300-400,430=-4;540,510-690,650=51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_004()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_005()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920; //1920
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080; //1080
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1920_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_006()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "10,10-100,100=-8;100,10-200,200=-4;"
                        "300,350-430,440=-4;510,540-650,690=-4;"
                        "700,710-800,1000=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->enableSeekEos = true;
    vEncSample->enableRepeat = true;
    vEncSample->setMaxCount = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_007()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "400,1272-1080,1920=-51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->enableSeekEos = true;
    vEncSample->enableRepeat = true;
    vEncSample->setMaxCount = true;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_008()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;"
                        "350,300-400,430=-4;540,510-690,750=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->enableSeekEos = true;
    vEncSample->enableRepeat = true;
    vEncSample->setMaxCount = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_009()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->enableSeekEos = true;
    vEncSample->enableRepeat = true;
    vEncSample->setMaxCount = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

int VIDEO_HW_ENCODE_ROI_FUNC_010()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080; //1080
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920; //1920
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->surfInput = true;
    vEncSample->enableRoi = true;
    vEncSample->enableSeekEos = true;
    vEncSample->enableRepeat = true;
    vEncSample->setMaxCount = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_HEVC));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
} // namespace Media
} // namespace OHOS