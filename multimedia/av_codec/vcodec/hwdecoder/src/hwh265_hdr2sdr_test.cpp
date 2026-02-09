/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "videodec_api11_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "native_buffer.h"

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class HwdecHdr2SdrNdkTest : public testing::Test {
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
static OH_AVCapability *cap_hevc = nullptr;
static string g_codecNameAVC = "";
static string g_codecNameHEVC = "";
OH_AVCodec *vdec_ = NULL;
OH_AVFormat *format;
constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
} // namespace

void HwdecHdr2SdrNdkTest::SetUpTestCase()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
}
void HwdecHdr2SdrNdkTest::TearDownTestCase() {}

void HwdecHdr2SdrNdkTest::SetUp(void) {}

void HwdecHdr2SdrNdkTest::TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
}

namespace {

/**
 * @tc.name   HEVC_HW_HDR2SDR_FUNC_002
 * @tc.number HEVC_HW_HDR2SDR_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(HwdecHdr2SdrNdkTest, HEVC_HW_HDR2SDR_FUNC_002, TestSize.Level2)
{
    if (cap_hevc) {
        if (!access("/system/lib64/media/", 0)) {
            vdec_ = OH_VideoDecoder_CreateByName(g_codecNameHEVC.c_str());
            ASSERT_NE(NULL, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(NULL, format);
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE,
            OH_COLORSPACE_BT709_LIMIT));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA));
            ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(vdec_, format));
        }
        else {
            vdec_ = OH_VideoDecoder_CreateByName(g_codecNameHEVC.c_str());
            ASSERT_NE(NULL, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(NULL, format);
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE,
            OH_COLORSPACE_BT709_LIMIT));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA));
            ASSERT_EQ(AV_ERR_UNSUPPORT, OH_VideoDecoder_Configure(vdec_, format));
        }
    }
}
} //namespace