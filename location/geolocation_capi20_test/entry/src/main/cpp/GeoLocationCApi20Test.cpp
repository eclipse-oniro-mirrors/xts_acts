/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <LocationKit/oh_location.h>
#include <LocationKit/oh_location_type.h>
#include <cstdlib>
#include <js_native_api_types.h>
#include <unistd.h>

namespace {
auto g_sleepTime = 3;
static Location_RequestConfig *g_config;
static const Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
} // namespace

static napi_value OHLocationInfoGetAdditionalInfo(napi_env env, napi_callback_info info)
{
    Location_Info *location;
    char additionalInfo[] = "";
    Location_ResultCode errorCode = OH_LocationInfo_GetAdditionalInfo(nullptr, additionalInfo, 0);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == LOCATION_INVALID_PARAM ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_IsLocatingEnabled1(napi_env env, napi_callback_info info)
{
    bool flag = true;
    bool *enabled = &flag;
    Location_ResultCode startCode = OH_Location_IsLocatingEnabled(enabled);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_SUCCESS ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_IsLocatingEnabled2(napi_env env, napi_callback_info info)
{
    Location_ResultCode startCode = OH_Location_IsLocatingEnabled(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_INVALID_PARAM ? 0 : -1, &result);
    return result;
}
void LocationInfoCallback(Location_Info *location, void *userData)
{
    size_t infoLen = 512;
    char *additionalInfo = (char *)malloc(infoLen);
    Location_ResultCode ResultCode = OH_LocationInfo_GetAdditionalInfo(location, additionalInfo, infoLen);
};

static napi_value OH_Location_StartLocating1(napi_env env, napi_callback_info info)
{
    Location_RequestConfig *config = OH_Location_CreateRequestConfig();
    OH_LocationRequestConfig_SetCallback(config, LocationInfoCallback, nullptr);
    OH_LocationRequestConfig_SetInterval(config, 1);
    Location_ResultCode startCode = OH_Location_StartLocating(config);
    sleep(g_sleepTime);
    Location_ResultCode qaz = OH_Location_StopLocating(config);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_SWITCH_OFF ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_StartLocating2(napi_env env, napi_callback_info info)
{
    Location_ResultCode startCode = OH_Location_StartLocating(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_INVALID_PARAM ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_StartLocating3(napi_env env, napi_callback_info info)
{
    g_config = OH_Location_CreateRequestConfig();
    OH_LocationRequestConfig_SetCallback(g_config, LocationInfoCallback, nullptr);
    OH_LocationRequestConfig_SetInterval(g_config, 1);
    Location_ResultCode startCode = OH_Location_StartLocating(g_config);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_SUCCESS ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_StartLocating4(napi_env env, napi_callback_info info)
{
    Location_RequestConfig *config = OH_Location_CreateRequestConfig();
    OH_LocationRequestConfig_SetCallback(config, LocationInfoCallback, nullptr);
    OH_LocationRequestConfig_SetInterval(config, 1);
    Location_ResultCode startCode = OH_Location_StartLocating(config);
    sleep(g_sleepTime);
    Location_ResultCode qaz = OH_Location_StopLocating(config);
    napi_value result = nullptr;
    napi_create_int32(env, startCode == LOCATION_PERMISSION_DENIED ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_StopLocating1(napi_env env, napi_callback_info info)
{
    Location_RequestConfig *config = OH_Location_CreateRequestConfig();
    OH_Location_StartLocating(config);
    sleep(g_sleepTime);
    Location_ResultCode stopCode = OH_Location_StopLocating(config);
    napi_value result = nullptr;
    napi_create_int32(env, stopCode, &result);
    return result;
}
static napi_value OH_Location_StopLocating2(napi_env env, napi_callback_info info)
{
    Location_ResultCode stopCode = OH_Location_StopLocating(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, stopCode == LOCATION_INVALID_PARAM ? 0 : -1, &result);
    return result;
}
static napi_value OH_Location_StopLocating3(napi_env env, napi_callback_info info)
{
    Location_RequestConfig *config = OH_Location_CreateRequestConfig();
    OH_Location_StartLocating(config);
    sleep(g_sleepTime);
    Location_ResultCode stopCode = OH_Location_StopLocating(config);
    napi_value result = nullptr;
    napi_create_int32(env, stopCode == LOCATION_SUCCESS ? 0 : -1, &result);
    return result;
}
static napi_value OHLocationInfoGetAdditionalInfo0100(napi_env env, napi_callback_info info)
{
    Location_Info *location;
    char additionalInfo[] = "";
    Location_ResultCode errorCode = OH_LocationInfo_GetAdditionalInfo(location, additionalInfo, 0);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == LOCATION_INVALID_PARAM ? 0 : -1, &result);
    return result;
}
static napi_value OH_LocationRequestConfig_SetUseScene0100(napi_env env, napi_callback_info info)
{
    try {
        Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
        OH_LocationRequestConfig_SetUseScene(requestConfig, LOCATION_USE_SCENE_SPORT);
        int32_t errorCode = 0;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    } catch (...) {
        int32_t errorCode = 1;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    }
}
static napi_value OH_LocationRequestConfig_SetUseScene0101(napi_env env, napi_callback_info info)
{
    try {
        Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
        OH_LocationRequestConfig_SetUseScene(requestConfig, LOCATION_USE_SCENE_TRANSPORT);
        int32_t errorCode = 0;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    } catch (...) {
        int32_t errorCode = 1;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    }
}
static napi_value OH_LocationRequestConfig_SetUseScene0102(napi_env env, napi_callback_info info)
{
    try {
        Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
        OH_LocationRequestConfig_SetUseScene(requestConfig, LOCATION_USE_SCENE_DAILY_LIFE_SERVICE);
        int32_t errorCode = 0;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    } catch (...) {
        int32_t errorCode = 1;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    }
}
static napi_value OH_LocationRequestConfig_SetPowerConsumptionScene0100(napi_env env, napi_callback_info info)
{
    try {
        Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
        OH_LocationRequestConfig_SetPowerConsumptionScene(requestConfig, LOCATION_LOW_POWER_CONSUMPTION);
        int32_t errorCode = 0;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    } catch (...) {
        int32_t errorCode = 1;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    }
}
static napi_value OH_LocationRequestConfig_SetPowerConsumptionScene0101(napi_env env, napi_callback_info info)
{
    try {
        Location_RequestConfig *requestConfig = OH_Location_CreateRequestConfig();
        OH_LocationRequestConfig_SetPowerConsumptionScene(requestConfig, LOCATION_NO_POWER_CONSUMPTION);
        int32_t errorCode = 0;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    } catch (...) {
        int32_t errorCode = 1;
        napi_value result = nullptr;
        napi_create_int32(env, errorCode, &result);
        return result;
    }
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHLocationInfoGetAdditionalInfo", nullptr, OHLocationInfoGetAdditionalInfo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Location_IsLocatingEnabled1", nullptr, OH_Location_IsLocatingEnabled1, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Location_IsLocatingEnabled2", nullptr, OH_Location_IsLocatingEnabled2, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Location_StartLocating1", nullptr, OH_Location_StartLocating1, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Location_StartLocating2", nullptr, OH_Location_StartLocating2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Location_StopLocating1", nullptr, OH_Location_StopLocating1, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Location_StopLocating2", nullptr, OH_Location_StopLocating2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHLocationInfoGetAdditionalInfo0100", nullptr, OHLocationInfoGetAdditionalInfo0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_LocationRequestConfig_SetUseScene0100", nullptr, OH_LocationRequestConfig_SetUseScene0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_LocationRequestConfig_SetUseScene0101", nullptr, OH_LocationRequestConfig_SetUseScene0101, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_LocationRequestConfig_SetUseScene0102", nullptr, OH_LocationRequestConfig_SetUseScene0102, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_LocationRequestConfig_SetPowerConsumptionScene0100", nullptr,
         OH_LocationRequestConfig_SetPowerConsumptionScene0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_LocationRequestConfig_SetPowerConsumptionScene0101", nullptr,
         OH_LocationRequestConfig_SetPowerConsumptionScene0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Location_StartLocating3", nullptr, OH_Location_StartLocating3, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Location_StopLocating3", nullptr, OH_Location_StopLocating3, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OH_Location_StartLocating4", nullptr, OH_Location_StartLocating4, nullptr, nullptr, nullptr, napi_default,
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
    .nm_modname = "locationcapi20",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
