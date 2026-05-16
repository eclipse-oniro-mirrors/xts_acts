/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>D
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "VideoDecApi11Sample.h"
#include "VideoDecNdkSample.h"

#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include "include/CommonTool.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
namespace OHOS {
namespace Media {

namespace {
OH_AVCodec* vdec_ = NULL;
OH_AVCapability* cap = nullptr;
OH_AVCapability* cap_hevc = nullptr;
VDecSignal* signal_;
const string INVALID_CODEC_NAME = "avdec_h264";
string g_codecName;
string g_codecNameHEVC;
OH_AVFormat* format;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t HD_WIDTH = 1280;
constexpr uint32_t HD_HEIGHT = 720;
constexpr uint32_t MAX_SUPPORTED_INSTANCES_EXPECTED = 6;
constexpr int32_t LOOP_COUNT_TWO = 2;
} // namespace

namespace ApiTest {
// SetUpTestCase: Called before all test cases
void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "g_codecName: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
}
// SetUp: Called before each test cases
void SetUp()
{
    signal_ = new VDecSignal();
}
// TearDown: Called after each test cases
void TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
}
} // namespace ApiTest

void VDecNeedInputData(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    cout << "VDecNeedInputData  index:" << index << endl;
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inCond_.notify_all();
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0100()
{
    vdec_ = OH_VideoDecoder_CreateByMime(NULL);
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0200()
{
    vdec_ = OH_VideoDecoder_CreateByName(NULL);
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3300()
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetCallback(NULL, cb_, static_cast<void*>(signal_)));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    OH_AVCodecAsyncCallback cb2_;
    cb2_.onError = NULL;
    cb2_.onStreamChanged = NULL;
    cb2_.onNeedInputData = NULL;
    cb2_.onNeedOutputData = NULL;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb2_, static_cast<void*>(signal_)));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0400()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Destroy(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0500()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1400()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_5000()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    string widthStr = "width";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_5100()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0600()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Start(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0700()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Stop(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0800()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Flush(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0900()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Reset(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1000()
{
    ASSERT_EQ(nullptr, OH_VideoDecoder_GetOutputDescription(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_4100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_Prepare(nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1500()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetSurface(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1600()
{
    vdec_ = OH_VideoDecoder_CreateByName(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1700()
{
    vdec_ = OH_VideoDecoder_CreateByMime(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2200()
{
    bool isValid = false;
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_IsValid(nullptr, &isValid);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    ret = OH_VideoDecoder_IsValid(vdec_, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2500()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_RenderOutputData(NULL, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2600()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputData(vdec_, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2700()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_FreeOutputData(NULL, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2900()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, -1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3000()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());

    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3100()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, -1, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3200()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, 0, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0100
 * @tc.number VIDEO_HWDEC_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_, nullptr);
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_2, nullptr);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0200
 * @tc.number VIDEO_HWDEC_API_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Configure(vdec_, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0300
 * @tc.number VIDEO_HWDEC_API_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Start(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0400
 * @tc.number VIDEO_HWDEC_API_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0400()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0500
 * @tc.number VIDEO_HWDEC_API_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0500()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0600
 * @tc.number VIDEO_HWDEC_API_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0600()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VDecNeedInputData;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void*>(signal_)));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    for (int i = 0; i < LOOP_COUNT_TWO; i++) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, []() { return signal_->inIdxQueue_.size() > 0; });
        uint32_t index = signal_->inIdxQueue_.front();
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        cout << "OH_VideoDecoder_PushInputData  index:" << index << endl;
        if (i == 0) {
            ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_PushInputData(vdec_, index, attr));
        } else {
            ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
        }
    }
    OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    signal_->inIdxQueue_.pop();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0700
 * @tc.number VIDEO_HWDEC_API_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0700()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0800
 * @tc.number VIDEO_HWDEC_API_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Destroy(vdec_));
    vdec_ = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Destroy(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0900
 * @tc.number VIDEO_HWDEC_API_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0900()
{
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_, nullptr);
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_2, nullptr);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1000
 * @tc.number VIDEO_HWDEC_API_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1000()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1100
 * @tc.number VIDEO_HWDEC_API_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(nullptr, format);
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(nullptr, format);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1200
 * @tc.number VIDEO_HWDEC_API_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0100
 * @tc.number VIDEO_HWDEC_CAP_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0100()
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    ASSERT_NE(cap, nullptr);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0200
 * @tc.number VIDEO_HWDEC_CAP_API_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0200()
{
    cap = OH_AVCodec_GetCapability(nullptr, false);
    ASSERT_EQ(cap, nullptr);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0300
 * @tc.number VIDEO_HWDEC_CAP_API_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0300()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0400
 * @tc.number VIDEO_HWDEC_CAP_API_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0400()
{
    cap = OH_AVCodec_GetCapabilityByCategory(nullptr, false, HARDWARE);
    ASSERT_EQ(cap, nullptr);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0500
 * @tc.number VIDEO_HWDEC_CAP_API_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0500()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    ASSERT_TRUE(OH_AVCapability_IsHardware(cap));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0600
 * @tc.number VIDEO_HWDEC_CAP_API_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0600()
{
    ASSERT_FALSE(OH_AVCapability_IsHardware(nullptr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0700
 * @tc.number VIDEO_HWDEC_CAP_API_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0700()
{
    ASSERT_EQ(0, OH_AVCapability_GetMaxSupportedInstances(nullptr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0800
 * @tc.number VIDEO_HWDEC_CAP_API_0800
 * @tc.desc   function test, 不同平台解码器数量不一致, 改为不校验具体数量
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0800()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    string codecName = OH_AVCapability_GetName(cap);
    if (codecName == "OMX.hisi.video.decoder.avc") {
        ASSERT_LT(1, OH_AVCapability_GetMaxSupportedInstances(cap));
    } else {
        ASSERT_EQ(MAX_SUPPORTED_INSTANCES_EXPECTED, OH_AVCapability_GetMaxSupportedInstances(cap));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0900
 * @tc.number VIDEO_HWDEC_CAP_API_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0900()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    ASSERT_EQ(g_codecName, OH_AVCapability_GetName(cap));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1000
 * @tc.number VIDEO_HWDEC_CAP_API_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1000()
{
    const char* name = OH_AVCapability_GetName(nullptr);
    ASSERT_NE(name, nullptr);
    ASSERT_EQ(strlen(name), 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3100
 * @tc.number VIDEO_HWDEC_CAP_API_3100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3200
 * @tc.number VIDEO_HWDEC_CAP_API_3200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3200()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3300
 * @tc.number VIDEO_HWDEC_CAP_API_3300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3300()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    cout << "WidthAlignment " << alignment << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3400
 * @tc.number VIDEO_HWDEC_CAP_API_3400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3400()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3500
 * @tc.number VIDEO_HWDEC_CAP_API_3500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3500()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3600
 * @tc.number VIDEO_HWDEC_CAP_API_3600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3600()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, &alignment);
    cout << "HeightAlignment " << alignment << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3700
 * @tc.number VIDEO_HWDEC_CAP_API_3700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3700()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3800
 * @tc.number VIDEO_HWDEC_CAP_API_3800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3800()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3900
 * @tc.number VIDEO_HWDEC_CAP_API_3900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_3900()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4000
 * @tc.number VIDEO_HWDEC_CAP_API_4000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4100
 * @tc.number VIDEO_HWDEC_CAP_API_4100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4200
 * @tc.number VIDEO_HWDEC_CAP_API_4200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4200()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4300
 * @tc.number VIDEO_HWDEC_CAP_API_4300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4300()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4400
 * @tc.number VIDEO_HWDEC_CAP_API_4400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4400()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4500
 * @tc.number VIDEO_HWDEC_CAP_API_4500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4500()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4600
 * @tc.number VIDEO_HWDEC_CAP_API_4600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4600()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4700
 * @tc.number VIDEO_HWDEC_CAP_API_4700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4700()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4800
 * @tc.number VIDEO_HWDEC_CAP_API_4800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4800()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4900
 * @tc.number VIDEO_HWDEC_CAP_API_4900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_4900()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5000
 * @tc.number VIDEO_HWDEC_CAP_API_5000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    SafeMemcpy(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ASSERT_GE(heightRange.minVal, 0);
    ASSERT_GT(heightRange.maxVal, 0);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(widthRange.minVal, 0);
    ASSERT_GT(widthRange.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1700
 * @tc.number VIDEO_HWDEC_CAP_API_1700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1700()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    SafeMemcpy(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
        ASSERT_GE(heightRange.minVal, 0);
        ASSERT_GT(heightRange.maxVal, 0);
        ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(widthRange.minVal, 0);
        ASSERT_GT(widthRange.maxVal, 0);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5100
 * @tc.number VIDEO_HWDEC_CAP_API_5100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5100()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5200
 * @tc.number VIDEO_HWDEC_CAP_API_5200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5200()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0));
    return SUCCESS_CODE;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5300
 * @tc.number VIDEO_HWDEC_CAP_API_5300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5300()
{
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT));
    return SUCCESS_CODE;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_9400
 * @tc.number VIDEO_HWDEC_CAP_API_9400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_9400()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoHeightRange(capability, &heightRange));
    ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoWidthRange(capability, &widthRange));
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, widthRange.maxVal + 1, heightRange.maxVal + 1));
    return SUCCESS_CODE;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5400
 * @tc.number VIDEO_HWDEC_CAP_API_5400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5400()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5500
 * @tc.number VIDEO_HWDEC_CAP_API_5500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5500()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5600
 * @tc.number VIDEO_HWDEC_CAP_API_5600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5600()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5700
 * @tc.number VIDEO_HWDEC_CAP_API_5700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5700()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1600
 * @tc.number VIDEO_HWDEC_CAP_API_1600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1600()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5800
 * @tc.number VIDEO_HWDEC_CAP_API_5800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5800()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5900
 * @tc.number VIDEO_HWDEC_CAP_API_5900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_5900()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6000
 * @tc.number VIDEO_HWDEC_CAP_API_6000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6100
 * @tc.number VIDEO_HWDEC_CAP_API_6100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6200
 * @tc.number VIDEO_HWDEC_CAP_API_6200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6200()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, heightRange.maxVal, &widthRange);
    cout << "minval=" << widthRange.minVal << "  maxval=" << widthRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, HD_WIDTH, HD_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, widthRange.maxVal, heightRange.maxVal, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6300
 * @tc.number VIDEO_HWDEC_CAP_API_6300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6300()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false,
              OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6400
 * @tc.number VIDEO_HWDEC_CAP_API_6400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6400()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false,
              OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, DEFAULT_FRAME_RATE));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6500
 * @tc.number VIDEO_HWDEC_CAP_API_6500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6500()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6600
 * @tc.number VIDEO_HWDEC_CAP_API_6600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6600()
{
    ASSERT_EQ(
        false,
        OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6700
 * @tc.number VIDEO_HWDEC_CAP_API_6700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6700()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true,
              OH_AVCapability_AreVideoSizeAndFrameRateSupported(
                  capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6800
 * @tc.number VIDEO_HWDEC_CAP_API_6800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6800()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6900
 * @tc.number VIDEO_HWDEC_CAP_API_6900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_6900()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7000
 * @tc.number VIDEO_HWDEC_CAP_API_7000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7100
 * @tc.number VIDEO_HWDEC_CAP_API_7100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    ASSERT_NE(nullptr, pixelFormat);
    ASSERT_GT(pixelFormatNum, 0);
    ASSERT_EQ(AV_ERR_OK, ret);
    for (int i = 0; i < pixelFormatNum; i++) {
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, vdec_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        ASSERT_GE(pixelFormat[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
        OH_AVFormat_Destroy(format);
        OH_VideoDecoder_Destroy(vdec_);
    }
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, vdec_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
    ASSERT_NE(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1200
 * @tc.number VIDEO_HWDEC_CAP_API_1200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1200()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
        ASSERT_NE(nullptr, pixelFormat);
        ASSERT_GT(pixelFormatNum, 0);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < pixelFormatNum; i++) {
            vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            ASSERT_NE(nullptr, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            ASSERT_GE(pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec_);
        }
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        ASSERT_NE(nullptr, vdec_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
        ASSERT_NE(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7200
 * @tc.number VIDEO_HWDEC_CAP_API_7200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7200()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7300
 * @tc.number VIDEO_HWDEC_CAP_API_7300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7300()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7400
 * @tc.number VIDEO_HWDEC_CAP_API_7400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7400()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7500
 * @tc.number VIDEO_HWDEC_CAP_API_7500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7500()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(profileNum, 0);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        ASSERT_GE(profiles[i], 0);
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1300
 * @tc.number VIDEO_HWDEC_CAP_API_1300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1300()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(profileNum, 0);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_GE(profiles[i], 0);
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7600
 * @tc.number VIDEO_HWDEC_CAP_API_7600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7600()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7700
 * @tc.number VIDEO_HWDEC_CAP_API_7700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7700()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7800
 * @tc.number VIDEO_HWDEC_CAP_API_7800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7800()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t levelNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, nullptr, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7900
 * @tc.number VIDEO_HWDEC_CAP_API_7900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_7900()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, &levels, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8000
 * @tc.number VIDEO_HWDEC_CAP_API_8000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_8000()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(profileNum, 0);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        ASSERT_GE(profiles[i], 0);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        ASSERT_GT(levelNum, 0);
        for (int j = 0; j < levelNum; j++) {
            ASSERT_GE(levels[j], 0);
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1400
 * @tc.number VIDEO_HWDEC_CAP_API_1400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_1400()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    uint32_t profileNum = 0;
    const int32_t* profiles = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(profileNum, 0);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_GE(profiles[i], 0);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            ASSERT_GT(levelNum, 0);
            for (int j = 0; j < levelNum; j++) {
                ASSERT_GE(levels[j], 0);
            }
        }
    }
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8100
 * @tc.number VIDEO_HWDEC_CAP_API_8100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_8100()
{
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8200
 * @tc.number VIDEO_HWDEC_CAP_API_8200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_8200()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(capability, 1, 1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8300
 * @tc.number VIDEO_HWDEC_CAP_API_8300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_8300()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_BASELINE, 1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ATTIME_API_0010
 * @tc.number VIDEO_HWDEC_ATTIME_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_ATTIME_API_0010()
{
    shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
    const char* INP_DIR_720_30 = "/data/storage/el2/base/files/1280_720_30_10Mb.h264";
    vDecSample->inpDir = INP_DIR_720_30;
    vDecSample->sfOutput = true;
    vDecSample->defaultWidth = HD_WIDTH;
    vDecSample->defaultHeight = HD_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->rsAtTime = true;
    vDecSample->isAPI = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDecSurface(g_codecName));
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->errCount);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0010
 * @tc.number VIDEO_DECODE_SYNC_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0010()
{
    uint32_t index;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_QueryInputBuffer(nullptr, &index, -1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0020
 * @tc.number VIDEO_DECODE_SYNC_API_0020
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0020()
{
    uint32_t index;
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, vdec_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Prepare(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_QueryInputBuffer(vdec_, &index, INT64_MAX));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0030
 * @tc.number VIDEO_DECODE_SYNC_API_0030
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0030()
{
    uint32_t index;
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, vdec_);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Prepare(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_QueryInputBuffer(vdec_, &index, INT64_MIN));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0040
 * @tc.number VIDEO_DECODE_SYNC_API_0040
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0040()
{
    ASSERT_EQ(nullptr, OH_VideoDecoder_GetInputBuffer(nullptr, 1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0050
 * @tc.number VIDEO_DECODE_SYNC_API_0050
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0050()
{
    uint32_t index;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_QueryOutputBuffer(nullptr, &index, -1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0060
 * @tc.number VIDEO_DECODE_SYNC_API_0060
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0060()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->enableSyncMode = 1;
    vDecSample->syncOutputWaitTime = INT64_MAX;
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0070
 * @tc.number VIDEO_DECODE_SYNC_API_0070
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0070()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->enableSyncMode = 1;
    vDecSample->syncOutputWaitTime = INT64_MIN;
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0080
 * @tc.number VIDEO_DECODE_SYNC_API_0080
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_DECODE_SYNC_API_0080()
{
    ASSERT_EQ(nullptr, OH_VideoDecoder_GetOutputBuffer(nullptr, 1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_FORMAT_API_0010
 * @tc.number VIDEO_HWDEC_FORMAT_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_HWDEC_FORMAT_API_0010()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    OH_AVCapability_GetVideoSupportedNativeBufferFormats(
        nullptr, &(vDecSample->pixlFormats), &(vDecSample->pixlFormatNum));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_FORMAT_API_0020
 * @tc.number VIDEO_HWDEC_FORMAT_API_0020
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_HWDEC_FORMAT_API_0020()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* avcodecMimeType = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    OH_AVCapability* capability = OH_AVCodec_GetCapability(avcodecMimeType, false);
    OH_AVCapability_GetVideoSupportedNativeBufferFormats(capability, &(vDecSample->pixlFormats), nullptr);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0010
 * @tc.number VIDEO_HWDEC_API_ADD_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_ADD_0010()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_, nullptr);
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Prepare(vdec_));
    uint32_t index = 0;
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, 0));
    OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0020
 * @tc.number VIDEO_HWDEC_API_ADD_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_ADD_0020()
{
    ASSERT_EQ(nullptr, OH_AVBuffer_GetNativeBuffer(nullptr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0030
 * @tc.number VIDEO_HWDEC_API_ADD_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_ADD_0030()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_DISPOSABLE;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0040
 * @tc.number VIDEO_HWDEC_API_ADD_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_ADD_0040()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_INCOMPLETE_FRAME;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0050()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_INCOMPLETE_FRAME;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, -1, attr));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0060()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputData(vdec_, -1));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0070()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_PushInputBuffer(vdec_, -1));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0080()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputBuffer(vdec_, -1));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0090()
{
    const int64_t kInvalidTimestamp = -100000000;
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, -1, kInvalidTimestamp));
    return SUCCESS_CODE;
}

int VIDEO_HWDEC_API_ADD_0100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputBuffer(vdec_, -1));
    return SUCCESS_CODE;
}
} // namespace Media
} // namespace OHOS