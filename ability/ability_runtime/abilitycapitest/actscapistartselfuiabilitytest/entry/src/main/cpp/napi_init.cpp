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
#include <AbilityKit/ability_runtime/start_options.h>
#include <AbilityKit/native_child_process.h>
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

static napi_value NdkStartAbilityWithOptions_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DestroyStartOptions(&options);
    errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DestroyStartOptions(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(nullptr, options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}


static napi_value NdkStartAbilityWithOptions_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWithAnimation(nullptr, true);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600 begins");
    bool withAnimation = false;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWithAnimation(nullptr, withAnimation);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowMode(nullptr, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800 begins");
    AbilityRuntime_WindowMode windowMode = ABILITY_RUNTIME_WINDOW_MODE_UNDEFINED;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowMode(nullptr, windowMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsDisplayId(nullptr, 1);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200 begins");
    int32_t displayId = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsDisplayId(nullptr, displayId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowLeft(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400 begins");
    int32_t windowLeft = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowLeft(nullptr, windowLeft);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowTop(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600 begins");
    int32_t windowTop = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowTop(nullptr, windowTop);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowWidth(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800 begins");
    int32_t windowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowWidth(nullptr, windowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowHeight(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000 begins");
    int32_t windowHeight = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowHeight(nullptr, windowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100 begins");
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }

    //创建参数结构体实例，并设置参数
    OH_Pixelmap_InitializationOptions *createOpts = nullptr;
    int32_t setWidth = 6;
    int32_t setHeight = 4;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, setWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, setHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    //创建Pixelmap实例
    OH_PixelmapNative *startWindowIcon = nullptr;
    Image_ErrorCode imgErrCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &startWindowIcon);
    if (imgErrCode != IMAGE_SUCCESS) {
        OH_PixelmapInitializationOptions_Release(createOpts);
    }
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowIcon(nullptr, startWindowIcon);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowIcon(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300 begins");
    OH_PixelmapNative *startWindowIcon = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowIcon(nullptr, &startWindowIcon);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowIcon(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(nullptr, "#00000000");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700 begins");
    char *startWindowBackgroundColor = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColor(nullptr, &startWindowBackgroundColor, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColor(options, nullptr, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900 begins");
    size_t supportedWindowModesSize = 3;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000 begins");
    AbilityRuntime_SupportedWindowMode *supportedWindowModes = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModes(nullptr, &supportedWindowModes, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100 begins");
    size_t supportedWindowModesSize = 3;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200 begins");
    size_t supportedWindowModesSize = -1;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300 begins");
    size_t supportedWindowModesSize = 0;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400 begins");
    size_t supportedWindowModesSize = -11;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500 begins");
    size_t supportedWindowModesSize = 11;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t windowWidth = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowWidth(nullptr, windowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowWidth(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t windowHeight = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowHeight(nullptr, windowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowHeight(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t minWindowWidth = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMinWindowWidth(nullptr, minWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowWidth(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t minWindowHeight = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMinWindowHeight(nullptr, minWindowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartVisibility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0100 begins");
    AbilityRuntime_StartVisibility visibility = AbilityRuntime_StartVisibility::ABILITY_RUNTIME_SHOW_UPON_START;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartVisibility(nullptr, visibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartVisibility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0200 begins");
    AbilityRuntime_StartVisibility visibility;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartVisibility(nullptr, visibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowHeight(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 begins");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantUri(nullptr, "this is a error uri");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantUri(want, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0300 begins");
    char uriBuffer[32] = {0};
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(nullptr, uriBuffer, sizeof(uriBuffer));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0400 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, nullptr, sizeof(uriBuffer));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0500 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantUri(want, "file://xxxxxxxx");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, uriBuffer, 15);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0600 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantUri(want, "file://xxxxxxxx");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, uriBuffer, 14);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0700 begins");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantInt32Param(nullptr, "keyInt", 32);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    int32_t intParam = 32;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantInt32Param(want, nullptr, intParam);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0900 begins");
    int32_t outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(nullptr, "keyInt", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1000 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantInt32Param(want, "keyInt", 32);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(want, nullptr, &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1100 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantInt32Param(want, "keyInt", 32);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(want, "keyInt", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1200 begins");
    bool flag = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantBoolParam(nullptr, "keyBool", flag);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantBoolParam(want, nullptr, flag);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1400 begins");
    bool outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(nullptr, "keyBool", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    bool outElement = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(nullptr, "keyBool", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1600 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;     
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    bool flag = false;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(want, "keyBool", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1700 begins");
    double param = 1.0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantDoubleParam(nullptr, "keyDouble", param);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantDoubleParam(want, nullptr, param);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1900 begins");
    double outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(nullptr, "keyDouble", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", param);
    double outElement = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(nullptr, "keyDouble", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;     
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    double param = 1.0;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", param);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(want, "keyDouble", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value StartNativeChildProcess_0100(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_StartNativeChildProcess(
        "libentry.so:Main", args, options, &pid);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value StartNativeChildProcess_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_0700 begins");
    NativeChildProcess_Args *args_global = OH_Ability_GetCurrentChildProcessArgs();
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_0700: %{public}d", args_global);
    if(args_global == nullptr){
      napi_value result;
      napi_create_int32(env, 0, &result);
      return result;
    }else{
      napi_value result;
      napi_create_int32(env, 1, &result);
      return result;
    }
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
        { "ndkStartAbilityWithOptions_0100", nullptr, NdkStartAbilityWithOptions_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0200", nullptr, NdkStartAbilityWithOptions_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0300", nullptr, NdkStartAbilityWithOptions_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0400", nullptr, NdkStartAbilityWithOptions_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0500", nullptr, NdkStartAbilityWithOptions_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0600", nullptr, NdkStartAbilityWithOptions_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0700", nullptr, NdkStartAbilityWithOptions_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0800", nullptr, NdkStartAbilityWithOptions_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1100", nullptr, NdkStartAbilityWithOptions_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1200", nullptr, NdkStartAbilityWithOptions_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1300", nullptr, NdkStartAbilityWithOptions_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1400", nullptr, NdkStartAbilityWithOptions_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1500", nullptr, NdkStartAbilityWithOptions_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1600", nullptr, NdkStartAbilityWithOptions_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1700", nullptr, NdkStartAbilityWithOptions_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1800", nullptr, NdkStartAbilityWithOptions_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1900", nullptr, NdkStartAbilityWithOptions_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2000", nullptr, NdkStartAbilityWithOptions_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2100", nullptr, NdkStartAbilityWithOptions_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2200", nullptr, NdkStartAbilityWithOptions_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2300", nullptr, NdkStartAbilityWithOptions_2300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2400", nullptr, NdkStartAbilityWithOptions_2400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2500", nullptr, NdkStartAbilityWithOptions_2500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2600", nullptr, NdkStartAbilityWithOptions_2600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2700", nullptr, NdkStartAbilityWithOptions_2700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2800", nullptr, NdkStartAbilityWithOptions_2800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2900", nullptr, NdkStartAbilityWithOptions_2900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3000", nullptr, NdkStartAbilityWithOptions_3000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3100", nullptr, NdkStartAbilityWithOptions_3100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3200", nullptr, NdkStartAbilityWithOptions_3200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3300", nullptr, NdkStartAbilityWithOptions_3300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3400", nullptr, NdkStartAbilityWithOptions_3400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3500", nullptr, NdkStartAbilityWithOptions_3500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3600", nullptr, NdkStartAbilityWithOptions_3600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3700", nullptr, NdkStartAbilityWithOptions_3700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3800", nullptr, NdkStartAbilityWithOptions_3800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3900", nullptr, NdkStartAbilityWithOptions_3900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4000", nullptr, NdkStartAbilityWithOptions_4000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4100", nullptr, NdkStartAbilityWithOptions_4100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4200", nullptr, NdkStartAbilityWithOptions_4200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0100", nullptr, NdkWantEx_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0200", nullptr, NdkWantEx_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0300", nullptr, NdkWantEx_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0400", nullptr, NdkWantEx_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0500", nullptr, NdkWantEx_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0600", nullptr, NdkWantEx_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0700", nullptr, NdkWantEx_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0800", nullptr, NdkWantEx_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0900", nullptr, NdkWantEx_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1000", nullptr, NdkWantEx_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1100", nullptr, NdkWantEx_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1200", nullptr, NdkWantEx_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1300", nullptr, NdkWantEx_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1400", nullptr, NdkWantEx_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1500", nullptr, NdkWantEx_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1600", nullptr, NdkWantEx_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1700", nullptr, NdkWantEx_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1800", nullptr, NdkWantEx_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1900", nullptr, NdkWantEx_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2000", nullptr, NdkWantEx_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2100", nullptr, NdkWantEx_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess_0100", nullptr, StartNativeChildProcess_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess_0700", nullptr, StartNativeChildProcess_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartVisibility_0100", nullptr, NdkStartVisibility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartVisibility_0200", nullptr, NdkStartVisibility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
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
