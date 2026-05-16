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
static napi_value GetLinkedInfo0100(napi_env env, napi_callback_info info)
{
    OH_WifiLinkedInfo wifiLinkedInfo;
    int32_t result = OH_Wifi_GetLinkedInfo(&wifiLinkedInfo);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value GetLinkedInfo0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_Wifi_GetLinkedInfo(nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value GetLinkedInfo0300(napi_env env, napi_callback_info info)
{
    OH_WifiLinkedInfo wifiLinkedInfo;
    int32_t result = OH_Wifi_GetLinkedInfo(&wifiLinkedInfo);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value GetLinkedInfo0400(napi_env env, napi_callback_info info)
{
    OH_WifiLinkedInfo linkedInfo;
    int32_t result = OH_Wifi_GetLinkedInfo(&linkedInfo);
    napi_value obj;
    napi_create_object(env, &obj);
    napi_value v;
    napi_create_string_utf8(env, linkedInfo.ssid, WIFI_MAX_SSID_LEN, &v);
    napi_set_named_property(env, obj, "ssid", v);
    napi_create_string_utf8(env, linkedInfo.bssid, WIFI_MAC_LEN, &v);
    napi_set_named_property(env, obj, "bssid", v);
    napi_create_int32(env, linkedInfo.rssi, &v);
    napi_set_named_property(env, obj, "rssi", v);
    napi_create_int32(env, linkedInfo.band, &v);
    napi_set_named_property(env, obj, "band", v);
    napi_create_int32(env, linkedInfo.linkSpeed, &v);
    napi_set_named_property(env, obj, "linkSpeed", v);
    napi_create_int32(env, linkedInfo.rxLinkSpeed, &v);
    napi_set_named_property(env, obj, "rxLinkSpeed", v);
    napi_create_int32(env, linkedInfo.maxSupportedTxLinkSpeed, &v);
    napi_set_named_property(env, obj, "maxSupportedTxLinkSpeed", v);
    napi_create_int32(env, linkedInfo.maxSupportedRxLinkSpeed, &v);
    napi_set_named_property(env, obj, "maxSupportedRxLinkSpeed", v);
    napi_create_int32(env, linkedInfo.frequency, &v);
    napi_set_named_property(env, obj, "frequency", v);
    napi_get_boolean(env, linkedInfo.isHidden != 0, &v);
    napi_set_named_property(env, obj, "isHidden", v);
    napi_get_boolean(env, linkedInfo.isRestricted != 0, &v);
    napi_set_named_property(env, obj, "isRestricted", v);
    napi_create_int32(env, linkedInfo.macType, &v);
    napi_set_named_property(env, obj, "macType", v);
    napi_create_string_utf8(env, linkedInfo.macAddress, WIFI_MAC_LEN, &v);
    napi_set_named_property(env, obj, "macAddress", v);
    napi_create_uint32(env, linkedInfo.ipAddress, &v);
    napi_set_named_property(env, obj, "ipAddress", v);
    napi_create_int32(env, linkedInfo.connState, &v);
    napi_set_named_property(env, obj, "connState", v);
    napi_create_int32(env, linkedInfo.channelWidth, &v);
    napi_set_named_property(env, obj, "channelWidth", v);
    napi_create_int32(env, linkedInfo.wifiStandard, &v);
    napi_set_named_property(env, obj, "wifiStandard", v);
    napi_create_int32(env, linkedInfo.supportedWifiCategory, &v);
    napi_set_named_property(env, obj, "supportedWifiCategory", v);
    napi_get_boolean(env, linkedInfo.isHiLinkNetwork != 0, &v);
    napi_set_named_property(env, obj, "isHiLinkNetwork", v);
    napi_create_int32(env, linkedInfo.wifiLinkType, &v);
    napi_set_named_property(env, obj, "wifiLinkType", v);
    return obj;
}
static napi_value OHWifiLinkTypeEnumValue0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_DISCONNECT;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_DEFAULT_LINK;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0300(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_WIFI7_SINGLE_LINK;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_WIFI7_MLSR;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0500(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_WIFI7_EMLSR;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0600(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_WIFI7_STR;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiLinkTypeEnumValue0700(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiLinkType::OH_WIFI_LINK_WIFI7_LEGACY;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

static napi_value OHWifiConnStateEnumValue0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_SCANNING;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_CONNECTING;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0300(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_AUTHENTICATING;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_OBTAINING_IPADDR;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0500(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_CONNECTED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0600(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_DISCONNECTING;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0700(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_DISCONNECTED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0800(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_SPECIAL_CONNECT;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiConnStateEnumValue0900(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiConnState::OH_WIFI_CONN_UNKNOWN;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_20MHZ;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_40MHZ;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0300(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_80MHZ;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_160MHZ;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0500(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_80MHZ_PLUS;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiChannelWidthEnumValue0600(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiChannelWidth::OH_WIFI_WIDTH_INVALID;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiCategoryEnumValue0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiCategory::OH_WIFI_CATEGORY_DEFAULT;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiCategoryEnumValue0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiCategory::OH_WIFI_CATEGORY_WIFI6;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiCategoryEnumValue0300(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiCategory::OH_WIFI_CATEGORY_WIFI6_PLUS;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiCategoryEnumValue0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiCategory::OH_WIFI_CATEGORY_WIFI7;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiCategoryEnumValue0500(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiCategory::OH_WIFI_CATEGORY_WIFI7_PLUS;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_UNDEFINED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0200(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11A;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0300(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11B;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0400(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11G;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0500(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11N;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0600(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11AC;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0700(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11AX;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
static napi_value OHWifiStandardEnumValue0800(napi_env env, napi_callback_info info)
{
    int32_t result = OH_WifiStandard::OH_WIFI_STANDARD_11AD;
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
        {"GetDeviceMacAddress0500", nullptr, GetDeviceMacAddress0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0600", nullptr, GetDeviceMacAddress0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0700", nullptr, GetDeviceMacAddress0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceMacAddress0800", nullptr, GetDeviceMacAddress0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetLinkedInfo0100", nullptr, GetLinkedInfo0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetLinkedInfo0200", nullptr, GetLinkedInfo0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetLinkedInfo0300", nullptr, GetLinkedInfo0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetLinkedInfo0400", nullptr, GetLinkedInfo0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0100", nullptr, OHWifiLinkTypeEnumValue0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0200", nullptr, OHWifiLinkTypeEnumValue0200,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0300", nullptr, OHWifiLinkTypeEnumValue0300,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0400", nullptr, OHWifiLinkTypeEnumValue0400,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0500", nullptr, OHWifiLinkTypeEnumValue0500,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0600", nullptr, OHWifiLinkTypeEnumValue0600,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiLinkTypeEnumValue0700", nullptr, OHWifiLinkTypeEnumValue0700,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0100", nullptr, OHWifiConnStateEnumValue0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0200", nullptr, OHWifiConnStateEnumValue0200,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0300", nullptr, OHWifiConnStateEnumValue0300,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0400", nullptr, OHWifiConnStateEnumValue0400,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0500", nullptr, OHWifiConnStateEnumValue0500,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0600", nullptr, OHWifiConnStateEnumValue0600,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0700", nullptr, OHWifiConnStateEnumValue0700,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0800", nullptr, OHWifiConnStateEnumValue0800,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiConnStateEnumValue0900", nullptr, OHWifiConnStateEnumValue0900,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0100", nullptr, OHWifiChannelWidthEnumValue0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0200", nullptr, OHWifiChannelWidthEnumValue0200,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0300", nullptr, OHWifiChannelWidthEnumValue0300,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0400", nullptr, OHWifiChannelWidthEnumValue0400,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0500", nullptr, OHWifiChannelWidthEnumValue0500,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiChannelWidthEnumValue0600", nullptr, OHWifiChannelWidthEnumValue0600,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWifiCategoryEnumValue0100", nullptr, OHWifiCategoryEnumValue0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiCategoryEnumValue0200", nullptr, OHWifiCategoryEnumValue0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiCategoryEnumValue0300", nullptr, OHWifiCategoryEnumValue0300, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiCategoryEnumValue0400", nullptr, OHWifiCategoryEnumValue0400, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiCategoryEnumValue0500", nullptr, OHWifiCategoryEnumValue0500, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0100", nullptr, OHWifiStandardEnumValue0100, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0200", nullptr, OHWifiStandardEnumValue0200, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0300", nullptr, OHWifiStandardEnumValue0300, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0400", nullptr, OHWifiStandardEnumValue0400, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0500", nullptr, OHWifiStandardEnumValue0500, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0600", nullptr, OHWifiStandardEnumValue0600, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0700", nullptr, OHWifiStandardEnumValue0700, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHWifiStandardEnumValue0800", nullptr, OHWifiStandardEnumValue0800, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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
