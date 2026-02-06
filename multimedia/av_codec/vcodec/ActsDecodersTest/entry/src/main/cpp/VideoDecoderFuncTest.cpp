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
static string g_codecNameVc1 = "";
static string g_codecNameMjpeg = "";
static string g_codecNameMsvideo1 = "";
static constexpr uint32_t FRAMESIZE60 = 60;
static constexpr uint32_t FRAMESIZE30 = 30;
static constexpr uint32_t FRAMESIZE98 = 98;

static const char *GINP_DIR_VC1 = "/data/storage/el2/base/files/video/test_vc1.avi";
static const char *GINP_DIR_MJPEG = "/data/storage/el2/base/files/video/1920_1080_30.avi";
static const char *GINP_DIR_MSVIDEO1 = "/data/storage/el2/base/files/video/msvideo1_720x480.avi";

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
        return -1;
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
    return VerifyDecodingResult(vDecSample, FRAMESIZE60);
}

// Test MJPEG decoder function with buffer mode
int VideoMjpegDecFunction0003()
{
    InitCapabilities();
    if (g_capMjpeg == nullptr) {
        return -1;
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
    return VerifyDecodingResult(vDecSample, FRAMESIZE30);
}

// Test MSVIDEO1 decoder function with buffer mode
int VideoMsvideo1DecFunction0005()
{
    InitCapabilities();
    if (g_capMsvideo1 == nullptr) {
        return -1;
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
    return VerifyDecodingResult(vDecSample, FRAMESIZE98);
}

} // namespace Media
} // namespace OHOS
