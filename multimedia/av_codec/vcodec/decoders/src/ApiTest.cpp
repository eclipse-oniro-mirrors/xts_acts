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

#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>

#include "gtest/gtest.h"
#include "VideoDecApi11SampleTest.h"
#include "native_avcodec_videodecoder.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "native_avcapability.h"

#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmemory.h"
#include <fcntl.h>

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

#define PIXFORMAT_NUM 3

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class DecApiNdkTest : public testing::Test {
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

uint32_t g_pixelFormatNum = 0;
const int32_t *g_pixelFormat = nullptr;
OH_AVCodec *vdec_ = NULL;
OH_AVCapability *cap = nullptr;
const string CODEC_NAME = "OH.Media.Codec.Decoder.Video.VC1";
const string CODEC_NAME_VP8 = "OH.Media.Codec.Decoder.Video.VP8";
const string CODEC_NAME_VP9 = "OH.Media.Codec.Decoder.Video.VP9";
const string CODEC_NAME_AV1 = "OH.Media.Codec.Decoder.Video.AV1";
const string CODEC_NAME_RV30 = "OH.Media.Codec.Decoder.Video.Rv30";
const string CODEC_NAME_RV40 = "OH.Media.Codec.Decoder.Video.Rv40";
const string CODEC_NAME_MJPEG = "OH.Media.Codec.Decoder.Video.MJPEG";
const string CODEC_NAME_MSVIDEO1 = "OH.Media.Codec.Decoder.Video.MSVIDEO1";
const string CODEC_NAME_RAWVIDEO = "OH.Media.Codec.Decoder.Video.RAWVIDEO";
const string CODEC_NAME_MPEG1 = "OH.Media.Codec.Decoder.Video.MPEG";
const string CODEC_NAME_WVC1 = "OH.Media.Codec.Decoder.Video.WVC1";
const string CODEC_NAME_WMV3 = "OH.Media.Codec.Decoder.Video.WMV3";
const string CODEC_NAME_DVVIDEO = "OH.Media.Codec.Decoder.Video.DVVIDEO";
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
OH_AVFormat *format;

static bool CheckPixelFormat(int32_t pixformat)
{
    if (pixformat == AV_PIXEL_FORMAT_YUVI420 ||
        pixformat == AV_PIXEL_FORMAT_NV12 ||
        pixformat == AV_PIXEL_FORMAT_NV21) {
        return true;
    } else {
        return false;
    }
}

static bool CheckProfile(int32_t profile)
{
    if (profile == VC1_PROFILE_SIMPLE ||
        profile == VC1_PROFILE_MAIN ||
        profile == VC1_PROFILE_ADVANCED) {
        return true;
    } else {
        return false;
    }
}

static bool CheckLevelsForProfile(int32_t profile, int32_t level)
{
    if (profile == VC1_PROFILE_SIMPLE) {
        if (level == VC1_LEVEL_LOW ||
            level == VC1_LEVEL_MEDIUM) {
            return true;
        } else {
            return false;
        }
    } else if (profile == VC1_PROFILE_MAIN) {
        if (level == VC1_LEVEL_LOW ||
            level == VC1_LEVEL_MEDIUM ||
            level == VC1_LEVEL_HIGH) {
            return true;
        } else {
            return false;
        }
    } else if (profile == VC1_PROFILE_ADVANCED) {
        if (level == VC1_LEVEL_L0 ||
            level == VC1_LEVEL_L1 ||
            level == VC1_LEVEL_L2 ||
            level == VC1_LEVEL_L3 ||
            level == VC1_LEVEL_L4) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

void DecApiNdkTest::SetUpTestCase() {}
void DecApiNdkTest::TearDownTestCase() {}

void DecApiNdkTest::SetUp() {}
void DecApiNdkTest::TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0001
 * @tc.number VIDEO_VC1DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME, codec_name);
    }
}

/**
 * @tc.name   VIDEO_VP8DEC_CAP_API_0001
 * @tc.number VIDEO_VP8DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_VP8DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VP8, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_VP8, codec_name);
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_CAP_API_0001
 * @tc.number VIDEO_VP9DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_VP9DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VP9, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_VP9, codec_name);
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_CAP_API_0001
 * @tc.number VIDEO_AV1DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_AV1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AV1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_AV1, codec_name);
    }
}

/**
 * @tc.name   VIDEO_RV30DEC_CAP_API_0001
 * @tc.number VIDEO_RV30DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_RV30DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RV30, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_RV30, codec_name);
    }
}

/**
 * @tc.name   VIDEO_RV40DEC_CAP_API_0001
 * @tc.number VIDEO_RV40DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_RV40DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RV40, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_RV40, codec_name);
    }
}

/**
 * @tc.name   VIDEO_MJPEGDEC_CAP_API_0001
 * @tc.number VIDEO_MJPEGDEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_MJPEGDEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MJPEG, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_MJPEG, codec_name);
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_CAP_API_0001
 * @tc.number VIDEO_MSVIDEO1DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_MSVIDEO1, codec_name);
    }
}

/**
 * @tc.name   VIDEO_RAWVIDEODEC_CAP_API_0001
 * @tc.number VIDEO_RAWVIDEODEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_RAWVIDEODEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RAWVIDEO, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_RAWVIDEO, codec_name);
    }
}

/**
 * @tc.name   VIDEO_MPEG1DEC_CAP_API_0001
 * @tc.number VIDEO_MPEG1DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_MPEG1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MPEG1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_MPEG1, codec_name);
    }
}

/**
 * @tc.name   VIDEO_WVC1DEC_CAP_API_0001
 * @tc.number VIDEO_WVC1DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_WVC1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_WVC1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_WVC1, codec_name);
    }
}

/**
 * @tc.name   VIDEO_WMV3DEC_CAP_API_0001
 * @tc.number VIDEO_WMV3DEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_WMV3DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_WMV3, codec_name);
    }
}

/**
 * @tc.name   VIDEO_DVVIDEODEC_CAP_API_0001
 * @tc.number VIDEO_DVVIDEODEC_CAP_API_0001
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_DVVIDEODEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_DVVIDEO, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME_DVVIDEO, codec_name);
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0002
 * @tc.number VIDEO_VC1DEC_CAP_API_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0002, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (cap != nullptr) {
        ASSERT_NE(cap, nullptr);
        ASSERT_EQ(64, OH_AVCapability_GetMaxSupportedInstances(cap));
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0003
 * @tc.number VIDEO_VC1DEC_CAP_API_0003
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0003, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_EQ(range.minVal, 2);
        ASSERT_EQ(range.maxVal, 2048);
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0004
 * @tc.number VIDEO_VC1DEC_CAP_API_0004
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0004, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
         OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &g_pixelFormat, &g_pixelFormatNum);
        ASSERT_NE(nullptr, g_pixelFormat);
        ASSERT_EQ(g_pixelFormatNum, 3);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < g_pixelFormatNum; i++) {
            vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
            ASSERT_NE(nullptr, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            EXPECT_GE(g_pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, g_pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec_);
            format = nullptr;
            vdec_ = nullptr;
        }
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0005
 * @tc.number VIDEO_VC1DEC_CAP_API_0005
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0005, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *g_pixelFormat = nullptr;
    uint32_t g_pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &g_pixelFormat, &g_pixelFormatNum);
        ASSERT_NE(nullptr, g_pixelFormat);
        ASSERT_EQ(g_pixelFormatNum, PIXFORMAT_NUM);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < g_pixelFormatNum; i++) {
            ASSERT_EQ(true, CheckPixelFormat(g_pixelFormat[i]));
            vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
            ASSERT_NE(nullptr, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            EXPECT_GE(g_pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, g_pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec_);
        }
        vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
        ASSERT_NE(nullptr, vdec_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21 + AV_PIXEL_FORMAT_NV21);
        ASSERT_NE(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    }
}


/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0006
 * @tc.number VIDEO_VC1DEC_CAP_API_0006
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0006, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_EQ(CheckProfile(profiles[i]), true);
        }
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0007
 * @tc.number VIDEO_VC1DEC_CAP_API_0007
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0007, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            cout << "profiles[" << i << "] = " << profiles[i] << endl;
            ASSERT_EQ(CheckProfile(profiles[i]), true);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            EXPECT_GT(levelNum, 0);
            for (int j = 0; j < levelNum; j++) {
                cout << "level is " << levels[j] << endl;
                ASSERT_EQ(CheckLevelsForProfile(profiles[i], levels[j]), true);
            }
        }
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_CAP_API_0008
 * @tc.number VIDEO_VC1DEC_CAP_API_0008
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0008, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_EQ(profiles[i], i);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(
                capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            for (int j = 0; j < levelNum; j++) {
                ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profiles[i], levels[j]));
            }
        }
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_CAP_API_0009
 * @tc.number VIDEO_MSVIDEO1DEC_CAP_API_0009
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0009, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 0);
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_CAP_API_0010
 * @tc.number VIDEO_MSVIDEO1DEC_CAP_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0010, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(2, profileNum);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            EXPECT_GE(profiles[i], 0);
        }
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_CAP_API_0011
 * @tc.number VIDEO_MSVIDEO1DEC_CAP_API_0011
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0011, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(2, profileNum);
        const int32_t* levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            EXPECT_GE(profiles[i], 0);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            EXPECT_GT(levelNum, 0);
            for (int j = 0; j < levelNum; j++) {
                EXPECT_GE(levels[j], 0);
            }
        }
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_CAP_API_0012
 * @tc.number VIDEO_MSVIDEO1DEC_CAP_API_0012
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0012, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3,
    false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WMV3_PROFILE_SIMPLE, WMV3_LEVEL_LOW));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WMV3_PROFILE_SIMPLE, WMV3_LEVEL_MEDIUM));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WMV3_PROFILE_MAIN, WMV3_LEVEL_LOW));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WMV3_PROFILE_MAIN, WMV3_LEVEL_MEDIUM));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WMV3_PROFILE_MAIN, WMV3_LEVEL_HIGH));
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_CAP_API_0013
 * @tc.number VIDEO_VP9DEC_CAP_API_0013
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VP9DEC_CAP_API_0013, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP9,
    false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_1));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_11));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_2));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_21));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_3));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_31));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_4));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_41));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_5));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_51));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_52));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_6));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_61));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_0, VP9_LEVEL_62));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_1, VP9_LEVEL_31));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_2, VP9_LEVEL_5));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        VP9_PROFILE_3, VP9_LEVEL_62));
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_CAP_API_0014
 * @tc.number VIDEO_AV1DEC_CAP_API_0014
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_AV1DEC_CAP_API_0014, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1,
    false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_20));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_21));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_22));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_23));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_30));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_31));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_32));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_33));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_40));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_41));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_42));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_43));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_50));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_51));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_52));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_53));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_60));
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_CAP_API_0015
 * @tc.number VIDEO_AV1DEC_CAP_API_0015
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_AV1DEC_CAP_API_0015, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1,
    false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_61));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_62));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_63));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_70));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_71));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_72));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_MAIN, AV1_LEVEL_73));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_HIGH, AV1_LEVEL_33));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        AV1_PROFILE_PROFESSIONAL, AV1_LEVEL_40));
    }
}

/**
 * @tc.name   VIDEO_WVC1DEC_CAP_API_0016
 * @tc.number VIDEO_WVC1DEC_CAP_API_0016
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_WVC1DEC_CAP_API_0016, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WVC1,
    false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L0));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L1));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L2));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L3));
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability,
        WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L4));
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_CAP_API_0017
 * @tc.number VIDEO_VP9DEC_CAP_API_0017
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VP9DEC_CAP_API_0017, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_VP9, false, SOFTWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        ASSERT_EQ(profiles[i], i);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(
            capability, profiles[i], &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        for (int j = 0; j < levelNum; j++) {
            ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profiles[i], levels[j]));
        }
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_CAP_API_0018
 * @tc.number VIDEO_VP9DEC_CAP_API_0018
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DecApiNdkTest, VIDEO_VP9DEC_CAP_API_0018, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AV1, false, SOFTWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        ASSERT_EQ(profiles[i], i);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(
            capability, profiles[i], &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        for (int j = 0; j < levelNum; j++) {
            ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profiles[i], levels[j]));
        }
    }
}
} // namespace