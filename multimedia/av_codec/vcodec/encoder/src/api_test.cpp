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
#include <string>

#include "gtest/gtest.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"
#include "native_avcodec_videoencoder.h"
#include "videoenc_ndk_sample.h"
#include "native_avcapability.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace {
OH_AVCodec *venc_ = NULL;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
OH_AVCapability *cap = nullptr;
OHOS::Media::VEncSignal *signal_ = nullptr;
OH_AVFormat *format;
void onError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
};

void onStreamChanged(OH_AVCodec *codec, OH_AVFormat *fmt, void *userData)
{
    cout << "stream Changed" << endl;
};

void onNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
    cout << "need input data" << endl;
};

void onNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr, void *userData)
{
    cout << "output data" << endl;
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
};
} // namespace

namespace OHOS {
namespace Media {
class HwEncApiNdkTest : public testing::Test {
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

void HwEncApiNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *TMP_CODEC_NAME = OH_AVCapability_GetName(cap);
    if (memcpy_s(g_codecName, sizeof(g_codecName), TMP_CODEC_NAME, strlen(TMP_CODEC_NAME)) != 0) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;
}
void HwEncApiNdkTest::TearDownTestCase() {}
void HwEncApiNdkTest::SetUp()
{
    signal_ = new VEncSignal();
}
void HwEncApiNdkTest::TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0100
 * @tc.name      : OH_VideoEncoder_CreateByMime para1 error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0100, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(nullptr);
    ASSERT_EQ(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0200
 * @tc.name      : OH_VideoEncoder_CreateByMime para2 error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0200, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime("");
    ASSERT_EQ(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0300
 * @tc.name      : OH_VideoEncoder_CreateByMime para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0300, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(nullptr);
    ASSERT_EQ(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0400
 * @tc.name      : OH_VideoEncoder_CreateByMime para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0400, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName("");
    ASSERT_EQ(nullptr, venc_);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0500
 * @tc.name      : OH_VideoEncoder_CreateByMime para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Destroy(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0600
 * @tc.name      : OH_VideoEncoder_SetCallback para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0600, TestSize.Level2)
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetCallback(NULL, cb_, static_cast<void *>(signal_)));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0700
 * @tc.name      : OH_VideoEncoder_SetCallback para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0700, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(NULL, venc_);

    OH_AVCodecAsyncCallback cb2_;
    cb2_.onError = NULL;
    cb2_.onStreamChanged = NULL;
    cb2_.onNeedInputData = NULL;
    cb2_.onNeedOutputData = NULL;
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb2_, static_cast<void *>(signal_)));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0800
 * @tc.name      : OH_VideoEncoder_SetCallback para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0800, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, NULL));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_0900
 * @tc.name      : OH_VideoEncoder_Configure para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_0900, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    ret = OH_VideoEncoder_Configure(venc_, nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1100
 * @tc.name      : OH_VideoEncoder_Configure para not enough
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, 100000);
    ret = OH_VideoEncoder_Configure(venc_, format);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1400
 * @tc.name      : OH_VideoEncoder_Start para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Start(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1500
 * @tc.name      : OH_VideoEncoder_Stop para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Stop(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1600
 * @tc.name      : OH_VideoEncoder_Flush para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1600, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Flush(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1700
 * @tc.name      : OH_VideoEncoder_Reset para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1700, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Reset(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1800
 * @tc.name      : OH_VideoEncoder_Reset para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1800, TestSize.Level2)
{
    format = OH_VideoEncoder_GetOutputDescription(nullptr);
    ASSERT_EQ(format, nullptr);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_1900
 * @tc.name      : OH_VideoEncoder_SetParameter para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_1900, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetParameter(venc_, nullptr));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2000
 * @tc.name      : OH_VideoEncoder_SetParameter para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2000, TestSize.Level2)
{
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetParameter(NULL, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2100
 * @tc.name      : OH_VideoEncoder_GetSurface para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2100, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    ret = OH_VideoEncoder_GetSurface(venc_, nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2200
 * @tc.name      : OH_VideoEncoder_FreeOutputData para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2200, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_FreeOutputData(nullptr, 0);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2300
 * @tc.name      : OH_VideoEncoder_FreeOutputData para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2300, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);

    ret = OH_VideoEncoder_Configure(venc_, format);
    ASSERT_EQ(ret, AV_ERR_OK);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    usleep(1000000);
    ret = OH_VideoEncoder_FreeOutputData(venc_, 9999999);
    ASSERT_EQ(ret, AV_ERR_INVALID_STATE);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2400
 * @tc.name      : OH_VideoEncoder_NotifyEndOfStream para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2400, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}
/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2500
 * @tc.name      : OH_VideoEncoder_NotifyEndOfStream para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2500, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2600
 * @tc.name      : OH_VideoEncoder_PushInputData para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2600, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(venc_, 0, attr));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2700
 * @tc.name      : OH_VideoEncoder_PushInputData para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2700, TestSize.Level2)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(NULL, 0, attr));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2800
 * @tc.name      : OH_VideoEncoder_PushInputData para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2800, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(nullptr, venc_);
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(NULL, 99999, attr));
}

/**
 * @tc.number    : VIDEO_ENCODE_ILLEGAL_PARA_2900
 * @tc.name      : OH_VideoEncoder_GetInputDescription para error
 * * @tc.desc      : api test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_ILLEGAL_PARA_2900, TestSize.Level2)
{
    ASSERT_EQ(nullptr, OH_VideoEncoder_GetInputDescription(nullptr));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0100
 * @tc.name      : create create
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0100, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(venc_, NULL);
    OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(venc_2, NULL);
    OH_VideoEncoder_Destroy(venc_2);
    venc_2 = nullptr;
}

/**
 * @tc.number    : VIDEO_ENCODE_API_3100
 * @tc.name      : create create
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_3100, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(venc_, NULL);
    OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(venc_2, NULL);
    OH_VideoEncoder_Destroy(venc_2);
    venc_2 = nullptr;
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0200
 * @tc.name      : create configure configure
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0200, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Configure(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0300
 * @tc.name      : create configure start start
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0300, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Start(venc_));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0400
 * @tc.name      : create configure start stop stop
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0400, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Stop(venc_));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0500
 * @tc.name      : create configure start stop reset reset
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0500, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Reset(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Reset(venc_));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0600
 * @tc.name      : create configure start EOS EOS
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0600, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);
    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, static_cast<void *>(signal_)));

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [] { return signal_->inIdxQueue_.size() > 1; });
    uint32_t index = signal_->inIdxQueue_.front();
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_PushInputData(venc_, index, attr));
    signal_->inIdxQueue_.pop();
    index = signal_->inIdxQueue_.front();
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_PushInputData(venc_, index, attr));
    signal_->inIdxQueue_.pop();
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0700
 * @tc.name      : create configure start flush flush
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0700, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);
    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);
    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Flush(venc_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Flush(venc_));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0800
 * @tc.name      : create configure start stop release release
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0800, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Destroy(venc_));
    venc_ = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Destroy(venc_));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_0900
 * @tc.name      : create create
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_0900, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(venc_, NULL);
    OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(venc_2, NULL);
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Destroy(venc_2));
    venc_2 = nullptr;
}

/**
 * @tc.number    : VIDEO_ENCODE_API_1000
 * @tc.name      : repeat OH_VideoEncoder_SetCallback
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_1000, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(venc_, NULL);
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, NULL));
    ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, NULL));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_1100
 * @tc.name      : repeat OH_VideoEncoder_GetOutputDescription
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_1100, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(venc_, NULL);
    format = OH_VideoEncoder_GetOutputDescription(venc_);
    ASSERT_NE(NULL, format);
    OH_AVFormat_Destroy(format);
    format = OH_VideoEncoder_GetOutputDescription(venc_);
    ASSERT_NE(NULL, format);
}

/**
 * @tc.number    : VIDEO_ENCODE_API_1200
 * @tc.name      : repeat OH_VideoEncoder_SetParameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_1200, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);

    format = OH_AVFormat_Create();
    ASSERT_NE(NULL, format);

    string widthStr = "width";
    string heightStr = "height";
    string frameRateStr = "frame_rate";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, heightStr.c_str(), DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_SetParameter(venc_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_SetParameter(venc_, format));
}

/**
 * @tc.number    : VIDEO_ENCODE_API_1200
 * @tc.name      : repeat OH_VideoEncoder_GetInputDescription
 * @tc.desc      : function test
 */
HWTEST_F(HwEncApiNdkTest, VIDEO_ENCODE_API_1300, TestSize.Level2)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_NE(NULL, venc_);
    format = OH_VideoEncoder_GetInputDescription(venc_);
    ASSERT_NE(NULL, format);
    OH_AVFormat_Destroy(format);
    format = OH_VideoEncoder_GetInputDescription(venc_);
    ASSERT_NE(NULL, format);
}
} // namespace