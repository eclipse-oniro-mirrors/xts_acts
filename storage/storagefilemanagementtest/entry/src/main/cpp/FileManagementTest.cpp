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
#include <map>
#include <vector>

FileManagement_ErrCode GetErrCodeByName(std::string errCodeName)
{
    std::map<std::string, FileManagement_ErrCode> errCodeMap = {
        {std::string("ERR_OK"), ERR_OK},
        {std::string("ERR_PERMISSION_ERROR"), ERR_PERMISSION_ERROR},
        {std::string("ERR_INVALID_PARAMETER"), ERR_INVALID_PARAMETER},
        {std::string("ERR_DEVICE_NOT_SUPPORTED"), ERR_DEVICE_NOT_SUPPORTED},
        {std::string("ERR_EPERM"), ERR_EPERM},
        {std::string("ERR_ENOENT"), ERR_ENOENT},
        {std::string("ERR_ENOMEM"), ERR_ENOMEM},
        {std::string("ERR_UNKNOWN"), ERR_UNKNOWN},
    };

    auto it = errCodeMap.find(errCodeName);
    if (it != errCodeMap.end()) {
        return it->second;
    }
    return ERR_UNKNOWN;
}

static void AddTestCaseToDescOne(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(DECLARE_NAPI_FUNCTION("FileSharePolicyErrorResultMessage", FileSharePolicyErrorResultMessage));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareRevokePermission", FileShareRevokePermission));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareRevokePermissionErrInvalidParameter",
                                         FileShareRevokePermissionErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareRevokePermissionErrEperm", FileShareRevokePermissionErrEperm));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareActivatePermission", FileShareActivatePermission));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareActivatePermissionErrInvalidParameter",
                                         FileShareActivatePermissionErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareActivatePermissionErrEperm", FileShareActivatePermissionErrEperm));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareDeactivatePermission", FileShareDeactivatePermission));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareDeactivatePermissionErrInvalidParameter",
                                         FileShareDeactivatePermissionErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareDeactivatePermissionErrEperm",
                                         FileShareDeactivatePermissionErrEperm));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareCheckPersistentPermission", FileShareCheckPersistentPermission));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareCheckPersistentPermissionErrInvalidParameter",
                                         FileShareCheckPersistentPermissionErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileShareCheckPersistentPermissionErrEperm",
                                         FileShareCheckPersistentPermissionErrEperm));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriErrCodeErrOk", FileUriErrCodeErrOk));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriErrCodeErrInvalidParameter", FileUriErrCodeErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriErrCodeErrUnknown", FileUriErrCodeErrUnknown));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriErrCodeErrEnoent", FileUriErrCodeErrEnoent));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetPathFromUriErrOk", FileUriGetPathFromUriErrOk));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetPathFromUriErrInvalidParameter",
                                         FileUriGetPathFromUriErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetPathFromUriErrUnknown", FileUriGetPathFromUriErrUnknown));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetFullDirectoryUriErrOk", FileUriGetFullDirectoryUriErrOk));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetFullDirectoryUriErrInvalidParameter",
                                         FileUriGetFullDirectoryUriErrInvalidParameter));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetFileNameErrOk", FileUriGetFileNameErrOk));
    desc.push_back(DECLARE_NAPI_FUNCTION("FileUriGetFileNameErrInvalidParameter",
                                         FileUriGetFileNameErrInvalidParameter));
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        DECLARE_NAPI_FUNCTION("EnvironmentErrCodeErrOK", EnvironmentErrCodeErrOK),
        DECLARE_NAPI_FUNCTION("EnvironmentErrCodeErrInvalidParameter", EnvironmentErrCodeErrInvalidParameter),
        DECLARE_NAPI_FUNCTION("EnvironmentErrCodeErrDeviceNotSupported", EnvironmentErrCodeErrDeviceNotSupported),
        DECLARE_NAPI_FUNCTION("EnvironmentGetUserDownloadDir", EnvironmentGetUserDownloadDir),
        DECLARE_NAPI_FUNCTION("EnvironmentGetUserDesktopDir", EnvironmentGetUserDesktopDir),
        DECLARE_NAPI_FUNCTION("EnvironmentGetUserDocumentDir", EnvironmentGetUserDocumentDir),
        DECLARE_NAPI_FUNCTION("FileIOErrCodeErrOK", FileIOErrCodeErrOK),
        DECLARE_NAPI_FUNCTION("FileIOErrCodeErrEnoent", FileIOErrCodeErrEnoent),
        DECLARE_NAPI_FUNCTION("FileIOErrCodeErrInvalidParameter", FileIOErrCodeErrInvalidParameter),
        DECLARE_NAPI_FUNCTION("FileIOFileLocationLocal", FileIOFileLocationLocal),
        DECLARE_NAPI_FUNCTION("FileIOFileLocationCloud", FileIOFileLocationCloud),
        DECLARE_NAPI_FUNCTION("FileIOFileLocationLocalAndCloud", FileIOFileLocationLocalAndCloud),
        DECLARE_NAPI_FUNCTION("FileIOFileLocation", FileIOFileLocation),
        DECLARE_NAPI_FUNCTION("FileShareErrCodeErrOk", FileShareErrCodeErrOk),
        DECLARE_NAPI_FUNCTION("FileShareErrCodeErrDeviceNotSupport", FileShareErrCodeErrDeviceNotSupport),
        DECLARE_NAPI_FUNCTION("FileShareErrCodeErrEperm", FileShareErrCodeErrEperm),
        DECLARE_NAPI_FUNCTION("FileShareErrCodeErrPermissionError", FileShareErrCodeErrPermissionError),
        DECLARE_NAPI_FUNCTION("FileShareErrCodeErrInvalidParameter", FileShareErrCodeErrInvalidParameter),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorCodePersistenceForbidden",
                              FileSharePolicyErrorCodePersistenceForbidden),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorCodeInvalidMode", FileSharePolicyErrorCodeInvalidMode),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorCodeInvalidPath", FileSharePolicyErrorCodeInvalidPath),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorCodePermissionNotPersisted",
                              FileSharePolicyErrorCodePermissionNotPersisted),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorResultUri", FileSharePolicyErrorResultUri),
        DECLARE_NAPI_FUNCTION("FileSharePolicyErrorResultCode", FileSharePolicyErrorResultCode),
    };

    AddTestCaseToDescOne(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "filemanagement",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }