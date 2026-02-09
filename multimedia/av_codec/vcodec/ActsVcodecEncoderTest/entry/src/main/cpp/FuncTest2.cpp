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
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t FRAME_RATE_30_INT = 30;
constexpr uint32_t DEFAULT_QUALITY = 30;
constexpr uint32_t MAX_PROFILE_NUM = 3;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t SECOND = 1000;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t MAX_QUALITY = 100;
constexpr uint32_t NO_SUPPORT_MODE = 100;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;

    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                 strlen(tmpCodecNameHevc)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecNameHEVC << endl;
}

void TestTearDownFunc2()
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

int VideoEncodeCapability5100Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(cap, 0, DEFAULT_HEIGHT));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability5200Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, 0));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability5300Test()
{
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT));
    return 0;
}

int VideoEncodeCapability5400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability5500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability5600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability5700Test()
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
    }
    return 0;
}

int VideoEncodeCapability5800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability5900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, 0, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6200Test()
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
    }
    return 0;
}

int VideoEncodeCapability6300Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, 0, DEFAULT_HEIGHT, FRAME_RATE_30_INT));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, DEFAULT_WIDTH, 0, FRAME_RATE_30_INT));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6500Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6600Test()
{
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(
        nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, FRAME_RATE_30_INT));
    return 0;
}

int VideoEncodeCapability6700Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(
            cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, FRAME_RATE_30_INT));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability6800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability6900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t pixelFormatNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, nullptr, &pixelFormatNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7100Test()
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
        ASSERT_EQ(AV_ERR_UNSUPPORT, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability7300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t profileNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, nullptr, &profileNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        uint32_t profileNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, &profileNum);
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
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability7700Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, 1, &levels, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7800Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, nullptr, &levelNum);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability7900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, &levels, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeCapability8000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        ASSERT_GT(levelNum, 0);
        for (int i = 0; i < levelNum; i++) {
            ASSERT_GE(levels[i], 0);
        }
        return 0;
    }
    return 0;
}

int VideoEncodeCapability8100Test()
{
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1));
    return 0;
}

int VideoEncodeCapability8200Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(cap, 1, 1));
        return 0;
    }
    return 0;
}

int VideoEncodeCapability8300Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(cap, AVC_PROFILE_BASELINE, 1));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0100Test()
{
    if (cap) {
        ASSERT_NE(nullptr, OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0200Test()
{
    if (cap) {
        ASSERT_NE(nullptr, OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0300Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_IsHardware(cap));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        const char *name = OH_AVCapability_GetName(cap);
        ASSERT_NE(name, nullptr);
        ASSERT_GT(strlen(name), 0);
        return 0;
    }
    return 0;
}


int VideoEncodeHevcCapability0500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;

        ASSERT_NE(nullptr, cap);

        ret = OH_AVCapability_GetEncoderBitrateRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderBitrateRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "max val " << range.maxVal << "  min val " << range.minVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, range.minVal - 1);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, range.maxVal + 1);
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0700Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CBR);
        EXPECT_EQ(isSupported, true);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability5200Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_VBR);
        EXPECT_EQ(isSupported, true);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
        EXPECT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability5300Test()
{
    if (cap) {
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
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability5400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, NO_SUPPORT_MODE);
        EXPECT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0800Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderQualityRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability0900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderQualityRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(range.minVal, 0);
        ASSERT_EQ(range.maxVal, MAX_QUALITY);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1200Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, &alignment);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(alignment, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, &alignment);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(alignment, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, DEFAULT_WIDTH, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1700Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability1900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, DEFAULT_HEIGHT, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeHevcCapability2000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, DEFAULT_WIDTH, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2200Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange widthRange;
        OH_AVRange heightRange;
        SecureMemset(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        SecureMemset(&heightRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRange(cap, &heightRange);
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = OH_AVCapability_GetVideoWidthRange(cap, &widthRange);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(heightRange.minVal, 0);
        ASSERT_GT(heightRange.maxVal, 0);
        ASSERT_GE(widthRange.minVal, 0);
        ASSERT_GT(widthRange.maxVal, 0);
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2700Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(cap, 0, DEFAULT_HEIGHT));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2800Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, 0));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability2900Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT));
        return 0;
    }
    return 0;
}

int VideoEncodeHevcCapability3000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    }
    return 0;
}

void InitFuncTest2()
{
    SetUpTestCase();
}
