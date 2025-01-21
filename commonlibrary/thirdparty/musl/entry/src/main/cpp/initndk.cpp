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
#include <cstdio>
#include <js_native_api.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/pr.h>
#include <malloc.h>
#include <node_api.h>
#include <sys/xattr.h>

#define DEFAULT_VALUE 0
#define BUFSIZ 128
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_5 5
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
extern "C" int init_module(void *module_image, unsigned long len, const char *param_values);

static napi_value InitModule(napi_env env, napi_callback_info info)
{
    void *param;
    int ret = init_module(param, PARAM_5, "0");
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, DEFAULT_VALUE, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"initModule", nullptr, InitModule, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "wchar",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
