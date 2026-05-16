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
#include "filemanagement/fileio/error_code.h"
#include "filemanagement/file_uri/oh_file_uri.h"
#include <iostream>
#include "native_common.h"
#include "hilog/log.h"
#include <cerrno>
#include <malloc.h>
#include <cstdio>
#include <cstring>
#include <js_native_api_types.h>

static napi_value GetUriFromPath(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/test1.txt";
    unsigned int length = strlen(path);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetUriFromPath(path, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetPathFromUri(napi_env env, napi_callback_info info)
{
    char uri[] = "/data/storage/el2/base/files/test2.txt";
    unsigned int length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetPathFromUri(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetFullDirectoryUri(napi_env env, napi_callback_info info)
{
    char uri[] =
"file://com.acts.storage.fileurindk/data/storage/el2/base/files/test3.txt";
    unsigned int length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFullDirectoryUri(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsValidUri(napi_env env, napi_callback_info info)
{
    char uri[] =
"file://com.acts.storage.fileurindk/data/storage/el2/base/files/test4.txt";
    unsigned int length = strlen(uri);
    bool falgs = OH_FileUri_IsValidUri(uri, length);
    napi_value result = nullptr;
    napi_create_int32(env, falgs, &result);
    return result;
}

static napi_value GetFileName(napi_env env, napi_callback_info info)
{
    char uri[] =
"file://com.acts.storage.fileurindk/data/storage/el2/base/files/test5.txt";
    unsigned int length = strlen(uri);
    char *uriResult = nullptr;
    OH_FileUri_GetFileName(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_string_utf8(env, uriResult, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value IsValidUriInvalid(napi_env env, napi_callback_info info)
{
    char uri[] =
"com.acts.storage.fileurindk/data/storage/el2/base/files/test6.txt";
    unsigned int length = strlen(uri);
    bool falgs = OH_FileUri_IsValidUri(uri, length);
    napi_value result = nullptr;
    napi_create_int32(env, falgs, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "GetUriFromPath", nullptr, GetUriFromPath, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetPathFromUri", nullptr, GetPathFromUri, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFullDirectoryUri", nullptr, GetFullDirectoryUri, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsValidUri", nullptr, IsValidUri, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFileName", nullptr, GetFileName, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsValidUriInvalid", nullptr, IsValidUriInvalid, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "fileuri",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}