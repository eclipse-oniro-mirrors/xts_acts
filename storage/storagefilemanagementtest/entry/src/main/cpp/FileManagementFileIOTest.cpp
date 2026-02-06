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
#include "filemanagement/fileio/error_code.h"
#include "filemanagement/fileio/oh_fileio.h"
#include <filemanagement/environment/error_code.h>
#include <iostream>

napi_value FileIOErrCodeErrOK(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_OK;
    FileIO_FileLocation location;
    char uri[] = "/storage";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileIOErrCodeErrEnoent(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_ENOENT;
    FileIO_FileLocation location;
    char uri[] = "/storage/TestNoSuchPath";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileIOErrCodeErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_INVALID_PARAMETER;
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(nullptr, 0, nullptr);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileIOFileLocationLocal(napi_env env, napi_callback_info info)
{
    FileIO_FileLocation testLocation = FileIO_FileLocation::LOCAL;
    FileIO_FileLocation location;
    char uri[] = "/storage";
    OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    if (location == testLocation) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    }
    return result;
}

napi_value FileIOFileLocationCloud(napi_env env, napi_callback_info info)
{
    FileIO_FileLocation location = FileIO_FileLocation::CLOUD;
    char uri[] = "/storage";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileIOFileLocationLocalAndCloud(napi_env env, napi_callback_info info)
{
    FileIO_FileLocation location = FileIO_FileLocation::LOCAL_AND_CLOUD;
    char uri[] = "/storage";
    FileManagement_ErrCode ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileIOFileLocation(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    size_t errCodeSize = 0;
    char errCodeName[200] = "";
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], errCodeName, sizeof(errCodeName), &errCodeSize);
    FileManagement_ErrCode errcode = GetErrCodeByName(errCodeName);

    FileIO_FileLocation location;
    FileManagement_ErrCode ret;
    char uri[] = "/storage";
    char invalidUri[] = "../";
    if (errcode == ERR_INVALID_PARAMETER) {
        ret = OH_FileIO_GetFileLocation(nullptr, 0, nullptr);
    } else if (errcode == ERR_ENOENT) {
        ret = OH_FileIO_GetFileLocation(uri, strlen(invalidUri), &location);
    } else {
        ret = OH_FileIO_GetFileLocation(uri, strlen(uri), &location);
    }

    napi_value result = nullptr;
    if (errcode != ret) {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
        return result;
    }
    napi_create_int32(env, ERR_OK, &result);
    return result;
}