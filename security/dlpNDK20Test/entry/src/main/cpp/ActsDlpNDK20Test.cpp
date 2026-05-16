/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "DataProtectionKit/dlp_permission_api.h"
#include "napi/native_api.h"
#include <cstdint>
#include <cstdlib>

static napi_value OsGetDlpPermissionInfo0100(napi_env env, napi_callback_info info)
{
    DLP_FileAccess *dlpFileAccess = NULL;
    uint32_t flags = NULL;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetDlpPermissionInfo0101(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = NO_PERMISSION;
    uint32_t flags = 0;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetDlpPermissionInfo0102(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = READ_ONLY;
    uint32_t flags = 0x00000001;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetDlpPermissionInfo0103(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = CONTENT_EDIT;
    uint32_t flags = 0;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetDlpPermissionInfo0104(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = FULL_CONTROL;
    uint32_t flags = 0;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetDlpPermissionInfo0105(napi_env env, napi_callback_info info)
{
    DLP_FileAccess *dlpFileAccess = NULL;
    uint32_t flags = NULL;
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OsGetOriginalFileName0100(napi_env env, napi_callback_info info)
{
    const char *fileName = "test.txt";
    char *originalFileName = nullptr;
    DLP_ErrCode ret = OH_DLP_GetOriginalFileName(fileName, &originalFileName);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_string_utf8(env, originalFileName, NAPI_AUTO_LENGTH, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    free(originalFileName);
    return result;
}
static napi_value OsSetSandboxAppConfig0100(napi_env env, napi_callback_info info)
{
    const char *configInfo = nullptr;
    DLP_ErrCode ret = OH_DLP_SetSandboxAppConfig(configInfo);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_get_boolean(env, ret, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OsGetDlpPermissionInfo0100", nullptr, OsGetDlpPermissionInfo0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetDlpPermissionInfo0101", nullptr, OsGetDlpPermissionInfo0101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetDlpPermissionInfo0102", nullptr, OsGetDlpPermissionInfo0102, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetDlpPermissionInfo0103", nullptr, OsGetDlpPermissionInfo0103, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetDlpPermissionInfo0104", nullptr, OsGetDlpPermissionInfo0104, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetDlpPermissionInfo0105", nullptr, OsGetDlpPermissionInfo0105, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsGetOriginalFileName0100", nullptr, OsGetOriginalFileName0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OsSetSandboxAppConfig0100", nullptr, OsSetSandboxAppConfig0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "osaccountndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
