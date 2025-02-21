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

#include <cstdio>
#include <cstring>

#include "napi/native_api.h"
#include "AbilityKit/ability_runtime/ability_runtime_common.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "AbilityKit/ability_runtime/context_constant.h"
#include "hilog/log.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;

static void Throw(napi_env env, int32_t errCode, const char *errMsg)
{
    napi_value code;
    napi_create_int32(env, errCode, &code);

    napi_value msg = nullptr;
    if (errMsg != nullptr) {
        napi_create_string_utf8(env, errMsg, strlen(errMsg), &msg);
    } else {
        napi_create_string_utf8(env, "", 0, &msg);
    }

    napi_value error;
    napi_create_error(env, code, msg, &error);
    napi_throw(env, error);
}

static napi_value GetBundleName(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "error %{public}d", code);
        Throw(env, code, "");
        return nullptr;
    }
    OH_LOG_DEBUG(LOG_APP, "result: %{public}s", buffer);
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value GetCacheDir(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "error %{public}d", code);
        Throw(env, code, "");
        return nullptr;
    }
    OH_LOG_DEBUG(LOG_APP, "result: %{public}s", buffer);
    napi_value result;
    napi_create_string_utf8(env, buffer, writeLength, &result);
    return result;
}

static napi_value GetAreaMode(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode mode = ABILITY_RUNTIME_AREA_MODE_EL1;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetAreaMode(&mode);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "error %{public}d", code);
        Throw(env, code, "");
        return nullptr;
    }
    OH_LOG_DEBUG(LOG_APP, "result: %{public}d", mode);
    napi_value result;
    napi_create_int32(env, mode, &result);
    return result;
}

static napi_value TestGetBundleName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valueType;
    napi_typeof(env, args[0], &valueType);
    if (valueType != napi_string) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "args[0] is not string");
        return result;
    }

    char realBundleName[BUF_SIZE];
    size_t realBundleNameLen = 0;
    napi_get_value_string_utf8(env, args[0], realBundleName, BUF_SIZE, &realBundleNameLen);
    if (realBundleNameLen == 0) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "input is empty");
        return result;
    }

    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    int32_t testId = 0;

    testId++;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetBundleName(NULL, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(nullptr, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, BUF_SIZE, NULL);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, BUF_SIZE, nullptr);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, -1, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, 0, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, realBundleNameLen, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(buffer, realBundleNameLen + 1, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (strcmp(buffer, realBundleName) != 0) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed result is wrong: %{public}s != %{public}s", testId, buffer,
                     realBundleName);
        return result;
    }

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestGetCacheDir(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valueType;
    napi_typeof(env, args[0], &valueType);
    if (valueType != napi_string) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "args[0] is not string");
        return result;
    }

    char realCacheDir[BUF_SIZE];
    size_t realCacheDirLen = 0;
    napi_get_value_string_utf8(env, args[0], realCacheDir, BUF_SIZE, &realCacheDirLen);
    if (realCacheDirLen == 0) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "input is empty");
        return result;
    }

    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    int32_t testId = 0;

    testId++;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetCacheDir(NULL, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(nullptr, BUF_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, BUF_SIZE, NULL);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, BUF_SIZE, nullptr);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, -1, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, 0, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, realCacheDirLen, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetCacheDir(buffer, realCacheDirLen + 1, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (strcmp(buffer, realCacheDir) != 0) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed result is wrong: %{public}s != %{public}s", testId, buffer,
                     realCacheDir);
        return result;
    }

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestGetAreaMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valueType;
    napi_typeof(env, args[0], &valueType);
    if (valueType != napi_number) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "args[0] is not number");
        return result;
    }

    int32_t realAreaMode = -1;
    napi_get_value_int32(env, args[0], &realAreaMode);
    if (realAreaMode == -1) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        OH_LOG_ERROR(LOG_APP, "input is invalid");
        return result;
    }

    AbilityRuntime_AreaMode mode = ABILITY_RUNTIME_AREA_MODE_EL1;
    int32_t testId = 0;

    testId++;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_ApplicationContextGetAreaMode(NULL);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetAreaMode(nullptr);
    if (code != ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }

    testId++;
    code = OH_AbilityRuntime_ApplicationContextGetAreaMode(&mode);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (realAreaMode != mode) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed result is wrong: %{public}d != %{public}d", testId, mode,
                     realAreaMode);
        return result;
    }

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getBundleName", nullptr, GetBundleName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCacheDir", nullptr, GetCacheDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAreaMode", nullptr, GetAreaMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetBundleName", nullptr, TestGetBundleName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetCacheDir", nullptr, TestGetCacheDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetAreaMode", nullptr, TestGetAreaMode, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};
} // namespace

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
