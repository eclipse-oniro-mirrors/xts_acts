/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <securec.h>
#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
} // namespace
namespace OHOS {
namespace Media {
class HwCapabilityNdkTest : public testing::Test {
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

void HwCapabilityNdkTest::SetUpTestCase()
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
void HwCapabilityNdkTest::TearDownTestCase() {}
void HwCapabilityNdkTest::SetUp() {}
void HwCapabilityNdkTest::TearDown()
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
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0010
 * @tc.name      : OH_AVCapability_IsFeatureSupported para error
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0010, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, static_cast<OH_AVCapabilityFeature>(4)));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0011
 * @tc.name      : 解码，是否支持分层编码
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0011, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0012
 * @tc.name      : 编码，是否支持分层编码
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0012, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0013
 * @tc.name      : 解码，是否支持LTR
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0013, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0014
 * @tc.name      : 编码，是否支持LTR
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0014, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0015
 * @tc.name      : 软解，是否支持低时延
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0015, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0016
 * @tc.name      : 硬解，是否支持低时延
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0016, TestSize.Level2)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY));
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY));
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0017
 * @tc.name      : 编码，是否支持低时延
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0017, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY));
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY));
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0018
 * @tc.name      : OH_AVCapability_GetFeatureProperties para error
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0018, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, static_cast<OH_AVCapabilityFeature>(4)));

    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, static_cast<OH_AVCapabilityFeature>(-1)));
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, static_cast<OH_AVCapabilityFeature>(100)));

    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0019
 * @tc.name      : 解码，查询分层编码的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0019, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0020
 * @tc.name      : 编码，查询分层编码的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0020, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0021
 * @tc.name      : 解码，查询LTR能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0021, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0022
 * @tc.name      : 编码，查询LTR的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0022, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        format = OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
        ASSERT_NE(nullptr, format);
        int ltrnum = 0;
        EXPECT_EQ(OH_AVFormat_GetIntValue(
            format, OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &ltrnum), true);
        EXPECT_EQ(ltrnum, 10);
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0023
 * @tc.name      : 软解，查询低时延的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0023, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0024
 * @tc.name      : 硬解，查询低时延的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0024, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY));
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0025
 * @tc.name      : 编码，查询低时延的能力值
 * @tc.desc      : api test
 */
HWTEST_F(HwCapabilityNdkTest, VIDEO_TEMPORAL_ENCODE_API_0025, TestSize.Level1)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(nullptr, OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY));
}
} // namespace