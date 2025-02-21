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
#include <string>

#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "videoenc_ndk_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t DEFAULT_QUALITY = 30;
constexpr uint32_t MAX_PROFILE_NUM = 3;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
const char *INP_DIR_720 = "/data/test/media/1280_720_nv.yuv";
constexpr uint32_t SECOND = 1000;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t MAX_QUALITY = 100;
} // namespace
namespace OHOS {
namespace Media {
class HwEncFuncNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

void HwEncFuncNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (memcpy_s(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (memcpy_s(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
void HwEncFuncNdkTest::TearDownTestCase() {}
void HwEncFuncNdkTest::SetUp() {}
void HwEncFuncNdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}
namespace {
/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0100
 * @tc.name      : create by mime
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0100, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0200
 * @tc.name      : create by name
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0200, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0300
 * @tc.name      : create no exist encoder
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0300, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByName("aabbccdd");
    ASSERT_EQ(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0400
 * @tc.name      : test encode buffer
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0400, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0500
 * @tc.name      : test encode surface
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0500, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0600
 * @tc.name      : set force IDR when encoding
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0600, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->enableForceIDR = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0700
 * @tc.name      : set color format
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0700, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 1));
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709));
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_LINEAR));
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_YCGCO));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0800
 * @tc.name      : set key frame interval
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0800, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, SECOND));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_VideoEncoder_Destroy(venc_);
    OH_AVFormat_Destroy(format);

    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, -1));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));

    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, 0));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_0900
 * @tc.name      : set profile level
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_0900, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_BASELINE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Destroy(venc_);

    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_HIGH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Destroy(venc_);

    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Destroy(venc_);

    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN + AVC_PROFILE_MAIN);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1000
 * @tc.name      : set bitrate mode
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1000, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();

    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1100
 * @tc.name      : set bitrate value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1100, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR));
    ASSERT_EQ(true, OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, 1000000));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1400
 * @tc.name      : set framerate
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1400, TestSize.Level1)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();

    ASSERT_EQ(true, OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, 60));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1600
 * @tc.name      : set quality
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1600, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ));
        ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, 60));
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1700
 * @tc.name      : input frame after EOS
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1700, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->enable_random_eos = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1800
 * @tc.name      : encode h265 buffer
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1800, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1800
 * @tc.name      : encode RGBA h265 buffer mode
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_2000, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = "/data/test/media/test.rgba";
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_FUNCTION_1900
 * @tc.name      : encode h265 surface
 * @tc.desc      : function test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_FUNCTION_1900, TestSize.Level1)
{
    auto vEncSample = make_unique<VEncNdkSample>();
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->DEFAULT_WIDTH = 1280;
    vEncSample->DEFAULT_HEIGHT = 720;
    vEncSample->DEFAULT_FRAME_RATE = 30;
    vEncSample->SURF_INPUT = true;
    ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
    ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0100
 * @tc.name      : OH_AVCodec_GetCapability para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0100, TestSize.Level2)
{
    const char *p = nullptr;
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability(p, true));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0200
 * @tc.name      : OH_AVCodec_GetCapability para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0200, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability("", true));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0300
 * @tc.name      : OH_AVCodec_GetCapability para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0300, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability("notexist", true));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0400
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0400, TestSize.Level2)
{
    ASSERT_NE(nullptr, OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0500
 * @tc.name      : OH_AVCodec_GetCapabilityByCategory para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0500, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory("", true, HARDWARE));
}
/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_9900
 * @tc.name      : OH_AVCodec_GetCapabilityByCategory para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_9900, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory(nullptr, true, HARDWARE));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0600
 * @tc.name      : OH_AVCodec_GetCapabilityByCategory para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0600, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory("notexist", true, HARDWARE));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0700
 * @tc.name      : OH_AVCodec_GetCapabilityByCategory param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0700, TestSize.Level2)
{
    ASSERT_NE(nullptr, OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0800
 * @tc.name      : OH_AVCapability_IsHardware param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0800, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_IsHardware(nullptr));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_0900
 * @tc.name      : OH_AVCapability_IsHardware param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_0900, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsHardware(capability));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1000
 * @tc.name      : OH_AVCapability_GetName param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1000, TestSize.Level2)
{
    const char *name = OH_AVCapability_GetName(nullptr);
    ASSERT_NE(name, nullptr);
    ASSERT_EQ(strlen(name), 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1100
 * @tc.name      : OH_AVCapability_GetName param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1100, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    const char *name = OH_AVCapability_GetName(capability);
    ASSERT_NE(name, nullptr);
    ASSERT_GT(strlen(name), 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1200
 * @tc.name      : OH_AVCapability_GetMaxSupportedInstances param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1200, TestSize.Level2)
{
    int32_t maxSupportedInstance = OH_AVCapability_GetMaxSupportedInstances(nullptr);
    ASSERT_EQ(maxSupportedInstance, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1300
 * @tc.name      : OH_AVCapability_GetMaxSupportedInstances param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);

    string codecName = OH_AVCapability_GetName(capability);
    if (codecName == "OMX.hisi.video.encoder.avc") {
        ASSERT_EQ(16, OH_AVCapability_GetMaxSupportedInstances(capability));
    } else {
        ASSERT_EQ(4, OH_AVCapability_GetMaxSupportedInstances(capability));
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1400
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderBitrateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1500
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param error
 * @tc.desc      : api test
 */

HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;

    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);

    ret = OH_AVCapability_GetEncoderBitrateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1700
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderBitrateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "max val " << range.maxVal << "  min val " << range.minVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1800
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1800, TestSize.Level2)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(nullptr, BITRATE_MODE_CBR);
    ASSERT_EQ(false, isSupported);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_1900
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_1900, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, BITRATE_MODE_CBR);
    EXPECT_EQ(isSupported, true);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR);
    EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8400
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, BITRATE_MODE_VBR);
    EXPECT_EQ(isSupported, true);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
    EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8500
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8500, TestSize.Level2)
{
    OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capa);
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
        EXPECT_EQ(isSupported, true);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    } else {
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
        EXPECT_EQ(isSupported, false);
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8600
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8600, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ + BITRATE_MODE_CQ);
    EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2000
 * @tc.name      : OH_AVCapability_GetEncoderQualityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2100
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2200
 * @tc.name      : OH_AVCapability_GetEncoderQualityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderQualityRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2300
 * @tc.name      : OH_AVCapability_GetEncoderQualityRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderQualityRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(range.minVal, 0);
    ASSERT_EQ(range.maxVal, MAX_QUALITY);
}


/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2400
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2500
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2700
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderComplexityRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_2800
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_2800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderComplexityRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3100
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3200
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3300
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3400
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3500
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3600
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, &alignment);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3700
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3800
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_WIDTH, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_3900
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_3900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4000
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4100
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4200
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4300
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4400
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4500
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4600
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4700
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4800
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_4900
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_4900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5000
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_9800
 * @tc.name      : configure encoder with illegal width and height
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_9800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    memset_s(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    memset_s(&heightRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5100
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5100, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5200
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5200, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0));
}
/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5300
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5300, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5400
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5500
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5600
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5700
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5800
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_5900
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_5900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6000
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6100
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6200
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GT(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6300
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6400
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6500
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6500, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6600
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6600, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6700
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6700, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6800
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_6900
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_6900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7000
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7100
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    ASSERT_NE(nullptr, pixelFormat);
    ASSERT_GT(pixelFormatNum, 0);
    ASSERT_EQ(AV_ERR_OK, ret);
    for (int i = 0; i < pixelFormatNum; i++) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        EXPECT_GE(pixelFormat[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_AVFormat_Destroy(format);
        OH_VideoEncoder_Destroy(venc_);
    }
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
    ASSERT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7200
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7300
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7400
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7500
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, profiles);
    ASSERT_EQ(profileNum, MAX_PROFILE_NUM);
    for (int i = 0; i < profileNum; i++) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        EXPECT_GE(profiles[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profiles[i]);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (ret != AV_ERR_OK) {
            cout << profiles[i] << " profile cant configure" << endl;
        }
        EXPECT_EQ(AV_ERR_OK, ret);
        OH_AVFormat_Destroy(format);
        OH_VideoEncoder_Destroy(venc_);
    }
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN + AVC_PROFILE_MAIN);
    ASSERT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7600
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7700
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7800
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, nullptr, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_7900
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_7900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, &levels, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8000
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, levels);
    ASSERT_GT(levelNum, 0);
    for (int i = 0; i < levelNum; i++) {
        ASSERT_GE(levels[i], 0);
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8100
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8100, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8200
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8200, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(capability, 1, 1));
}

/**
 * @tc.number    : VIDEO_ENCODE_CAPABILITY_8300
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_CAPABILITY_8300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_BASELINE, 1));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0100
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0100, TestSize.Level2)
{
    ASSERT_NE(nullptr, OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0200
 * @tc.name      : OH_AVCodec_GetCapabilityByCategory param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0200, TestSize.Level2)
{
    ASSERT_NE(nullptr, OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0300
 * @tc.name      : OH_AVCapability_IsHardware param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsHardware(capability));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0400
 * @tc.name      : OH_AVCapability_GetName param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    const char *name = OH_AVCapability_GetName(capability);
    ASSERT_NE(name, nullptr);
    ASSERT_GT(strlen(name), 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0500
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param error
 * @tc.desc      : api test
 */

HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;

    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);

    ret = OH_AVCapability_GetEncoderBitrateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0600
 * @tc.name      : OH_AVCapability_GetEncoderBitrateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderBitrateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "max val " << range.maxVal << "  min val " << range.minVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_07
 * 00
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0700, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, BITRATE_MODE_CBR);
    EXPECT_EQ(isSupported, true);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR);
    EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5200
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5200, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, BITRATE_MODE_VBR);
    EXPECT_EQ(isSupported, true);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
    EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5300
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5300, TestSize.Level2)
{
    OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capa);
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
        EXPECT_EQ(isSupported, true);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    } else {
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
        EXPECT_EQ(isSupported, false);
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5400
 * @tc.name      : OH_AVCapability_IsEncoderBitrateModeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ + BITRATE_MODE_CQ);
    EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0800
 * @tc.name      : OH_AVCapability_GetEncoderQualityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderQualityRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_0900
 * @tc.name      : OH_AVCapability_GetEncoderQualityRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_0900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderQualityRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(range.minVal, 0);
    ASSERT_EQ(range.maxVal, MAX_QUALITY);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1000
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderComplexityRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1100
 * @tc.name      : OH_AVCapability_GetEncoderComplexityRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetEncoderComplexityRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1200
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}


/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1300
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1400
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1500
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, &alignment);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1600
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_WIDTH, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1700
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1800
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_1900
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_1900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2000
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2100
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2200
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2300
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2400
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2500
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2600
 * @tc.name      : configure encoder with illegal width and height
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    memset_s(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    memset_s(&heightRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(heightRange.minVal, 0);
    ASSERT_GT(heightRange.maxVal, 0);
    ASSERT_GE(widthRange.minVal, 0);
    ASSERT_GT(widthRange.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2700
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2700, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2800
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2800, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_2900
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_2900, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3000
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3100
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3200
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3300
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3400
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3500
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GT(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3600
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3600, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3700
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3700, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3800
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3800, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_3900
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3900, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4000
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4100
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4200
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    ASSERT_NE(nullptr, pixelFormat);
    ASSERT_GT(pixelFormatNum, 0);
    ASSERT_EQ(AV_ERR_OK, ret);
    for (int i = 0; i < pixelFormatNum; i++) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        ASSERT_GE(pixelFormat[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_AVFormat_Destroy(format);
        OH_VideoEncoder_Destroy(venc_);
    }
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
    EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4300
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4400
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4500
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, profiles);
    ASSERT_GT(profileNum, 0);
    for (int i = 0; i < profileNum; i++) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        EXPECT_GE(profiles[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profiles[i]);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (ret != AV_ERR_OK) {
            cout << profiles[i] << " profile cant configure" << endl;
        }
        EXPECT_EQ(AV_ERR_OK, ret);
        OH_AVFormat_Destroy(format);
        OH_VideoEncoder_Destroy(venc_);
    }
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    int32_t illegalProfile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + HEVC_PROFILE_MAIN_10_HDR10_PLUS;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, illegalProfile);
    ret = OH_VideoEncoder_Configure(venc_, format);
    ASSERT_NE(AV_ERR_OK, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4600
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t **levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4700
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, nullptr, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4800
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_4900
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, levels);
    ASSERT_GT(levelNum, 0);
    for (int i = 0; i < levelNum; i++) {
        ASSERT_GE(levels[i], 0);
    }
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5000
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5000, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t profile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + 1;
    int32_t level = HEVC_LEVEL_62 + 1;
    ASSERT_NE(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profile, level));
}

/**
 * @tc.number    : VIDEO_ENCODE_HEVC_CAPABILITY_5100
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwEncFuncNdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5100, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, HEVC_PROFILE_MAIN, 1));
}
} // namespace