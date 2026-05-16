/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <complex>
#include <cstdio>

static napi_value InitArray(napi_env env, napi_callback_info info)
{
    int32_t array[2] = { [0] = 1 };
    napi_value num1 = nullptr;
    napi_create_int32(env, array[0], &num1);
    napi_value num2 = nullptr;
    napi_create_int32(env, array[1], &num2);
    napi_value result = nullptr;
    int length = 2;
    napi_create_array_with_length(env, length, &result);
    napi_set_element(env, result, 0, num1);
    napi_set_element(env, result, 1, num2);
    return result;
}

static napi_value GetBool(napi_env env, napi_callback_info info)
{
    bool res1 = true;
    bool res2 = false;
    napi_value num1 = nullptr;
    napi_create_int32(env, res1 ? 0 : 1, &num1);
    napi_value num2 = nullptr;
    napi_create_int32(env, res2 ? 0 : 1, &num2);
    napi_value result = nullptr;
    int length = 2;
    napi_create_array_with_length(env, length, &result);
    napi_set_element(env, result, 0, num1);
    napi_set_element(env, result, 1, num2);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"InitArray", nullptr, InitArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBool", nullptr, GetBool, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "softwareNdk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
