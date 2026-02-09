/**
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

#include <cstddef>
#include <cstring>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_TAG "MY_TAG"
#include "napi/native_api.h"

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static void LogSoLoaded(napi_env env)
{
    napi_value module;
    napi_load_module_with_info(env, "ets/utils/LogMap",
                               "com.example.execute_promise_after_module_load/entry_test", &module);
    napi_value logMap;
    napi_get_named_property(env, module, "LogMap", &logMap);
    napi_value logModuleLoadFunc;
    napi_get_named_property(env, logMap, "logModuleLoad", &logModuleLoadFunc);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "testLoadSoInTaskPoolNotExecutePromisePendingJob", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_string_utf8(env, "libentrytaskpool.so", NAPI_AUTO_LENGTH, &value);
    napi_value argv[2];
    argv[0] = key;
    argv[1] = value;
    size_t argc = 2;
    napi_call_function(env, module, logModuleLoadFunc, argc, argv, nullptr);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    LogSoLoaded(env);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entrytaskpool",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}