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
#include <cstring> // 新增：用于内存操作（如memset）

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x2300 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"   // 全局tag宏，标识模块日志tag
#define MAC_LEN 20

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

// 新增：获取MAC地址的NAPI函数
napi_value GetWifiMacAddress(napi_env env, napi_callback_info info)
{
    // 1. 定义MAC地址缓冲区（长度17字节足够，预留20字节防溢出）
    char macAddr[MAC_LEN] = {0}; // 初始化缓冲区，避免脏数据
    unsigned int macAddrLen = sizeof(macAddr); // 传入缓冲区最大长度

    // 2. 调用C接口获取MAC地址
    Wifi_ResultCode code = OH_Wifi_GetDeviceMacAddress(macAddr, &macAddrLen);
    OH_LOG_INFO(LOG_APP, LOG_TAG, "getWifiMacAddress ret: %{public}d, len: %{public}u",
        static_cast<int>(code), macAddrLen);

    // 3. 处理接口调用失败的情况
    if (code != WIFI_SUCCESS) { // 假设WIFI_SUCCESS是成功的返回码
        OH_LOG_ERROR(LOG_APP, LOG_TAG, "failed to get mac address, code: %{public}d", static_cast<int>(code));
        napi_throw_error(env, nullptr, "Failed to get WiFi MAC address"); // 向ArkTS抛异常
        return nullptr;
    }
    
    // 5. 将C字符串转换为NAPI字符串（返回给ArkTS）
    napi_value res;
    napi_status status = napi_create_string_utf8(env, macAddr, macAddrLen, &res);
    if (status != napi_ok) {
        OH_LOG_ERROR(LOG_APP, LOG_TAG, "failed to create mac string");
        napi_throw_error(env, nullptr, "Failed to create MAC address string");
        return nullptr;
    }

    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "GetWifiSwitchState", nullptr, GetWifiSwitchState,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetWifiMacAddress", nullptr, GetWifiMacAddress, // 导出新增函数
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
