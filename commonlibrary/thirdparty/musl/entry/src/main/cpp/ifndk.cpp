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
#include <cerrno>
#include <cstdio>
#include <js_native_api.h>
#include <malloc.h>
#include <net/if.h>
#include <node_api.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)

static napi_value IfFreeNameIndex(napi_env env, napi_callback_info info)
{
    struct if_nameindex *ni;
    ni = if_nameindex();
    napi_value result = nullptr;
    if_freenameindex(ni);
    napi_create_int32(env, NO_ERR, &result);
    return result;
}

static napi_value IfNameIndex(napi_env env, napi_callback_info info)
{
    struct if_nameindex *ni;
    ni = if_nameindex();
    napi_value result = nullptr;
    if (ni != nullptr) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if_freenameindex(ni);
    return result;
}

static napi_value IfIndexToName(napi_env env, napi_callback_info info)
{
    char *name = nullptr;
    char index[BUFSIZ] = "Ethernet HWaddr 00:21:5A:44:C8:02";
    errno = NO_ERR;
    unsigned int i = if_nametoindex(index);
    name = if_indextoname(i, index);
    napi_value result = nullptr;
    if (name != nullptr) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value IfNameToIndex(napi_env env, napi_callback_info info)
{
    unsigned int i = if_nametoindex("lan0");
    napi_value result = nullptr;
    if (i != NO_ERR) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ifFreeNameIndex", nullptr, IfFreeNameIndex, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ifNameIndex", nullptr, IfNameIndex, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ifIndexToName", nullptr, IfIndexToName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ifNameToIndex", nullptr, IfNameToIndex, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "if",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
