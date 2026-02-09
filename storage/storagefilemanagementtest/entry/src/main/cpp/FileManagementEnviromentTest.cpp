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
#include "filemanagement/environment/error_code.h"
#include "filemanagement/environment/oh_environment.h"
#include <iostream>

using CommonCallback = FileManagement_ErrCode (*)(char **);

napi_value EnvironmentErrCodeErrOK(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_OK;
    char *downloadPath = nullptr;
    FileManagement_ErrCode ret = OH_Environment_GetUserDownloadDir(&downloadPath);
    if (ret == ERR_OK) {
        free(downloadPath);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value EnvironmentErrCodeErrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_DEVICE_NOT_SUPPORTED;
    char *uri = nullptr;
    FileManagement_ErrCode ret = OH_Environment_GetUserDownloadDir(&uri);
    napi_value result = nullptr;
    if (ret == ERR_OK) {
        free(uri);
    }
    if (ret != errcode && ret != ERR_OK) {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value EnvironmentErrCodeErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_INVALID_PARAMETER;
    FileManagement_ErrCode ret = OH_Environment_GetUserDownloadDir(nullptr);
    napi_value result = nullptr;
    if (ret != errcode) {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    } else {
        napi_create_int32(env, ERR_OK, &result);
    }
    return result;
}

napi_value EnvironmentCommon(napi_env env, napi_callback_info info, CommonCallback callback)
{
    size_t argc = 2;
    napi_value args[2];
    size_t errCodeSize = 0;
    char errCodeName[200] = "";
    bool isValid = false;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], errCodeName, sizeof(errCodeName), &errCodeSize);
    napi_get_value_bool(env, args[1], &isValid);
    FileManagement_ErrCode errcode = GetErrCodeByName(errCodeName);

    char *uri = nullptr;
    FileManagement_ErrCode ret;
    if (isValid) {
        ret = callback(&uri);
    } else {
        ret = callback(nullptr);
    }
    napi_value result = nullptr;
    if (ret == ERR_OK) {
        free(uri);
    }
    napi_create_int32(env, ret, &result);

    return result;
}

napi_value EnvironmentGetUserDownloadDir(napi_env env, napi_callback_info info)
{
    return EnvironmentCommon(env, info, OH_Environment_GetUserDownloadDir);
}

napi_value EnvironmentGetUserDesktopDir(napi_env env, napi_callback_info info)
{
    return EnvironmentCommon(env, info, OH_Environment_GetUserDesktopDir);
}

napi_value EnvironmentGetUserDocumentDir(napi_env env, napi_callback_info info)
{
    return EnvironmentCommon(env, info, OH_Environment_GetUserDocumentDir);
}
