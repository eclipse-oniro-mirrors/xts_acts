/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/ActsFuncTest.h"
#include <memory>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <string>
#include "include/VideodecApi11SampleTest.h"
#include "include/VideodecNdkSampleTest.h"

using namespace std;
using namespace OHOS::Media;

namespace {
constexpr int SWDEC_SUCCESS = 0;
// G.CNS.02: resolution/framerate constants to avoid magic numbers
constexpr uint32_t K_WIDTH_1920 = 1920;
constexpr uint32_t K_WIDTH_1280 = 1280;
constexpr uint32_t K_WIDTH_1104 = 1104;
constexpr uint32_t K_HEIGHT_1080 = 1080;
constexpr uint32_t K_HEIGHT_720 = 720;
constexpr uint32_t K_HEIGHT_622 = 622;
constexpr double K_FRAME_RATE_30 = 30.0;
constexpr uint32_t K_REPEAT_START_STOP_OR_FLUSH_BEFORE_EOS_COUNT = 5;
const char* INP_DIR_720_30 = "/data/storage/el2/base/haps/entry_test/files/1280_720_30_10Mb.h264";
const char* INP_DIR_1080_30 = "/data/storage/el2/base/haps/entry_test/files/1920_1080_10_30Mb.h264";
const char* CODEC_NAME_AVC = "OH.Media.Codec.Decoder.Video.AVC";

OH_AVCapability* g_cap = nullptr;
string g_codecNameAvc;

void InitSwdecCapability()
{
    if (g_cap == nullptr) {
        g_cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
        if (g_cap != nullptr) {
            g_codecNameAvc = OH_AVCapability_GetName(g_cap);
        }
    }
}
} // namespace

namespace Acts {
namespace SwDecoder {

int VideoSwdecFunction0200()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName("OMX.h264.decode.111.222.333");
    if (vdec != nullptr) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecFunction0300()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    int ret = vDecSample->RunVideoDec(CODEC_NAME_AVC);
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction0400()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->surfaceOutput = true;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    int ret = vDecSample->RunVideoDecSurface(CODEC_NAME_AVC);
    if (ret == AV_ERR_SURFACE_UNAVAILABLE_SKIP || ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    bool isValid = true;
    if (vDecSample->vdec_ != nullptr) {
        (void)OH_VideoDecoder_IsValid(vDecSample->vdec_, &isValid);
    }
    if (isValid) {
        return -1;
    }
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction0700()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction0800()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->beforeEosInput = true;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction4000()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = true;
    vDecSample->beforeEosInput = true;
    int ret = vDecSample->RunVideoDecSurface(CODEC_NAME_AVC);
    if (ret == AV_ERR_SURFACE_UNAVAILABLE_SKIP || ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1000()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    vDecSample->afterEosDestoryCodec = false;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK || vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->Reset() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK || vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1100()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    vDecSample->afterEosDestoryCodec = false;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1200()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    vDecSample->repeatStartStopBeforeEos = K_REPEAT_START_STOP_OR_FLUSH_BEFORE_EOS_COUNT;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1300()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    vDecSample->repeatStartFlushBeforeEos = K_REPEAT_START_STOP_OR_FLUSH_BEFORE_EOS_COUNT;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1400()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_720_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1500()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1280;
    vDecSample->defaultHeight = K_HEIGHT_720;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecFunction1600()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir =
        "/data/app/el2/100/base/com.example.actsswdecodertest/haps/entry_test/files/resolutionChange.h264";
    vDecSample->defaultWidth = K_WIDTH_1104;
    vDecSample->defaultHeight = K_HEIGHT_622;
    vDecSample->defaultFrameRate = 30U;
    vDecSample->surfaceOutput = false;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK || vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoDecodeSyncSw264Func0010()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = K_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->sleepOnFPS = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAvc) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartSyncVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoDecodeSyncSw264Func0020()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = K_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->sleepOnFPS = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAvc) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartSyncVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoDecodeSyncSw264Func0040()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = K_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->sleepOnFPS = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAvc) != AV_ERR_OK ||
        vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    int ret = vDecSample->StartSyncVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

int VideoSwdecodeBlankFrame0010()
{
    InitSwdecCapability();
    if (g_cap == nullptr) {
        return SWDEC_SUCCESS;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = K_WIDTH_1920;
    vDecSample->defaultHeight = K_HEIGHT_1080;
    vDecSample->defaultFrameRate = K_FRAME_RATE_30;
    vDecSample->enbleBlankFrame = 1;
    vDecSample->surfaceOutput = false;
    int ret = vDecSample->RunVideoDec(g_codecNameAvc);
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return (vDecSample->errCount == 0) ? SWDEC_SUCCESS : -1;
}

} // namespace SwDecoder
} // namespace Acts
