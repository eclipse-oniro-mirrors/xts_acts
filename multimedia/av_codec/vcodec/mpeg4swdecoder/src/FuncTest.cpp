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
#include "openssl/sha.h"

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
class Mpeg4SwdecFuncNdkTest : public testing::Test {
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
    const char *INP_DIR_1080_30 = "/data/test/media/mpeg4_main@level4_1920x1080_30.m4v";
};
} // namespace Media
} // namespace OHOS

namespace {
static OH_AVCapability *cap_mpeg4 = nullptr;
static string g_codecNameMpeg4 = "";
} // namespace

void Mpeg4SwdecFuncNdkTest::SetUpTestCase()
{
    cap_mpeg4 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2, false, SOFTWARE);
    g_codecNameMpeg4 = OH_AVCapability_GetName(cap_mpeg4);
    cout << "g_codecNameMpeg4: " << g_codecNameMpeg4 << endl;
}

void Mpeg4SwdecFuncNdkTest::TearDownTestCase() {}
void Mpeg4SwdecFuncNdkTest::SetUp() {}
void Mpeg4SwdecFuncNdkTest::TearDown() {}

namespace {
/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(Mpeg4SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010, TestSize.Level1)
{
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMpeg4));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(Mpeg4SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020, TestSize.Level0)
{
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMpeg4));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(Mpeg4SwdecFuncNdkTest, VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040, TestSize.Level1)
{
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMpeg4));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartSyncVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_MPEG4SWDEC_BLANK_FRAME_0010
 * @tc.number VIDEO_MPEG4SWDEC_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(Mpeg4SwdecFuncNdkTest, VIDEO_MPEG4SWDEC_BLANK_FRAME_0010, TestSize.Level1)
{
    if (cap_mpeg4 != nullptr) {
        if (!access("/system/lib64/media/", 0)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->INP_DIR = INP_DIR_1080_30;
            vDecSample->DEFAULT_WIDTH = 1920;
            vDecSample->DEFAULT_HEIGHT = 1080;
            vDecSample->DEFAULT_FRAME_RATE = 30;
            vDecSample->enbleBlankFrame = 1;
            vDecSample->SF_OUTPUT = false;
            ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameMpeg4));
            vDecSample->WaitForEOS();
            ASSERT_EQ(0, vDecSample->errCount);
        }
    }
}
} // namespace