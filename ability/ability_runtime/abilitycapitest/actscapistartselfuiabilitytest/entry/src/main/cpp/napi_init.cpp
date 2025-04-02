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

#include <AbilityKit/ability_base/ability_base_common.h>
#include <cstdio>
#include <cstring>
#include <string>

#include "napi/native_api.h"
#include "AbilityKit/ability_runtime/ability_runtime_common.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "AbilityKit/ability_runtime/context_constant.h"
#include "AbilityKit/ability_base/want.h"
#include "hilog/log.h"
#include "fcntl.h"
#include "unistd.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;

static void Throw(napi_env env, int32_t errCode, const char *errMsg)
{
    napi_value code;
    napi_create_int32(env, errCode, &code);

    napi_value msg = nullptr;
    if (errMsg != nullptr) {
        napi_create_string_utf8(env, errMsg, strlen(errMsg), &msg);
    } else {
        napi_create_string_utf8(env, "", 0, &msg);
    }

    napi_value error;
    napi_create_error(env, code, msg, &error);
    napi_throw(env, error);
}

typedef AbilityRuntime_ErrorCode (*AbilityRuntime_GetDirFunc)(char *, int32_t, int32_t *);

static napi_value NdkStartAbility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0200 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_DestroyWant(want);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.err.bundle");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0300 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("errmodule");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0400 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbilityerr");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0500 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0900 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1000 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1100 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryFormAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1200 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1600 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0100 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_DestroyWant(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0200 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantElement(want, element);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0300 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_Element *element;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, element);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0400 begins");
    int32_t code = 401;
    AbilityBase_Element element;
    element.abilityName = "";
    element.moduleName = "";
    element.bundleName = "";
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    if (want == nullptr) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    AbilityBase_Element ourelement2;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, &ourelement2);
    std::string result  = "OH_AbilityBase_GetWantElement bundleName:" + std::string(ourelement2.bundleName) + " " +
    "OH_AbilityBase_GetWantElement moduleName:" + std::string(ourelement2.moduleName) + " " +
    "OH_AbilityBase_GetWantElement abilityName:" + std::string(ourelement2.abilityName);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0400 native errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0500 begins");
    AbilityBase_Element element;
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, nullptr, "VALUE");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0700 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value1");
    errCode = OH_AbilityBase_SetWantCharParam(want, "key", "set second value");
    char outvalue[30];
    OH_AbilityBase_GetWantCharParam(want, "key", outvalue, sizeof(outvalue));
    std::string result  = "OH_AbilityBase_GetWantCharParam:" + std::string(outvalue);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0800 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(nullptr, "key", outvalue, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, nullptr, outvalue, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30] = { 0 };
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key100", outvalue, sizeof(outvalue));
    std::string result  = "OH_AbilityBase_GetWantCharParam:" + std::string(outvalue);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1100 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", nullptr, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", outvalue, NULL);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", outvalue, 1);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1500 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 100);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, nullptr, 100);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", NULL);
    int32_t fd = 100;
    OH_AbilityBase_GetWantFd(want, "fd", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 fd=%{public}d", fd);
    napi_value result;
    napi_create_int32(env, fd, &result);
    return result;
}

static napi_value WantNdk_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd1", 1);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_AddWantFd(want, "fd2", 1);
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_AddWantFd(want, "fd3", 1);
    AbilityBase_ErrorCode errCode3 = OH_AbilityBase_AddWantFd(want, "fd4", 1);
    AbilityBase_ErrorCode errCode4 = OH_AbilityBase_AddWantFd(want, "fd5", 1);
    int32_t fd = 100;
    int32_t fd1 = 100;
    int32_t fd2 = 100;
    int32_t fd3 = 100;
    int32_t fd4 = 100;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_AbilityBase_GetWantFd(want, "fd2", &fd1);
    OH_AbilityBase_GetWantFd(want, "fd3", &fd2);
    OH_AbilityBase_GetWantFd(want, "fd4", &fd3);
    OH_AbilityBase_GetWantFd(want, "fd5", &fd4);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 fd=%{public}d", fd);
    std::string result = "fd1:" + std::to_string(fd) + "fd2:" + std::to_string(fd1) + "fd3:" + std::to_string(fd2) +
    "fd4:" + std::to_string(fd3) + "fd5:" + std::to_string(fd4);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd1", 1);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_AddWantFd(want, "fd1", 2);
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_AddWantFd(want, "fd1", 3);
    AbilityBase_ErrorCode errCode3 = OH_AbilityBase_AddWantFd(want, "fd1", 4);
    AbilityBase_ErrorCode errCode4 = OH_AbilityBase_AddWantFd(want, "fd1", 5);
    int32_t fd = 100;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 fd=%{public}d", fd);
    std::string result  = "fd1:" + std::to_string(fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", -1);
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2000 errCode=%{public}d", err);
    napi_value result;
    napi_create_int32(env, err, &result);
    return result;
}

static napi_value WantNdk_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 0);
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2100 errCode=%{public}d", err);
    napi_value result;
    napi_create_int32(env, err, &result);
    return result;
}

static napi_value WantNdk_2200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = 100;
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_GetWantFd(nullptr, "fd", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2200 errCode=%{public}d", errCode2);
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}

static napi_value WantNdk_2300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = 100;
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_GetWantFd(want, nullptr, &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 errCode=%{public}d", errCode2);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 fd=%{public}d", fd);
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}

static napi_value WantNdk_2400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = -1;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 fd=%{public}d", fd);
    napi_value result;
    napi_create_int32(env, fd, &result);
    return result;
}

static napi_value WantNdk_2500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility1");
    element.bundleName = const_cast<char *>("com.example.myapplication");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantElement(want, element);
    AbilityBase_Element ourelement2;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, &ourelement2);
    std::string result  = "OH_AbilityBase_GetWantElement bundleName:" + std::string(ourelement2.bundleName) + " " +
    "OH_AbilityBase_GetWantElement moduleName:" + std::string(ourelement2.moduleName) + " " +
    "OH_AbilityBase_GetWantElement abilityName:" + std::string(ourelement2.abilityName);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2500 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ndkStartAbility_0100", nullptr, NdkStartAbility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0200", nullptr, NdkStartAbility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0300", nullptr, NdkStartAbility_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0400", nullptr, NdkStartAbility_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0500", nullptr, NdkStartAbility_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0900", nullptr, NdkStartAbility_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1000", nullptr, NdkStartAbility_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1100", nullptr, NdkStartAbility_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1200", nullptr, NdkStartAbility_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1600", nullptr, NdkStartAbility_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0100", nullptr, WantNdk_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0200", nullptr, WantNdk_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0300", nullptr, WantNdk_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0400", nullptr, WantNdk_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0500", nullptr, WantNdk_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0600", nullptr, WantNdk_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0700", nullptr, WantNdk_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0800", nullptr, WantNdk_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0900", nullptr, WantNdk_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1000", nullptr, WantNdk_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1100", nullptr, WantNdk_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1200", nullptr, WantNdk_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1300", nullptr, WantNdk_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1400", nullptr, WantNdk_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1500", nullptr, WantNdk_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1600", nullptr, WantNdk_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1700", nullptr, WantNdk_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1800", nullptr, WantNdk_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1900", nullptr, WantNdk_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2000", nullptr, WantNdk_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2100", nullptr, WantNdk_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2200", nullptr, WantNdk_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2200", nullptr, WantNdk_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2300", nullptr, WantNdk_2300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2400", nullptr, WantNdk_2400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2500", nullptr, WantNdk_2500, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};
} // namespace

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
