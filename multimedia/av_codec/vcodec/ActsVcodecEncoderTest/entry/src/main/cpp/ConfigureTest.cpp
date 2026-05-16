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
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <string>
#include "SecureMemory.h"
#include <iostream>
#include <memory>
#include "videoenc_api11_sample.h"
#include "avcodec_codec_name.h"
#include "include/OhosCommonTest.h"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

void TestTearDownConfigure()
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
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != EOK) {
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

int VideoEncodeHevcCapability1800Test()
{
    if (cap_hevc) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap_hevc);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap_hevc, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4000Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, DEFAULT_HEIGHT, &range);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4400Test()
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
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4410Test()
{
    if (cap_hevc) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap_hevc);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap_hevc, DEFAULT_WIDTH, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4700Test()
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
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4710Test()
{
    if (cap_hevc) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap_hevc);
        ret = OH_AVCapability_GetVideoWidthRange(cap_hevc, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability5000Test()
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
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}
int VideoEncodeCapability5010Test()
{
    if (cap_hevc) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap_hevc);
        ret = OH_AVCapability_GetVideoHeightRange(cap_hevc, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.maxVal + 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, venc_);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, range.minVal - 1);
        EXPECT_NE(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}
int VideoEncodeCapability5020Test()
{
    bool isSupportedCBRHQ = OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_CBR_HIGH_QUALITY);
    auto vEncSample = make_unique<VEncAPI11Sample>();
    if (isSupportedCBRHQ) {
        OH_AVCodec *venc = OH_VideoEncoder_CreateByName(g_codecNameHEVC);
        if (!venc) {
            return 1;
        }
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, vEncSample->DEFAULT_WIDTH);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, vEncSample->DEFAULT_HEIGHT);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, vEncSample->DEFAULT_PIX_FMT);
        OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, vEncSample->DEFAULT_FRAME_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, vEncSample->DEFAULT_KEY_FRAME_INTERVAL);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR_HIGH_QUALITY);
        int ret = OH_VideoEncoder_Configure(venc, format);
        OH_VideoEncoder_Destroy(venc);
        OH_AVFormat_Destroy(format);
        if (ret != AV_ERR_OK) {
            return 1;
        }
        return 0;
    } else {
        return 0;
    }
}
int VideoEncodeCapability5030Test()
{
    bool isSupportedCBRHQ = OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_CBR_HIGH_QUALITY);
    auto vEncSample = make_unique<VEncAPI11Sample>();
    if (isSupportedCBRHQ) {
        OH_AVCodec *venc = OH_VideoEncoder_CreateByName(g_codecNameHEVC);
        if (!venc) {
            return 1;
        }
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, vEncSample->DEFAULT_WIDTH);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, vEncSample->DEFAULT_HEIGHT);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, vEncSample->DEFAULT_PIX_FMT);
        OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, vEncSample->DEFAULT_FRAME_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, vEncSample->DEFAULT_KEY_FRAME_INTERVAL);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, vEncSample->DEFAULT_QUALITY);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR_HIGH_QUALITY);
        int ret = OH_VideoEncoder_Configure(venc, format);
        OH_VideoEncoder_Destroy(venc);
        OH_AVFormat_Destroy(format);
        if (ret != AV_ERR_INVALID_VAL) {
            return 1;
        }
        return 0;
    } else {
        return 0;
    }
}

void InitConfigureTest()
{
    SetUpTestCase();
}
