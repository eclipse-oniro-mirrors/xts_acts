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

#include <cerrno>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <sys/mman.h>
#define ERROR 0
#define SUCCESS 1
#define PARAM_1 1

static napi_value PosixMadvise(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    errno = ERROR;
    size_t size = PARAM_1;
    void *param = nullptr;
    int returnValue = posix_madvise(param, size, PARAM_1);
    if (errno == ERROR) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"posixMadvise", nullptr, PosixMadvise, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libsysmmanndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
