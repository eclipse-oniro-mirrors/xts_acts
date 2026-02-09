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
#include <string>
#include "gtest/gtest.h"
#include "native_avcodec_videodecoder.h"
#include "native_averrors.h"
#include "videodec_ndk_sample.h"
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
class HwdecFuncNdkTest : public testing::Test {
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
};
} // namespace Media
} // namespace OHOS

namespace {
static OH_AVCapability *cap = nullptr;
static OH_AVCapability *cap_hevc = nullptr;
static OH_AVRange heightRange;
static OH_AVRange widthRange;
static OH_AVErrCode ret = AV_ERR_OK;
static string g_codecName = "";
static string g_codecNameHEVC = "";
constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
constexpr int32_t UHD_RESOLUTION[2] = {3840, 2160};
constexpr int32_t HD_RESOLUTION[2] = {1104, 622};
} // namespace

void HwdecFuncNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
    ret = OH_AVCapability_GetVideoHeightRange(cap, &heightRange);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, heightRange.maxVal, &widthRange);
    cout << "minval=" << widthRange.minVal << "  maxval=" << widthRange.maxVal << endl;
}
void HwdecFuncNdkTest::TearDownTestCase() {}
void HwdecFuncNdkTest::SetUp() {}
void HwdecFuncNdkTest::TearDown() {}

namespace {
/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0200
 * @tc.number VIDEO_HWDEC_FUNCTION_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0200, TestSize.Level1)
{
    OH_AVCodec *vdec_ = OH_VideoDecoder_CreateByName("OMX.h264.decode.111.222.333");
    ASSERT_EQ(nullptr, vdec_);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0300
 * @tc.number VIDEO_HWDEC_FUNCTION_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0300, TestSize.Level0)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0400
 * @tc.number VIDEO_HWDEC_FUNCTION_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0400, TestSize.Level0)
{
    VDecNdkSample *vDecSample = new VDecNdkSample();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->SF_OUTPUT = true;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecName));
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    delete vDecSample;
    vDecSample = nullptr;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0700
 * @tc.number VIDEO_HWDEC_FUNCTION_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0700, TestSize.Level1)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0800
 * @tc.number VIDEO_HWDEC_FUNCTION_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0800, TestSize.Level1)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->BEFORE_EOS_INPUT = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0900
 * @tc.number VIDEO_HWDEC_FUNCTION_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_0900, TestSize.Level1)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->BEFORE_EOS_INPUT_INPUT = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1000
 * @tc.number VIDEO_HWDEC_FUNCTION_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1000, TestSize.Level1)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1100
 * @tc.number VIDEO_HWDEC_FUNCTION_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1100, TestSize.Level1)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1200
 * @tc.number VIDEO_HWDEC_FUNCTION_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1200, TestSize.Level2)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->REPEAT_START_STOP_BEFORE_EOS = 5;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1300
 * @tc.number VIDEO_HWDEC_FUNCTION_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1300, TestSize.Level2)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->REPEAT_START_FLUSH_BEFORE_EOS = 5;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1400
 * @tc.number VIDEO_HWDEC_FUNCTION_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1400, TestSize.Level2)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_720_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1600
 * @tc.number VIDEO_HWDEC_FUNCTION_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1600, TestSize.Level2)
{   
    if (cap_hevc) {
        shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/1920_1080_20M_30.h265";
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1700
 * @tc.number VIDEO_HWDEC_FUNCTION_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecFuncNdkTest, VIDEO_HWDEC_FUNCTION_1700, TestSize.Level2)
{
    if (g_codecName.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/resolutionChange.h264";
        vDecSample->DEFAULT_WIDTH = 1104;
        vDecSample->DEFAULT_HEIGHT = 622;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    } else {
        cout << "hardware encoder is rk,skip." << endl;
    }
}
/**
 * @tc.name   SURF_CHANGE_FUNC_001
 * @tc.number SURF_CHANGE_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, SURF_CHANGE_FUNC_001, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vDecSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->AFTER_EOS_DESTORY_CODEC = false;
    vDecSample->sleepOnFPS = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecName));
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    ASSERT_EQ(AV_ERR_OK, vDecSample->Reset());
    ASSERT_EQ(AV_ERR_INVALID_STATE, vDecSample->SwitchSurface());
    ASSERT_EQ(AV_ERR_OK, vDecSample->Release());
}
/**
 * @tc.name   SURF_CHANGE_FUNC_002
 * @tc.number SURF_CHANGE_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, SURF_CHANGE_FUNC_002, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vDecSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->sleepOnFPS = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->Flush());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SwitchSurface());
    ASSERT_EQ(AV_ERR_OK, vDecSample->Stop());
}
/**
 * @tc.name   SURF_CHANGE_FUNC_003
 * @tc.number SURF_CHANGE_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, SURF_CHANGE_FUNC_003, TestSize.Level0)
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = 1920;
    vDecSample->DEFAULT_HEIGHT = 1080;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = false;
    vDecSample->CreateSurface();
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecName));
    ASSERT_EQ(AV_ERR_OPERATE_NOT_PERMIT, vDecSample->SwitchSurface());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}
/**
 * @tc.name   SURF_CHANGE_FUNC_004
 * @tc.number SURF_CHANGE_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, SURF_CHANGE_FUNC_004, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = INP_DIR_1080_30;
    vDecSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vDecSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->SF_OUTPUT = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->sleepOnFPS = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->RepeatCallSetSurface());
    vDecSample->WaitForEOS();
}

/**
 * @tc.name   OUTPUT_DECS_FUNC_001
 * @tc.number OUTPUT_DECS_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_001, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = "/data/test/media/1920x1080.h264";
    vDecSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vDecSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->needCheckOutputDesc = true;
    vDecSample->expectCropTop = 0;
    vDecSample->expectCropBottom = DEFAULT_HEIGHT - 1;
    vDecSample->expectCropLeft = 0;
    vDecSample->expectCropRight = DEFAULT_WIDTH - 1;

    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_002
 * @tc.number OUTPUT_DECS_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_002, TestSize.Level0)
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/1920x1080.h265";
        vDecSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vDecSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = DEFAULT_HEIGHT - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = DEFAULT_WIDTH - 1;

        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_003
 * @tc.number OUTPUT_DECS_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_003, TestSize.Level0)
{
    if (cap) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/3840x2160.h264";
        if ((widthRange.maxVal>=UHD_RESOLUTION[0]) && (heightRange.maxVal>=UHD_RESOLUTION[1])) {
            vDecSample->DEFAULT_WIDTH = UHD_RESOLUTION[0];
            vDecSample->DEFAULT_HEIGHT = UHD_RESOLUTION[1];
            vDecSample->DEFAULT_FRAME_RATE = 30;
            vDecSample->needCheckOutputDesc = true;
            vDecSample->expectCropTop = 0;
            vDecSample->expectCropBottom = UHD_RESOLUTION[1] - 1;
            vDecSample->expectCropLeft = 0;
            vDecSample->expectCropRight = UHD_RESOLUTION[0] - 1;
            ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
            ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
            ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
            ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
            vDecSample->WaitForEOS();
            ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
        } else {
            return;
        }
    }
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_004
 * @tc.number OUTPUT_DECS_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_004, TestSize.Level0)
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/3840x2160.h265";
        vDecSample->DEFAULT_WIDTH = UHD_RESOLUTION[0];
        vDecSample->DEFAULT_HEIGHT = UHD_RESOLUTION[1];
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = UHD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = UHD_RESOLUTION[0] - 1;

        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_005
 * @tc.number OUTPUT_DECS_FUNC_005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_005, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->INP_DIR = "/data/test/media/1104x622.h265";
    vDecSample->DEFAULT_WIDTH = HD_RESOLUTION[0];
    vDecSample->DEFAULT_HEIGHT = HD_RESOLUTION[1];
    vDecSample->DEFAULT_FRAME_RATE = 30;
    vDecSample->needCheckOutputDesc = true;
    vDecSample->expectCropTop = 0;
    vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
    vDecSample->expectCropLeft = 0;
    vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_006
 * @tc.number OUTPUT_DECS_FUNC_006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_006, TestSize.Level0)
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/1104x622.h265";
        vDecSample->DEFAULT_WIDTH = HD_RESOLUTION[0];
        vDecSample->DEFAULT_HEIGHT = HD_RESOLUTION[1];
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_007
 * @tc.number OUTPUT_DECS_FUNC_007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HwdecFuncNdkTest, OUTPUT_DECS_FUNC_007, TestSize.Level0)
{
    if ((g_codecName.find("hisi") != string::npos) && (cap)) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->INP_DIR = "/data/test/media/resolutionChange.h264";
        vDecSample->DEFAULT_WIDTH = HD_RESOLUTION[0];
        vDecSample->DEFAULT_HEIGHT = HD_RESOLUTION[1];
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->isResChangeStream = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
    } else {
        cout << "hardware encoder is rk,skip." << endl;
    }
}
} // namespace