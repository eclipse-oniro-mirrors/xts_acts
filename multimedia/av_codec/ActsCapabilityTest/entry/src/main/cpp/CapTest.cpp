/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <filesystem>
#include <iostream>
#include "include/CommonTest.h"
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <unistd.h>
namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
} // namespace
namespace OHOS {
namespace Media {
constexpr int MAX_ALLOWED_LTR_FRAME_COUNT = 10;
constexpr int ONE_HUNDRED = 100;
constexpr int FOUR = 4;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int SUCCESS_CODE = 0;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
class HwCapabilityNdkTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};


using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}

void HwCapabilityNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SafeMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != 0) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SafeMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != 0) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
void HwCapabilityNdkTest::TearDownTestCase() {}
void HwCapabilityNdkTest::SetUp() {}
void HwCapabilityNdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0010
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0010()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (OH_AVCapability_IsFeatureSupported(capability,
            static_cast<OH_AVCapabilityFeature>(FOUR)) != false) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0011
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0011
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0011()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) {
        return -1;
    }
    if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0012
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0012
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0012()
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY) < 0) {
                return -1;
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
                return -1;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0013
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0013
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0013()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) {
        return -1;
    }
    if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0014
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0014
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0014()
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE) < 0) {
                return -1;
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
                return -1;
            }
        }
    }
    return 0;
}
/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0015
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0015
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0015()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (capability) {
        if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0016
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0016
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0016()
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability =
            OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
        if (capability) {
            bool isLowLatencySupported = OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY);
            if (!isLowLatencySupported) {
                return -1;
            }
        }
    } else {
        OH_AVCapability *capability =
            OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY)) {
                return -1;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0017
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0017
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0017()
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY) < 0) {
                return -1;
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY)) {
                return -1;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0018
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0018
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0018()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(FOUR))) {
            return -1;
        }

        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(-1))) {
            return -1;
        }
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(ONE_HUNDRED))) {
            return -1;
        }

        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0019
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0019
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0019()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        false, HARDWARE);
    if (nullptr == capability) {
        return -1;
    }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0020
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0020
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0020()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0021
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0021
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0021()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        false, HARDWARE);
    if (nullptr == capability) {
        return -1;
    }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0022
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0022
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0022()
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
            true, HARDWARE);
        if (capability) {
            format = OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
            int ltrnum = 0;
            if (OH_AVFormat_GetIntValue(format,
                OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &ltrnum) < 0) {
                return -1;
            }
            if (ltrnum > MAX_ALLOWED_LTR_FRAME_COUNT) {
                return -1;
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
            true, HARDWARE);
        if (capability) {
            if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
                VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
                return -1;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0023
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0023
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0023()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        false, SOFTWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0024
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0024
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_TEMPORAL_ENCODE_API_0024()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        false, HARDWARE);
    if (nullptr == capability) {
        return -1;
    }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0025
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0025
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_TEMPORAL_ENCODE_API_0025()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability, VIDEO_LOW_LATENCY)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0026
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0026
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
int VIDEO_TEMPORAL_ENCODE_API_0026()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC,
        true, HARDWARE);
    if (capability) {
        const OH_NativeBuffer_Format *pixlFormats = nullptr;
        uint32_t pixlFormatNum = 0;
        if (AV_ERR_OK != OH_AVCapability_GetVideoSupportedNativeBufferFormats(capability,
            &pixlFormats, &pixlFormatNum)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0027
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0027
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
int VIDEO_TEMPORAL_ENCODE_API_0027()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability) {
        const OH_NativeBuffer_Format *pixlFormats = nullptr;
        uint32_t pixlFormatNum = 0;
        if (AV_ERR_INVALID_VAL != OH_AVCapability_GetVideoSupportedNativeBufferFormats(capability,
            &pixlFormats, &pixlFormatNum)) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_TEMPORAL_ENCODE_API_0028
 * @tc.number VIDEO_TEMPORAL_ENCODE_API_0028
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
int VIDEO_TEMPORAL_ENCODE_API_0028()
{
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    if (AV_ERR_INVALID_VAL !=OH_AVCapability_GetAudioSupportedSampleRateRanges(nullptr,
        &sampleRateRanges, &rangesNum)) {
        return -1;
    }
    return 0;
}

} // namespace Media
} // namespace OHOS