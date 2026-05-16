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
#include <sys/fsuid.h>
#include <unistd.h>

#define PARAM_0 0
#define ONEVAL 1
#define MINUSONE (-1)

static napi_value Setfsgid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = MINUSONE;
    int oldval = setfsgid(MINUSONE);
    if (oldval >= PARAM_0) {
        int setval = setfsgid(oldval);
        setval = setfsgid(MINUSONE);
        if (setval == oldval) {
            ret = PARAM_0;
        }
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Setfsuid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = MINUSONE;
    int oldval = setfsuid(MINUSONE);
    if (oldval >= PARAM_0) {
        int setval = setfsuid(oldval);
        setval = setfsuid(MINUSONE);
        if (setval == oldval) {
            ret = PARAM_0;
        }
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setfsgid", nullptr, Setfsgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setfsuid", nullptr, Setfsuid, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "fsuid1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
