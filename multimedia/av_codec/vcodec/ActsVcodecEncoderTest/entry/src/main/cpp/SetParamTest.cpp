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
#include <cfloat>
#include <iostream>
#include <memory>
#include "SecureMemory.h"
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "videoenc_sample.h"
#include "videoenc_api11_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "EncoderSetparamTest12"

static OH_AVCodec *venc_ = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t FRAME_RATE_10 = 10;
constexpr uint32_t QP_MAX_200 = 200;
constexpr uint32_t EXPECTED_FRAME_COUNT_25 = 25;
constexpr uint32_t COLOR_PRIMARIES_100 = 100;
constexpr uint32_t TRANSFER_CHARACTERISTICS_10000 = 10000;
constexpr uint32_t MATRIX_COEFFICIENTS_10000 = 10000;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

void TestTearDownSetparam()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr) {
            if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
                cout << "memcpy failed" << endl;
            }
            cout << "codecname: " << g_codecName << endl;
        } else {
        }
    } else {
    }
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr) {
        const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
        if (tmpCodecNameHevc != nullptr) {
            if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                strlen(tmpCodecNameHevc)) != EOK) {
                cout << "memcpy failed" << endl;
            }
            cout << "codecname_hevc: " << g_codecNameHEVC << endl;
        } else {
        }
    } else {
    }
}
static void TearDownTestCase() {}
static void TestSetUp() {}
static void TestTearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

int RESET_BITRATE_001Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int RESET_BITRATE_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        EXPECT_NE(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int RESET_BITRATE_003Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h264";
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

int RESET_BITRATE_004Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h264";
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

int RESET_BITRATE_005Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h264";
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

int RESET_BITRATE_006Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h264";
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

int RESET_BITRATE_007Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int RESET_BITRATE_008Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        EXPECT_NE(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int RESET_BITRATE_009Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h264";
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

int RESET_BITRATE_010Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h264";
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

int RESET_BITRATE_011Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h264";
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

int RESET_BITRATE_012Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h264";
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

int RESET_FRAMERATE_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}
int RESET_FRAMERATE_012Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
            ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
            OH_AVFormat *format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
            EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
            OH_AVFormat_Destroy(format);
            vEncSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
            return 0;
        }
        return 0;
    }
    return 0;
}
int RESET_FRAMERATE_013Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
            ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
            OH_AVFormat *format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
            EXPECT_EQ(AV_ERR_OK, vEncSample->SetParameter(format));
            OH_AVFormat_Destroy(format);
            vEncSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
            return 0;
        }
        return 0;
    }
    return 0;
}
int RESET_FRAMERATE_014Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
        EXPECT_EQ(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}
int RESET_FRAMERATE_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h264";
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

int RESET_FRAMERATE_003Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h264";
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

int RESET_FRAMERATE_004Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h264";
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

int RESET_FRAMERATE_005Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h264";
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

int RESET_FRAMERATE_006Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h264";
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

int RESET_FRAMERATE_007Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h265";
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

int RESET_FRAMERATE_008Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h265";
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

int RESET_FRAMERATE_009Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h265";
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

int RESET_FRAMERATE_010Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h265";
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

int RESET_FRAMERATE_011Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h265";
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

int RESET_QP_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, QP_MAX_200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, QP_MAX_200);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}
int RESET_QP_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, QP_MAX_200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, QP_MAX_200);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int RESET_QP_003Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h264";
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

int RESET_QP_004Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h264";
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

int RESET_QP_005Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h264";
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

int RESET_QP_006Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h264";
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

int RESET_QP_007Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h264";
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

int RESET_QP_008Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h264";
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

int RESET_QP_009Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h265";
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

int RESET_QP_010Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h265";
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

int RESET_QP_011Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h265";
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

int RESET_QP_012Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h265";
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

int RESET_QP_013Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h265";
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

int RESET_QP_014Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h265";
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

int SET_PROFILE_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
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

int SET_PROFILE_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
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

int SET_PROFILE_003Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_HIGH;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_003.h264";
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

int SET_PROFILE_004Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_004.h264";
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

int SET_PROFILE_005Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_BASELINE;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_005.h264";
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

int SET_RANGE_FLAG_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h265";
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

int SET_RANGE_FLAG_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h264";
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

int SET_COLORSPACE_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h264";
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

int SET_COLORSPACE_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h265";
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

int SET_FORCE_IDR_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
}

int SET_FORCE_IDR_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
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

int COLORSPACE_CONFIG_001Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARIES_100;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTICS_10000;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENTS_10000;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_INVALID_STATE, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
        return 0;
    }
}

int COLORSPACE_CONFIG_002Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h264.h264";
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

int COLORSPACE_CONFIG_003Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h265.h265";
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

int COLORSPACE_CONFIG_004Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_PQ_h265.h265";
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

int COLORSPACE_CONFIG_005Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_HLG;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_HLG_h265.h265";
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

int COLORSPACE_CONFIG_006Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_P3D65;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_P3D65_h265.h265";
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

int COLORSPACE_CONFIG_ADD_001Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_IDENTITY;
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

int COLORSPACE_CONFIG_ADD_002Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_UNSPECIFIED;
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

int COLORSPACE_CONFIG_ADD_003Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_FCC;
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

int COLORSPACE_CONFIG_ADD_004Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT601_625;
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

int COLORSPACE_CONFIG_ADD_005Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT601_525;
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

int COLORSPACE_CONFIG_ADD_006Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_SMPTE_ST240;
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

int COLORSPACE_CONFIG_ADD_007Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_YCGCO;
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

int COLORSPACE_CONFIG_ADD_008Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_CL;
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

int COLORSPACE_CONFIG_ADD_009Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_SMPTE_ST2085;
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

int COLORSPACE_CONFIG_ADD_010Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_CHROMATICITY_NCL;
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

int COLORSPACE_CONFIG_ADD_011Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_CHROMATICITY_CL;
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

int COLORSPACE_CONFIG_ADD_012Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_ICTCP;
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

int FRAMENUM_JUDGMENT_001Test()
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->OUT_DIR = "/data/test/media/1280_720_nv.h264";
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
            ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
            vEncSample->WaitForEOS();
            ASSERT_EQ(EXPECTED_FRAME_COUNT_25, vEncSample->outCount);
            ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
            return 0;
        }
    }
    return 0;
}

int FRAMENUM_JUDGMENT_002Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/test/media/EN_1280_720_nv.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(EXPECTED_FRAME_COUNT_25, vEncSample->outCount);
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
    return 0;
}

void InitSetparamTest()
{
    SetUpTestCase();
}
