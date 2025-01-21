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
#include <dirent.h>
#include <dlfcn.h>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <cerrno>

#define INIT (-1)
#define SUCCESS 0

static napi_value DlSym(napi_env env, napi_callback_info info)
{
    const char *path = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    void *ptr = dlopen(path, RTLD_LAZY);
    errno = 0;
    dlsym(ptr, "OHOS_EXTENSION_GetExtensionModule");
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"dlsym", nullptr, DlSym, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libdlfcnndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
