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
#include "telephony/cellular_data/telephony_data.h"
#include "telephony/core_service/telephony_radio.h"
#include "telephony/core_service/telephony_radio_type.h"
#include "hilog/log.h"
#include <cstdint>
#include <cstring>

#define TELEPHONY_LOG_TAG "LogTagTelephonyNDKXts"
#define TELEPHONY_LOG_DOMAIN 0x0000

#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9

/* 用例一 */
static napi_value OHTelephonyGetDefaultCellularDataSlotId(napi_env env, napi_callback_info info)
{
    napi_status status;
    int32_t id = OH_Telephony_GetDefaultCellularDataSlotId();
    napi_value result = nullptr;
    status = napi_create_int32(env, id, &result);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, TELEPHONY_LOG_DOMAIN, TELEPHONY_LOG_TAG,
                     "Failed to get UTF-8 string");
        return nullptr;
    }
    return result;
}

static int32_t TestCaseOHTelephonyGetNetworkStateForSlotParam(uint32_t index)
{
    Telephony_NetworkState telState;
    Telephony_RadioResult ret = TEL_RADIO_SUCCESS;
    
    if (index == CASE_INDEX_1) {
        ret = OH_Telephony_GetNetworkStateForSlot(0, nullptr); //查看卡槽0
    } else if (index == CASE_INDEX_2) {
        ret = OH_Telephony_GetNetworkStateForSlot(-1, &telState); //错误参数卡槽-1
    } else if (index == CASE_INDEX_3) {
        ret = OH_Telephony_GetNetworkStateForSlot(-1, nullptr); //错误参数卡槽-1
    } else if (index == CASE_INDEX_4) {
        ret = OH_Telephony_GetNetworkStateForSlot(0, &telState); //查看卡槽0
    } else if (index == CASE_INDEX_5) {
        ret = OH_Telephony_GetNetworkStateForSlot(100, &telState); //错误参数卡槽100
    }
    
    return static_cast<int32_t>(ret);
}

/* 用例二 */
static napi_value OHTelephonyGetNetworkStateForSlotParam(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    int32_t ret = -1;
    ret = TestCaseOHTelephonyGetNetworkStateForSlotParam(index);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int32_t TestCaseOHTelephonyGetNetworkStateParam(uint32_t index)
{
    Telephony_NetworkState telState;
    Telephony_RadioResult ret;
    
    if (index == CASE_INDEX_1) {
        ret = OH_Telephony_GetNetworkState(nullptr);
    } else if (index == CASE_INDEX_2) {
        ret = OH_Telephony_GetNetworkState(&telState);
    }
    
    return static_cast<int32_t>(ret);
}

/* 用例三 */
static napi_value OHTelephonyGetNetworkStateParam(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    int32_t ret = -1;
    ret = TestCaseOHTelephonyGetNetworkStateParam(index);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Conv2JsObject(napi_env env, Telephony_NetworkState *state)
{
    napi_value jsValue = nullptr;
    napi_value propertyValue = nullptr;
    napi_create_object(env, &jsValue);
    
    napi_create_string_utf8(env, state->longOperatorName_, strlen(state->longOperatorName_), &propertyValue);
    napi_set_named_property(env, jsValue, "longOperatorName", propertyValue);
    
    napi_create_string_utf8(env, state->shortOperatorName_, strlen(state->shortOperatorName_), &propertyValue);
    napi_set_named_property(env, jsValue, "shortOperatorName", propertyValue);
    
    napi_create_string_utf8(env, state->plmnNumeric_, strlen(state->plmnNumeric_), &propertyValue);
    napi_set_named_property(env, jsValue, "plmnNumeric", propertyValue);
    
    napi_get_boolean(env, state->isRoaming_, &propertyValue);
    napi_set_named_property(env, jsValue, "isRoaming", propertyValue);
    
    napi_create_int32(env, state->regState_, &propertyValue);
    napi_set_named_property(env, jsValue, "regState", propertyValue);
    
    napi_create_int32(env, state->nsaState_, &propertyValue);
    napi_set_named_property(env, jsValue, "nsaState", propertyValue);
    
    napi_create_int32(env, state->cfgTech_, &propertyValue);
    napi_set_named_property(env, jsValue, "cfgTech", propertyValue);
    
    napi_get_boolean(env, state->isCaActive_, &propertyValue);
    napi_set_named_property(env, jsValue, "isCaActive", propertyValue);
    
    napi_get_boolean(env, state->isEmergency_, &propertyValue);
    napi_set_named_property(env, jsValue, "isEmergency", propertyValue);
    
    return jsValue;
}

/* 用例四 */
static napi_value OHTelephonyGetNetworkStateForSlot(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t soltId;
    napi_get_value_int32(env, args[0], &soltId);
    
    Telephony_NetworkState telState = {0};
    Telephony_RadioResult res = TEL_RADIO_SUCCESS;
    res = OH_Telephony_GetNetworkStateForSlot(soltId, &telState);
    if (res != Telephony_RadioResult::TEL_RADIO_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, TELEPHONY_LOG_DOMAIN, TELEPHONY_LOG_TAG,
                     "OH_Telephony_GetNetworkStateForSlot failed %{public}d", res);
        return nullptr;
    }
    
    return Conv2JsObject(env, &telState);
}

/* 用例五 */
static napi_value OHTelephonyGetNetworkState(napi_env env, napi_callback_info info)
{
    Telephony_NetworkState telState = {0};
    Telephony_RadioResult res = TEL_RADIO_SUCCESS;
    res = OH_Telephony_GetNetworkState(&telState);
    if (res != Telephony_RadioResult::TEL_RADIO_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, TELEPHONY_LOG_DOMAIN, TELEPHONY_LOG_TAG,
                     "OH_Telephony_GetNetworkState failed %{public}d", res);
        return nullptr;
    }
    
    return Conv2JsObject(env, &telState);
}

/* 覆盖枚举值8300001 */
static napi_value GetNetworkState0601(napi_env env, napi_callback_info info)
{
    int32_t result = Telephony_RadioResult::TEL_RADIO_ERR_MARSHALLING_FAILED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

/* 覆盖枚举值8300002 */
static napi_value GetNetworkState0701(napi_env env, napi_callback_info info)
{
    int32_t result = Telephony_RadioResult::TEL_RADIO_ERR_SERVICE_CONNECTION_FAILED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

/* 覆盖枚举值8300003 */
static napi_value GetNetworkState0801(napi_env env, napi_callback_info info)
{
    int32_t result = Telephony_RadioResult::TEL_RADIO_ERR_OPERATION_FAILED;
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHTelephonyGetDefaultCellularDataSlotId", nullptr, OHTelephonyGetDefaultCellularDataSlotId, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHTelephonyGetNetworkStateForSlotParam", nullptr, OHTelephonyGetNetworkStateForSlotParam, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHTelephonyGetNetworkStateParam", nullptr, OHTelephonyGetNetworkStateParam, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHTelephonyGetNetworkStateForSlot", nullptr, OHTelephonyGetNetworkStateForSlot, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHTelephonyGetNetworkState", nullptr, OHTelephonyGetNetworkState, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetNetworkState0601", nullptr, GetNetworkState0601, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetNetworkState0701", nullptr, GetNetworkState0701, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetNetworkState0801", nullptr, GetNetworkState0801, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
