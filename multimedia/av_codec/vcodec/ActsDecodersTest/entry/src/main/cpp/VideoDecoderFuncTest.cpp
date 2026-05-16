/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/VideoDecoderFuncTest.h"
#include "include/VideoDecApi11SampleTest.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avformat.h>
#include <hilog/log.h>
#include <string>
#include <memory>
#include <sys/stat.h>
#include <unistd.h>

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "VideoDecoderTest"

namespace OHOS {
namespace Media {

static OH_AVCapability *g_capVc1 = nullptr;
static OH_AVCapability* g_capMjpeg = nullptr;
static OH_AVCapability* g_capMsvideo1 = nullptr;
static OH_AVCapability* g_capVp8 = nullptr;
static OH_AVCapability* g_capVp9 = nullptr;
static OH_AVCapability* g_capAv1 = nullptr;
static OH_AVCapability* g_capCinepak = nullptr;
static string g_codecNameVc1 = "";
static string g_codecNameMjpeg = "";
static string g_codecNameMsvideo1 = "";
static string g_codecNameVp8 = "";
static string g_codecNameVp9 = "";
static string g_codecNameAv1 = "";
static string g_codecNameCinepak = "";
static constexpr uint32_t FRAMESIZE60 = 60;
static constexpr uint32_t FRAMESIZE30 = 30;
static constexpr uint32_t FRAMESIZE98 = 98;
static constexpr uint32_t FRAMESIZE52 = 52;
static constexpr uint32_t FRAMESIZE100 = 100;
static constexpr uint32_t FRAMESIZE180 = 180;
static constexpr uint32_t FRAMESIZE45 = 45;
static constexpr uint32_t FRAMESIZE5 = 5;

// Profile index constants
static constexpr uint32_t PROFILE_INDEX_0 = 0;
static constexpr uint32_t PROFILE_INDEX_1 = 1;
static constexpr uint32_t PROFILE_INDEX_2 = 2;
static constexpr uint32_t PROFILE_INDEX_3 = 3;
static constexpr uint32_t MIN_PROFILE_COUNT_2 = 2;
static constexpr uint32_t MIN_PROFILE_COUNT_3 = 3;
static constexpr uint32_t MIN_PROFILE_COUNT_4 = 4;

static const char *GINP_DIR_VC1 = "/data/storage/el2/base/files/video/test_vc1.avi";
static const char *GINP_DIR_MJPEG = "/data/storage/el2/base/files/video/1920_1080_30.avi";
static const char *GINP_DIR_MSVIDEO1 = "/data/storage/el2/base/files/video/msvideo1_720x480.avi";
static const char *GINP_DIR_VP8 = "/data/storage/el2/base/files/video/vp8_480x640.ivf";
static const char *GINP_DIR_1080P_VP8 = "/data/storage/el2/base/files/video/vp8_1080x1920@30fps.ivf";
static const char *GINP_DIR_VP9_P0 = "/data/storage/el2/base/files/video/vp9_1_0_p0_256x144@15fps.ivf";
static const char *GINP_DIR_VP9_P1 = "/data/storage/el2/base/files/video/vp9_1_1_p1_384x192@30fps.ivf";
static const char *GINP_DIR_VP9_P2 = "/data/storage/el2/base/files/video/vp9_2_1_p2_640x384@30fps.ivf";
static const char *GINP_DIR_VP9_P3 = "/data/storage/el2/base/files/video/vp9_3_1_p3_1280x768@30fps.ivf";
static const char *GINP_DIR_VP9_L4_P0 = "/data/storage/el2/base/files/video/vp9_4_0_p0_2048x1088@30fps.ivf";
static const char *GINP_DIR_VP9_L4_P1 = "/data/storage/el2/base/files/video/vp9_4_0_p1_2048x1088@30fps.ivf";
static const char *GINP_DIR_AV1_MAIN = "/data/storage/el2/base/files/video/av1_main_L3.1_1280x720.ivf";
static const char *GINP_DIR_AV1_HIGH = "/data/storage/el2/base/files/video/av1_high_L3.0_854x480.ivf";
static const char *GINP_DIR_AV1_MAIN_8BIT = "/data/storage/el2/base/files/video/av1_main_L4.0_1920x1080.ivf";
static const char *GINP_DIR_AV1_HIGH_8BIT = "/data/storage/el2/base/files/video/av1_high_L4.0_1920x1080.ivf";
static const char *GINP_DIR_CINEPAK = "/data/storage/el2/base/files/video/cinepak_720_480_25.mkv";

static void InitCapabilities()
{
    if (g_capVc1 == nullptr) {
        g_capVc1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
        if (g_capVc1 != nullptr) {
            g_codecNameVc1 = OH_AVCapability_GetName(g_capVc1);
        }
    }
    if (g_capMjpeg == nullptr) {
        g_capMjpeg = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MJPEG, false, SOFTWARE);
        if (g_capMjpeg != nullptr) {
            g_codecNameMjpeg = OH_AVCapability_GetName(g_capMjpeg);
        }
    }
    if (g_capMsvideo1 == nullptr) {
        g_capMsvideo1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
        if (g_capMsvideo1 != nullptr) {
            g_codecNameMsvideo1 = OH_AVCapability_GetName(g_capMsvideo1);
        }
    }
    if (g_capVp8 == nullptr) {
        g_capVp8 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP8, false, SOFTWARE);
        if (g_capVp8 != nullptr) {
            g_codecNameVp8 = OH_AVCapability_GetName(g_capVp8);
        }
    }
    if (g_capVp9 == nullptr) {
        g_capVp9 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP9, false, SOFTWARE);
        if (g_capVp9 != nullptr) {
            g_codecNameVp9 = OH_AVCapability_GetName(g_capVp9);
        }
    }
    if (g_capAv1 == nullptr) {
        g_capAv1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1, false, SOFTWARE);
        if (g_capAv1 != nullptr) {
            g_codecNameAv1 = OH_AVCapability_GetName(g_capAv1);
        }
    }
    if (g_capCinepak == nullptr) {
        g_capCinepak = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_CINEPAK, false, SOFTWARE);
        if (g_capCinepak != nullptr) {
            g_codecNameCinepak = OH_AVCapability_GetName(g_capCinepak);
        }
    }
}

static int SetupDecoder(shared_ptr<VDecAPI11Sample> vDecSample, const string& codecName)
{
    vDecSample->outputYuvFlag = true;
    
    if (vDecSample->CreateVideoDecoder(codecName) != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->StartVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    return 0;
}

static int VerifyDecodingResult(shared_ptr<VDecAPI11Sample> vDecSample, uint32_t expectedFrameCount)
{
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->outFrameCount != expectedFrameCount) {
        return -1;
    }
    
    return 0;
}

// Test VC1 decoder function with buffer mode
int VideoVc1DecFunction0001()
{
    InitCapabilities();
    if (g_capVc1 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_VC1);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    
    if (SetupDecoder(vDecSample, g_codecNameVc1) != 0) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    int result = VerifyDecodingResult(vDecSample, FRAMESIZE60);
    return result;
}

// Test MJPEG decoder function with buffer mode
int VideoMjpegDecFunction0003()
{
    InitCapabilities();
    if (g_capMjpeg == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_MJPEG);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    
    if (SetupDecoder(vDecSample, g_codecNameMjpeg) != 0) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    int result = VerifyDecodingResult(vDecSample, FRAMESIZE30);
    return result;
}

// Test MSVIDEO1 decoder function with buffer mode
int VideoMsvideo1DecFunction0005()
{
    InitCapabilities();
    if (g_capMsvideo1 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_MSVIDEO1);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    
    if (SetupDecoder(vDecSample, g_codecNameMsvideo1) != 0) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    int result = VerifyDecodingResult(vDecSample, FRAMESIZE98);
    return result;
}

// Test VC1 decoder function with surface mode
int VideoVc1DecFunction0002()
{
    InitCapabilities();
    if (g_capVc1 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_VC1);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    vDecSample->sfOutput = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    if (vDecSample->RunVideoDecSurface(g_codecNameVc1) != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->outFrameCount != FRAMESIZE60) {
        return -1;
    }
    return 0;
}

// Test MJPEG decoder function with surface mode
int VideoMjpegDecFunction0004()
{
    InitCapabilities();
    if (g_capMjpeg == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_MJPEG);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    vDecSample->sfOutput = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    if (vDecSample->RunVideoDecSurface(g_codecNameMjpeg) != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->outFrameCount != FRAMESIZE30) {
        return -1;
    }
    return 0;
}

// Test MSVIDEO1 decoder function with surface mode
int VideoMsvideo1DecFunction0006()
{
    InitCapabilities();
    if (g_capMsvideo1 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_MSVIDEO1);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    vDecSample->sfOutput = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    if (vDecSample->RunVideoDecSurface(g_codecNameMsvideo1) != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->outFrameCount != FRAMESIZE98) {
        return -1;
    }
    return 0;
}

// Test VP8 decoder function
int VideoVp8DecFunction0007()
{
    InitCapabilities();
    if (g_capVp8 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP8;
    vDecSample->outputYuvFlag = true;
    
    if (vDecSample->CreateVideoDecoder(g_codecNameVp8) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE52);
}

// Test VP9 decoder function with profile 0
int VideoVp9DecFunction0008()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profiles[0] != VP9_PROFILE_0) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_P0;
    vDecSample->outputYuvFlag = true;
    
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE52);
}

// Test VP9 decoder function with profile 1
int VideoVp9DecFunction0009()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_2 ||
            profiles[PROFILE_INDEX_1] != VP9_PROFILE_1) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_P1;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE100);
}

// Test VP9 decoder function with profile 2
int VideoVp9DecFunction0010()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_3 ||
            profiles[PROFILE_INDEX_2] != VP9_PROFILE_2) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_P1;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE100);
}

// Test VP9 decoder function with profile 3
int VideoVp9DecFunction0011()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_4 ||
            profiles[PROFILE_INDEX_3] != VP9_PROFILE_3) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_P1;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE100);
}

// Test AV1 decoder function with main profile
int VideoAv1DecFunction0012()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 == nullptr || profiles == nullptr || profiles[0] != AV1_PROFILE_MAIN) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_AV1_MAIN;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAv1) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderForAV1() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE180);
}

// Test AV1 decoder function with high profile
int VideoAv1DecFunction0013()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_2 ||
            profiles[PROFILE_INDEX_1] != AV1_PROFILE_HIGH) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_AV1_HIGH;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAv1) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderForAV1() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE45);
}

// Test AV1 decoder function with main profile 8bit
int VideoAv1DecFunction0015()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 == nullptr || profiles == nullptr || profiles[0] != AV1_PROFILE_MAIN) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_AV1_MAIN_8BIT;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAv1) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderForAV1() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE180);
}

// Test AV1 decoder function with high profile 8bit
int VideoAv1DecFunction0016()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capAv1, &profiles, &profileNum);
    if (g_capAv1 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_2 ||
            profiles[PROFILE_INDEX_1] != AV1_PROFILE_HIGH) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_AV1_HIGH_8BIT;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameAv1) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderForAV1() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE45);
}

// Test VP9 decoder function with level 4 profile 0
int VideoVp9DecFunction0019()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profiles[0] != VP9_PROFILE_0) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_L4_P0;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE100);
}

// Test VP9 decoder function with level 4 profile 1
int VideoVp9DecFunction0020()
{
    InitCapabilities();
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(g_capVp9, &profiles, &profileNum);
    if (g_capVp9 == nullptr || profiles == nullptr || profileNum < MIN_PROFILE_COUNT_2 ||
            profiles[PROFILE_INDEX_1] != VP9_PROFILE_1) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_VP9_L4_P1;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp9) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE100);
}

// Test VP8 decoder function with 1080p
int VideoVp8DecFunction0021()
{
    InitCapabilities();
    if (g_capVp8 == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = GINP_DIR_1080P_VP8;
    vDecSample->outputYuvFlag = true;
    if (vDecSample->CreateVideoDecoder(g_codecNameVp8) != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    if (vDecSample->StartVideoDecoderReadStream() != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    return VerifyDecodingResult(vDecSample, FRAMESIZE52);
}

// Test cinepak decoder function with buffer mode
int VideoCinepakDecFunction0022()
{
    InitCapabilities();
    if (g_capCinepak == nullptr) {
        return 0;
    }
    
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->GetFormat(GINP_DIR_CINEPAK);
    if (vDecSample->gFd < 0) {
        return -1;
    }
    
    if (SetupDecoder(vDecSample, g_codecNameCinepak) != 0) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    int result = VerifyDecodingResult(vDecSample, FRAMESIZE5);
    return result;
}
} // namespace Media
} // namespace OHOS
