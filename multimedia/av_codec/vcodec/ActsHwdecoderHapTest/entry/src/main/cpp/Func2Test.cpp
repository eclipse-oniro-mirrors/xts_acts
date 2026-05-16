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
#include "VideoDecApi11Sample.h"
#include "VideoDecNdkSample.h"

#include <multimedia/player_framework/native_avcapability.h>
#include "include/CommonTool.h"
#include <multimedia/player_framework/native_avcodec_videodecoder.h>

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace OHOS {
namespace Media {

namespace {
const char* INP_DIR_720_30 = "/data/storage/el2/base/files/1280_720_30_10Mb.h264";
const char* INP_DIR_1080_30 = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
const char* INP_DIR_1080_20 = "/data/storage/el2/base/files/1920_1080_20M_30.h265";
const char* INP_DIR_VIVID = "/data/storage/el2/base/files/hlg_vivid_4k.h265";
const char* INP_DIR_VVC_1080 = "/data/storage/el2/base/files/1920_1080_10bit.vvc";
const char* INP_DIR_IPB_265_10BIT = "/data/storage/el2/base/files/176_144_Main10.h265";
const char* INP_DIR_IPB_265_8BIT = "/data/storage/el2/base/files/720_1280_25_8bit.h265";
const char* INP_DIR_IPB_264_8BIT = "/data/storage/el2/base/files/720_1280_25_avcc.h264";

static OH_AVCapability* cap = nullptr;
static OH_AVCapability* cap_hevc = nullptr;
static OH_AVCapability* cap_vvc = nullptr;
static string g_codecName = "";
static string g_codecNameHEVC = "";
static string g_codecNameVVC = "";
const std::vector<OH_NativeBuffer_TransformType> transfromTypes = {
    NATIVEBUFFER_ROTATE_NONE,   NATIVEBUFFER_ROTATE_90,     NATIVEBUFFER_ROTATE_180,    NATIVEBUFFER_ROTATE_270,
    NATIVEBUFFER_FLIP_H,        NATIVEBUFFER_FLIP_V,        NATIVEBUFFER_FLIP_H_ROT90,  NATIVEBUFFER_FLIP_V_ROT90,
    NATIVEBUFFER_FLIP_H_ROT180, NATIVEBUFFER_FLIP_V_ROT180, NATIVEBUFFER_FLIP_H_ROT270, NATIVEBUFFER_FLIP_V_ROT270
};

constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
constexpr int32_t DEFAULT_FRAME_RATE = 30;
constexpr int32_t STREAM_CALLBACK_KEY = 35;
constexpr int32_t UHD_WIDTH = 3840;
constexpr int32_t UHD_HEIGHT = 2160;
constexpr int32_t HD_WIDTH = 1280;
constexpr int32_t HD_HEIGHT = 720;
constexpr int32_t PORTRAIT_WIDTH = 720;
constexpr int32_t PORTRAIT_HEIGHT = 1280;
constexpr int32_t QCIF_WIDTH = 176;
constexpr int32_t QCIF_HEIGHT = 144;
constexpr int32_t CROP_WIDTH_1104 = 1104;
constexpr int32_t CROP_HEIGHT_622 = 622;
constexpr int32_t BUFFER_INDEX_OFFSET = 100;
constexpr int32_t SYNC_WAIT_TIME_US = 100000;

static bool CapConfigCheck(OH_AVCapability* capability, int32_t profile, int32_t level)
{
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    bool isGetContain = false;
    bool isSupport = OH_AVCapability_AreProfileAndLevelSupported(capability, profile, level);
    OH_AVErrCode err = OH_AVCapability_GetSupportedLevelsForProfile(capability, profile, &levels, &levelNum);
    if (!isSupport && err != AV_ERR_OK) {
        return true;
    }
    if (err != AV_ERR_OK) {
        cout << "OH_AVCapability_GetSupportedLevelsForProfile false err: " << err << endl;
        return false;
    }
    for (uint32_t j = 0; j < levelNum; j++) {
        if (levels[j] == level) {
            isGetContain = true;
            break;
        }
    }
    if (isSupport != isGetContain) {
        cout << "isSupport != isGetContain isSupport:" << static_cast<int32_t>(isSupport) << "   isGetContain:"
             << static_cast<int32_t>(isGetContain) << endl;
        return false;
    }
    return true;
}
} // namespace

namespace Func2Test {
void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
    cap_vvc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VVC, false, HARDWARE);
    g_codecNameVVC = OH_AVCapability_GetName(cap_vvc);
    cout << "g_codecNameVVC: " << g_codecNameVVC << endl;
}
} // namespace Func2Test

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0010()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->ConfigureVideoDecoder());
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0020()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->QueryInputBuffer(index, 0));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0030
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0030()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->QueryOutputBuffer(index, 0));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0040()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->SetVideoDecoderCallback());
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0050
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0050()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0060
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0060()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vDecSample->QueryInputBuffer(index, 0));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0070
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0070()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vDecSample->QueryOutputBuffer(index, 0));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0080
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0080()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->enableSyncMode = 1;
        vDecSample->getInputBufferIndexRepeat = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->OpenFile());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        vDecSample->SyncInputFunc();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0090
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0090()
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->QueryInputBuffer(index, -1));
        ASSERT_EQ(nullptr, vDecSample->GetInputBuffer(index + BUFFER_INDEX_OFFSET));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0100
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0100()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->getOutputBufferIndexRepeated = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0110
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0110
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0110()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->getOutputBufferIndexNoExisted = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0120
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0120
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_FUNC_0120()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0120.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->syncInputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0130
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_DECODE_SYNC_FUNC_0130()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0130.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->syncInputWaitTime = SYNC_WAIT_TIME_US;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0140
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_FUNC_0140()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0140.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->syncOutputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0150
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_DECODE_SYNC_FUNC_0150()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0150.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->syncOutputWaitTime = SYNC_WAIT_TIME_US;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0160
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0160()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0160.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->queryInputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0170
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_FUNC_0170()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->outDir = "/data/storage/el2/base/files/VIDEO_DECODE_SYNC_0170.yuv";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->queryOutputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_HW264_FUNC_0010()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_DECODE_SYNC_HW264_FUNC_0020()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_HW265_FUNC_0010()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_HW265_FUNC_0020()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_HW265_FUNC_0040()
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VIVID;
        vDecSample->defaultProfile = HEVC_PROFILE_MAIN_10;
        vDecSample->defaultWidth = UHD_WIDTH;
        vDecSample->defaultHeight = UHD_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        vDecSample->useHDRSource = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_HW266_FUNC_0010()
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_HW266_FUNC_0020()
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_HW266_FUNC_0040()
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->defaultProfile = HEVC_PROFILE_MAIN_10;
        vDecSample->defaultWidth = UHD_WIDTH;
        vDecSample->defaultHeight = UHD_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_720_30;
        vDecSample->defaultWidth = HD_WIDTH;
        vDecSample->defaultHeight = HD_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010()
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_H264_BLANK_FRAME_0010
 * @tc.number VIDEO_DECODE_H264_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_H264_BLANK_FRAME_0010()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_720_30;
        vDecSample->defaultWidth = HD_WIDTH;
        vDecSample->defaultHeight = HD_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_H265_BLANK_FRAME_0020
 * @tc.number VIDEO_DECODE_H265_BLANK_FRAME_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_H265_BLANK_FRAME_0020()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_H266_BLANK_FRAME_0030
 * @tc.number VIDEO_DECODE_H266_BLANK_FRAME_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_H266_BLANK_FRAME_0030()
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameVVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0001
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0001()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_264_8BIT;
        vDecSample->defaultWidth = PORTRAIT_WIDTH;
        vDecSample->defaultHeight = PORTRAIT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0002
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_LOW_LATENCY_0002()
{
    if (cap != nullptr) {
        if (OH_AVCapability_IsFeatureSupported(cap, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->inpDir = INP_DIR_IPB_264_8BIT;
            vDecSample->defaultWidth = PORTRAIT_WIDTH;
            vDecSample->defaultHeight = PORTRAIT_HEIGHT;
            vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0003
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0003()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_264_8BIT;
        vDecSample->defaultWidth = PORTRAIT_WIDTH;
        vDecSample->defaultHeight = PORTRAIT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0004
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0004()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_265_8BIT;
        vDecSample->defaultWidth = PORTRAIT_WIDTH;
        vDecSample->defaultHeight = PORTRAIT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0005
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0005()
{
    if (cap_hevc != nullptr) {
        if (OH_AVCapability_IsFeatureSupported(cap_hevc, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->inpDir = INP_DIR_IPB_265_8BIT;
            vDecSample->defaultWidth = PORTRAIT_WIDTH;
            vDecSample->defaultHeight = PORTRAIT_HEIGHT;
            vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0006
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0006()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_265_8BIT;
        vDecSample->defaultWidth = PORTRAIT_WIDTH;
        vDecSample->defaultHeight = PORTRAIT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0007
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0007()
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_265_10BIT;
        vDecSample->defaultWidth = QCIF_WIDTH;
        vDecSample->defaultHeight = QCIF_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        vDecSample->is8bitYuv = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0008
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0008()
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        if (OH_AVCapability_IsFeatureSupported(cap_hevc, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->inpDir = INP_DIR_IPB_265_10BIT;
            vDecSample->defaultWidth = QCIF_WIDTH;
            vDecSample->defaultHeight = QCIF_HEIGHT;
            vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            vDecSample->is8bitYuv = false;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0009
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_LOW_LATENCY_0009()
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_IPB_265_10BIT;
        vDecSample->defaultWidth = QCIF_WIDTH;
        vDecSample->defaultHeight = QCIF_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->is8bitYuv = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_PIXE_FORMAT_0030
 * @tc.number VIDEO_HWDEC_PIXE_FORMAT_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_PIXE_FORMAT_0030()
{
    if (cap_vvc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_VVC_1080;
        vDecSample->isGetVideoSupportedPixelFormats = true;
        vDecSample->isGetFormatKey = true;
        vDecSample->avcodecMimeType = OH_AVCODEC_MIMETYPE_VIDEO_VVC;
        vDecSample->isEncoder = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_LT(1, vDecSample->pixlFormatNum);
        ASSERT_EQ(STREAM_CALLBACK_KEY, vDecSample->firstCallBackKey);
        ASSERT_EQ(STREAM_CALLBACK_KEY, vDecSample->onStreamChangedKey);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_TRANSFORM_0010
 * @tc.number VIDEO_DECODE_TRANSFORM_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_TRANSFORM_0010()
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        vDecSample->sfOutput = true;
        vDecSample->CreateSurface();
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->setTransform = true;
        vDecSample->defaultTransform = -1;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        for (const auto& transformtype : transfromTypes) {
            vDecSample->defaultTransform = transformtype;
            ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
            ASSERT_EQ(vDecSample->defaultTransform, vDecSample->GetSurfaceTransform(0));
            ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        }
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetSurface());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        ASSERT_EQ(vDecSample->defaultTransform, vDecSample->GetSurfaceTransform(0));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_TRANSFORM_0020
 * @tc.number VIDEO_DECODE_TRANSFORM_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_TRANSFORM_0020()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        vDecSample->sfOutput = true;
        vDecSample->CreateSurface();
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->setTransform = true;
        vDecSample->defaultTransform = -1;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        for (const auto& transformtype : transfromTypes) {
            vDecSample->defaultTransform = transformtype;
            ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
            ASSERT_EQ(vDecSample->defaultTransform, vDecSample->GetSurfaceTransform(0));
            ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        }
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetSurface());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        ASSERT_EQ(vDecSample->defaultTransform, vDecSample->GetSurfaceTransform(0));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_RESOLUTION_0010
 * @tc.number VIDEO_DECODE_RESOLUTION_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_RESOLUTION_0010()
{
    if (g_codecName.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->defaultWidth = CROP_WIDTH_1104;
        vDecSample->defaultHeight = CROP_HEIGHT_622;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->enableSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_LT(0, vDecSample->changeCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_ANOTHER_0010
 * @tc.number VIDEO_DECODE_ANOTHER_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_ANOTHER_0010()
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = INP_DIR_1080_20;
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        auto vDecSample2 = make_shared<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample2->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample2->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Flush());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Stop());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample2->Reset());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_CAPABILITY_CONFIG_0010
 * @tc.number VIDEO_CAPABILITY_CONFIG_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_CAPABILITY_CONFIG_0010()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    OH_AVCodec* vdec = nullptr;
    if (cap != nullptr) {
        g_codecName = OH_AVCapability_GetName(cap);
        vdec = OH_VideoDecoder_CreateByName(g_codecName.c_str());
        ASSERT_NE(nullptr, vdec);
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_1));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_1b));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_11));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_12));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_13));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_2));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_21));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_22));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_3));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_31));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_32));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_4));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_41));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_42));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_5));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_BASELINE, AVC_LEVEL_51));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_52));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_6));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_HIGH, AVC_LEVEL_61));
        ASSERT_TRUE(CapConfigCheck(cap, AVC_PROFILE_MAIN, AVC_LEVEL_62));
        ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Destroy(vdec));
    } else {
        vdec = OH_VideoDecoder_CreateByName(nullptr);
        ASSERT_EQ(nullptr, vdec);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_CAPABILITY_CONFIG_0020
 * @tc.number VIDEO_CAPABILITY_CONFIG_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_CAPABILITY_CONFIG_0020()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    OH_AVCodec* vdec = nullptr;
    if (cap_hevc != nullptr) {
        g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
        vdec = OH_VideoDecoder_CreateByName(g_codecNameHEVC.c_str());
        ASSERT_NE(nullptr, vdec);
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN, HEVC_LEVEL_1));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_2));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_STILL, HEVC_LEVEL_21));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10_HDR10, HEVC_LEVEL_3));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10_HDR10_PLUS, HEVC_LEVEL_31));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN, HEVC_LEVEL_4));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_41));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_STILL, HEVC_LEVEL_5));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10_HDR10, HEVC_LEVEL_51));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10_HDR10_PLUS, HEVC_LEVEL_52));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN, HEVC_LEVEL_6));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_61));
        ASSERT_TRUE(CapConfigCheck(cap_hevc, HEVC_PROFILE_MAIN_STILL, HEVC_LEVEL_62));
        ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Destroy(vdec));
    } else {
        vdec = OH_VideoDecoder_CreateByName(nullptr);
        ASSERT_EQ(nullptr, vdec);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_CAPABILITY_CONFIG_0030
 * @tc.number VIDEO_CAPABILITY_CONFIG_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_CAPABILITY_CONFIG_0030()
{
    cap_vvc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VVC, false, HARDWARE);
    OH_AVCodec* vdec = nullptr;
    if (cap_vvc != nullptr) {
        g_codecNameVVC = OH_AVCapability_GetName(cap_vvc);
        vdec = OH_VideoDecoder_CreateByName(g_codecNameVVC.c_str());
        ASSERT_NE(nullptr, vdec);
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_10, VVC_LEVEL_1));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12, VVC_LEVEL_2));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12_INTRA, VVC_LEVEL_21));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MULTI_MAIN_10, VVC_LEVEL_3));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_10_444, VVC_LEVEL_31));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12_444, VVC_LEVEL_4));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_16_444, VVC_LEVEL_41));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12_444_INTRA, VVC_LEVEL_5));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_16_444_INTRA, VVC_LEVEL_51));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MULTI_MAIN_10_444, VVC_LEVEL_52));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_10_STILL, VVC_LEVEL_6));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12_STILL, VVC_LEVEL_61));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_10_444_STILL, VVC_LEVEL_62));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_12_444_STILL, VVC_LEVEL_63));
        ASSERT_TRUE(CapConfigCheck(cap_vvc, VVC_PROFILE_MAIN_16_444_STILL, VVC_LEVEL_155));
        ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Destroy(vdec));
    } else {
        vdec = OH_VideoDecoder_CreateByName(nullptr);
        ASSERT_EQ(nullptr, vdec);
    }
    return SUCCESS_CODE;
}
} // namespace Media
} // namespace OHOS