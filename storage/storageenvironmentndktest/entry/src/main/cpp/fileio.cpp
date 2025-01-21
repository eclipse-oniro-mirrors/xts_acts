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
#include "oh_fileio.h"
#include "error_code.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include <cstring.h>

static napi_value GetFileLocation(napi_env env, napi_callback_info info)
{
    FileIO_FileLocation location;
    char uri[] = "file://com.acts.storage.environmentndk/data/storage/el2/base\
/haps/com.acts.storage.environmentndk/files/fileio_location.txt";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetFileLocation_noexist(napi_env env, napi_callback_info info)
{
    FileIO_FileLocation location;
    char uri[] = "file://docs/storage/Users/currentUser/fileio_location1.txt";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetFileLocation", nullptr, GetFileLocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetFileLocation_noexist", nullptr, GetFileLocation_noexist, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libfileio",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }