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
#include "filemanagement/fileshare/error_code.h"
#include "filemanagement/fileshare/oh_file_share.h"
#include <filemanagement/environment/error_code.h>
#include <iostream>
#include <cstring>

static const uint32_t POLICY_NUM = 2;

napi_value FileShareErrCodeErrOk(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_OK;
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, errcode, &result);
    }
    return result;
}

napi_value FileShareErrCodeErrDeviceNotSupport(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_DEVICE_NOT_SUPPORTED;
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, errcode, &result);
    }
    return result;
}

napi_value FileShareErrCodeErrEperm(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_EPERM;
    char strTestPath1[] = "/storage/test1.txt";
    char strTestPath2[] = "/storage/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {strTestPath1, static_cast<unsigned int>(strlen(strTestPath1)), FileShare_OperationMode::READ_MODE},
        {strTestPath2, static_cast<unsigned int>(strlen(strTestPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value FileShareErrCodeErrPermissionError(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_PERMISSION_ERROR;
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value FileShareErrCodeErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileManagement_ErrCode errcode = ERR_INVALID_PARAMETER;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(nullptr, 0, nullptr, nullptr);
    napi_value result = nullptr;
    if (ret == errcode) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value FileSharePolicyErrorCodePersistenceForbidden(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult policyErrRes = {nullptr, FileShare_PolicyErrorCode::PERSISTENCE_FORBIDDEN, nullptr};
    FileShare_PolicyErrorResult *resPtr = &policyErrRes;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resPtr, &resultNum);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileSharePolicyErrorCodeInvalidMode(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), 0},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), 0}
    };
    FileShare_PolicyErrorResult *policyErrRes = nullptr;
    uint32_t resultNum = 0;
    OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (policyErrRes == nullptr || policyErrRes->code != FileShare_PolicyErrorCode::INVALID_MODE) {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    } else {
        napi_create_int32(env, ERR_OK, &result);
    }
    return result;
}

napi_value FileSharePolicyErrorCodeInvalidPath(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/invalidPath";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/invalidPath";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult *policyErrRes = nullptr;
    uint32_t resultNum = 0;
    OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (policyErrRes == nullptr || policyErrRes->code != FileShare_PolicyErrorCode::INVALID_PATH) {
        napi_create_int32(env, UNEXPECTED_CODE, &result);
    } else {
        napi_create_int32(env, ERR_OK, &result);
    }
    return result;
}

napi_value FileSharePolicyErrorCodePermissionNotPersisted(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult policyErrRes = {nullptr, FileShare_PolicyErrorCode::PERMISSION_NOT_PERSISTED, nullptr};
    FileShare_PolicyErrorResult *resPtr = &policyErrRes;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resPtr, &resultNum);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileSharePolicyErrorResultUri(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult policyErrRes;
    policyErrRes.uri = "file://com.acts.storage.filemanagement/virtualPath";
    FileShare_PolicyErrorResult *resPtr = &policyErrRes;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resPtr, &resultNum);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileSharePolicyErrorResultCode(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult policyErrRes;
    policyErrRes.code = FileShare_PolicyErrorCode::PERMISSION_NOT_PERSISTED;
    FileShare_PolicyErrorResult *resPtr = &policyErrRes;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resPtr, &resultNum);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileSharePolicyErrorResultMessage(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult policyErrRes;
    policyErrRes.message = "Test Message";
    FileShare_PolicyErrorResult *resPtr = &policyErrRes;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resPtr, &resultNum);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileShareRevokePermission(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    napi_value result = nullptr;
    if (ret != ERR_OK) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    ret = OH_FileShare_RevokePermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    napi_create_int32(env, ret, &result);
    if (policyErrRes != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    }
    return result;
}

napi_value FileShareRevokePermissionErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_RevokePermission(nullptr, POLICY_NUM, &policyErrRes, &resultNum);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (policyErrRes != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    }
    return result;
}

napi_value FileShareRevokePermissionErrEperm(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/invalidPath";
    char testPath2[200] = "file://com.acts.storage.filemanagement/invalidPath";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* policyErrRes = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    napi_value result = nullptr;
    ret = OH_FileShare_RevokePermission(policy, POLICY_NUM, &policyErrRes, &resultNum);
    if (ret == ERR_EPERM) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (policyErrRes != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(policyErrRes, resultNum);
    }
    return result;
}

napi_value FileShareActivatePermission(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* errResult = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_value result = nullptr;
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_ActivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_create_int32(env, ret, &result);
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareActivatePermissionErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileShare_PolicyErrorResult* errResult = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_ActivatePermission(nullptr, POLICY_NUM, &errResult, &resultNum);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareActivatePermissionErrEperm(napi_env env, napi_callback_info info)
{
    FileShare_PolicyErrorResult* errResult = nullptr;
    char testPath1[200] = "file://com.acts.storage.filemanagement/invalidPath";
    char testPath2[200] = "file://com.acts.storage.filemanagement/invalidPath";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_value result = nullptr;
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_ActivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    if (ret == ERR_EPERM) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareDeactivatePermission(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* errResult = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_value result = nullptr;
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_ActivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_DeactivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_create_int32(env, ret, &result);
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareDeactivatePermissionErrInvalidParameter(napi_env env, napi_callback_info info)
{
    FileShare_PolicyErrorResult* errResult = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_DeactivatePermission(nullptr, 0, &errResult, &resultNum);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareDeactivatePermissionErrEperm(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/invalidPath";
    char testPath2[200] = "file://com.acts.storage.filemanagement/invalidPath";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult* errResult = nullptr;
    uint32_t resultNum = 0;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &errResult, &resultNum);
    napi_value result = nullptr;
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_ActivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    ret = OH_FileShare_DeactivatePermission(policy, POLICY_NUM, &errResult, &resultNum);
    if (ret == ERR_EPERM) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    if (errResult != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(errResult, resultNum);
    }
    return result;
}

napi_value FileShareCheckPersistentPermission(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test1.txt";
    char testPath2[200] = "file://com.acts.storage.filemanagement/data/storage/el2/base/files/test2.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult *resultPersist = nullptr;
    unsigned int resultPersistNum;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resultPersist, &resultPersistNum);
    OH_FileShare_ReleasePolicyErrorResult(resultPersist, resultPersistNum);
    napi_value result = nullptr;
    bool *checkRresult = nullptr;
    unsigned int resultNum;
    ret = OH_FileShare_CheckPersistentPermission(policy, POLICY_NUM, &checkRresult, &resultNum);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value FileShareCheckPersistentPermissionErrInvalidParameter(napi_env env, napi_callback_info info)
{
    bool *checkRresult = nullptr;
    unsigned int resultNum;
    FileManagement_ErrCode ret = OH_FileShare_CheckPersistentPermission(nullptr, 0, &checkRresult, &resultNum);
    napi_value result = nullptr;
    if (ret == ERR_INVALID_PARAMETER) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}

napi_value FileShareCheckPersistentPermissionErrEperm(napi_env env, napi_callback_info info)
{
    char testPath1[200] = "file://com.acts.storage.filemanagement/invalidPath";
    char testPath2[200] = "file://com.acts.storage.filemanagement/invalidPath";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {testPath1, static_cast<unsigned int>(strlen(testPath1)), FileShare_OperationMode::READ_MODE},
        {testPath2, static_cast<unsigned int>(strlen(testPath2)), FileShare_OperationMode::WRITE_MODE}
    };
    FileShare_PolicyErrorResult *resultPersist = nullptr;
    unsigned int resultPersistNum;
    FileManagement_ErrCode ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &resultPersist, &resultPersistNum);
    OH_FileShare_ReleasePolicyErrorResult(resultPersist, resultPersistNum);
    napi_value result = nullptr;
    bool *checkRresult = nullptr;
    unsigned int resultNum;
    ret = OH_FileShare_CheckPersistentPermission(policy, POLICY_NUM, &checkRresult, &resultNum);
    if (ret == ERR_EPERM) {
        napi_create_int32(env, ERR_OK, &result);
    } else {
        napi_create_int32(env, ret, &result);
    }
    return result;
}