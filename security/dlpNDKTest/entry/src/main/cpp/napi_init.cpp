/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <string>
#include <cstdbool>
#include <cstdint>

#include "DataProtectionKit/dlp_permission_api.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"

static napi_value OsGetDlpPermissionInfoA(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = NO_PERMISSION; //表示DLP文件授权类型
    uint32_t flags = 0; //表示DLP文件的详细操作权限
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result[2] = {nullptr};
        napi_create_int32(env, dlpFileAccess, &result[0]);
        napi_create_int32(env, flags, &result[1]);
        return result[1];
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OsGetOriginalFileNameA(napi_env env, napi_callback_info info)
{
    const char *fileName = "test.txt.dlp"; //表示dlp文件名，用以获取原始文件名
    char *originalFileName = nullptr; //表示原始文件名
    DLP_ErrCode ret = OH_DLP_GetOriginalFileName(fileName, &originalFileName);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_string_utf8(env, originalFileName, NAPI_AUTO_LENGTH, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    free(originalFileName); //处理完后手动释放originalFileName
    return result;
}

static napi_value OsIsInSandboxA(napi_env env, napi_callback_info info)
{
    bool isInSandbox = false; //true 表示当前应用在沙箱中，false 表示应用不在沙箱
    DLP_ErrCode ret = OH_DLP_IsInSandbox(&isInSandbox);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_get_boolean(env, isInSandbox, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OsSetSandboxAppConfigA(napi_env env, napi_callback_info info)
{
    const char *configInfo = "configInfo"; //沙箱应用配置信息，用户可将配置信息json化后传入
    DLP_ErrCode ret = OH_DLP_SetSandboxAppConfig(configInfo);
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OsGetSandboxAppConfigA(napi_env env, napi_callback_info info)
{
    char *configInfo = nullptr; //输出json化后的沙箱应用配置信息
    DLP_ErrCode ret = OH_DLP_GetSandboxAppConfig(&configInfo);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_string_utf8(env, configInfo, NAPI_AUTO_LENGTH, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    free(configInfo); //处理完后手动释放configInfo
    return result;
}

static napi_value OsCleanSandboxAppConfigA(napi_env env, napi_callback_info info)
{
    DLP_ErrCode ret = OH_DLP_CleanSandboxAppConfig();
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"osGetDlpPermissionInfoA", nullptr, OsGetDlpPermissionInfoA, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"osGetOriginalFileNameA", nullptr, OsGetOriginalFileNameA, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"osIsInSandboxA", nullptr, OsIsInSandboxA, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"osSetSandboxAppConfigA", nullptr, OsSetSandboxAppConfigA, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"osGetSandboxAppConfigA", nullptr, OsGetSandboxAppConfigA, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"osCleanSandboxAppConfigA", nullptr, OsCleanSandboxAppConfigA, nullptr,
         nullptr, nullptr, napi_default, nullptr}
    };

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
