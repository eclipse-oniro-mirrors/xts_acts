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
#ifndef FILE_MANAGEMENT_TEST_H
#define FILE_MANAGEMENT_TEST_H

#include "napi/native_api.h"
#include "native_common.h"
#include <js_native_api_types.h>
#include "filemanagement/environment/error_code.h"
#include <string>

FileManagement_ErrCode GetErrCodeByName(std::string errCodeName);
const int32_t UNEXPECTED_CODE = -1;

napi_value EnvironmentErrCodeErrOK(napi_env env, napi_callback_info info);
napi_value EnvironmentErrCodeErrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value EnvironmentErrCodeErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value EnvironmentGetUserDownloadDir(napi_env env, napi_callback_info info);
napi_value EnvironmentGetUserDesktopDir(napi_env env, napi_callback_info info);
napi_value EnvironmentGetUserDocumentDir(napi_env env, napi_callback_info info);
napi_value FileIOErrCodeErrOK(napi_env env, napi_callback_info info);
napi_value FileIOErrCodeErrEnoent(napi_env env, napi_callback_info info);
napi_value FileIOErrCodeErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileIOFileLocationLocal(napi_env env, napi_callback_info info);
napi_value FileIOFileLocationCloud(napi_env env, napi_callback_info info);
napi_value FileIOFileLocationLocalAndCloud(napi_env env, napi_callback_info info);
napi_value FileIOFileLocation(napi_env env, napi_callback_info info);
napi_value FileShareErrCodeErrOk(napi_env env, napi_callback_info info);
napi_value FileShareErrCodeErrDeviceNotSupport(napi_env env, napi_callback_info info);
napi_value FileShareErrCodeErrEperm(napi_env env, napi_callback_info info);
napi_value FileShareErrCodeErrPermissionError(napi_env env, napi_callback_info info);
napi_value FileShareErrCodeErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorCodePersistenceForbidden(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorCodeInvalidMode(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorCodeInvalidPath(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorCodePermissionNotPersisted(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorResultUri(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorResultCode(napi_env env, napi_callback_info info);
napi_value FileSharePolicyErrorResultMessage(napi_env env, napi_callback_info info);
napi_value FileShareRevokePermission(napi_env env, napi_callback_info info);
napi_value FileShareRevokePermissionErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileShareRevokePermissionErrEperm(napi_env env, napi_callback_info info);
napi_value FileShareActivatePermission(napi_env env, napi_callback_info info);
napi_value FileShareActivatePermissionErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileShareActivatePermissionErrEperm(napi_env env, napi_callback_info info);
napi_value FileShareDeactivatePermission(napi_env env, napi_callback_info info);
napi_value FileShareDeactivatePermissionErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileShareDeactivatePermissionErrEperm(napi_env env, napi_callback_info info);
napi_value FileShareCheckPersistentPermission(napi_env env, napi_callback_info info);
napi_value FileShareCheckPersistentPermissionErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileShareCheckPersistentPermissionErrEperm(napi_env env, napi_callback_info info);
napi_value FileUriErrCodeErrOk(napi_env env, napi_callback_info info);
napi_value FileUriErrCodeErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileUriErrCodeErrUnknown(napi_env env, napi_callback_info info);
napi_value FileUriErrCodeErrEnoent(napi_env env, napi_callback_info info);
napi_value FileUriGetPathFromUriErrOk(napi_env env, napi_callback_info info);
napi_value FileUriGetPathFromUriErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileUriGetPathFromUriErrUnknown(napi_env env, napi_callback_info info);
napi_value FileUriGetFullDirectoryUriErrOk(napi_env env, napi_callback_info info);
napi_value FileUriGetFullDirectoryUriErrInvalidParameter(napi_env env, napi_callback_info info);
napi_value FileUriGetFileNameErrOk(napi_env env, napi_callback_info info);
napi_value FileUriGetFileNameErrInvalidParameter(napi_env env, napi_callback_info info);

#endif