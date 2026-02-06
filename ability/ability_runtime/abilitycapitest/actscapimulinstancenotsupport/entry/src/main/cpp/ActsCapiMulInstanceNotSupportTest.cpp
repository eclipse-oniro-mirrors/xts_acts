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
#include <cstdint>
#include <js_native_api_types.h>
#include "AbilityKit/ability_runtime/application_context.h"
#include "ActsCapiMulInstanceNotSupportTest.h"

namespace {
const uint32_t MAX_NAME_LENGTH = 1024;
}

napi_value StartSelfUIAbilityWithStartOptionsInstanceNotSupport(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapimulinstancenotsupport");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_MULTI_INSTANCE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    } else if (ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value AbiliRuntimeErrorMultiInstanceNotSupportCode(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.actscapimulinstancenotsupport");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_SetWantBoolParam(want, "ohos.extra.param.key.createAppInstance", true);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_AbilityBase_DestroyWant(want);
    if (ret == ABILITY_RUNTIME_ERROR_MULTI_INSTANCE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    } else if (ret == ABILITY_RUNTIME_ERROR_CODE_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}