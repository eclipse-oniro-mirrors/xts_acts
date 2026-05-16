/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <cfenv>
#include <js_native_api_types.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_4 4
#define PARAM_8 8
#define PARAM_16 16
#define MPARAM_1 (-1)

static napi_value FeTestExcept(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam;
    napi_get_value_int32(env, args[0], &firstParam);
    int backParam = fetestexcept(firstParam);
    napi_value result;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeUpdateEnv(napi_env env, napi_callback_info info)
{
    int backParam;
    const fenv_t *envp;
    backParam = feupdateenv(envp);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeSetRound(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, rounding_mode;
    napi_get_value_int32(env, args[0], &rounding_mode);
    backParam = fesetround(rounding_mode);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeSetExceptFlag(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, excepts;
    napi_get_value_int32(env, args[0], &excepts);
    const fexcept_t flagp = PARAM_0;
    backParam = fesetexceptflag(&flagp, excepts);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeSetEnv(napi_env env, napi_callback_info info)
{
    int backParam;
    const fenv_t *envp;
    backParam = fesetenv(envp);
    feupdateenv(envp);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeRaiseExcept(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, excepts;
    napi_get_value_int32(env, args[0], &excepts);
    backParam = feraiseexcept(excepts);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeHoldExcept(napi_env env, napi_callback_info info)
{
    int backParam;
    fenv_t envp;
    backParam = feholdexcept(&envp);
    feupdateenv(&envp);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeGetRound(napi_env env, napi_callback_info info)
{
    int backParam;
    backParam = fegetround();
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeGetExceptFlag(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, excepts;
    napi_get_value_int32(env, args[0], &excepts);
    fexcept_t *flagp = nullptr;
    backParam = fegetexceptflag(flagp, excepts);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeGetEnv(napi_env env, napi_callback_info info)
{
    int backParam;
    fenv_t fenv;
    backParam = fegetenv(&fenv);
    feupdateenv(&fenv);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FeClearExcept(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, list;
    napi_get_value_int32(env, args[0], &list);
    switch (list) {
    case PARAM_0:
        backParam = feclearexcept(list);
        break;
    case PARAM_1:
        backParam = feclearexcept(list);
        break;
    case PARAM_2:
        backParam = feclearexcept(list);
        break;
    case PARAM_4:
        backParam = feclearexcept(list);
        break;
    case PARAM_8:
        backParam = feclearexcept(list);
        break;
    case PARAM_16:
        backParam = feclearexcept(list);
        break;
    case MPARAM_1:
        backParam = feclearexcept(list);
        break;
    default:
        backParam = feclearexcept(list);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"fetestexcept", nullptr, FeTestExcept, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feupdateenv", nullptr, FeUpdateEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fesetround", nullptr, FeSetRound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fesetexceptflag", nullptr, FeSetExceptFlag, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fesetenv", nullptr, FeSetEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetround", nullptr, FeGetRound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feraiseexcept", nullptr, FeRaiseExcept, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetexceptflag", nullptr, FeGetExceptFlag, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feholdexcept", nullptr, FeHoldExcept, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fegetenv", nullptr, FeGetEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feclearexcept", nullptr, FeClearExcept, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libfenvndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
