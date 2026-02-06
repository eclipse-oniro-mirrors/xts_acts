/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstring>

#include "napi/native_api.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "AbilityKit/ability_runtime/start_options.h"
#include "hilog/log.h"

static napi_value GetResourceDir(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, &moduleNameLength);

    const int32_t bufferSize = 1024;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        buffer, bufferSize, &writeLength);

    napi_value resultArray;
    size_t resultArrayLength = 2;
    napi_create_array_with_length(env, resultArrayLength, &resultArray);

    napi_value retValue;
    napi_create_int32(env, code, &retValue);
    napi_set_element(env, resultArray, 0, retValue);

    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    napi_set_element(env, resultArray, 1, result);

    return resultArray;
}

static napi_value ErrorBufferNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, &moduleNameLength);

    const int32_t bufferSize = 1024;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        nullptr, bufferSize, &writeLength);

    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value ErrorWritelengthNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, nullptr);

    const int32_t bufferSize = 1024;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        buffer, bufferSize, nullptr);

    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value ErrorBuffersizeLess(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, &moduleNameLength);

    const int32_t bufferSize = 1;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        buffer, bufferSize, &writeLength);

    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value BuffersizeLarger(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, &moduleNameLength);

    const int32_t bufferSize = 49;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        buffer, bufferSize, &writeLength);

    napi_value resultArray;
    size_t resultArrayLength = 2;
    napi_create_array_with_length(env, resultArrayLength, &resultArray);

    napi_value retValue;
    napi_create_int32(env, code, &retValue);
    napi_set_element(env, resultArray, 0, retValue);

    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    napi_set_element(env, resultArray, 1, result);

    return resultArray;
}

static napi_value BuffersizeEquals(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_value thisArg;
    void* data;

    napi_get_cb_info(env, info, &argc, argv, &thisArg, &data);

    size_t moduleNameLength;
    char moduleName[256] = {0};
    napi_get_value_string_utf8(env, argv[0], moduleName, sizeof(moduleName) - 1, &moduleNameLength);

    const int32_t bufferSize = 48;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(moduleName,
        buffer, bufferSize, &writeLength);

    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value ErrorModuleNameNull(napi_env env, napi_callback_info info)
{
    const int32_t bufferSize = 1024;
    char buffer[bufferSize] = {0};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetResourceDir(nullptr,
        buffer, bufferSize, &writeLength);

    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getResourceDir", nullptr, GetResourceDir, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "error_buffer_null", nullptr, ErrorBufferNull, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "error_writelength_null", nullptr, ErrorWritelengthNull, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "error_buffersize_less", nullptr, ErrorBuffersizeLess, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "buffersize_larger", nullptr, BuffersizeLarger, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "buffersize_equals", nullptr, BuffersizeEquals, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "error_moduleName_null", nullptr, ErrorModuleNameNull, nullptr, nullptr, nullptr, napi_default, nullptr }
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
