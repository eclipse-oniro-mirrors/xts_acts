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
#include "videoenc_api11_sample.h"
#include "avcodec_codec_name.h"
#include "include/OhosCommonTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "VcodecEncoderTest12"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format = nullptr;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t DEFAULT_KEY_FRAME_INTERVAL = 1000;
constexpr uint32_t DEFAULT_BITRATE = 10000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t LTR_COUNT_2 = 2;
constexpr uint32_t LTR_COUNT_5 = 5;
constexpr uint32_t LTR_COUNT_10 = 10;
constexpr uint32_t LTR_COUNT_INVALID_11 = 11;
constexpr uint32_t LTR_INTERVAL_5 = 5;
constexpr uint32_t TEMPORAL_GOP_SIZE_2 = 2;
constexpr uint32_t TEMPORAL_GOP_SIZE_3 = 3;
constexpr uint32_t TEMPORAL_GOP_SIZE_4 = 4;
constexpr uint32_t TEMPORAL_GOP_SIZE_5 = 5;
constexpr uint32_t TEMPORAL_GOP_SIZE_6 = 6;
constexpr uint32_t TEMPORAL_GOP_SIZE_8 = 8;
constexpr uint32_t TEMPORAL_GOP_SIZE_9 = 9;
constexpr uint32_t TEMPORAL_GOP_SIZE_30 = 30;
constexpr uint32_t TEMPORAL_GOP_MODE_3 = 3;
OH_AVPixelFormat DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
const char *g_inpDir720Array[16] = {
    "/data/storage/el2/base/files/media/1280_720_nv.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_1.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_2.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_3.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_7.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_10.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_13.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_4.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_8.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_11.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_14.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_5.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_9.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_12.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_15.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_6.yuv"
};
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr &&
                SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
            cout << "memcpy failed" << endl;
        }
        cout << "codecname: " << g_codecName << endl;
    }
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr) {
        const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
        if (tmpCodecNameHevc != nullptr &&
                SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                strlen(tmpCodecNameHevc)) != EOK) {
            cout << "memcpy failed" << endl;
        }
        cout << "codecname_hevc: " << g_codecNameHEVC << endl;
    }
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

int VideoTemporalEncodeApi0020Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, TEMPORAL_GOP_MODE_3);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (!access("/system/lib64/media/", 0)) {
            ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
        } else {
            ASSERT_EQ(ret, AV_ERR_OK);
        }
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeApi0030Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, TEMPORAL_GOP_SIZE_30);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (!access("/system/lib64/media/", 0)) {
            ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
        } else {
            ASSERT_EQ(ret, AV_ERR_OK);
        }
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0010Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    format = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_TEMPORAL_SCALABILITY);
    if (cap && format) {
        OH_AVFormat_Destroy(format);
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (!access("/system/lib64/media/", 0)) {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on phone=========="<< endl;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            vEncSample->TEMPORAL_ENABLE = true;
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        } else {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on rk=========="<< endl;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            vEncSample->TEMPORAL_ENABLE = true;
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        }
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0020Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0020.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = false;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}


int VideoTemporalEncodeFunction0440Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0440.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
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

int VideoTemporalEncodeFunction0050Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0050.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
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

int VideoTemporalEncodeFunction0060Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0060.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;

        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
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

int VideoTemporalEncodeFunction0070Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0070.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
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

int VideoTemporalEncodeFunction0080Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0080.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0090Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0090.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0100Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0110Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0110.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0120Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0120.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoTemporalEncodeFunction0130Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0130.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_6;
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

int VideoTemporalEncodeFunction0140Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0140.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
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

int VideoTemporalEncodeFunction0150Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0150.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_9;
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

int VideoTemporalEncodeFunction0160Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0160.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 12;
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

int VideoTemporalEncodeFunction0170Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0170.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        vEncSample->enableForceIDR = true;
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

int VideoTemporalEncodeFunction0180Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0180.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
        vEncSample->enableForceIDR = true;
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

int LTR_FUNC_001Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_001.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Reset());
        vEncSample->ltrParam.ltrCount = LTR_COUNT_INVALID_11;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        return 0;
    }
    return 0;
}

int LTR_FUNC_002Test()
{
    OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char* codecName = OH_AVCapability_GetName(capa);
    if (!strcmp(codecName, "OMX.hisi.video.encoder.hevc")) {
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    } else {
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    }
    return 0;
}

int LTR_FUNC_004Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_004.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 1;
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

int LTR_FUNC_005Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_005.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.useBadLtr = true;
        vEncSample->ltrParam.ltrCount = 1;
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

int LTR_FUNC_006Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_006.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_10;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
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

int LTR_FUNC_007Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_007.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = false;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_10;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
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

int LTR_FUNC_008Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_008.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_2;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.useLtrIndex = 0;
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

int LTR_FUNC_009Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_009.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->ltrParam.ltrCount = -1;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
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

int LTR_FUNC_010Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_010.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
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

int LTR_FUNC_011Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_011.h264";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
        return 0;
    }
    return 0;
}

int LTR_FUNC_012Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_012.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
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

int LTR_FUNC_013Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_013.h265";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
        return 0;
    }
    return 0;
}

int LTR_FUNC_014Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_014.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
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

int LTR_FUNC_015Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_015.h264";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
        return 0;
    }
    return 0;
}

int LTR_FUNC_016Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_016.h265";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
        return 0;
    }
    return 0;
}

int VideoUniformlyEncodeFunction0100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoUniformlyEncodeFunction0200Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        return 0;
    }
    return 0;
}

int VideoUniformlyEncodeFunction0300Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
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

int VideoUniformlyEncodeFunction0400Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
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

int VideoUniformlyEncodeFunction0500Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        return 0;
    }
    return 0;
}

int VideoUniformlyEncodeFunction0600Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
}

int VideoUniformlyEncodeFunction0700Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        return 0;
    }
    return 0;
}

int VideoUniformlyEncodeFunction0800Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
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

int VideoUniformlyEncodeFunction0900Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
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

int VideoUniformlyEncodeFunction1000Test()
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        return 0;
        }
        return 0;
    }
void InitTemporalTest()
{
    SetUpTestCase();
}
