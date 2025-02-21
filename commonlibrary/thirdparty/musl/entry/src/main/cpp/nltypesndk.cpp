/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cstdlib>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <nl_types.h>
#include <node_api.h>

#define SUCCESS 1
#define FAIL (-1)
#define SIZE_2 2

static napi_value Catclose(napi_env env, napi_callback_info info)
{
    int returnValue = SUCCESS;
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Catopen(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    nl_catd catid = catopen("hello", NL_CAT_LOCALE);
    if (catid != nullptr) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Catgets(napi_env env, napi_callback_info info)
{
    int returnValue = SUCCESS;
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"catOpen", nullptr, Catopen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"catclose", nullptr, Catclose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"catgets", nullptr, Catgets, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "nltypesndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }