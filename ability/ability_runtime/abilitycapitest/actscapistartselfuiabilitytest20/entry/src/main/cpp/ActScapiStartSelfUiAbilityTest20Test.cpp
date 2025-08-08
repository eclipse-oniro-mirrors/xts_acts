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
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include "AbilityKit/ability_runtime/application_context.h"

namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}

static napi_value DestroyChildProcessConfigsParamInvalid(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = nullptr;
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_DestroyChildProcessConfigs(configs);
    if (ret == NCP_ERR_INVALID_PARAM) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

static napi_value DestroyChildProcessConfigsNoError(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs *configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_DestroyChildProcessConfigs(configs);
    if (ret == NCP_NO_ERROR) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"DestroyChildProcessConfigsParamInvalid",
            nullptr, DestroyChildProcessConfigsParamInvalid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyChildProcessConfigsNoError",
            nullptr, DestroyChildProcessConfigsNoError, nullptr, nullptr, nullptr, napi_default, nullptr}
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
