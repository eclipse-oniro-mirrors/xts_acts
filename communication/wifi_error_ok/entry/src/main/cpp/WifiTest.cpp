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
#include <ConnectivityKit/bluetooth/oh_bluetooth.h>
#include <ConnectivityKit/wifi/oh_wifi.h>
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>

static napi_value GetWifiStatus(napi_env env, napi_callback_info info)
{
    bool wifiStatus = false;
    int32_t result = OH_Wifi_IsWifiEnabled(&wifiStatus);
    int32_t confirmResult;
    if (result == WIFI_SUCCESS) {
        confirmResult = 0;
    }
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value GetWifiStatus0101(napi_env env, napi_callback_info info)
{
    bool wifiStatus = false;
    int32_t result = OH_Wifi_IsWifiEnabled(nullptr);
    int32_t confirmResult;
    if (result == WIFI_INVALID_PARAM) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value GetWifiStatus0102(napi_env env, napi_callback_info info)
{
    bool wifiStatus = true;
    int32_t result = OH_Wifi_IsWifiEnabled(&wifiStatus);
    int32_t confirmResult;
    if (result == WIFI_SUCCESS) {
        confirmResult = 0;
    }
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value GetWifiStatus0103(napi_env env, napi_callback_info info)
{
    bool wifiStatus = false;
    int32_t result = OH_Wifi_IsWifiEnabled(nullptr);
    int32_t confirmResult;
    if (result == WIFI_INVALID_PARAM) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value GetBluetoothSwitchState0100(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(nullptr);
    if (result == BLUETOOTH_INVALID_PARAM) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0101(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_OFF;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0102(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_TURNING_ON;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0103(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_ON;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0104(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_TURNING_OFF;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0105(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_BLE_TURNING_ON;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0106(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_BLE_ON;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetBluetoothSwitchState0107(napi_env env, napi_callback_info info)
{
    Bluetooth_SwitchState state = BLUETOOTH_STATE_BLE_TURNING_OFF;
    Bluetooth_ResultCode result = OH_Bluetooth_GetBluetoothSwitchState(&state);
    if (result == BLUETOOTH_SUCCESS) {
        int32_t stateValue = 0;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    } else {
        int32_t stateValue = 1;
        napi_value res;
        napi_create_uint32(env, stateValue, &res);
        return res;
    }
}
static napi_value GetDeviceMacAddress0100(napi_env env, napi_callback_info info)
{
    char macAddress[32] = {0};
    unsigned int macAddressLen = sizeof(macAddress);
    int32_t result = OH_Wifi_GetDeviceMacAddress(macAddress, &macAddressLen);
    int32_t confirmResult;
    if (result == WIFI_SUCCESS) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0200(napi_env env, napi_callback_info info)
{
    char macAddress[32] = {0};
    unsigned int macAddressLen = sizeof(macAddress);
    int32_t result = OH_Wifi_GetDeviceMacAddress(nullptr, &macAddressLen);
    int32_t confirmResult;
    if (result == WIFI_INVALID_PARAM) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0300(napi_env env, napi_callback_info info)
{
    char macAddress[32] = {0};
    unsigned int macAddressLen = sizeof(macAddress);
    int32_t result = OH_Wifi_GetDeviceMacAddress(macAddress, nullptr);
    int32_t confirmResult;
    if (result == WIFI_INVALID_PARAM) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_Wifi_GetDeviceMacAddress(nullptr, nullptr);
    int32_t confirmResult;
    if (result == WIFI_INVALID_PARAM) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0500(napi_env env, napi_callback_info info)
{
    char macAddress[32] = {0};
    unsigned int macAddressLen = sizeof(macAddress);
    int32_t result = OH_Wifi_GetDeviceMacAddress(macAddress, &macAddressLen);
    int32_t confirmResult;
    if (result == WIFI_STA_DISABLED) {
        confirmResult = 0;
    } else {
        confirmResult = 1;
    };
    napi_value retValue;
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0600(napi_env env, napi_callback_info info)
{
    int32_t result = Wifi_ResultCode::WIFI_PERMISSION_DENIED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0700(napi_env env, napi_callback_info info)
{
    int32_t result = Wifi_ResultCode::WIFI_NOT_SUPPORTED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value GetDeviceMacAddress0800(napi_env env, napi_callback_info info)
{
    int32_t result = Wifi_ResultCode::WIFI_OPERATION_FAILED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetWifiStatus", nullptr, GetWifiStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetWifiStatus0101", nullptr, GetWifiStatus0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetWifiStatus0102", nullptr, GetWifiStatus0102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetWifiStatus0103", nullptr, GetWifiStatus0103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0100", nullptr, GetDeviceMacAddress0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0200", nullptr, GetDeviceMacAddress0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0300", nullptr, GetDeviceMacAddress0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0400", nullptr, GetDeviceMacAddress0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0500", nullptr, GetDeviceMacAddress0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0600", nullptr, GetDeviceMacAddress0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0700", nullptr, GetDeviceMacAddress0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0800", nullptr, GetDeviceMacAddress0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBluetoothSwitchState0100", nullptr, GetBluetoothSwitchState0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0101", nullptr, GetBluetoothSwitchState0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0102", nullptr, GetBluetoothSwitchState0102, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0103", nullptr, GetBluetoothSwitchState0103, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0104", nullptr, GetBluetoothSwitchState0104, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0105", nullptr, GetBluetoothSwitchState0105, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0106", nullptr, GetBluetoothSwitchState0106, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetBluetoothSwitchState0107", nullptr, GetBluetoothSwitchState0107, nullptr, nullptr, nullptr, napi_default,
         nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {.nm_version = 1,
                                 .nm_flags = 0,
                                 .nm_filename = nullptr,
                                 .nm_register_func = Init,
                                 .nm_modname = "wifindk",
                                 .nm_priv = ((void *)0),
                                 .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
