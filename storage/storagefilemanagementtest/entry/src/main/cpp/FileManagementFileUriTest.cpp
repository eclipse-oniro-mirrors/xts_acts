/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "FileManagementTest.h"
#include "filemanagement/file_uri/error_code.h"
#include "filemanagement/file_uri/oh_file_uri.h"
#include <filemanagement/environment/error_code.h>

napi_value FileUriErrCodeErrOk(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_OK;
    char testPath[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    size_t length = strlen(testPath);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetUriFromPath(testPath, length, &uriResult);
    napi_value result = nullptr;
    if (errcode == ret) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value FileUriErrCodeErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_INVALID_PARAMETER;
    FileManagement_ErrCode ret = OH_FileUri_GetUriFromPath(nullptr, 0, nullptr);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriErrCodeErrUnknown(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_UNKNOWN;
    char testPath[200] = "../";
    size_t length = strlen(testPath);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetUriFromPath(testPath, length, &uriResult);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriErrCodeErrEnoent(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_ENOENT;
    char uri[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/../test1.txt";
    size_t length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFullDirectoryUri(uri, length, &uriResult);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriGetPathFromUriErrOk(napi_env env, napi_callback_info info)
{
    char uri[200] = "/data/storage/el2/base/files/test1.txt";
    size_t length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetPathFromUri(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileUriGetPathFromUriErrInvalidParameter(napi_env env, napi_callback_info info)
{
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetPathFromUri(nullptr, 0, &uriResult);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriGetPathFromUriErrUnknown(napi_env env, napi_callback_info info)
{
    char uri[200] = "../";
    size_t length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetPathFromUri(uri, length, &uriResult);
    napi_value result = nullptr;
    if (ret == ERR_UNKNOWN) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriGetFullDirectoryUriErrOk(napi_env env, napi_callback_info info)
{
    char uri[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    size_t length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFullDirectoryUri(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileUriGetFullDirectoryUriErrInvalidParameter(napi_env env, napi_callback_info info)
{
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFullDirectoryUri(nullptr, 0, &uriResult);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileUriGetFileNameErrOk(napi_env env, napi_callback_info info)
{
    char uri[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    size_t length = strlen(uri);
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFileName(uri, length, &uriResult);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileUriGetFileNameErrInvalidParameter(napi_env env, napi_callback_info info)
{
    char *uriResult = nullptr;
    FileManagement_ErrCode ret = OH_FileUri_GetFileName(nullptr, 0, &uriResult);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}