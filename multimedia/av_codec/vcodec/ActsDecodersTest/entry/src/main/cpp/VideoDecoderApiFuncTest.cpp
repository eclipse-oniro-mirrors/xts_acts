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
#include <fcntl.h>
#include <string>
#include <sys/stat.h>

// 测试常量定义
constexpr int MAX_DECODER_INSTANCES = 64;        // 最大解码器实例数
constexpr int MIN_VIDEO_WIDTH = 2;               // 最小视频宽度
constexpr int MAX_VIDEO_WIDTH = 2048;            // 最大视频宽度
constexpr int VC1_PROFILE_COUNT = 3;             // VC1 支持的 profile 数量
constexpr int WMV3_PROFILE_COUNT = 2;            // WMV3 支持的 profile 数量
constexpr int PIXEL_FORMAT_COUNT = 3;            // 支持的像素格式数量

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

static const string CODEC_NAME = "OH.Media.Codec.Decoder.Video.VC1";
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
    }
    return -1;
}

// Test OH_AVCodec_GetCapabilityByCategory
int VideoVc1DecCapApi0002()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (cap != nullptr) {
        if (MAX_DECODER_INSTANCES == OH_AVCapability_GetMaxSupportedInstances(cap)) {
            return 0;
        }
    }
    return -1;
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
    }
    return -1;
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
    return -1;
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
    return -1;
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
    return -1;
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
        return -1;
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
        return -1;
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
    }
    return -1;
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
    return -1;
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
        return -1;
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
    return -1;
}

} // namespace Media
} // namespace OHOS
