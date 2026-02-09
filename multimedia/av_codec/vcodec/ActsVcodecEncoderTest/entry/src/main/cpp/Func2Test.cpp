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
#include <iostream>
#include <memory>
#include "SecureMemory.h"
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include "videoenc_sample.h"
#include "videoenc_api11_sample.h"
#include "avcodec_codec_name.h"
#include "include/OhosCommonTest.h"
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "EncoderFunc2Test12"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
constexpr int32_t SQR = 2; // CQ mode
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t FRAME_RATE_30_INT = 30;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t VIDEO_WIDTH_1080P = 1920;
constexpr uint32_t VIDEO_HEIGHT_1080P = 1080;
constexpr uint32_t VIDEO_WIDTH_4K = 4096;
constexpr uint32_t VIDEO_HEIGHT_4K = 4096;
constexpr uint32_t VIDEO_WIDTH_QCIF = 176;
constexpr uint32_t VIDEO_HEIGHT_QCIF = 144;
constexpr uint32_t SYNC_WAIT_TIME_100MS = 100000;
constexpr uint32_t INDEX_OFFSET_100 = 100;
constexpr uint32_t TEMPORAL_GOP_SIZE_8 = 8;
constexpr uint32_t LTR_COUNT_5 = 5;
constexpr uint32_t LTR_INTERVAL_5 = 5;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static bool InitAVCCodecName()
{
    if (cap == nullptr) {
        cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    }
    if (cap == nullptr) {
        return false;
    }
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (tmpCodecName == nullptr) {
        return false;
    }
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != EOK) {
        return false;
    }
    return true;
}

static bool InitHEVCCodecName()
{
    if (cap_hevc == nullptr) {
        cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    }
    if (cap_hevc == nullptr) {
        return false;
    }
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (tmpCodecNameHevc == nullptr) {
        return false;
    }
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc) + 1) != EOK) {
        return false;
    }
    return true;
}

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc) + 1) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
static void TearDownTestCase() {}
static void SetUp() {}
static void TearDown()
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
int VideoEncodeHevcCapability3100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3200Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, 0, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GT(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3600Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, 0, DEFAULT_HEIGHT, FRAME_RATE_30_INT));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3700Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, DEFAULT_WIDTH, 0, FRAME_RATE_30_INT));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        ASSERT_NE(nullptr, capability);
        bool result = OH_AVCapability_AreVideoSizeAndFrameRateSupported(
            capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0);
        ASSERT_EQ(false, result);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability3900Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(
            cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, FRAME_RATE_30_INT));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t pixelFormatNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, nullptr, &pixelFormatNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4200Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        uint32_t pixelFormatNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum);
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
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t profileNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, nullptr, &profileNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        uint32_t profileNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, &profileNum);
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
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t **levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, 1, levels, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4700Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, HEVC_PROFILE_MAIN, nullptr, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4800Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, HEVC_PROFILE_MAIN, &levels, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability4900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, HEVC_PROFILE_MAIN, &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        ASSERT_GT(levelNum, 0);
        for (int i = 0; i < levelNum; i++) {
            ASSERT_GE(levels[i], 0);
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5000Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        int32_t profile = HEVC_PROFILE_MAIN_10_HDR10_PLUS + 1;
        int32_t level = HEVC_LEVEL_62 + 1;
        ASSERT_NE(true, OH_AVCapability_AreProfileAndLevelSupported(cap, profile, level));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5100Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(cap, HEVC_PROFILE_MAIN, 1));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8700Test()
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
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8800Test()
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
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8900Test()
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
            } else {
                ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability9000Test()
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
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5500Test()
{
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
        } else {
            ASSERT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
        }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5600Test()
{
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
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5700Test()
{
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
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5800Test()
{
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
        } else {
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability5900Test()
{
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
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeSyncFunc0010Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->ConfigureVideoEncoder());
    }
    return 0;
}

int VideoEncodeSyncFunc0020Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->QueryInputBuffer(index, 0));
    }
    return 0;
}

int VideoEncodeSyncFunc0030Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vEncSample->QueryOutputBuffer(index, 0));
    }
    return 0;
}

int VideoEncodeSyncFunc0040Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        int32_t ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeSyncFunc0050Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        int32_t ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->enbleSyncMode = 1;
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
    }
    return 0;
}

int VideoEncodeSyncFunc0070Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        int32_t ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        uint32_t index = 0;
        ret = vEncSample->QueryInputBuffer(index, 0);
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        return 0;
    } else {
    }
    return 0;
}

int VideoEncodeSyncFunc0080Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vEncSample->QueryOutputBuffer(index, 0));
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0090Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getOutputBufferIndexNoExisted = true;
        vEncSample->noDestroy = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->OpenFile());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->QueryInputBuffer(index, -1));
        ASSERT_EQ(nullptr, vEncSample->GetInputBuffer(index+INDEX_OFFSET_100));
    }
    return 0;
}

int VideoEncodeSyncFunc0110Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getOutputBufferIndexRepeated = true;
        vEncSample->noDestroy = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0120Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->getOutputBufferIndexRepeated = true;
        vEncSample->noDestroy = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->OpenFile());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(true, vEncSample->abnormalIndexValue);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0130Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0130.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
    return 0;
}

int VideoEncodeSyncFunc0140Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0140.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
    return 0;
}

int VideoEncodeSyncFunc0150Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName() && OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0150.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0160Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName() && OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_SQR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0160.h264";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
    return 0;
}

int VideoEncodeSyncFunc0210Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr && InitAVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->isGetFormatKey = true;
        vEncSample->avcodecMimeType = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
        vEncSample->isEncoder = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0220Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr &&
                    InitHEVCCodecName() &&
                    OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_VBR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0220.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0230Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr &&
                    InitHEVCCodecName() &&
                    OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_CQ)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0230.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0240Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr &&
                    InitHEVCCodecName() &&
                    OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_SQR)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0240.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0360Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0360.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncInputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0370Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0370.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncInputWaitTime = SYNC_WAIT_TIME_100MS;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0380Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0380.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0390Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0390.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = SYNC_WAIT_TIME_100MS;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0400Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0400.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->queryInputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFunc0410Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName()) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_SYNC_FUNC_0410.h265";
        vEncSample->enbleSyncMode = 1;
        vEncSample->queryOutputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020010Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/176_144_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0010.h265";
        vEncSample->DEFAULT_WIDTH = VIDEO_WIDTH_QCIF;
        vEncSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_QCIF;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020020Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0020.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020030Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1920_1080_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0030.h265";
        vEncSample->DEFAULT_WIDTH = VIDEO_WIDTH_1080P;
        vEncSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_1080P;
        vEncSample->DEFAULT_BITRATE_MODE = SQR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020040Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/4096_4096_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0040.h265";
        vEncSample->DEFAULT_WIDTH = VIDEO_WIDTH_4K;
        vEncSample->DEFAULT_HEIGHT = VIDEO_WIDTH_4K;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020110Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0110.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_8;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020130Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0130.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020150Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_RGBA1010102_0150.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = true;
        vEncSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020170Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020180Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA;
        vEncSample->configMain10 = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeRgba10101020190Test()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr && InitHEVCCodecName() && ! access("/system/lib64/media/", 0)) {
        if (!IsSupportRgba1010102Format()) {
            return 0;
        }
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_rgba1010102.yuv";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA1010102;
        vEncSample->configMain10 = false;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_LT(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodeSyncFormat0010Test()
{
    if (cap != nullptr && !access("/system/lib64/media/", 0)) {
        auto vEncSample = make_shared<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
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
        return 0;
    }
    return 0;
}

void InitFunc2Test()
{
    SetUpTestCase();
}
