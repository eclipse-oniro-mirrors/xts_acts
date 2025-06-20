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

#include <iostream>
#include <cstdio>
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>

#include "gtest/gtest.h"
#include "videodec_ndk_sample.h"
#include "videodec_api11_sample.h"
#include "native_avcodec_videodecoder.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "native_avcapability.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class HwdecApiNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

namespace {
OH_AVCodec *vdec_ = NULL;
OH_AVCapability *cap = nullptr;
VDecSignal *signal_;
const string INVALID_CODEC_NAME = "avdec_h264";
string g_codecName;
OH_AVFormat *format;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr double DEFAULT_FRAME_RATE = 30.0;
} // namespace

void HwdecApiNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "g_codecName: " << g_codecName << endl;
}
void HwdecApiNdkTest::TearDownTestCase() {}
void HwdecApiNdkTest::SetUp()
{
    signal_ = new VDecSignal();
}
void HwdecApiNdkTest::TearDown()
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
} // namespace Media
} // namespace OHOS

namespace {
void VDecNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    cout << "VDecNeedInputData  index:" << index << endl;
    VDecSignal *signal = static_cast<VDecSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inCond_.notify_all();
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0100
 * @tc.name      : OH_VideoDecoder_FindDecoder para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0100, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByMime(NULL);
    ASSERT_EQ(NULL, vdec_);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.name      : OH_VideoDecoder_CreateByName para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0200, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(NULL);
    ASSERT_EQ(NULL, vdec_);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.name      : OH_VideoDecoder_SetCallback para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_3300, TestSize.Level2)
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetCallback(NULL, cb_, static_cast<void *>(signal_)));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.name      : OH_VideoDecoder_SetCallback para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1800, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    OH_AVCodecAsyncCallback cb2_;
    cb2_.onError = NULL;
    cb2_.onStreamChanged = NULL;
    cb2_.onNeedInputData = NULL;
    cb2_.onNeedOutputData = NULL;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb2_, static_cast<void *>(signal_)));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.name      : OH_VideoDecoder_SetCallback para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0300, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.name      : OH_VideoDecoder_Destroy para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0400, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Destroy(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.name      : OH_VideoDecoder_Configure para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0500, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(vdec_, NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.name      : OH_VideoDecoder_Configure para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1400, TestSize.Level2)
{
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.name      : OH_VideoDecoder_Configure para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_5000, TestSize.Level2)
{
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);
    string widthStr = "width";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.name      : OH_VideoDecoder_Configure para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_5100, TestSize.Level2)
{
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.name      : OH_VideoDecoder_Start para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0600, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Start(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.name      : OH_VideoDecoder_Stop para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0700, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Stop(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.name      : OH_VideoDecoder_Flush para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0800, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Flush(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.name      : OH_VideoDecoder_Reset para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_0900, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Reset(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.name      : OH_VideoDecoder_GetOutputDescription para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1000, TestSize.Level2)
{
    ASSERT_EQ(NULL, OH_VideoDecoder_GetOutputDescription(NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.name      : OH_VideoDecoder_SetParameter para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1100, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(vdec_, NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.name      : OH_VideoDecoder_Prepare para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_4100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_Prepare(nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.name      : OH_VideoDecoder_SetParameter para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1500, TestSize.Level2)
{
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(NULL, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.name      : OH_VideoDecoder_SetSurface para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1200, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetSurface(vdec_, NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.name      : OH_VideoDecoder_CreateByName para correct
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1300, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.name      : OH_VideoDecoder_CreateByName para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1600, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(NULL, vdec_);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.name      : OH_VideoDecoder_CreateByName para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_1700, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByMime(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(NULL, vdec_);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.name      : OH_VideoDecoder_IsValid para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2200, TestSize.Level2)
{
    bool isValid = false;
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_IsValid(nullptr, &isValid);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);
    ret = OH_VideoDecoder_IsValid(vdec_, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.name      : OH_VideoDecoder_RenderOutputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2500, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_RenderOutputData(NULL, 0));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.name      : OH_VideoDecoder_RenderOutputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2600, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputData(vdec_, 0));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.name      : OH_VideoDecoder_FreeOutputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2700, TestSize.Level2)
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_FreeOutputData(NULL, 0));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.name      : OH_VideoDecoder_FreeOutputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2800, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, 0));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.name      : OH_VideoDecoder_FreeOutputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_2900, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, -1));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.name      : OH_VideoDecoder_PushInputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_3000, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());

    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.name      : OH_VideoDecoder_PushInputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_3100, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, -1, attr));
}

/**
 * @tc.number    : VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.name      : OH_VideoDecoder_PushInputData para error
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ILLEGAL_PARA_3200, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, 0, attr));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0100
 * @tc.name      : create create
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0100, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_, NULL);
    OH_AVCodec *vdec_2 = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_2, NULL);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0200
 * @tc.name      : create configure configure
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0200, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Configure(vdec_, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0300
 * @tc.name      : create configure start start
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0300, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Start(vdec_));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0400
 * @tc.name      : create configure start stop stop
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0400, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0500
 * @tc.name      : create configure start stop reset reset
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0500, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0600
 * @tc.name      : create configure start EOS EOS
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0600, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VDecNeedInputData;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void *>(signal_)));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    for (int i = 0; i < 2; i++) {
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
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0700
 * @tc.name      : create configure start flush flush
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0700, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0800
 * @tc.name      : create configure start stop release release
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0800, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

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
}

/**
 * @tc.number    : VIDEO_HWDEC_API_0900
 * @tc.name      : create create
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_0900, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_, NULL);
    OH_AVCodec *vdec_2 = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_2, NULL);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
}

/**
 * @tc.number    : VIDEO_HWDEC_API_1000
 * @tc.name      : repeat OH_VideoDecoder_SetCallback
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_1000, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
}

/**
 * @tc.number    : VIDEO_HWDEC_API_1100
 * @tc.name      : repeat OH_VideoDecoder_GetOutputDescription
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_1100, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(NULL, format);
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(NULL, format);
}

/**
 * @tc.number    : VIDEO_HWDEC_API_1200
 * @tc.name      : repeat OH_VideoDecoder_SetParameter
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_API_1200, TestSize.Level2)
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(NULL, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0100
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0100, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    ASSERT_NE(cap, nullptr);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0200
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0200, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(nullptr, false);
    ASSERT_EQ(cap, nullptr);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0300
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0300, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0400
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0400, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(nullptr, false, HARDWARE);
    ASSERT_EQ(cap, nullptr);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0500
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0500, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    ASSERT_TRUE(OH_AVCapability_IsHardware(cap));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0600
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0600, TestSize.Level2)
{
    ASSERT_FALSE(OH_AVCapability_IsHardware(nullptr));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0700
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0700, TestSize.Level2)
{
    ASSERT_EQ(0, OH_AVCapability_GetMaxSupportedInstances(nullptr));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0800
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test, 不同平台解码器数量不一致, 改为不校验具体数量
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0800, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    string codec_name = OH_AVCapability_GetName(cap);
    if (codec_name == "OMX.hisi.video.decoder.avc") {
        ASSERT_LT(1, OH_AVCapability_GetMaxSupportedInstances(cap));
    } else {
        ASSERT_EQ(6, OH_AVCapability_GetMaxSupportedInstances(cap));
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_0900
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_0900, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(cap, nullptr);
    ASSERT_EQ(g_codecName, OH_AVCapability_GetName(cap));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1000
 * @tc.name      : OH_AVCodec_GetCapability
 * @tc.desc      : function test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1000, TestSize.Level2)
{
    const char *name = OH_AVCapability_GetName(nullptr);
    ASSERT_NE(name, nullptr);
    ASSERT_EQ(strlen(name), 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3100
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3200
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3300
 * @tc.name      : OH_AVCapability_GetVideoWidthAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    cout << "WidthAlignment " << alignment << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3400
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3500
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3600
 * @tc.name      : OH_AVCapability_GetVideoHeightAlignment param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, &alignment);
    cout << "HeightAlignment " << alignment << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(alignment, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3700
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3800
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_3900
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_3900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4000
 * @tc.name      : OH_AVCapability_GetVideoWidthRangeForHeight param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4100
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4200
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4300
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4400
 * @tc.name      : OH_AVCapability_GetVideoHeightRangeForWidth param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4500
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4600
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4700
 * @tc.name      : OH_AVCapability_GetVideoWidthRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4800
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_4900
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_4900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5000
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    memset_s(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
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
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1700
 * @tc.name      : OH_AVCapability_GetVideoHeightRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    memset_s(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
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
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5100
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5100, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5200
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5200, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0));
}
/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5300
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5300, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT));
}
/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_9400
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_9400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoHeightRange(capability, &heightRange));
    ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoWidthRange(capability, &widthRange));
    ASSERT_EQ(false, OH_AVCapability_IsVideoSizeSupported(capability, widthRange.maxVal + 1, heightRange.maxVal + 1));
}
/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5400
 * @tc.name      : OH_AVCapability_IsVideoSizeSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5500
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5600
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5700
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GE(range.minVal, 0);
    ASSERT_GT(range.maxVal, 0);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1600
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRange param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GE(range.minVal, 0);
        ASSERT_GT(range.maxVal, 0);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5800
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_5900
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_5900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6000
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6100
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6200
 * @tc.name      : OH_AVCapability_GetVideoFrameRateRangeForSize param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, heightRange.maxVal, &widthRange);
    cout << "minval=" << widthRange.minVal << "  maxval=" << widthRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 1280, 720, &range);
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
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6300
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6400
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6400, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, 30));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6500
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6500, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6600
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6600, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6700
 * @tc.name      : OH_AVCapability_AreVideoSizeAndFrameRateSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6700, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 30));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6800
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_6900
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_6900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7000
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7100
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
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
        EXPECT_GE(pixelFormat[i], 0);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
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
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1200
 * @tc.name      : OH_AVCapability_GetVideoSupportedPixelFormats param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
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
            EXPECT_GE(pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
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
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7200
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7300
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7400
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7500
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(profileNum, 0);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        EXPECT_GE(profiles[i], 0);
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1300
 * @tc.name      : OH_AVCapability_GetSupportedProfiles param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_GT(profileNum, 0);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            EXPECT_GE(profiles[i], 0);
        }
    } else {
        return;
    }
    
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7600
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7700
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, &levels, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7800
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7800, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t levelNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, nullptr, &levelNum);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_7900
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_7900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, &levels, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_8000
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_8000, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_GT(profileNum, 0);
    ASSERT_NE(nullptr, profiles);
    for (int i = 0; i < profileNum; i++) {
        EXPECT_GE(profiles[i], 0);
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_NE(nullptr, levels);
        EXPECT_GT(levelNum, 0);
        for (int j = 0; j < levelNum; j++) {
            EXPECT_GE(levels[j], 0);
        }
    }
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_1400
 * @tc.name      : OH_AVCapability_GetSupportedLevelsForProfile param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_1400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    uint32_t profileNum = 0;
    const int32_t *profiles = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
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
                EXPECT_GE(levels[j], 0);
            }
        }
    } else {
        return;
    }
    
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_8100
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_8100, TestSize.Level2)
{
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_8200
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param error
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_8200, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(false, OH_AVCapability_AreProfileAndLevelSupported(capability, 1, 1));
}

/**
 * @tc.number    : VIDEO_HWDEC_CAP_API_8300
 * @tc.name      : OH_AVCapability_AreProfileAndLevelSupported param correct
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_CAP_API_8300, TestSize.Level2)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    ASSERT_NE(nullptr, capability);
    ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_BASELINE, 1));
}

/**
 * @tc.number    : VIDEO_HWDEC_ATTIME_API_0010
 * @tc.name      : OH_VideoDecoder_RenderOutputBufferAtTime use renderTimestampNs of < 0
 * @tc.desc      : api test
 */
HWTEST_F(HwdecApiNdkTest, VIDEO_HWDEC_ATTIME_API_0010, TestSize.Level1)
{
    shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
    const char *INP_DIR_720_30 = "/data/test/media/1280_720_30_10Mb.h264";
    vDecSample->INP_DIR = INP_DIR_720_30;
    vDecSample->SF_OUTPUT = true;
    vDecSample->DEFAULT_WIDTH = 1280;
    vDecSample->DEFAULT_HEIGHT = 720;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->rsAtTime = true;
    vDecSample->isAPI = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecName));
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->errCount);
}
} // namespace