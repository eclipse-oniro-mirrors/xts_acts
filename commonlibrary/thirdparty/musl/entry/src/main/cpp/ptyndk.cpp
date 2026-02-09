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

#include "napi/native_api.h"
#include <js_native_api.h>
#include <node_api.h>
#include <pty.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
static napi_value Forkpty(napi_env env, napi_callback_info info)
{
    int param = PARAM_0;
    pid_t pid = forkpty(&param, nullptr, nullptr, nullptr);
    int value = FAIL;
    if (pid >= NO_ERR) {
        value = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}
static napi_value Openpty(napi_env env, napi_callback_info info)
{
    int ama = PARAM_0, asl = PARAM_0;
    int ret = openpty(&ama, &asl, nullptr, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"forkpty", nullptr, Forkpty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openpty", nullptr, Openpty, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "pty",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }