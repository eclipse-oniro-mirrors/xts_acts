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
#include "telephony/cellular_data/telephony_data.h"
#include "telephony/core_service/telephony_radio.h"
#include "telephony/core_service/telephony_radio_type.h"
#include <cstdint>
#include <cstring>
#include <js_native_api_types.h>

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

// TEL_RADIO_PERMISSION_DENIED
static napi_value OH_Telephony_GetNetworkState2(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_PERMISSION_DENIED ? TEL_RADIO_PERMISSION_DENIED : 0, &result);
    return result;
}

// OH_Telephony_GetNetworkStateForSlot  TEL_RADIO_PERMISSION_DENIED
static napi_value OH_Telephony_GetNetworkStateForSlot1(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    int32_t slotId = 0;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkStateForSlot(slotId, &initState);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_PERMISSION_DENIED ? TEL_RADIO_PERMISSION_DENIED : 0, &result);
    return result;
}

static napi_value TelRadio0100(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState *state;
    Telephony_RadioResult errorCode = OH_Telephony_GetNetworkState(&initState);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == TEL_RADIO_PERMISSION_DENIED ? TEL_RADIO_PERMISSION_DENIED : 0, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Telephony_GetNetworkState2", nullptr, OH_Telephony_GetNetworkState2, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Telephony_GetNetworkStateForSlot1", nullptr, OH_Telephony_GetNetworkStateForSlot1, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TelRadio0100", nullptr, TelRadio0100, nullptr, nullptr, nullptr, napi_default, nullptr},
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
