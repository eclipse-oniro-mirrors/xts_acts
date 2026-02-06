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
#include "VideoDecApi11SampleTest.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "native_avformat.h"
#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmemory.h"
#include <fcntl.h>


#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class DecFuncNdkTest : public testing::Test {
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
    const char *ginpDirVc1 = "/data/test/media/test_vc1.avi";
    const char *ginpDirMjpeg = "/data/test/media/1920_1080_30.avi";
    const char *ginpDirMsvideo1 = "/data/test/media/msvideo1_720x480.avi";
    const char *ginpDirVp8 = "/data/test/media/vp8_480x640.ivf";
    const char *ginpDirVp9P0 = "/data/test/media/vp9_1_0_p0_256x144@15fps.ivf";
    const char *ginpDirVp9P1 = "/data/test/media/vp9_1_1_p1_384x192@30fps.ivf";
    const char *ginpDirVp9P2 = "/data/test/media/vp9_2_1_p2_640x384@30fps.ivf";
    const char *ginpDirVp9P3 = "/data/test/media/vp9_3_1_p3_1280x768@30fps.ivf";
    const char *ginpDirAv1Main = "/data/test/media/av1_main_L3.1_1280x720.ivf";
    const char *ginpDirAv1High =  "/data/test/media/av1_high_L3.0_854x480.ivf";
    const char *ginpDirAv1Pro = "/data/test/media/av1_high_L4.0_1920x1080.ivf";
};

static OH_AVCapability *g_capVc1 = nullptr;
static OH_AVCapability* g_capMjpeg = nullptr;
static OH_AVCapability* g_capMsvideo1 = nullptr;
static OH_AVCapability* g_capWmv3 = nullptr;
static OH_AVCapability* g_capVp8 = nullptr;
static OH_AVCapability* g_capVp9 = nullptr;
static OH_AVCapability* g_capAv1 = nullptr;
static string g_codecNameVc1 = "";
static string g_codecNameMjpeg = "";
static string g_codecNameMsvideo1 = "";
static string g_codecNameWmv3 = "";
static string g_codecNameVp8 = "";
static string g_codecNameVp9 = "";
static string g_codecNameAv1 = "";
constexpr uint32_t FRAMESIZE60 = 60;
constexpr uint32_t FRAMESIZE30 = 30;
constexpr uint32_t FRAMESIZE98 = 98;
constexpr uint32_t FRAMESIZE52 = 52;
constexpr uint32_t FRAMESIZE100 = 100;
constexpr uint32_t FRAMESIZE180 = 180;
constexpr uint32_t FRAMESIZE45 = 45;
void DecFuncNdkTest::SetUpTestCase()
{
    g_capVc1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (g_capVc1 != nullptr) {
        g_codecNameVc1 = OH_AVCapability_GetName(g_capVc1);
        cout << "g_codecNameVc1: " << g_codecNameVc1 << endl;
    }
    g_capMjpeg = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MJPEG, false, SOFTWARE);
    if (g_capMjpeg != nullptr) {
        g_codecNameMjpeg = OH_AVCapability_GetName(g_capMjpeg);
        cout << "g_codecNameMjpeg: " << g_codecNameMjpeg << endl;
    }
    g_capMsvideo1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
    if (g_capMsvideo1 != nullptr) {
        g_codecNameMsvideo1 = OH_AVCapability_GetName(g_capMsvideo1);
        cout << "g_codecNameMsvideo1: " << g_codecNameMsvideo1 << endl;
    }
    g_capWmv3 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (g_capWmv3 != nullptr) {
        g_codecNameWmv3 = OH_AVCapability_GetName(g_capWmv3);
        cout << "g_codecNameWmv3: " << g_codecNameWmv3 << endl;
    }
    g_capVp8 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP8, false, SOFTWARE);
    if (g_capVp8 != nullptr) {
        g_codecNameVp8 = OH_AVCapability_GetName(g_capVp8);
        cout << "g_codecNameVp8: " << g_codecNameVp8 << endl;
    }
    g_capVp9 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP9, false, SOFTWARE);
    if (g_capVp9 != nullptr) {
        g_codecNameVp9 = OH_AVCapability_GetName(g_capVp9);
        cout << "g_codecNameVp9: " << g_codecNameVp9 << endl;
    }
    g_capAv1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1, false, SOFTWARE);
    if (g_capAv1 != nullptr) {
        g_codecNameAv1 = OH_AVCapability_GetName(g_capAv1);
        cout << "g_codecNameAv1: " << g_codecNameAv1 << endl;
    }
}

void DecFuncNdkTest::TearDownTestCase() {}
void DecFuncNdkTest::SetUp() {}
void DecFuncNdkTest::TearDown() {}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.name   VIDEO_VC1DEC_FUNCTION_0001
 * @tc.number VIDEO_VC1DEC_FUNCTION_0001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VC1DEC_FUNCTION_0001, TestSize.Level0)
{
    if (g_capVc1 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirVc1;
        vDecSample->getFormat(file);
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVc1));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE60, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VC1DEC_FUNCTION_0002
 * @tc.number VIDEO_VC1DEC_FUNCTION_0002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VC1DEC_FUNCTION_0002, TestSize.Level0)
{
    if (g_capVc1 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirVc1;
        vDecSample->getFormat(file);
        vDecSample->SF_OUTPUT = true;
        vDecSample->outputYuvSurface = true;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameVc1));
        vDecSample->WaitForEOS();
        ASSERT_EQ(FRAMESIZE60, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_MJPEGDEC_FUNCTION_0003
 * @tc.number VIDEO_MJPEGDEC_FUNCTION_0003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MJPEGDEC_FUNCTION_0003, TestSize.Level0)
{
    if (g_capMjpeg != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirMjpeg;
        vDecSample->getFormat(file);
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMjpeg));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE30, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_MJPEGDEC_FUNCTION_0004
 * @tc.number VIDEO_MJPEGDEC_FUNCTION_0004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MJPEGDEC_FUNCTION_0004, TestSize.Level0)
{
    if (g_capMjpeg != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirMjpeg;
        vDecSample->getFormat(file);
        vDecSample->SF_OUTPUT = true;
        vDecSample->outputYuvSurface = true;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameMjpeg));
        vDecSample->WaitForEOS();
        ASSERT_EQ(FRAMESIZE30, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_FUNCTION_0005
 * @tc.number VIDEO_MSVIDEO1DEC_FUNCTION_0005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MSVIDEO1DEC_FUNCTION_0005, TestSize.Level0)
{
    if (g_capMsvideo1 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirMsvideo1;
        vDecSample->getFormat(file);
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMsvideo1));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE98, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_MSVIDEO1DEC_FUNCTION_0006
 * @tc.number VIDEO_MSVIDEO1DEC_FUNCTION_0006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MSVIDEO1DEC_FUNCTION_0006, TestSize.Level0)
{
    if (g_capMsvideo1 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        const char* file = ginpDirMsvideo1;
        vDecSample->getFormat(file);
        vDecSample->SF_OUTPUT = true;
        vDecSample->outputYuvSurface = true;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameMsvideo1));
        vDecSample->WaitForEOS();
        ASSERT_EQ(FRAMESIZE98, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VP8DEC_FUNCTION_0007
 * @tc.number VIDEO_VP8DEC_FUNCTION_0007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VP8DEC_FUNCTION_0007, TestSize.Level0)
{
    if (g_capVp8 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirVp8;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVp8));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderReadStream());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE52, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_FUNCTION_0008
 * @tc.number VIDEO_VP9DEC_FUNCTION_0008
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VP9DEC_FUNCTION_0008, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 != nullptr && (profiles[0] == VP9_PROFILE_0)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirVp9P0;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVp9));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderReadStream());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE52, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_FUNCTION_0009
 * @tc.number VIDEO_VP9DEC_FUNCTION_0009
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VP9DEC_FUNCTION_0009, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 != nullptr && (profiles[1] == VP9_PROFILE_1)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirVp9P1;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVp9));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderReadStream());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE100, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_FUNCTION_0010
 * @tc.number VIDEO_VP9DEC_FUNCTION_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VP9DEC_FUNCTION_0010, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 != nullptr && (profiles[2] == VP9_PROFILE_2)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirVp9P1;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVp9));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderReadStream());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE100, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_VP9DEC_FUNCTION_0011
 * @tc.number VIDEO_VP9DEC_FUNCTION_0011
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VP9DEC_FUNCTION_0011, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 != nullptr && (profiles[3] == VP9_PROFILE_3)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirVp9P1;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVp9));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderReadStream());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE100, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_FUNCTION_0012
 * @tc.number VIDEO_AV1DEC_FUNCTION_0012
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_AV1DEC_FUNCTION_0012, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 != nullptr && (profiles[0] == AV1_PROFILE_MAIN)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirAv1Main;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameAv1));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderForAV1());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE180, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_FUNCTION_0013
 * @tc.number VIDEO_AV1DEC_FUNCTION_0013
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_AV1DEC_FUNCTION_0013, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 != nullptr && (profiles[1] == AV1_PROFILE_HIGH)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirAv1High;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameAv1));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderForAV1());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE45, vDecSample->outFrameCount);
    }
}

/**
 * @tc.name   VIDEO_AV1DEC_FUNCTION_0014
 * @tc.number VIDEO_AV1DEC_FUNCTION_0014
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DecFuncNdkTest, VIDEO_AV1DEC_FUNCTION_0014, TestSize.Level0)
{
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 != nullptr && (profiles[2] == AV1_PROFILE_PROFESSIONAL)) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->INP_DIR = ginpDirAv1Pro;
        vDecSample->outputYuvFlag = true;
        ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameAv1));
        ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
        ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
        ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoderForAV1());
        vDecSample->WaitForEOS();
        ASSERT_EQ(0, vDecSample->errCount);
        ASSERT_EQ(FRAMESIZE45, vDecSample->outFrameCount);
    }
}
} // namespace