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
#include "native_avformat.h"
#include "videodec_api11_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class HevcSwdecFuncNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void Release();
    int32_t Stop();

protected:
    const char *INP_DIR_1080_30 = "/data/test/media/1920_1080_30.h265";
};
} // namespace Media
} // namespace OHOS

namespace {
static OH_AVCapability *cap_hevc = nullptr;
static string g_codecNameHevc = "";
} // namespace

void HevcSwdecFuncNdkTest::SetUpTestCase()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, SOFTWARE);
    g_codecNameHevc = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHevc: " << g_codecNameHevc << endl;
}

void HevcSwdecFuncNdkTest::TearDownTestCase() {}
void HevcSwdecFuncNdkTest::SetUp() {}
void HevcSwdecFuncNdkTest::TearDown() {}

namespace {
/**
 * @tc.name   VIDEO_DECODE_SYNC_SW265_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_SW265_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HevcSwdecFuncNdkTest, VIDEO_DECODE_SYNC_SW265_FUNC_0010, TestSize.Level1)
{
    if (cap_hevc != nullptr) {
        shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHevc));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SW265_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_SW265_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HevcSwdecFuncNdkTest, VIDEO_DECODE_SYNC_SW265_FUNC_0020, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
        vDecSample->enbleSyncMode = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameHevc));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}

/**
 * @tc.name   VIDEO_SWDEC_H265_BLANK_FRAME_0010
 * @tc.number VIDEO_SWDEC_H265_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HevcSwdecFuncNdkTest, VIDEO_SWDEC_H265_BLANK_FRAME_0010, TestSize.Level0)
{
    if (cap_hevc != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = INP_DIR_1080_30;
        vDecSample->DEFAULT_WIDTH = 1920;
        vDecSample->DEFAULT_HEIGHT = 1080;
        vDecSample->DEFAULT_FRAME_RATE = 30;
        vDecSample->SF_OUTPUT = false;
        vDecSample->enbleBlankFrame = 1;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec(g_codecNameHevc));
        vDecSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vDecSample->errCount);
    }
}
} // namespace