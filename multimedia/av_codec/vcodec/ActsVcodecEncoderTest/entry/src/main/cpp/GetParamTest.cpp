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
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

void TestTearDownGetparam()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
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
}

int VideoEncodeMseQp0100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = false;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0100.h265";
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

int VideoEncodeMseQp0200Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = true;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0200.h265";
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

int VideoEncodeMseQp0300Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = false;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0300.h265";
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

int VideoEncodeMseQp0400Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = true;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0400.h265";
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

int VideoEncodeRepeat0100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableRepeat = true;
        vEncSample->setMaxCount = true;
        vEncSample->DEFAULT_FRAME_AFTER = 0;
        vEncSample->DEFAULT_MAX_COUNT = -1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        return 0;
    }
    return 0;
}

int VideoEncodePreProcess0100Test()
{
    if (cap != nullptr && !access("/system/lib64/ndk/libfast_image.so", 0)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->runDualEncoder = true;
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0010_1.h264";
        vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0010_2.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_AVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateSecondaryEncoder());
        vEncSample->SURF_INPUT = false;
        int encWidth = 1280;
        int encHeight = 720;
        vEncSample->DEFAULT_WIDTH = encWidth;
        vEncSample->DEFAULT_HEIGHT = encHeight;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchSecondaryEncoder());
        vEncSample->preProcessParameter.configEnable = true;
        vEncSample->preProcessParameter.enableDownsampling = true;
        int encDownsamplingWidth = 640;
        int encDownsamplingHeight = 360;
        vEncSample->preProcessParameter.downsamplingWidth = encDownsamplingWidth;
        vEncSample->preProcessParameter.downsamplingHeight = encDownsamplingHeight;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        vEncSample->SURF_INPUT = true;
        int encDownWidth = 380;
        int encDownHeight = 200;
        vEncSample->preProcessParameter.downsamplingWidth = encDownWidth;
        vEncSample->preProcessParameter.downsamplingHeight = encDownHeight;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchPrimaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartSecondaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodePreProcess0200Test()
{
    if (cap_hevc != nullptr && !access("/system/lib64/ndk/libfast_image.so", 0)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->runDualEncoder = true;
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0020_1.h265";
        vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0020_2.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_HEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateSecondaryEncoder());
        int encWidth = 1280;
        int encHeight = 720;
        int encCropLeft = 100;
        int encCropRight = 1199;
        int encCropTop = 100;
        int encCropBottom = 699;
        vEncSample->SURF_INPUT = false;
        vEncSample->DEFAULT_WIDTH = encWidth;
        vEncSample->DEFAULT_HEIGHT = encHeight;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchSecondaryEncoder());
        vEncSample->preProcessParameter.configEnable = true;
        vEncSample->preProcessParameter.enableCrop = true;
        vEncSample->preProcessParameter.cropLeft = encCropLeft;
        vEncSample->preProcessParameter.cropRight = encCropRight;
        vEncSample->preProcessParameter.cropTop = encCropTop;
        vEncSample->preProcessParameter.cropBottom = encCropBottom;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        vEncSample->SURF_INPUT = true;
        vEncSample->preProcessParameter.enableCrop = true;
        int vedioEncCropLeft = 50;
        int vedioEncCropRight = 999;
        int vedioEncCropTop = 0;
        int vedioEncCropBottom = 499;
        vEncSample->preProcessParameter.cropLeft = vedioEncCropLeft;
        vEncSample->preProcessParameter.cropRight = vedioEncCropRight;
        vEncSample->preProcessParameter.cropTop = vedioEncCropTop;
        vEncSample->preProcessParameter.cropBottom = vedioEncCropBottom;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchPrimaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartSecondaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

int VideoEncodePreProcess0300Test()
{
    if (cap != nullptr && !access("/system/lib64/ndk/libfast_image.so", 0)) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->runDualEncoder = true;
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0030_1.h264";
        vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0030_2.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_AVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateSecondaryEncoder());
        vEncSample->SURF_INPUT = false;
        int encVideoDefaultWidth = 1280;
        int encVideoDefaultHeight = 720;
        double encDropFrameRate = 25.57;
        vEncSample->DEFAULT_WIDTH = encVideoDefaultWidth;
        vEncSample->DEFAULT_HEIGHT = encVideoDefaultHeight;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchSecondaryEncoder());
        vEncSample->preProcessParameter.configEnable = true;
        vEncSample->preProcessParameter.enableDFrame = true;
        vEncSample->preProcessParameter.dropFrameRate = encDropFrameRate;
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        vEncSample->SURF_INPUT = true;
        vEncSample->preProcessParameter.enableDFrame = true;
        double encDropFrameNum = 15.89;
        vEncSample->preProcessParameter.dropFrameRate = encDropFrameNum;
        ASSERT_EQ(AV_ERR_OK, vEncSample->SwitchPrimaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetDualCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartSecondaryEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    }
    return 0;
}

void InitGetparamTest()
{
    SetUpTestCase();
}