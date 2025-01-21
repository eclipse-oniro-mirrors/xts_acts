 /*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "native_common.h"
#include <environment.h>
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>

static napi_value GetUserDownloadDir(napi_env env, napi_callback_info info)
{
    char *downloadPath = nullptr;
    int ret = OH_Environment_GetUserDownloadDir(&downloadPath);
    if (ret == 0) {
        free(downloadPath);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetUserDesktopDir(napi_env env, napi_callback_info info)
{
    char *desktopPath = nullptr;
    int ret = OH_Environment_GetUserDesktopDir(&desktopPath);
    if (ret == 0) {
        free(desktopPath);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetUserDocumentDir(napi_env env, napi_callback_info info)
{
    char *documentPath = nullptr;
    int ret = OH_Environment_GetUserDocumentDir(&documentPath);
    if (ret == 0) {
        free(documentPath);
    } 
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getUserDownloadDir", nullptr, GetUserDownloadDir, nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"getUserDesktopDir", nullptr, GetUserDesktopDir, nullptr, nullptr, nullptr, napi_default, nullptr},      
        {"getUserDocumentDir", nullptr, GetUserDocumentDir, nullptr, nullptr, nullptr, napi_default, nullptr}, 
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
    .nm_modname = "libenvironment",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }