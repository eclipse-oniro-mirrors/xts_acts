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
#include <ConnectivityKit/wifi/oh_wifi.h>
#include "hilog/log.h"
#include <cstdint>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x2300 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"   // 全局tag宏，标识模块日志tag

napi_value GetWifiSwitchState(napi_env env, napi_callback_info info)
{
    bool state = false;
    Wifi_ResultCode code = OH_Wifi_IsWifiEnabled(&state);
    OH_LOG_INFO(LOG_APP, "testTag ret success: %{public}d, wifi state: %{public}d",
        static_cast<int>(code),
        static_cast<int>(state)
    );
    
    int32_t stateValue = static_cast<int32_t>(state);
    napi_value res;
    napi_create_uint32(env, stateValue, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "GetWifiSwitchState", nullptr, GetWifiSwitchState,
          nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
