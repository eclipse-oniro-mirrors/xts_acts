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
#include "telephony/core_service/telephony_radio.h"
#include "telephony/core_service/telephony_radio_type.h"
#include <cstdint>
#include <js_native_api_types.h>

static napi_value OH_Telephony_GetNetworkState3(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_ERR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value OH_Telephony_GetNetworkStateForSlot2(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    int32_t slotId;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkStateForSlot(slotId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_ERR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value TelRadio0101(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_ERR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

static napi_value TelRegState0100(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.regState_ = TEL_REG_STATE_NO_SERVICE;
    if (initState.regState_ == TEL_REG_STATE_NO_SERVICE) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRegState0101(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.regState_ = TEL_REG_STATE_IN_SERVICE;
    if (initState.regState_ == TEL_REG_STATE_IN_SERVICE) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRegState0102(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.regState_ = TEL_REG_STATE_EMERGENCY_CALL_ONLY;
    if (initState.regState_ == TEL_REG_STATE_EMERGENCY_CALL_ONLY) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRegState0103(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.regState_ = TEL_REG_STATE_POWER_OFF;
    if (initState.regState_ == TEL_REG_STATE_POWER_OFF) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0100(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_UNKNOWN) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0101(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_GSM;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_GSM) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0102(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_1XRTT;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_1XRTT) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0103(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_WCDMA;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_WCDMA) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0104(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_HSPA;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_HSPA) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0105(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_HSPAP;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_HSPAP) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0106(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_TD_SCDMA;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_TD_SCDMA) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0107(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_EVDO;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_EVDO) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0108(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_EHRPD;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_EHRPD) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0109(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_LTE;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_LTE) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0110(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_LTE_CA;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_LTE_CA) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0111(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_IWLAN;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_IWLAN) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelRadioTechnology0112(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.cfgTech_ = TEL_RADIO_TECHNOLOGY_NR;
    if (initState.cfgTech_ == TEL_RADIO_TECHNOLOGY_NR) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0100(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED;
    if (initState.nsaState_ == TEL_NSA_STATE_NOT_SUPPORTED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0101(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_NO_DETECTED;
    if (initState.nsaState_ == TEL_NSA_STATE_NO_DETECTED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0102(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_CONNECTED_DETECTED;
    if (initState.nsaState_ == TEL_NSA_STATE_CONNECTED_DETECTED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0103(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_IDLE_DETECTED;
    if (initState.nsaState_ == TEL_NSA_STATE_IDLE_DETECTED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0104(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_DUAL_CONNECTED;
    if (initState.nsaState_ == TEL_NSA_STATE_DUAL_CONNECTED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}
static napi_value TelNsaState0105(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState initState = {
        .longOperatorName_ = "",                         // 空字符串
        .shortOperatorName_ = "",                        // 空字符串
        .plmnNumeric_ = "",                              // 空字符串
        .isRoaming_ = false,                             // 初始化为非漫游
        .regState_ = static_cast<Telephony_RegState>(8), // 未知注册状态
        .cfgTech_ = TEL_RADIO_TECHNOLOGY_UNKNOWN,        // 未知无线技术
        .nsaState_ = TEL_NSA_STATE_NOT_SUPPORTED,        // NSA非激活
        .isCaActive_ = false,                            // CA未激活
        .isEmergency_ = false                            // 非紧急呼叫状态
    };
    initState.nsaState_ = TEL_NSA_STATE_SA_ATTACHED;
    if (initState.nsaState_ == TEL_NSA_STATE_SA_ATTACHED) {
        Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
        napi_value result = nullptr;
        napi_create_int32(env, errorCode == TEL_RADIO_SUCCESS ? 0 : -1, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Telephony_GetNetworkState3", nullptr, OH_Telephony_GetNetworkState3, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Telephony_GetNetworkStateForSlot2", nullptr, OH_Telephony_GetNetworkStateForSlot2, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TelRadio0101", nullptr, TelRadio0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRegState0100", nullptr, TelRegState0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRegState0101", nullptr, TelRegState0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRegState0102", nullptr, TelRegState0102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRegState0103", nullptr, TelRegState0103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0100", nullptr, TelRadioTechnology0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0101", nullptr, TelRadioTechnology0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0102", nullptr, TelRadioTechnology0102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0103", nullptr, TelRadioTechnology0103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0104", nullptr, TelRadioTechnology0104, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0105", nullptr, TelRadioTechnology0105, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0106", nullptr, TelRadioTechnology0106, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0107", nullptr, TelRadioTechnology0107, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0108", nullptr, TelRadioTechnology0108, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0109", nullptr, TelRadioTechnology0109, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0110", nullptr, TelRadioTechnology0110, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0111", nullptr, TelRadioTechnology0111, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelRadioTechnology0112", nullptr, TelRadioTechnology0112, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0100", nullptr, TelNsaState0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0101", nullptr, TelNsaState0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0102", nullptr, TelNsaState0102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0103", nullptr, TelNsaState0103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0104", nullptr, TelNsaState0104, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TelNsaState0105", nullptr, TelNsaState0105, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "osaccountndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
