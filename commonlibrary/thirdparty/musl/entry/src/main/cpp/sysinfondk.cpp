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
#include <netdb.h>
#include <sys/sysinfo.h>
#define SUCCESS 1
#define FAIL (-1)
#define NOERROR (-1)

napi_value GetPhysPages(napi_env env, napi_callback_info info)
{

    long phys_pages = get_phys_pages();
    int ret = FAIL;
    if (phys_pages >= NOERROR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value GetNprocsConf(napi_env env, napi_callback_info info)
{

    int nprocs_conf = get_nprocs_conf();
    int ret = FAIL;
    if (nprocs_conf > NOERROR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value GetNprocs(napi_env env, napi_callback_info info)
{

    int nprocs = get_nprocs();
    int ret = FAIL;
    if (nprocs > NOERROR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value GetAvphysPages(napi_env env, napi_callback_info info)
{

    long avail_phys_pages = get_avphys_pages();
    int ret = FAIL;
    if (avail_phys_pages > NOERROR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getPhysPages", nullptr, GetPhysPages, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNprocsConf", nullptr, GetNprocsConf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNprocs", nullptr, GetNprocs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAvphysPages", nullptr, GetAvphysPages, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "time",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }