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

#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "videoenc_sample.h"
#include "videoenc_api11_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "avcodec_info.h"
#include "avcodec_list.h"
#include "avcodec_common.h"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
} // namespace
namespace OHOS {
namespace Media {
class HwEncFunc2NdkTest : public testing::Test {
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

void HwEncFunc2NdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (memcpy_s(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (memcpy_s(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc) + 1) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
void HwEncFunc2NdkTest::TearDownTestCase() {}
void HwEncFunc2NdkTest::SetUp() {}
void HwEncFunc2NdkTest::TearDown()
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
bool IsSupportRgba1010102Format()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (capability == nullptr) {
        return false;
    }
    int32_t ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    if (pixelFormat == nullptr || pixelFormatNum == 0 || ret != AV_ERR_OK) {
        return false;
    }
    for (int i = 0; i < pixelFormatNum; i++) {
        if (pixelFormat[i] == static_cast<int32_t>(AV_PIXEL_FORMAT_RGBA1010102)) {
            return true;
        }
    }
    return false;
}
/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3100
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3200
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3200, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3300
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3300, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3400
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3400, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3500
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3600
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, 30));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3700
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, 30));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3800
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported
            (capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_3900
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_3900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_3900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported
            (capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4000
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t pixelFormatNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4100
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4200
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4200, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        uint32_t pixelFormatNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
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
        EXPECT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4300
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4300, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t profileNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4400
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4400, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4500
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        uint32_t profileNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
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
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4600
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t **levels = nullptr;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, levels, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4700
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, nullptr, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4800
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_4900
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_4900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_4900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, HEVC_PROFILE_MAIN, &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        ASSERT_GT(levelNum, 0);
        for (int i = 0; i < levelNum; i++) {
            ASSERT_GE(levels[i], 0);
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5000
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory
        (OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        int32_t profile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + 1;
        int32_t level = HEVC_LEVEL_62 + 1;
        ASSERT_NE(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profile, level));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5100
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC,
            true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, HEVC_PROFILE_MAIN, 1));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_CAPABILITY_8700
 * @tc.number VIDEO_ENCODE_CAPABILITY_8700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8700, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_CAPABILITY_8800
 * @tc.number VIDEO_ENCODE_CAPABILITY_8800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8800, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_CAPABILITY_8900
 * @tc.number VIDEO_ENCODE_CAPABILITY_8900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_8900, TestSize.Level2)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            int64_t min = 1;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, min);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
                EXPECT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
            }else {
                ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            }
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_CAPABILITY_9000
 * @tc.number VIDEO_ENCODE_CAPABILITY_9000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_CAPABILITY_9000, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        int64_t max = 100000001;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, max);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5500
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21);
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }else {
            ASSERT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5600
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5600, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5700
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5700, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA);
            EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5800
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        int64_t min = 1;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, min);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            EXPECT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        }else {
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_HEVC_CAPABILITY_5900
 * @tc.number VIDEO_ENCODE_HEVC_CAPABILITY_5900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_HEVC_CAPABILITY_5900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        int64_t max = 100000001;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, max);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
    } else {
        return;
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0010
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0010, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->ConfigureVideoEncoder());
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0020
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0020, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->QueryInputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0030
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0030, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->QueryOutputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0040
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0040, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->SetVideoEncoderCallback());
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0050
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0050, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Reset());
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0070
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0070, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vEncSample->QueryInputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0080
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0080, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vEncSample->QueryOutputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0090
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0090, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getInputBufferIndexRepeat = true;
        vEncSample->isRunning_.store(true);
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->OpenFile());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        vEncSample->SyncInputFunc();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0100
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0100, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->QueryInputBuffer(index, -1));
        ASSERT_EQ(nullptr, vEncSample->GetInputBuffer(index+100));
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0110
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0110
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0110, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getOutputBufferIndexRepeated = true;
        vEncSample->noDestroy = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0120
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0120
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0120, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getOutputBufferIndexNoExisted = true;
        vEncSample->noDestroy = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0130
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0130, TestSize.Level0)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0130.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0140
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0140, TestSize.Level1)
{
    if (cap != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_VBR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0140.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0150
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0150, TestSize.Level1)
{
    if (cap != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0150.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0160
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0160, TestSize.Level1)
{
    if (cap != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_SQR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0160.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0210
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0210
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0210, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0210.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0220
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0220
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0220, TestSize.Level1)
{
    if (cap_hevc != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_VBR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0220.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0230
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0230
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0230, TestSize.Level1)
{
    if (cap_hevc != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_CQ)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0230.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0240
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0240
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0240, TestSize.Level1)
{
    if (cap_hevc != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_SQR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0240.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0360
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0360
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0360, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0360.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncInputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0370
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0370
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0370, TestSize.Level1)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0370.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncInputWaitTime = 100000;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0380
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0380
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0380, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0380.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0390
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0390
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0390, TestSize.Level1)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0390.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = 100000;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0400
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0400, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0400.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->queryInputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_SYNC_FUNC_0410
 * @tc.number VIDEO_ENCODE_SYNC_FUNC_0410
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_SYNC_FUNC_0410, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_SYNC_FUNC_0410.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->queryOutputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0010
 * @tc.number VIDEO_ENCODE_RGBA1010102_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0010, TestSize.Level1)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/176_144_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0010.h265";
        vEncSample->DEFAULT_WIDTH = 176;
        vEncSample->DEFAULT_HEIGHT = 144;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0020
 * @tc.number VIDEO_ENCODE_RGBA1010102_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0020, TestSize.Level0)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0020.h265";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0030
 * @tc.number VIDEO_ENCODE_RGBA1010102_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0030, TestSize.Level0)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1920_1080_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0030.h265";
        vEncSample->DEFAULT_WIDTH = 1920;
        vEncSample->DEFAULT_HEIGHT = 1080;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0040
 * @tc.number VIDEO_ENCODE_RGBA1010102_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0040, TestSize.Level1)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/4096_4096_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0040.h265";
        vEncSample->DEFAULT_WIDTH = 4096;
        vEncSample->DEFAULT_HEIGHT = 4096;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0110
 * @tc.number VIDEO_ENCODE_RGBA1010102_0110
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0110, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0110.h265";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 8;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0130
 * @tc.number VIDEO_ENCODE_RGBA1010102_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0130, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0130.h265";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 5;
        vEncSample->ltrParam.ltrInterval = 5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0150
 * @tc.number VIDEO_ENCODE_RGBA1010102_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0150, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_ENCODE_RGBA1010102_0150.h265";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0170
 * @tc.number VIDEO_ENCODE_RGBA1010102_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0170, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0180
 * @tc.number VIDEO_ENCODE_RGBA1010102_0180
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0180, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_RGBA1010102_0190
 * @tc.number VIDEO_ENCODE_RGBA1010102_0190
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_RGBA1010102_0190, TestSize.Level2)
{
    if (cap_hevc != nullptr && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = false;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_ENCODE_PIXE_FORMAT_0010
 * @tc.number VIDEO_ENCODE_PIXE_FORMAT_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwEncFunc2NdkTest, VIDEO_ENCODE_PIXE_FORMAT_0010, TestSize.Level2)
{
    if (cap != nullptr && !access("/system/lib64/media/", 0)) {
        auto vEncSample = make_shared<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/test/media/1280_720_nv.yuv";
        vEncSample->isGetVideoSupportedPixelFormats = true;
        vEncSample->isGetFormatKey = true;
        vEncSample->avcodecMimeType = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
        vEncSample->isEncoder = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(1, vEncSample->pixlFormatNum);
        ASSERT_EQ(0, vEncSample->firstCallBackKey);
        ASSERT_EQ(0, vEncSample->onStreamChangedKey);
    }
}
} // namespace
