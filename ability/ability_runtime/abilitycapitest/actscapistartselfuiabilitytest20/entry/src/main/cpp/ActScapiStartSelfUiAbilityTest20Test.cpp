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

#include "AbilityKit/native_child_process.h"
#include "napi/native_api.h"
#include <AbilityKit/ability_runtime/ability_runtime_common.h>
#include <cstdint>
#include <future>
#include <thread>
#include <unistd.h>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include "AbilityKit/ability_runtime/application_context.h"
#include "ActScapiStartSelfUiAbilityTest20Test.h"

std::promise<int> *g_promiseStartProcess = nullptr;
napi_value DestroyChildProcessConfigsParamInvalid(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = nullptr;
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_DestroyChildProcessConfigs(configs);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value DestroyChildProcessConfigsNoError(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_DestroyChildProcessConfigs(configs);
    if (ret == NCP_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ChildProcessConfigsSetIsolationModeInvalidParam(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = nullptr;
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_ChildProcessConfigs_SetIsolationMode(configs, NCP_ISOLATION_MODE_ISOLATED);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ChildProcessConfigsSetIsolationModeNoError(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_ChildProcessConfigs_SetIsolationMode(configs, NCP_ISOLATION_MODE_ISOLATED);
    if (ret == NCP_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ChildProcessConfigsSetProcessNameInvalidParam(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs;
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_ChildProcessConfigs_SetProcessName(configs, nullptr);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ChildProcessConfigsSetProcessNameNoError(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if (ret == NCP_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

void NativeChildProcessExit(int32_t pid, int32_t signal)
{}

napi_value RegisterNativeChildProcessExitCallbackNoError(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_RegisterNativeChildProcessExitCallback(NativeChildProcessExit);
    if (ret == NCP_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value RegisterNativeChildProcessExitCallbackInvPar(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_RegisterNativeChildProcessExitCallback(nullptr);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value UnregisterNativeChildProcessExitCallbackNoError(napi_env env, napi_callback_info info)
{
    OH_Ability_RegisterNativeChildProcessExitCallback(NativeChildProcessExit);
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_UnregisterNativeChildProcessExitCallback(NativeChildProcessExit);
    if (ret == NCP_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value UnregisterNativeChildProcessExitCallbackInvPar(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_UnregisterNativeChildProcessExitCallback(nullptr);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value UnregisterNativeChildProcessExitCallbackNotExist(napi_env env, napi_callback_info info)
{
    void* errPtr = reinterpret_cast<void*>(0x12345678);
    auto data = reinterpret_cast<OH_Ability_OnNativeChildProcessExit>(errPtr);
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_UnregisterNativeChildProcessExitCallback(data);
    if (ret == NCP_ERR_CALLBACK_NOT_EXIST) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value DestroyWantNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantElementNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantElement(want, element);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantElementNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantElement(want, &element);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantCharParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantCharParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantCharParam(want, "key", "set second value");
    char outvalue[30];
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantCharParam(want, "key", outvalue, sizeof(outvalue));
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AddWantFdNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_AddWantFd(want, "fd", 100);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantUriNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantUri(want, "file://xxxxxxxx");
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantUriNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char uriBuffer[32] = {0};
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantUri(want, uriBuffer, sizeof(uriBuffer));
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantInt32ParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantInt32Param(want, "keyInt", 32);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantInt32ParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    int value = 32;
    OH_AbilityBase_SetWantInt32Param(want, "keyInt", value);
    int32_t outElement = 0;
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantInt32Param(want, "keyInt", &outElement);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantBoolParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantBoolParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    bool outElement = 0;
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantBoolParam(want, "keyBool", &outElement);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetWantDoubleParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode ret = OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", param);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetWantDoubleParamNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double outElement = 0;
    OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", outElement);
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantDoubleParam(want, "keyDouble", &outElement);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeAreaModeEl2Code(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode para = ABILITY_RUNTIME_AREA_MODE_EL2;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeAreaModeEl3Code(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode para = ABILITY_RUNTIME_AREA_MODE_EL3;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeAreaModeEl4Code(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode para = ABILITY_RUNTIME_AREA_MODE_EL4;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeAreaModeEl5Code(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode para = ABILITY_RUNTIME_AREA_MODE_EL5;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeHideUponStartCode(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartVisibility visibility = AbilityRuntime_StartVisibility::ABILITY_RUNTIME_HIDE_UPON_START;
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsStartVisibility(options, visibility);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value DestroyStartOptionsNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_DestroyStartOptions(&options);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWindowModeNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsWindowMode(options, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWindowModeNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_WindowMode windowMode = ABILITY_RUNTIME_WINDOW_MODE_UNDEFINED;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWindowMode(options, windowMode);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsDisplayIdNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsDisplayId(options, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsDisplayIdParamInvalid(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsDisplayId(nullptr, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsDisplayIdNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t displayId = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsDisplayId(options, displayId);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWithAnimationNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsWithAnimation(options, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWithAnimationNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    bool withAnimation = false;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWithAnimation(options, withAnimation);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWindowLeftNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsWindowLeft(options, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWindowLeftNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWindowLeft(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWindowTopNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsWindowTop(options, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWindowTopNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWindowTop(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsStartVisibilityNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_StartVisibility visibility = AbilityRuntime_StartVisibility::ABILITY_RUNTIME_SHOW_UPON_START;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsStartVisibility(options, visibility);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsStartVisibilityNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_StartVisibility visibility = AbilityRuntime_StartVisibility::ABILITY_RUNTIME_SHOW_UPON_START;
    OH_AbilityRuntime_SetStartOptionsStartVisibility(options, visibility);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsStartVisibility(options, visibility);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsStartWindowIconNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    
    OH_Pixelmap_InitializationOptions *createOpts = nullptr;
    int32_t setWidth = 6;
    int32_t setHeight = 4;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, setWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, setHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *startWindowIcon = nullptr;
    Image_ErrorCode imgErrCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &startWindowIcon);
    if (imgErrCode != IMAGE_SUCCESS) {
        OH_PixelmapInitializationOptions_Release(createOpts);
    }
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsStartWindowIcon(options, startWindowIcon);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsStartWindowIconNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }

    OH_Pixelmap_InitializationOptions *createOpts = nullptr;
    int32_t setWidth = 6;
    int32_t setHeight = 4;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, setWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, setHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *startWindowIcon = nullptr;
    Image_ErrorCode imgErrCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &startWindowIcon);
    if (imgErrCode != IMAGE_SUCCESS) {
        OH_PixelmapInitializationOptions_Release(createOpts);
    }
    OH_AbilityRuntime_SetStartOptionsStartWindowIcon(options, startWindowIcon);
    startWindowIcon = nullptr;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsStartWindowIcon(options, &startWindowIcon);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsStartWindowBackgroundColorNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(options, "#00000000");
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsStartWindowBackgroundColorNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *startOptions = OH_AbilityRuntime_CreateStartOptions();
    char originalStartWindowBackgroundColor[] = "";
    OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(startOptions, originalStartWindowBackgroundColor);
    char *startWindowBackgroundColor = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColor(
        startOptions, &startWindowBackgroundColor, size);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsSupportedWindowModesNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    size_t supportedWindowModesSize = 3;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(options, supportedWindowModes, supportedWindowModesSize);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsSupportedWindowModesNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_SupportedWindowMode *supportedWindowModes = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_GetStartOptionsSupportedWindowModes(options, &supportedWindowModes, size);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsMinWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsMinWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsMinWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsMinWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsMaxWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsMaxWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsMaxWindowWidthNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsMaxWindowWidth(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsMinWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsMinWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsMinWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsMinWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsMinWindowHeightParamInvalid(napi_env env, napi_callback_info info)
{
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsMinWindowHeight(nullptr, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value SetStartOptionsMaxWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_SetStartOptionsMaxWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value GetStartOptionsMaxWindowHeightNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t num = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetStartOptionsMaxWindowHeight(options, num);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

void OnNativeChildProcessStarted(int errCode, OHIPCRemoteProxy *remoteProxy)
{
    if (g_promiseStartProcess != nullptr) {
        g_promiseStartProcess->set_value(errCode);
    }
    g_promiseStartProcess = nullptr;
}

napi_value CreateNativeChildProcessNoError(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_Ability_CreateNativeChildProcess("libentry.so:Main", OnNativeChildProcessStarted);
    if (ret == NCP_ERR_NOT_SUPPORTED || ret == NCP_ERR_MULTI_PROCESS_DISABLED || ret == NCP_NO_ERROR
        || ret == NCP_ERR_MAX_CHILD_PROCESSES_REACHED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value CreateNativeChildProcessInvalidParam(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_Ability_CreateNativeChildProcess(nullptr, OnNativeChildProcessStarted);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value CreateNativeChildProcessLibLoadingFailed(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char libName[64];
    size_t nameLen;
    napi_get_value_string_utf8(env, args[0], libName, sizeof(libName), &nameLen);
    int32_t ret = OH_Ability_CreateNativeChildProcess("libentry.so:Main", OnNativeChildProcessStarted);
    if (ret == NCP_NO_ERROR) {
        auto future = promise.get_future();
        OH_LOG_INFO(LOG_APP, "Main process - Wait for call back");
        ret = future.get();
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value CreateNativeChildProcessWithConfigsNoError(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    int32_t ret =
        OH_Ability_CreateNativeChildProcessWithConfigs("libentry.so:Main", configs, OnNativeChildProcessStarted);
    if (ret == NCP_ERR_NOT_SUPPORTED || ret == NCP_ERR_MULTI_PROCESS_DISABLED || ret == NCP_NO_ERROR
        || ret == NCP_ERR_MAX_CHILD_PROCESSES_REACHED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value CreateNativeChildProcessWithConfigsInvalidParam(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    int32_t ret = OH_Ability_CreateNativeChildProcessWithConfigs(nullptr, configs, OnNativeChildProcessStarted);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartNativeChildProcessNoError(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    int32_t ret = OH_Ability_StartNativeChildProcess("libentry.so:Main", args, options, &pid);
    if (ret == NCP_ERR_NOT_SUPPORTED || ret == NCP_ERR_MULTI_PROCESS_DISABLED || ret == NCP_NO_ERROR
        || ret == NCP_ERR_MAX_CHILD_PROCESSES_REACHED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartNativeChildProcessInvalidParam(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    int32_t ret = OH_Ability_StartNativeChildProcess(nullptr, args, options, &pid);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartNativeChildProcessWithConfigsNoError(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs("libentry.so:Main", args, configs, &pid);
    if (ret == NCP_ERR_NOT_SUPPORTED || ret == NCP_ERR_MULTI_PROCESS_DISABLED || ret == NCP_NO_ERROR
        || ret == NCP_ERR_MAX_CHILD_PROCESSES_REACHED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartNativeChildProcessWithConfigsInvalidParam(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs(nullptr, args, configs, &pid);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartNativeChildProcessWithConfigsServiceError(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    const size_t size = 200 * 1024;
    NativeChildProcess_Args args;
    args.entryParams = (char *)malloc(sizeof(char) * size);
    for(int i = 0; i < size; i++){
        args.entryParams[i] = 'a';
    }
    args.fdList.head = NULL;
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    OH_Ability_DestroyChildProcessConfigs(configs);
    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs("libentry.so:Main", args, configs, &pid);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityInstanceKeyNotSupport(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0");
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_APP_INSTANCE_KEY_NOT_SUPPORTED
        || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED || ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityUpperLimitReached(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_UPPER_LIMIT_REACHED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithStartOptionsInstanceKeyNotSupport(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_APP_INSTANCE_KEY_NOT_SUPPORTED
        || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithStartOptionsNoError(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED || ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityWithStartOptionsUpperLimitReached(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_UPPER_LIMIT_REACHED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithStartOptionsNoSuchAbility(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("ErrorEntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_SUCH_ABILITY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityWithStartOptionsCodeCrossApp(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_CROSS_APP || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityWithStartOptionsCodeInternal(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_AddWantFd(want, "fd", -1);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INTERNAL || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityWithStartOptionsInvalidAppInstanceKey(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0_Error");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INVALID_APP_INSTANCE_KEY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithStartOptionsVisibilitySettingDisabled(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    OH_AbilityRuntime_SetStartOptionsStartVisibility(options, ABILITY_RUNTIME_HIDE_UPON_START);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_VISIBILITY_SETTING_DISABLED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetCacheDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetCacheDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetCacheDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetCacheDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetAreaModeNoError(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode para = ABILITY_RUNTIME_AREA_MODE_EL1;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetAreaModeInvPar(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetAreaMode(nullptr);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetBundleNameNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetBundleName(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetBundleNameInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetBundleName(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetTempDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetTempDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetTempDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetTempDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetFilesDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetFilesDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetFilesDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetDatabaseDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetDatabaseDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetDatabaseDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetDatabaseDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetPreferencesDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetPreferencesDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetPreferencesDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetPreferencesDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetBundleCodeDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetBundleCodeDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetBundleCodeDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetBundleCodeDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetDistributedFilesDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetDistributedFilesDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetDistributedFilesDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetDistributedFilesDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetCloudFileDirNoError(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    char cacheDir[kBufferSize] = {0};
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetCloudFileDir(cacheDir, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetCloudFileDirInvPar(napi_env env, napi_callback_info info)
{
    const size_t kBufferSize = 256;
    int32_t actualLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetCloudFileDir(nullptr, kBufferSize, &actualLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetResourceDirNoError(napi_env env, napi_callback_info info)
{
    char moduleName[256] = {"entry"};
    const int32_t bufferSize = 1024;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode ret =
        OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName, buffer, bufferSize, &writeLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value NcpErrorInvalidParamCode(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = nullptr;
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_DestroyChildProcessConfigs(configs);
    if (ret == NCP_ERR_INVALID_PARAM) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value NcpErrorServiceErrorCode(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    const size_t size = 200 * 1024;
    NativeChildProcess_Args args;
    args.entryParams = (char *)malloc(sizeof(char) * size);
    for(int i = 0; i < size; i++){
        args.entryParams[i] = 'a';
    }
    args.fdList.head = NULL;
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    OH_Ability_DestroyChildProcessConfigs(configs);
    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs("libentry.so:Main", args, configs, &pid);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value NcpErrorLibLoadingFailedCode(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char libName[64];
    size_t nameLen;
    napi_get_value_string_utf8(env, args[0], libName, sizeof(libName), &nameLen);
    int32_t ret = OH_Ability_CreateNativeChildProcess("libentry.so:Main", OnNativeChildProcessStarted);
    if (ret == NCP_NO_ERROR) {
        auto future = promise.get_future();
        OH_LOG_INFO(LOG_APP, "Main process - Wait for call back");
        ret = future.get();
    }
    if (ret == NCP_ERR_LIB_LOADING_FAILED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value NcpErrCallBackNotExistCode(napi_env env, napi_callback_info info)
{
    void* errPtr = reinterpret_cast<void*>(0x12345678);
    auto data = reinterpret_cast<OH_Ability_OnNativeChildProcessExit>(errPtr);
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_UnregisterNativeChildProcessExitCallback(data);
    if (ret == NCP_ERR_CALLBACK_NOT_EXIST) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityBaseErrorCodeNoErrorCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.ActsCapabilityStartSelfUIAbilityTest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode ret = OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityBaseErrorCodeParamInvalidCode(napi_env env, napi_callback_info info)
{
    AbilityBase_ErrorCode ret = OH_AbilityBase_DestroyWant(nullptr);
    if (ret == ABILITY_BASE_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeErrorCodeNoSuchAbilityCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("ErrorEntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_SUCH_ABILITY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeErrorCodeCrossAppCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_CROSS_APP || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeErrorCodeInternalCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_AddWantFd(want, "fd", -1);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INTERNAL || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeErrorVisibilitySettingDisabledCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    OH_AbilityRuntime_SetStartOptionsStartVisibility(options, ABILITY_RUNTIME_HIDE_UPON_START);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_VISIBILITY_SETTING_DISABLED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value AbilityRuntimeErrorCodeInvalidAppInstanceKeyCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0_Error");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INVALID_APP_INSTANCE_KEY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value AbilityRuntimeErrorCodeUpperLimitReachedCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_UPPER_LIMIT_REACHED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value AbilityRuntimeErrorAppInstanceKeyNotSupportCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_APP_INSTANCE_KEY_NOT_SUPPORTED
        || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value ApplicationContextGetVersionCodeNoError(napi_env env, napi_callback_info info)
{
    int64_t para = 1000000;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetVersionCode(&para);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value ApplicationContextGetVersionCodeParamInvalid(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ApplicationContextGetVersionCode(nullptr);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsInstanceKeyNotSupport(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_APP_INSTANCE_KEY_NOT_SUPPORTED
        || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsNoError(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED || ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsUpperLimitReached(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_UPPER_LIMIT_REACHED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsNoSuchAbility(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("ErrorEntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_SUCH_ABILITY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsCodeCrossApp(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_CROSS_APP || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsCodeInternal(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_AddWantFd(want, "fd", -1);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INTERNAL || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsInvalidAppInstanceKey(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantCharParam(want, "ohos.extra.param.key.appInstance", "app_instance_0_Error");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_INVALID_APP_INSTANCE_KEY || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value StartSelfUIAbilityWithPidWithStartOptionsVisibilitySettingDisabled(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapistartselfuiabilitytest20test");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    OH_AbilityRuntime_SetStartOptionsStartVisibility(options, ABILITY_RUNTIME_HIDE_UPON_START);
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_VISIBILITY_SETTING_DISABLED || ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
