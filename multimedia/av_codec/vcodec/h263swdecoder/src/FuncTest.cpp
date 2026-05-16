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
#include "native_avformat.h"

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class H263SwdecFuncNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};
} // namespace Media
} // namespace OHOS

namespace {
static OH_AVCapability *cap_263 = nullptr;
static string g_codecName263 = "";
static OH_AVCapability *cap_264 = nullptr;
static string g_codecName264 = "";
constexpr uint32_t FRAMESIZE90 = 90;
constexpr uint32_t FRAMESIZE75 = 75;
} // namespace

void H263SwdecFuncNdkTest::SetUpTestCase()
{
    cap_263 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    g_codecName263 = OH_AVCapability_GetName(cap_263);
    cout << "g_codecName263: " << g_codecName263 << endl;
    cap_264 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    g_codecName264 = OH_AVCapability_GetName(cap_264);
    cout << "g_codecName264: " << g_codecName264 << endl;
}

void H263SwdecFuncNdkTest::TearDownTestCase() {}
void H263SwdecFuncNdkTest::SetUp() {}
void H263SwdecFuncNdkTest::TearDown() {}

namespace {
/**
 * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(H263SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SW263_FUNC_0010, TestSize.Level1)
{
    if (cap_263 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = "/data/test/media/profile0_level10_I_128x96.h263";
        vDecSample->DEFAULT_WIDTH = 128;
        vDecSample->DEFAULT_HEIGHT = 96;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName263));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE90, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(H263SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SW263_FUNC_0020, TestSize.Level0)
{
    if (cap_263 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = "/data/test/media/profile0_level10_I_128x96.h263";
        vDecSample->DEFAULT_WIDTH = 128;
        vDecSample->DEFAULT_HEIGHT = 96;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName263));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE90, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(H263SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SW263_FUNC_0040, TestSize.Level1)
{
    if (cap_263 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = "/data/test/media/profile0_level10_I_128x96.h263";
        vDecSample->DEFAULT_WIDTH = 128;
        vDecSample->DEFAULT_HEIGHT = 96;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecName263));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE90, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SW263_BLANK_FRAME_0010
 * @tc.number VIDEO_DECODE_SW263_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(H263SwdecFuncNdkTest, VIDEO_DECODE_SW263_BLANK_FRAME_0010, TestSize.Level0)
{
    if (cap_263 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = "/data/test/media/20x20.h263";
        vDecSample->DEFAULT_WIDTH = 20;
        vDecSample->DEFAULT_HEIGHT = 20;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder("OH.Media.Codec.Decoder.Video.H263"));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE75, vDecSample->outFrameCount);
    }
}
} // namespace