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
#include "gtest/gtest.h"
#include "native_avcodec_videodecoder.h"
#include "native_averrors.h"
#include "videodec_api11_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class HwdecFunc2NdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    const char *INP_DIR_720_30 = "/data/test/media/1280_720_30_10Mb.h264";
    const char *INP_DIR_1080_30 = "/data/test/media/1920_1080_10_30Mb.h264";
    const char *INP_DIR_1080_20 = "/data/test/media/1920_1080_20M_30.h265";
    const char *inpDirVivid = "/data/test/media/hlg_vivid_4k.h265";
    const char *INP_DIR_VVC_1080 = "/data/test/media/1920_1080_10bit.vvc";
    const char *INP_DIR_IPB_265_10bit = "/data/test/media/176_144_Main10.h265";
    const char *INP_DIR_IPB_265_8bit = "/data/test/media/720_1280_25_8bit.h265";
    const char *INP_DIR_IPB_264_8bit = "/data/test/media/720_1280_25_avcc.h264";
};
} // namespace Media
} // namespace OHOS

namespace {
static OH_AVCapability *cap = nullptr;
static OH_AVCapability *cap_hevc = nullptr;
static OH_AVCapability *cap_vvc = nullptr;
static string g_codecName = "";
static string g_codecNameHEVC = "";
static string g_codecNameVVC = "";
const std::vector<OH_NativeBuffer_TransformType> transfromTypes = {
    NATIVEBUFFER_ROTATE_NONE,
    NATIVEBUFFER_ROTATE_90,
    NATIVEBUFFER_ROTATE_180,
    NATIVEBUFFER_ROTATE_270,
    NATIVEBUFFER_FLIP_H,
    NATIVEBUFFER_FLIP_V,
    NATIVEBUFFER_FLIP_H_ROT90,
    NATIVEBUFFER_FLIP_V_ROT90,
    NATIVEBUFFER_FLIP_H_ROT180,
    NATIVEBUFFER_FLIP_V_ROT180,
    NATIVEBUFFER_FLIP_H_ROT270,
    NATIVEBUFFER_FLIP_V_ROT270
};
} // namespace

void HwdecFunc2NdkTest::SetUpTestCase()
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
void HwdecFunc2NdkTest::TearDownTestCase() {}
void HwdecFunc2NdkTest::SetUp() {}
void HwdecFunc2NdkTest::TearDown() {}

namespace {
/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0010, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->ConfigureVideoDecoder());
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0020, TestSize.Level2)
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
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0030
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0030, TestSize.Level2)
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
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0040, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->SetVideoDecoderCallback());
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0050
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0050, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0060
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0060, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vDecSample->QueryInputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0070
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0070, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Flush());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_INVALID_STATE, vDecSample->QueryOutputBuffer(index, 0));
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0080
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0080, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->getInputBufferIndexRepeat = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->OpenFile());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        vDecSample->SyncInputFunc();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0090
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0090, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->Start());
        uint32_t index = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->QueryInputBuffer(index, -1));
        ASSERT_EQ(nullptr, vDecSample->GetInputBuffer(index+100));
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0100
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0100, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->getOutputBufferIndexRepeated = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0110
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0110
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0110, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->getOutputBufferIndexNoExisted = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(true, vDecSample->abnormalIndexValue);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0120
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0120
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0120, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0120.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->syncInputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0130
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0130, TestSize.Level1)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0130.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->syncInputWaitTime = 100000;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0140
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0140, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0140.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->syncOutputWaitTime = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0150
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0150, TestSize.Level1)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0150.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->syncOutputWaitTime = 100000;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0160
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0160, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0160.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->queryInputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_FUNC_0170
 * @tc.number VIDEO_DECODE_SYNC_FUNC_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_FUNC_0170, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_unique<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->OUT_DIR = "/data/test/media/VIDEO_DECODE_SYNC_0170.yuv";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->queryOutputBufferEOS = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW264_FUNC_0010, TestSize.Level0)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW264_FUNC_0020, TestSize.Level1)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW265_FUNC_0010, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW265_FUNC_0020, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW265_FUNC_0040, TestSize.Level0)
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = inpDirVivid;
        vDecSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        vDecSample->DEFAULT_WIDTH = 3840;
        vDecSample->DEFAULT_HEIGHT = 2160;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        vDecSample->useHDRSource = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW266_FUNC_0010, TestSize.Level0)
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW266_FUNC_0020, TestSize.Level2)
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW266_FUNC_0040, TestSize.Level0)
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
        vDecSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        vDecSample->DEFAULT_WIDTH = 3840;
        vDecSample->DEFAULT_HEIGHT = 2160;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->outputYuvFlag = false;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_720_30;
        vDecSample->DEFAULT_WIDTH = 1280;
        vDecSample->DEFAULT_HEIGHT = 720;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010, TestSize.Level2)
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_H264_BLANK_FRAME_0010
 * @tc.number VIDEO_DECODE_H264_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_H264_BLANK_FRAME_0010, TestSize.Level0)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_720_30;
        vDecSample->DEFAULT_WIDTH = 1280;
        vDecSample->DEFAULT_HEIGHT = 720;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_H265_BLANK_FRAME_0020
 * @tc.number VIDEO_DECODE_H265_BLANK_FRAME_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_H265_BLANK_FRAME_0020, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_H266_BLANK_FRAME_0030
 * @tc.number VIDEO_DECODE_H266_BLANK_FRAME_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_H266_BLANK_FRAME_0030, TestSize.Level0)
{
    if (g_codecNameVVC.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameVVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0001
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0001, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_264_8bit;
        vDecSample->DEFAULT_WIDTH = 720;
        vDecSample->DEFAULT_HEIGHT = 1280;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0002
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0002, TestSize.Level0)
{
    if (cap != nullptr) {
        if (OH_AVCapability_IsFeatureSupported(cap, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->INP_DIR = INP_DIR_IPB_264_8bit;
            vDecSample->DEFAULT_WIDTH = 720;
            vDecSample->DEFAULT_HEIGHT = 1280;
            vDecSample->DEFAULT_FRAME_RATE = 30;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0003
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0003, TestSize.Level2)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_264_8bit;
        vDecSample->DEFAULT_WIDTH = 720;
        vDecSample->DEFAULT_HEIGHT = 1280;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0004
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0004, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_265_8bit;
        vDecSample->DEFAULT_WIDTH = 720;
        vDecSample->DEFAULT_HEIGHT = 1280;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0005
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0005, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        if (OH_AVCapability_IsFeatureSupported(cap_hevc, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->INP_DIR = INP_DIR_IPB_265_8bit;
            vDecSample->DEFAULT_WIDTH = 720;
            vDecSample->DEFAULT_HEIGHT = 1280;
            vDecSample->DEFAULT_FRAME_RATE = 30;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0006
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0006, TestSize.Level2)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_265_8bit;
        vDecSample->DEFAULT_WIDTH = 720;
        vDecSample->DEFAULT_HEIGHT = 1280;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0007
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0007, TestSize.Level2)
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_265_10bit;
        vDecSample->DEFAULT_WIDTH = 176;
        vDecSample->DEFAULT_HEIGHT = 144;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enableLowLatency = true;
        vDecSample->lowLatency = 0;
        vDecSample->is8bitYuv = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0008
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0008, TestSize.Level2)
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        if (OH_AVCapability_IsFeatureSupported(cap_hevc, VIDEO_LOW_LATENCY)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->INP_DIR = INP_DIR_IPB_265_10bit;
            vDecSample->DEFAULT_WIDTH = 176;
            vDecSample->DEFAULT_HEIGHT = 144;
            vDecSample->DEFAULT_FRAME_RATE = 30;
            vDecSample->isChecklowLatency = true;
            vDecSample->enableLowLatency = true;
            vDecSample->lowLatency = 1;
            vDecSample->is8bitYuv = false;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        }
    }
}

/**
 * @tc.name   VIDEO_DECODE_LOW_LATENCY_0009
 * @tc.number VIDEO_DECODE_LOW_LATENCY_0009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_LOW_LATENCY_0009, TestSize.Level2)
{
    if (cap_hevc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_IPB_265_10bit;
        vDecSample->DEFAULT_WIDTH = 176;
        vDecSample->DEFAULT_HEIGHT = 144;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->is8bitYuv = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHEVC));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_HWDEC_PIXE_FORMAT_0030
 * @tc.number VIDEO_HWDEC_PIXE_FORMAT_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_HWDEC_PIXE_FORMAT_0030, TestSize.Level1)
{
    if (cap_vvc != nullptr && !access("/system/lib64/media/", 0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_VVC_1080;
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
        ASSERT_EQ(35, vDecSample->firstCallBackKey);
        ASSERT_EQ(35, vDecSample->onStreamChangedKey);
    }
}

/**
 * @tc.name   VIDEO_DECODE_TRANSFORM_0010
 * @tc.number VIDEO_DECODE_TRANSFORM_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_TRANSFORM_0010, TestSize.Level0)
{
    if (cap != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        vDecSample->SF_OUTPUT = true;
        vDecSample->CreateSurface();
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->setTransform = true;
        vDecSample->DEFAULT_TRANSFORM = -1;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        for (const auto& transformtype : transfromTypes) {
            vDecSample->DEFAULT_TRANSFORM = transformtype;
            ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
            ASSERT_EQ(vDecSample->DEFAULT_TRANSFORM, vDecSample->GetSurfaceTransform(0));
            ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        }
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetSurface());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        ASSERT_EQ(vDecSample->DEFAULT_TRANSFORM, vDecSample->GetSurfaceTransform(0));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_TRANSFORM_0020
 * @tc.number VIDEO_DECODE_TRANSFORM_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_TRANSFORM_0020, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_20;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        vDecSample->SF_OUTPUT = true;
        vDecSample->CreateSurface();
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        vDecSample->setTransform = true;
        vDecSample->DEFAULT_TRANSFORM = -1;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vDecSample->SetConfigTransform());
        ASSERT_EQ(0, vDecSample->GetSurfaceTransform(0));
        ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        for (const auto& transformtype : transfromTypes) {
            vDecSample->DEFAULT_TRANSFORM = transformtype;
            ASSERT_EQ(AV_ERR_OK, vDecSample->SetConfigTransform());
            ASSERT_EQ(vDecSample->DEFAULT_TRANSFORM, vDecSample->GetSurfaceTransform(0));
            ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
        }
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetSurface());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        ASSERT_EQ(vDecSample->DEFAULT_TRANSFORM, vDecSample->GetSurfaceTransform(0));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_RESOLUTION_0010
 * @tc.number VIDEO_DECODE_RESOLUTION_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFunc2NdkTest, VIDEO_DECODE_RESOLUTION_0010, TestSize.Level2)
{
    if (g_codecName.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->DEFAULT_WIDTH = 1104;
        vDecSample->DEFAULT_HEIGHT = 622;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_LT(0, vDecSample->changeCount);
    }
}
} // namespace