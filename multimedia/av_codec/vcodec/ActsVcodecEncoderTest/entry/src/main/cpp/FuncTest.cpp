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
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include "SecureMemory.h"


#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "EncoderFunc2Test12"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
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
constexpr uint32_t MAX_INSTANCES_HISI = 16;
constexpr uint32_t MAX_INSTANCES_OTHER = 4;
constexpr uint32_t TEST_QUALITY_VALUE = 60;
constexpr uint32_t FRAME_RATE_60 = 60;
constexpr uint32_t SLEEP_TIME_US = 1000000;
constexpr uint32_t INVALID_INDEX = 9999999;
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

static void TestSetUpTestCase()
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

void TestTearDownFunc()
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

static int TestIFrameIntervalConfig(const char *mimeType, int32_t pixelFormat, int32_t intervalValue)
{
    venc_ = OH_VideoEncoder_CreateByMime(mimeType);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, intervalValue));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_AVFormat_Destroy(format);
    format = nullptr;
    OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    return 0;
}

static int TestProfileConfig(const char *mimeType, int32_t pixelFormat,
    int32_t profileValue, OH_AVErrCode expectedResult)
{
    venc_ = OH_VideoEncoder_CreateByMime(mimeType);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profileValue);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    ASSERT_EQ(expectedResult, OH_VideoEncoder_Configure(venc_, format));
    OH_AVFormat_Destroy(format);
    format = nullptr;
    OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    return 0;
}

int VideoEncodeFunction0100Test()
{
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0300Test()
{
    venc_ = OH_VideoEncoder_CreateByName("aabbccdd");
    ASSERT_EQ(nullptr, venc_);
    return 0;
}

int VideoEncodeFunction0400Test()
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0500Test()
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0600Test()
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableForceIDR = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0700Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 1));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES,
                OH_ColorPrimary::COLOR_PRIMARY_BT709));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                                    OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_LINEAR));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                                    OH_MatrixCoefficient::MATRIX_COEFFICIENT_YCGCO));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0800Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0], SECOND);
            TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0], -1);
            TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0], 0);
            TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0], INT_MAX);
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0810Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, AV_PIXEL_FORMAT_YUVI420, SECOND);
        TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, AV_PIXEL_FORMAT_YUVI420, -1);
        TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, AV_PIXEL_FORMAT_YUVI420, 0);
        TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, AV_PIXEL_FORMAT_YUVI420, INT_MAX);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction0900Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                              AVC_PROFILE_BASELINE, AV_ERR_OK);
            TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                              AVC_PROFILE_HIGH, AV_ERR_OK);
            TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                              AVC_PROFILE_MAIN, AV_ERR_OK);
            TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                              AVC_PROFILE_MAIN + AVC_PROFILE_MAIN, AV_ERR_INVALID_VAL);
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1000Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();

            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1100Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR));
            ASSERT_EQ(true, OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1400Test()
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();

            ASSERT_EQ(true, OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, FRAME_RATE_60));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1600Test()
{
    InitHEVCCodecName();
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ));
        ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, TEST_QUALITY_VALUE));
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    }
    return 0;
}

int VideoEncodeFunction1700Test()
{
    if (cap) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr && strlen(tmpCodecName) > 0) {
            if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != EOK) {
                return -1;
            }
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enable_random_eos = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction2000Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/test.rgba";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeFunction1900Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return -1;
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability0100Test()
{
    const char *p = nullptr;
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability(p, true));
    return 0;
}

int VideoEncodeCapability0200Test()
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability("", true));
    return 0;
}

int VideoEncodeCapability0300Test()
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapability("notexist", true));
    return 0;
}

int VideoEncodeCapability0400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability0500Test()
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory("", true, HARDWARE));
    return 0;
}
int VideoEncodeCapability9900Test()
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory(nullptr, true, HARDWARE));
    return 0;
}

int VideoEncodeCapability0600Test()
{
    ASSERT_EQ(nullptr, OH_AVCodec_GetCapabilityByCategory("notexist", true, HARDWARE));
    return 0;
}

int VideoEncodeCapability0700Test()
{
    if (cap) {
        ASSERT_NE(nullptr, OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability0800Test()
{
    ASSERT_EQ(false, OH_AVCapability_IsHardware(nullptr));
    return 0;
}

int VideoEncodeCapability0900Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        ASSERT_EQ(true, OH_AVCapability_IsHardware(cap));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1000Test()
{
    const char *name = OH_AVCapability_GetName(nullptr);
    ASSERT_NE(name, nullptr);
    ASSERT_EQ(strlen(name), 0);
    return 0;
}

int VideoEncodeCapability1100Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        const char *name = OH_AVCapability_GetName(cap);
        ASSERT_NE(name, nullptr);
        ASSERT_GT(strlen(name), 0);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1200Test()
{
    int32_t maxSupportedInstance = OH_AVCapability_GetMaxSupportedInstances(nullptr);
    ASSERT_EQ(maxSupportedInstance, 0);
    return 0;
}

int VideoEncodeCapability1300Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);

        string codecName = OH_AVCapability_GetName(cap);
        if (codecName == "OMX.hisi.video.encoder.avc") {
            ASSERT_EQ(MAX_INSTANCES_HISI, OH_AVCapability_GetMaxSupportedInstances(cap));
        } else {
            ASSERT_EQ(MAX_INSTANCES_OTHER, OH_AVCapability_GetMaxSupportedInstances(cap));
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1310Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        ASSERT_NE(nullptr, cap);

        string codecName = OH_AVCapability_GetName(cap);
        if (codecName == "OMX.hisi.video.encoder.hevc") {
            ASSERT_EQ(MAX_INSTANCES_HISI, OH_AVCapability_GetMaxSupportedInstances(cap));
        } else {
            ASSERT_EQ(MAX_INSTANCES_OTHER, OH_AVCapability_GetMaxSupportedInstances(cap));
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderBitrateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}


int VideoEncodeCapability1500Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;

        ASSERT_NE(nullptr, cap);

        ret = OH_AVCapability_GetEncoderBitrateRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1700Test()
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
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability1800Test()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(nullptr, BITRATE_MODE_CBR);
    ASSERT_EQ(false, isSupported);
    return 0;
}

int VideoEncodeCapability1900Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
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
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8400Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
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
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8500Test()
{
    if (cap) {
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
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        } else {
            bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
            EXPECT_EQ(isSupported, false);
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability8600Test()
{
    if (cap) {
        ASSERT_NE(nullptr, cap);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
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
    } else {
        return 0;
    }
}

int VideoEncodeCapability2000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability2100Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability2200Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderQualityRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability2300Test()
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
    } else {
        return 0;
    }
}

int VideoEncodeCapability2400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability2500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability2700Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability2800Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability3300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, &alignment);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(alignment, 0);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3400Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability3600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, &alignment);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(alignment, 0);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3700Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_WIDTH, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3800Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, DEFAULT_WIDTH, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability3900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4100Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_HEIGHT, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4200Test()
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

int VideoEncodeCapability4300Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, 0, &range);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability4600Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoWidthRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability4800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return 0;
}

int VideoEncodeCapability4900Test()
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        ASSERT_NE(nullptr, cap);
        ret = OH_AVCapability_GetVideoHeightRange(cap, nullptr);
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeCapability9800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
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
        return 0;
    }
    return 0;
}

void InitFuncTest()
{
    TestSetUpTestCase();
}
