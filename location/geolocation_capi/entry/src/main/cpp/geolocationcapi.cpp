/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

Location_RequestConfig* g_requestConfig = nullptr;

static napi_value OhLocationIsEnabled(napi_env env, napi_callback_info info)
{
    bool isEnabled = false;
    auto resultCode = OH_Location_IsLocatingEnabled(&isEnabled);
    napi_value result = nullptr;
    napi_get_boolean(env, isEnabled, &result);
    return result;
}

void reportLocation(Location_Info* location, void* userData)
{
    auto baseInfo = OH_LocationInfo_GetBasicInfo(location);
    char additionalInfo[] = "";
    auto addition = OH_LocationInfo_GetAdditionalInfo(location, additionalInfo, 0);
    return;
}

static napi_value OhLocationStartLocating(napi_env env, napi_callback_info info)
{
    if (g_requestConfig == nullptr) {
        g_requestConfig = OH_Location_CreateRequestConfig();
    }
    OH_LocationRequestConfig_SetUseScene(g_requestConfig, LOCATION_USE_SCENE_NAVIGATION);
    OH_LocationRequestConfig_SetPowerConsumptionScene(g_requestConfig, LOCATION_HIGH_POWER_CONSUMPTION);
    OH_LocationRequestConfig_SetInterval(g_requestConfig, 1);
    OH_LocationRequestConfig_SetCallback(g_requestConfig, reportLocation, (void *)(1));
    OH_Location_StartLocating(g_requestConfig);
    int32_t ret = 0;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OhLocationStopLocating(napi_env env, napi_callback_info info)
{
    OH_Location_StopLocating(g_requestConfig);
    if (g_requestConfig != nullptr) {
        OH_Location_DestroyRequestConfig(g_requestConfig);
        g_requestConfig = nullptr;
    }
    int32_t ret = 0;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ohLocationIsEnabled", nullptr, OhLocationIsEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ohLocationStartLocating", nullptr, OhLocationStartLocating, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ohLocationStopLocating", nullptr, OhLocationStopLocating, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module geolocationcapi = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "geolocationcapi",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&geolocationcapi);
}
