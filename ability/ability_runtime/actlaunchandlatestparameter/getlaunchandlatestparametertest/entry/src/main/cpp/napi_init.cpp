/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include <string>
#include <hilog/log.h>

static napi_value GetLaunchParameter(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLaunchParameter(buffer, bufferSize, &writeLength);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 失败处理
    }
    OH_LOG_INFO(LOG_APP, "GetLaunchParameter:%{public}s.", buffer);
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value GetLatestParameter(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLatestParameter(buffer, bufferSize, &writeLength);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 失败处理
    }
    OH_LOG_INFO(LOG_APP, "GetLatestParameter:%{public}s.", buffer);
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}


static napi_value Error_GetLaunchParameter_buffer_null(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLaunchParameter(nullptr, bufferSize, &writeLength);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    if (ret == ABILITY_RUNTIME_ERROR_CODE_CONTEXT_NOT_EXIST) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, nullptr, writeLength, &result);
    return result;
}

static napi_value Error_GetLaunchParameter_writelength_null(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLaunchParameter(buffer, bufferSize, nullptr);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value Error_GetLaunchParameter_buffersize_less(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 1;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLaunchParameter(buffer, bufferSize, &writeLength);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value Error_GetLatestParameter_buffer_null(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLatestParameter(nullptr, bufferSize, &writeLength);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, nullptr, writeLength, &result);
    return result;
}

static napi_value Error_GetLatestParameter_writelength_null(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 2048;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLatestParameter(buffer, bufferSize, nullptr);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value Error_GetLatestParameter_buffersize_less(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 1;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    int32_t ret = OH_AbilityRuntime_ApplicationContextGetLatestParameter(buffer, bufferSize, &writeLength);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    if (ret == ABILITY_RUNTIME_ERROR_CODE_CONTEXT_NOT_EXIST) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        // 如果调用失败或者没有数据，返回空字符串
        std::string errStr = "errcode:" + std::to_string(ret);
        napi_value emptyStr;
        napi_create_string_utf8(env, errStr.c_str(), NAPI_AUTO_LENGTH, &emptyStr);
        return emptyStr;
    }
    
    // 创建 JS 字符串返回
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getLaunchParameter", nullptr, GetLaunchParameter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getLatestParameter", nullptr, GetLatestParameter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Error_GetLaunchParameter_buffer_null", nullptr, Error_GetLaunchParameter_buffer_null, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "Error_GetLaunchParameter_writelength_null", nullptr, Error_GetLaunchParameter_writelength_null, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "Error_GetLaunchParameter_buffersize_less", nullptr, Error_GetLaunchParameter_buffersize_less, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "Error_GetLatestParameter_buffer_null", nullptr, Error_GetLatestParameter_buffer_null, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "Error_GetLatestParameter_writelength_null", nullptr, Error_GetLatestParameter_writelength_null, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "Error_GetLatestParameter_buffersize_less", nullptr, Error_GetLatestParameter_buffersize_less,
            nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
