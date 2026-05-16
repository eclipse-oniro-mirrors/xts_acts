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
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <fcntl.h>
#include <string>
#include <sys/stat.h>
#include <iostream>
#include <unistd.h>

// 测试常量定义
constexpr int MAX_DECODER_INSTANCES = 64;        // 最大解码器实例数
constexpr int MIN_VIDEO_WIDTH = 2;               // 最小视频宽度
constexpr int MAX_VIDEO_WIDTH = 1920;            // 最大视频宽度
constexpr int VC1_PROFILE_COUNT = 3;             // VC1 支持的 profile 数量
constexpr int WMV3_PROFILE_COUNT = 2;            // WMV3 支持的 profile 数量
constexpr int PIXEL_FORMAT_COUNT = 3;            // 支持的像素格式数量
static OH_AVCodec *venc_ = nullptr;

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

#define PIXFORMAT_NUM 3

// 声明安全函数
extern "C" {
int SecureMemset(void *dest, size_t destMax, int c, size_t count);
}

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace OHOS {
namespace Media {

static bool CheckProfileLevelSupport(OH_AVCapability *capability, int32_t profile,
                                     const int32_t levels[], size_t levelCount)
{
    for (size_t i = 0; i < levelCount; i++) {
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, profile, levels[i])) {
            return false;
        }
    }
    return true;
}

static const string CODEC_NAME = "OH.Media.Codec.Decoder.Video.VC1";
static const string CODEC_NAME_VP8 = "OH.Media.Codec.Decoder.Video.VP8";
static const string CODEC_NAME_VP9 = "OH.Media.Codec.Decoder.Video.VP9";
static const string CODEC_NAME_AV1 = "OH.Media.Codec.Decoder.Video.AV1";
static const string CODEC_NAME_RV30 = "OH.Media.Codec.Decoder.Video.Rv30";
static const string CODEC_NAME_RV40 = "OH.Media.Codec.Decoder.Video.Rv40";
static const string CODEC_NAME_MJPEG = "OH.Media.Codec.Decoder.Video.MJPEG";
static const string CODEC_NAME_MSVIDEO1 = "OH.Media.Codec.Decoder.Video.MSVIDEO1";
static const string CODEC_NAME_RAWVIDEO = "OH.Media.Codec.Decoder.Video.RAWVIDEO";
static const string CODEC_NAME_MPEG1 = "OH.Media.Codec.Decoder.Video.MPEG";
static const string CODEC_NAME_WVC1 = "OH.Media.Codec.Decoder.Video.WVC1";
static const string CODEC_NAME_WMV3 = "OH.Media.Codec.Decoder.Video.WMV3";
static const string CODEC_NAME_DVVIDEO = "OH.Media.Codec.Decoder.Video.DVVIDEO";
static constexpr uint32_t DEFAULT_WIDTH = 1920;
static constexpr uint32_t DEFAULT_HEIGHT = 1080;

static bool CheckPixelFormat(int32_t pixformat)
{
    if (pixformat == AV_PIXEL_FORMAT_YUVI420 ||
        pixformat == AV_PIXEL_FORMAT_NV12 ||
        pixformat == AV_PIXEL_FORMAT_NV21) {
        return true;
    }
    return false;
}

static bool CheckProfile(int32_t profile)
{
    if (profile == VC1_PROFILE_SIMPLE ||
        profile == VC1_PROFILE_MAIN ||
        profile == VC1_PROFILE_ADVANCED) {
        return true;
    }
    return false;
}

static bool CheckLevelsForProfile(int32_t profile, int32_t level)
{
    if (profile == VC1_PROFILE_SIMPLE) {
        return (level == VC1_LEVEL_LOW || level == VC1_LEVEL_MEDIUM);
    } else if (profile == VC1_PROFILE_MAIN) {
        return (level == VC1_LEVEL_LOW || level == VC1_LEVEL_MEDIUM || level == VC1_LEVEL_HIGH);
    } else if (profile == VC1_PROFILE_ADVANCED) {
        return (level == VC1_LEVEL_L0 || level == VC1_LEVEL_L1 || level == VC1_LEVEL_L2 ||
                level == VC1_LEVEL_L3 || level == VC1_LEVEL_L4);
    }
    return false;
}

// Test OH_AVCodec_GetCapability
int VideoVc1DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test OH_AVCodec_GetCapabilityByCategory
int VideoVc1DecCapApi0002()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (cap != nullptr) {
        if (MAX_DECODER_INSTANCES == OH_AVCapability_GetMaxSupportedInstances(cap)) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test OH_AVCapability_GetVideoWidthRange
int VideoVc1DecCapApi0003()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
        if (ret == AV_ERR_OK && range.minVal == MIN_VIDEO_WIDTH && range.maxVal == MAX_VIDEO_WIDTH) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test OH_AVCapability_GetVideoSupportedPixelFormats
int VideoVc1DecCapApi0004()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
        if (ret != AV_ERR_OK || pixelFormat == nullptr || pixelFormatNum != PIXEL_FORMAT_COUNT) {
            return -1;
        }
        
        for (uint32_t i = 0; i < pixelFormatNum; i++) {
            OH_AVCodec *vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
            if (vdec == nullptr) {
                return -1;
            }
            OH_AVFormat *format = OH_AVFormat_Create();
            if (format == nullptr) {
                OH_VideoDecoder_Destroy(vdec);
                return -1;
            }
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            
            if (OH_VideoDecoder_Configure(vdec, format) != AV_ERR_OK) {
                OH_AVFormat_Destroy(format);
                OH_VideoDecoder_Destroy(vdec);
                return -1;
            }
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec);
        }
        return 0;
    }
    return 0;
}

// Test pixel format validation
int VideoVc1DecCapApi0005()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
        if (ret != AV_ERR_OK || pixelFormat == nullptr || pixelFormatNum != PIXFORMAT_NUM) {
            return -1;
        }
        
        for (uint32_t i = 0; i < pixelFormatNum; i++) {
            if (!CheckPixelFormat(pixelFormat[i])) {
                return -1;
            }
        }
        
        // Test invalid pixel format
        OH_AVCodec *vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
        if (vdec == nullptr) {
            return -1;
        }
        OH_AVFormat *format = OH_AVFormat_Create();
        if (format == nullptr) {
            OH_VideoDecoder_Destroy(vdec);
            return -1;
        }
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21 + AV_PIXEL_FORMAT_NV21);
        
        if (OH_VideoDecoder_Configure(vdec, format) == AV_ERR_OK) {
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec);
            return -1;
        }
        OH_AVFormat_Destroy(format);
        OH_VideoDecoder_Destroy(vdec);
        return 0;
    }
    return 0;
}

// Test OH_AVCapability_GetSupportedProfiles
int VideoVc1DecCapApi0006()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        if (ret != AV_ERR_OK || profileNum != VC1_PROFILE_COUNT || profiles == nullptr) {
            return -1;
        }
        for (uint32_t i = 0; i < profileNum; i++) {
            if (!CheckProfile(profiles[i])) {
                return -1;
            }
        }
        return 0;
    }
    return 0;
}

static int CheckProfileLevels(OH_AVCapability *capability, int32_t profile)
{
    OH_AVErrCode ret;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profile, &levels, &levelNum);
    if (ret != AV_ERR_OK || levels == nullptr || levelNum == 0) {
        return -1;
    }
    for (uint32_t j = 0; j < levelNum; j++) {
        if (!CheckLevelsForProfile(profile, levels[j])) {
            return -1;
        }
    }
    return 0;
}

// Test OH_AVCapability_GetSupportedLevelsForProfile
int VideoVc1DecCapApi0007()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK || profileNum != VC1_PROFILE_COUNT || profiles == nullptr) {
        return -1;
    }
    
    for (uint32_t i = 0; i < profileNum; i++) {
        if (!CheckProfile(profiles[i])) {
            return -1;
        }
        if (CheckProfileLevels(capability, profiles[i]) != 0) {
            return -1;
        }
    }
    return 0;
}

static int VerifyProfileLevelSupport(OH_AVCapability *capability, int32_t profile)
{
    OH_AVErrCode ret;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profile, &levels, &levelNum);
    if (ret != AV_ERR_OK || levels == nullptr) {
        return -1;
    }
    for (uint32_t j = 0; j < levelNum; j++) {
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, profile, levels[j])) {
            return -1;
        }
    }
    return 0;
}

// Test OH_AVCapability_AreProfileAndLevelSupported
int VideoVc1DecCapApi0008()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK || profileNum != VC1_PROFILE_COUNT || profiles == nullptr) {
        return -1;
    }
    
    for (uint32_t i = 0; i < profileNum; i++) {
        if (!CheckProfile(profiles[i])) {
            return -1;
        }
        if (VerifyProfileLevelSupport(capability, profiles[i]) != 0) {
            return -1;
        }
    }
    return 0;
}

// Test MSVIDEO1 profiles
int VideoMsvideo1DecCapApi0009()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        if (ret == AV_ERR_OK && profileNum == 0) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test WMV3 profiles
int VideoMsvideo1DecCapApi0010()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        if (ret != AV_ERR_OK || profileNum != WMV3_PROFILE_COUNT || profiles == nullptr) {
            return -1;
        }
        for (uint32_t i = 0; i < profileNum; i++) {
            if (profiles[i] < 0) {
                return -1;
            }
        }
        return 0;
    }
    return 0;
}

static int VerifyWmv3ProfileLevels(OH_AVCapability* capability, int32_t profile)
{
    OH_AVErrCode ret;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profile, &levels, &levelNum);
    if (ret != AV_ERR_OK || levels == nullptr || levelNum == 0) {
        return -1;
    }
    for (uint32_t j = 0; j < levelNum; j++) {
        if (levels[j] < 0) {
            return -1;
        }
    }
    return 0;
}

// Test WMV3 levels for profiles
int VideoMsvideo1DecCapApi0011()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK || profileNum != WMV3_PROFILE_COUNT) {
        return -1;
    }
    
    for (uint32_t i = 0; i < profileNum; i++) {
        if (profiles[i] < 0) {
            return -1;
        }
        if (VerifyWmv3ProfileLevels(capability, profiles[i]) != 0) {
            return -1;
        }
    }
    return 0;
}

// Test WMV3 profile and level support
int VideoMsvideo1DecCapApi0012()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3,
        false, SOFTWARE);
    if (capability != nullptr) {
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WMV3_PROFILE_SIMPLE, WMV3_LEVEL_LOW)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WMV3_PROFILE_SIMPLE, WMV3_LEVEL_MEDIUM)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WMV3_PROFILE_MAIN, WMV3_LEVEL_LOW)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WMV3_PROFILE_MAIN, WMV3_LEVEL_MEDIUM)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WMV3_PROFILE_MAIN, WMV3_LEVEL_HIGH)) {
            return -1;
        }
        return 0;
    }
    return 0;
}

// Test VP8 decoder capability API
int VideoVp8DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VP8, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_VP8 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test VP9 decoder capability API
int VideoVp9DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VP9, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_VP9 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test AV1 decoder capability API
int VideoAv1DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AV1, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_AV1 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test RV30 decoder capability API
int VideoRv30DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RV30, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_RV30 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test RV40 decoder capability API
int VideoRv40DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RV40, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_RV40 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test MJPEG decoder capability API
int VideoMjpegDecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MJPEG, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_MJPEG == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test MSVIDEO1 decoder capability API
int VideoMsvideo1DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_MSVIDEO1 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test RAWVIDEO decoder capability API
int VideoRawvideoDecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_RAWVIDEO, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_RAWVIDEO == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test MPEG1 decoder capability API
int VideoMpeg1DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_MPEG1, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_MPEG1 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test WVC1 decoder capability API
int VideoWvc1DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_WVC1, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_WVC1 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test WMV3 decoder capability API
int VideoWmv3DecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_WMV3 == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test DVVIDEO decoder capability API
int VideoDvvideoDecCapApi0001()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_DVVIDEO, false);
    if (cap != nullptr) {
        string codecName = OH_AVCapability_GetName(cap);
        if (CODEC_NAME_DVVIDEO == codecName) {
            return 0;
        }
        return -1;
    }
    return 0;
}

// Test VP9 decoder profile and level support
int VideoVp9DecCapApi0013()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VP9,
                                                                     false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    const int32_t vp9Profile0Levels[] = {
        VP9_LEVEL_1, VP9_LEVEL_11, VP9_LEVEL_2, VP9_LEVEL_21, VP9_LEVEL_3, VP9_LEVEL_31,
        VP9_LEVEL_4, VP9_LEVEL_41, VP9_LEVEL_5, VP9_LEVEL_51, VP9_LEVEL_52, VP9_LEVEL_6,
        VP9_LEVEL_61, VP9_LEVEL_62
    };
    if (!CheckProfileLevelSupport(capability, VP9_PROFILE_0, vp9Profile0Levels,
                                  sizeof(vp9Profile0Levels) / sizeof(vp9Profile0Levels[0]))) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, VP9_PROFILE_1, VP9_LEVEL_31)) {
        return -1;
    }
    return 0;
}

// Test AV1 decoder profile and level support (part 1)
int VideoAv1DecCapApi0014()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1,
                                                                     false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    const int32_t av1MainLevels[] = {
        AV1_LEVEL_20, AV1_LEVEL_21, AV1_LEVEL_22, AV1_LEVEL_23, AV1_LEVEL_30, AV1_LEVEL_31,
        AV1_LEVEL_32, AV1_LEVEL_33, AV1_LEVEL_40, AV1_LEVEL_41, AV1_LEVEL_42, AV1_LEVEL_43,
        AV1_LEVEL_50, AV1_LEVEL_51, AV1_LEVEL_52, AV1_LEVEL_53, AV1_LEVEL_60
    };
    if (!CheckProfileLevelSupport(capability, AV1_PROFILE_MAIN, av1MainLevels,
                                  sizeof(av1MainLevels) / sizeof(av1MainLevels[0]))) {
        return -1;
    }
    return 0;
}

// Test AV1 decoder profile and level support (part 2)
int VideoAv1DecCapApi0015()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1,
                                                                     false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    if (capability != nullptr) {
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_61)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_62)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_63)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_70)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_71)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_72)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_MAIN, AV1_LEVEL_73)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AV1_PROFILE_HIGH, AV1_LEVEL_33)) {
            return -1;
        }
        return 0;
    }
    return 0;
}

// Test WVC1 decoder profile and level support
int VideoWvc1DecCapApi0016()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WVC1,
                                                                     false, SOFTWARE);
    if (capability == nullptr) {
        return 0;
    }
    if (capability != nullptr) {
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L0)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L1)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L2)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L3)) {
            return -1;
        }
        if (!OH_AVCapability_AreProfileAndLevelSupported(capability, WVC1_PROFILE_ADVANCED, WVC1_LEVEL_L4)) {
            return -1;
        }
        return 0;
    }
    return 0;
}

// Test AV1 decoder supported profiles
int VideoAv1DecCapApi0017()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AV1,
                                                                     false, SOFTWARE);
    if (capability != nullptr) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        if (ret != AV_ERR_OK || profiles == nullptr) {
            return -1;
        }
        bool professionalFound = false;
        for (uint32_t i = 0; i < profileNum; i++) {
            if (profiles[i] < 0) {
                return -1;
            }
            if (profiles[i] == AV1_PROFILE_PROFESSIONAL) {
                professionalFound = true;
            }
        }
        if (professionalFound && profiles[profileNum - 1] != AV1_PROFILE_PROFESSIONAL) {
            return -1;
        }
        return 0;
    }
    return 0;
}

// Obtain a list of supported capabilities and their names for the video encoder
int VideoEncCapApi0018()
{
    uint32_t count = 0;
    OH_AVCapability **capabilityList = nullptr;
    const char *codecNameType = nullptr;
    const char *codecNameMimeType = nullptr;
    capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_VIDEO_ENCODER, &count);
    if (capabilityList == nullptr || count == 0) {
        return -1;
    }
    for (uint32_t i = 0; i < count; ++i) {
        codecNameType = OH_AVCapability_GetName(capabilityList[i]);
        codecNameMimeType = OH_AVCapability_GetMimeType(capabilityList[i]);
        cout << "codecNameType= " << codecNameType << endl;
        cout << "codecNameMimeType= " << codecNameMimeType << endl;
    }
    return 0;
}

// Obtain a list of supported capabilities and their names for the video decoder
int VideoDecCapApi0019()
{
    uint32_t count = 0;
    OH_AVCapability **capabilityList = nullptr;
    const char *codecNameType = nullptr;
    const char *codecNameMimeType = nullptr;
    capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_VIDEO_DECODER, &count);
    if (capabilityList == nullptr || count == 0) {
        return -1;
    }
    for (uint32_t i = 0; i < count; ++i) {
        codecNameType = OH_AVCapability_GetName(capabilityList[i]);
        codecNameMimeType = OH_AVCapability_GetMimeType(capabilityList[i]);
        cout << "codecNameType= " << codecNameType << endl;
        cout << "codecNameMimeType= " << codecNameMimeType << endl;
    }
    return 0;
}

// Obtain a list of supported capabilities and their names for the audio encoder
int VideoEncCapApi0020()
{
    uint32_t count = 0;
    OH_AVCapability **capabilityList = nullptr;
    const char *codecNameType = nullptr;
    const char *codecNameMimeType = nullptr;
    capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_AUDIO_ENCODER, &count);
    if (capabilityList == nullptr || count == 0) {
        return -1;
    }
    for (uint32_t i = 0; i < count; ++i) {
        codecNameType = OH_AVCapability_GetName(capabilityList[i]);
        codecNameMimeType = OH_AVCapability_GetMimeType(capabilityList[i]);
        cout << "codecNameType= " << codecNameType << endl;
        cout << "codecNameMimeType= " << codecNameMimeType << endl;
    }
    return 0;
}

// Obtain a list of supported capabilities and their names for the audio DECODER
int VideoDecCapApi0021()
{
    uint32_t count = 0;
    OH_AVCapability **capabilityList = nullptr;
    const char *codecNameType = nullptr;
    const char *codecNameMimeType = nullptr;
    capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_AUDIO_DECODER, &count);
    if (capabilityList == nullptr || count == 0) {
        return -1;
    }
    for (uint32_t i = 0; i < count; ++i) {
        codecNameType = OH_AVCapability_GetName(capabilityList[i]);
        codecNameMimeType = OH_AVCapability_GetMimeType(capabilityList[i]);
        cout << "codecNameType= " << codecNameType << endl;
        cout << "codecNameMimeType= " << codecNameMimeType << endl;
    }
    return 0;
}

// Check the encoder type
int VideoEncCapApi0022()
{
    OH_AVCapability *capHevcHw = nullptr;
    bool checkMimeType = true;
    capHevcHw = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (capHevcHw == nullptr) {
        return 0;
    }
    checkMimeType = OH_AVCapability_CheckMimeType(capHevcHw, OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (!checkMimeType) {
        return -1;
    }
    return 0;
}

// Check the secure decoder type
int VideoDecCapApi0023()
{
    uint32_t count = 0;
    if (access("/system/lib64/media/", 0)) {
        return 0;
    }
    OH_AVCapability **capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_VIDEO_DECODER, &count);
    if (capabilityList == nullptr || count == 0) {
        return -1;
    }
    for (uint32_t i = 0; i < count; ++i) {
        if (OH_AVCapability_IsSecure(capabilityList[i])) {
            return 0;
        }
    }
    return -1;
}

// Check the encoder type
int VideoDecCapApi0024()
{
    bool checkMimeType = true;
    checkMimeType = OH_AVCapability_CheckMimeType(nullptr, OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (!checkMimeType) {
        return -1;
    }
    return 0;
}

// Check the encoder type
int VideoDecCapApi0025()
{
    OH_AVCapability *capHevcHw = nullptr;
    bool checkMimeType = true;
    capHevcHw = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (capHevcHw == nullptr) {
        return 0;
    }
    checkMimeType = OH_AVCapability_CheckMimeType(capHevcHw, nullptr);
    if (!checkMimeType) {
        return -1;
    }
    return 0;
}

// Check the encoder type
int VideoDecCapApi0026()
{
    bool checkMimeType = true;
    checkMimeType = OH_AVCapability_IsSecure(nullptr);
    if (!checkMimeType) {
        return -1;
    }
    return 0;
}

int VideoDecCapApi0027()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, SOFTWARE);
    if (!cap) {
        return 0;
    }
    string codecName = "";
    codecName = OH_AVCapability_GetName(cap);
    venc_ = OH_VideoEncoder_CreateByName(codecName.c_str());
    if (!venc_) {
        return -1;
    }
    OH_AVFormat *format = OH_VideoEncoder_GetOutputDescription(venc_);
    if (!format) {
        OH_VideoEncoder_Destroy(venc_);
        return -1;
    }

    int32_t layerId = 0;
    int32_t ret = OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_LAYER_ID, &layerId);
    if (ret == 0) {
        std::cout << "temporal layer id: " << layerId << std::endl;
    } else {
        std::cerr << "Failed to get temporal layer id, ret=" << ret << std::endl;
    }

    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Destroy(venc_);
    return (ret == 0) ? 0 : -1;
}

} // namespace Media
} // namespace OHOS
