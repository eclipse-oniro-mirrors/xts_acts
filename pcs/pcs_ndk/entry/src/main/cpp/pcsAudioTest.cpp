/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <exception>
#include <multimedia/player_framework/native_avcapability.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <js_native_api_types.h>
#include <unistd.h>
#include <iostream>
#include "hilog/log.h"

#define FAIL (-1)
#define SUCCESS 0

constexpr uint32_t DEFAULT_SAMPLERATE = 44100;
constexpr uint32_t DEFAULT_BITRATE_MIN = 8000;
constexpr uint32_t DEFAULT_CHANNEL_MIN = 1;
constexpr uint32_t DEFAULT_CHANNEL_MAX = 2;
constexpr uint32_t DEFAULT_SAMPLE_RATE_8 = 8000;
constexpr uint32_t DEFAULT_SAMPLE_RATE_16 = 16000;
constexpr uint32_t DEFAULT_SAMPLE_RATE_441 = 44100;
constexpr uint32_t DEFAULT_SAMPLE_RATE_48 = 48000;
constexpr uint32_t DEFAULT_BITRATE_MAX = 320000;
constexpr uint32_t DEFAULT_CHANNEL_COUNT_ONE = 1;
constexpr uint32_t DEFAULT_CHANNEL_COUNT_TWO = 1;
constexpr uint32_t DEFAULT_MAX_INPUT_SIZE = 1152;
constexpr uint32_t DEFAULT_AAC_TYPE = 1;
constexpr uint8_t DEFAULT_VORBIS_TYPE = 10;
constexpr uint8_t DEFAULT_VORBISTWO_TYPE = 20;
const int GLOBAL_RESMGR = 0xFF00;
const int SD_HEIGHT = 480;
const int HD_WIDTH = 1280;
const int HD_HEIGHT = 720;
const char *TAG = "[pcsAudioTest]";


bool isSupportRate(OH_AVCapability *capability)
{
    // 1. 确认待配置采样率是否支持
    const int32_t *sampleRates = nullptr;
    bool isSupper16K = false;
    bool isSupper441K = false;
    bool isSupper48k = false;
    uint32_t sampleRateNum = 0;
    int32_t ret = OH_AVCapability_GetAudioSupportedSampleRates(capability, &sampleRates, &sampleRateNum);
    if (ret != AV_ERR_OK || sampleRates == nullptr || sampleRateNum == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " ret is :  %{public}d ", ret);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCapability_GetAudioSupportedSampleRates fail");
        return true;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRateNum end:  %{public}d ", sampleRateNum);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRates is: %{public}d", sampleRates);
    for (int i = 0; i < sampleRateNum; i++) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRate is: %{public}d ", sampleRates[i]);
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_16) {
            isSupper16K = true;
            continue;
        }
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_441) {
            isSupper441K = true;
            continue;
        }
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_48) {
            isSupper48k = true;
            continue;
        }
    }
    return isSupper16K && isSupper48k && isSupper441K;
}
bool isSupportRateAll(OH_AVCapability *capability)
{
    // 1. 确认待配置采样率是否支持
    const int32_t *sampleRates = nullptr;
    bool isSupper8K = false;
    bool isSupper16K = false;
    bool isSupper441K = false;
    bool isSupper48k = false;
    uint32_t sampleRateNum = 0;
    int32_t ret = OH_AVCapability_GetAudioSupportedSampleRates(capability, &sampleRates, &sampleRateNum);
    if (ret != AV_ERR_OK || sampleRates == nullptr || sampleRateNum == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " ret is :  %{public}d ", ret);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCapability_GetAudioSupportedSampleRates fail");
        return true;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRateNum end:  %{public}d ", sampleRateNum);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRates is: %{public}d", sampleRates);
    for (int i = 0; i < sampleRateNum; i++) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, " sampleRate is: %{public}d ", sampleRates[i]);
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_8) {
            isSupper8K = true;
            continue;
        }
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_16) {
            isSupper16K = true;
            continue;
        }
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_441) {
            isSupper441K = true;
            continue;
        }
        if (sampleRates[i] == DEFAULT_SAMPLE_RATE_48) {
            isSupper48k = true;
            continue;
        }
    }
    return isSupper16K && isSupper48k && isSupper441K;
}
static napi_value AudioDecoderFlushFirst(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderFlushFirst called");
 
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE_MIN);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT_ONE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AudioDecoderFlushSecond(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVErrCode checkParam;
    OH_AVFormat *format = nullptr;
    format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLERATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE_MAX);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNEL_COUNT_TWO);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, DEFAULT_MAX_INPUT_SIZE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, DEFAULT_AAC_TYPE);
    OH_AVCodec *audioDec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    OH_AudioCodec_Configure(audioDec, format);
    OH_AudioCodec_Prepare(audioDec);
    if (OH_AudioCodec_Start(audioDec) == AV_ERR_OK) {
        checkParam = OH_AudioCodec_Flush(audioDec);
        if (checkParam == AV_ERR_OK) {
            backParam = SUCCESS;
            OH_AudioCodec_Stop(audioDec);
        }
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

// FLAC编码验证
static napi_value AudioEncoderFlac(napi_env env, napi_callback_info info)
{
    using namespace std;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderFlac call start");
    int backParam = FAIL;
    napi_value result = nullptr;
        // 获取AAC的编码器对象。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, true);
    if (capability == nullptr) {
        backParam = SUCCESS;
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCodec_GetCapability failed");
        napi_create_int32(env, backParam, &result);
        return result;
    }
    bool isSupport = isSupportRateAll(capability);
    if (isSupport) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderFlac SUCCESS end");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    
    backParam = FAIL;
    napi_create_int32(env, backParam, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderFlac failed end");
    return result;
}

// AAC编码验证
static napi_value AudioEncoderAAc(napi_env env, napi_callback_info info)
{
    using namespace std;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderAAc call start");
    int backParam = FAIL;
    napi_value result = nullptr;
    // 获取AAC的编码器对象。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCodec_GetCapability failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    bool isSupper16LC = false;
    bool  isSupported = isSupportRate(capability);
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    int32_t ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK || profiles == nullptr || profileNum == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCapability_GetSupportedProfiles failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    for (int i = 0; i < profileNum; i++) {
        if (profiles[i] == AAC_PROFILE_LC) {
            isSupper16LC = true;
            break;
        }
    }
    if (isSupper16LC && isSupported) {
        backParam = SUCCESS;
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderAAc SUCCESS end");
        napi_create_int32(env, backParam, &result);
        return result;
    }
    
    backParam = FAIL;
    napi_create_int32(env, backParam, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderAAc failed end");
    return result;
}

// aac解码验证
static napi_value AudioDecoderAAc(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderAAc call start");
    int backParam = FAIL;
    napi_value result = nullptr;
    // 获取AAC的解码器对象。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    if (capability == nullptr) {
        backParam = SUCCESS;
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCodec_GetCapability failed");
        napi_create_int32(env, backParam, &result);
        return result;
    }
    // 1. 确认待配置采样率是否支持
    const int32_t *sampleRates = nullptr;
    bool isSupportChannelRange = false;
    bool isSupportBitrateRange = false;
    uint32_t sampleRateNum = 0;
    int32_t ret = OH_AVCapability_GetAudioSupportedSampleRates(capability, &sampleRates, &sampleRateNum);
    if (ret != AV_ERR_OK || sampleRates == nullptr || sampleRateNum == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCapability_GetAudioSupportedSampleRates failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    OH_AVRange bitR;
    int32_t ret1 = OH_AVCapability_GetEncoderBitrateRange(capability, &bitR);
    if (ret1 != AV_ERR_OK || bitR.maxVal <= 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCapability_GetEncoderBitrateRange failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    if (bitR.minVal <= DEFAULT_BITRATE_MIN && bitR.maxVal>= DEFAULT_BITRATE_MAX) {
        isSupportBitrateRange = true;
    }
    // 3. 获取通道数范围，判断待配置通道数参数是否在范围内
    OH_AVRange channelRange = {-1, -1};
    ret = OH_AVCapability_GetAudioChannelCountRange(capability, &channelRange);
    if (channelRange.minVal <= DEFAULT_CHANNEL_MIN && channelRange.maxVal>= DEFAULT_CHANNEL_MAX) {
        isSupportChannelRange = true;
    }
    backParam = FAIL;
    bool isSupported = isSupportRateAll(capability);
    if (isSupportChannelRange && isSupportBitrateRange && isSupported) {
        backParam = SUCCESS;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderAAc end");
    napi_create_int32(env, backParam, &result);
    return result;
}

// H264编码
static napi_value AudioEncoderH264(napi_env env, napi_callback_info info)
{
    using namespace std;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderH264 call start");
    int backParam = FAIL;
    napi_value result = nullptr;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
     // 异常处理
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCodec_GetCapability failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
    return result;
    }
    // 2. 查询编码档次和级别是否支持
    bool isSupportedLevel3 = OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_MAIN, AVC_LEVEL_12);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "isSupportedLevel3 end----------%{public}d", isSupportedLevel3);
    int32_t videoWidth = HD_HEIGHT;
    int32_t videoHeight = SD_HEIGHT;
    // 1. 确认视频宽高是否支持
    bool isSupportedSD = OH_AVCapability_IsVideoSizeSupported(capability, videoWidth, videoHeight);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "isSupportedSD end----------%{public}d", isSupportedSD);
    videoWidth = HD_WIDTH;
    videoHeight = HD_HEIGHT;
        // 1. 确认视频宽高是否支持
    bool isSupportedSHD = OH_AVCapability_IsVideoSizeSupported(capability, videoWidth, videoHeight);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "isSupportedSHD end----------%{public}d", isSupportedSHD);
    if (isSupportedLevel3 && isSupportedSD && isSupportedSHD) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioEncoderH264 call end");
    return result;
}

// H264解码
static napi_value AudioDecoderH264(napi_env env, napi_callback_info info)
{
    using namespace std;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderH264 call start");
    int backParam = FAIL;
    napi_value result = nullptr;
    // 1. 获取H.264软件解码器能力实例
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (capability == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "OH_AVCodec_GetCapabilityByCategory failed");
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        return result;
    }
    // 2. 查询编码档次和级别是否支持
    bool isSupportedBase = OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_BASELINE, AVC_LEVEL_51);
    bool isSupportedMain = OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_MAIN, AVC_LEVEL_51);
    bool isSupportedHigh = OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_HIGH, AVC_LEVEL_51);
    if (isSupportedBase && isSupportedMain && isSupportedHigh) {
        backParam = SUCCESS;
        napi_create_int32(env, backParam, &result);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderH264 success end");
        return result;
    }
    
    backParam = FAIL;
    napi_create_int32(env, backParam, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RESMGR, TAG, "AudioDecoderH264 fail end");
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_AudioCodec_Flush_First", nullptr, AudioDecoderFlushFirst, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioCodec_Flush_Second", nullptr, AudioDecoderFlushSecond, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioEncoderAAc", nullptr, AudioEncoderAAc, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioEncoderFlac", nullptr, AudioEncoderFlac, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioEncoderH264", nullptr, AudioEncoderH264, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioDecoderH264", nullptr, AudioDecoderH264, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_AudioDecoderAAc", nullptr, AudioDecoderAAc, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "pcsAudioTest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
