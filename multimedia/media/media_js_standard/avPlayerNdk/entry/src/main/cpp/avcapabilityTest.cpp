/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include "hilog/log.h"

#define FAIL (-1)
#define SUCCESS 0
#define WIDTH 1920
#define HEIGHT 1080
#define PARAM_720 720
#define PARAM_1280 1280
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_30 30
const bool IS_ENCODER = true;
const bool IS_DECODER = false;
#define LOG_DOMAIN 0x3200
#define LOG_TAG "AVPlayer_xts"

static napi_value AVCapabilityIsSupportedHEVC(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    
    bool checkParam = -1;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, IS_DECODER, SOFTWARE);
    OH_LOG_INFO(LOG_APP, "OH_AVCodec_GetCapabilityByCategory capability=%{public}d", capability);
    if (capability != nullptr) {
        backParam = SUCCESS;
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsSupported checkParam=%{public}d", checkParam);
    }
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value AVCapabilityIsSupportedH263(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    
    bool checkParam = -1;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, IS_DECODER, SOFTWARE);
    OH_LOG_INFO(LOG_APP, "OH_AVCodec_GetCapabilityByCategory capability=%{public}d", capability);
    if (capability != nullptr) {
        backParam = SUCCESS;
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsSupported checkParam=%{public}d", checkParam);
    }
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value AVCapabilityIsSupportedMPEG2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    
    bool checkParam = -1;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, IS_DECODER, SOFTWARE);
    OH_LOG_INFO(LOG_APP, "OH_AVCodec_GetCapabilityByCategory capability=%{public}d", capability);
    if (capability != nullptr) {
        backParam = SUCCESS;
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsSupported checkParam=%{public}d", checkParam);
    }
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value AVCapabilityIsSupportedMPEG4(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    
    bool checkParam = -1;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, IS_DECODER, SOFTWARE);
    OH_LOG_INFO(LOG_APP, "OH_AVCodec_GetCapabilityByCategory capability=%{public}d", capability);
    if (capability != nullptr) {
        backParam = SUCCESS;
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsSupported checkParam=%{public}d", checkParam);
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AVCapabilityIsVideoSizeSupported(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    int32_t width = PARAM_1280;
    int32_t height = PARAM_720;
    
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], &width);
    napi_get_value_int32(env, args[PARAM_1], &height);
    
    bool checkParam = -1;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, IS_DECODER, HARDWARE);
    OH_LOG_INFO(LOG_APP, "OH_AVCodec_GetCapabilityByCategory capability=%{public}d", capability);
    if (capability != nullptr) {
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsVideoSizeSupported width=%{public}d", width);
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsVideoSizeSupported height=%{public}d", height);
        checkParam = OH_AVCapability_IsVideoSizeSupported(capability, width, height);
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsVideoSizeSupported checkParam=%{public}d", checkParam);
    }
    if (checkParam != 0) {
        OH_LOG_INFO(LOG_APP, "OH_AVCapability_IsVideoSizeSupported Success checkParam=%{public}d", checkParam);
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AVCapabilityIsSupportedHEVC", nullptr, AVCapabilityIsSupportedHEVC, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVCapabilityIsSupportedH263", nullptr, AVCapabilityIsSupportedH263, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVCapabilityIsSupportedMPEG2", nullptr, AVCapabilityIsSupportedMPEG2, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVCapabilityIsSupportedMPEG4", nullptr, AVCapabilityIsSupportedMPEG4, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AVCapabilityIsVideoSizeSupported", nullptr, AVCapabilityIsVideoSizeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
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
    .nm_modname = "avcapability",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
