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
#include "filemanagement/fileshare/oh_file_share.h"
#include <iostream>
#include "native_common.h"
#include "filemanagement/fileio/error_code.h"
#include "hilog/log.h"
#include <malloc.h>
#include <js_native_api_types.h>

static napi_value FileShare_001(napi_env env, napi_callback_info info)
{
    static const uint32_t POLICY_NUM = 1;
    char path[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test1.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {path, sizeof(path) - 1, FileShare_OperationMode::READ_MODE}};
    FileShare_PolicyErrorResult* result = nullptr;
    uint32_t resultNum = 0;
    auto ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    if (result != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    }
    return result_1;
}

static napi_value FileShare_002(napi_env env, napi_callback_info info)
{
    static const uint32_t POLICY_NUM = 2;
    char path1[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test2.txt";
    char path2[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test201.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {path1, sizeof(path1) - 1, FileShare_OperationMode::READ_MODE},
        {path2, sizeof(path2) - 1, FileShare_OperationMode::WRITE_MODE}};
    FileShare_PolicyErrorResult* result = nullptr;
    uint32_t resultNum = 0;
    auto ret = OH_FileShare_PersistPermission(policy, POLICY_NUM, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    if (result != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    }
    return result_1;
}

static napi_value FileShare_003(napi_env env, napi_callback_info info)
{
    static const uint32_t POLICY_NUM = 1;
    char path[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test3.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {path, sizeof(path) - 1, FileShare_OperationMode::READ_MODE}};
    FileShare_PolicyErrorResult* result = nullptr;
    uint32_t resultNum = 0;
    OH_FileShare_PersistPermission(policy, POLICY_NUM, &result, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    auto ret = OH_FileShare_ActivatePermission(policy, POLICY_NUM, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    if (result != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    }
    return result_1;
}

static napi_value FileShare_004(napi_env env, napi_callback_info info)
{
    static const uint32_t POLICY_NUM = 1;
    char path[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test4.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {path, sizeof(path) - 1, FileShare_OperationMode::READ_MODE}};
    FileShare_PolicyErrorResult* result = nullptr;
    uint32_t resultNum = 0;
    OH_FileShare_PersistPermission(policy, POLICY_NUM, &result, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    OH_FileShare_ActivatePermission(policy, POLICY_NUM, &result, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    auto ret = OH_FileShare_DeactivatePermission(policy, POLICY_NUM, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    if (result != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    }
    return result_1;
}

static napi_value FileShare_005(napi_env env, napi_callback_info info)
{
    static const uint32_t POLICY_NUM = 1;
    char path[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test5.txt";
    FileShare_PolicyInfo policy[POLICY_NUM] = {
        {path, sizeof(path) - 1, FileShare_OperationMode::READ_MODE}};
    FileShare_PolicyErrorResult* result = nullptr;
    uint32_t resultNum = 0;
    OH_FileShare_PersistPermission(policy, POLICY_NUM, &result, &resultNum);
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    auto ret = OH_FileShare_RevokePermission(policy, POLICY_NUM, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    if (result != nullptr) {
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    }
    return result_1;
}

static napi_value FileShare_006(napi_env env, napi_callback_info info)
{
    char policyUriCharA[] =
    "file://com.acts.storage.filesharendk/data/storage/el2/base/files/test6.txt";
    FileShare_PolicyInfo policyA = {.uri = policyUriCharA,
                                    .length = sizeof(policyUriCharA) - 1,
                                    .operationMode =
                                    FileShare_OperationMode::READ_MODE | FileShare_OperationMode::WRITE_MODE};
    FileShare_PolicyInfo policiesA[] = {policyA};
    unsigned int policiesNumA = sizeof(policiesA) / sizeof(policiesA[0]);
    FileShare_PolicyErrorResult *resultPersist = nullptr;
    unsigned int resultPersistNum;
    OH_FileShare_PersistPermission(policiesA, policiesNumA, &resultPersist, &resultPersistNum);
    OH_FileShare_ReleasePolicyErrorResult(resultPersist, resultPersistNum);
    bool *result = nullptr;
    unsigned int resultNum;
    auto ret = OH_FileShare_CheckPersistentPermission(policiesA, policiesNumA, &result, &resultNum);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "FileShare_001", nullptr, FileShare_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "FileShare_002", nullptr, FileShare_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "FileShare_003", nullptr, FileShare_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "FileShare_004", nullptr, FileShare_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "FileShare_005", nullptr, FileShare_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "FileShare_006", nullptr, FileShare_006, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "fileshare",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
