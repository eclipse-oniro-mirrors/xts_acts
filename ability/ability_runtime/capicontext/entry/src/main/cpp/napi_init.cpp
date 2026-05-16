/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "AbilityKit/ability_runtime/context.h"
#include "napi/native_api.h"
#include "hilog/log.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;

static napi_value TestContextGetCacheDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCacheDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCacheDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetCacheDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCacheDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCacheDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetCacheDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCacheDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCacheDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetTempDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetTempDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetTempDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetTempDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetTempDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetTempDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetTempDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetTempDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetTempDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetFilesDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetFilesDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetFilesDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetFilesDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetFilesDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetFilesDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetFilesDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetFilesDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetFilesDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDatabaseDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDatabaseDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDatabaseDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDatabaseDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDatabaseDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDatabaseDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDatabaseDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDatabaseDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDatabaseDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetPreferencesDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetPreferencesDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetPreferencesDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetPreferencesDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetPreferencesDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetPreferencesDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetPreferencesDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetPreferencesDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetPreferencesDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetBundleCodeDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetBundleCodeDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetBundleCodeDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetBundleCodeDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetBundleCodeDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetBundleCodeDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetBundleCodeDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetBundleCodeDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetBundleCodeDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDistributedFilesDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDistributedFilesDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDistributedFilesDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDistributedFilesDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDistributedFilesDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDistributedFilesDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetDistributedFilesDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetDistributedFilesDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetDistributedFilesDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetResourceDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetResourceDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetResourceDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetResourceDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetResourceDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetResourceDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetResourceDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetResourceDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetResourceDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetCloudFileDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCloudFileDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCloudFileDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetCloudFileDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCloudFileDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCloudFileDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetCloudFileDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetCloudFileDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetCloudFileDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetLogFileDir_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetLogFileDir(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetLogFileDir_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetLogFileDir_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetLogFileDir(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetLogFileDir_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetLogFileDir_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetLogFileDir(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetLogFileDir_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetProcessName_NullContext(napi_env env, napi_callback_info info)
{
    char buffer[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetProcessName(nullptr,
        buffer, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetProcessName_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetProcessName_NullBuffer(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetProcessName(context,
        nullptr, BUF_SIZE, &writeLength);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetProcessName_NullBuffer failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetProcessName_NullWriteLength(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    char buffer[BUF_SIZE];
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetProcessName(context,
        buffer, BUF_SIZE, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetProcessName_NullWriteLength failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetAreaMode_NullContext(napi_env env, napi_callback_info info)
{
    AbilityRuntime_AreaMode areaMode = ABILITY_RUNTIME_AREA_MODE_EL1;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetAreaMode(nullptr, &areaMode);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetAreaMode_NullContext failed code: %{public}d", code);
    return result;
}

static napi_value TestContextGetAreaMode_NullAreaMode(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_GetAreaMode(context, nullptr);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextGetAreaMode_NullAreaMode failed code: %{public}d", code);
    return result;
}

static napi_value TestContextSetAreaMode_NullContext(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode code = OH_AbilityRuntime_Context_SetAreaMode(nullptr,
        ABILITY_RUNTIME_AREA_MODE_EL1);
    if (code == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    OH_LOG_ERROR(LOG_APP, "TestContextSetAreaMode_NullContext failed code: %{public}d", code);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testContextGetCacheDir_NullContext", nullptr, TestContextGetCacheDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetCacheDir_NullBuffer", nullptr, TestContextGetCacheDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetCacheDir_NullWriteLength", nullptr, TestContextGetCacheDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetTempDir_NullContext", nullptr, TestContextGetTempDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetTempDir_NullBuffer", nullptr, TestContextGetTempDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetTempDir_NullWriteLength", nullptr, TestContextGetTempDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetFilesDir_NullContext", nullptr, TestContextGetFilesDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetFilesDir_NullBuffer", nullptr, TestContextGetFilesDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetFilesDir_NullWriteLength", nullptr, TestContextGetFilesDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDatabaseDir_NullContext", nullptr, TestContextGetDatabaseDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDatabaseDir_NullBuffer", nullptr, TestContextGetDatabaseDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDatabaseDir_NullWriteLength", nullptr, TestContextGetDatabaseDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetPreferencesDir_NullContext", nullptr, TestContextGetPreferencesDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetPreferencesDir_NullBuffer", nullptr, TestContextGetPreferencesDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetPreferencesDir_NullWriteLength", nullptr, TestContextGetPreferencesDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetBundleCodeDir_NullContext", nullptr, TestContextGetBundleCodeDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetBundleCodeDir_NullBuffer", nullptr, TestContextGetBundleCodeDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetBundleCodeDir_NullWriteLength", nullptr, TestContextGetBundleCodeDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDistributedFilesDir_NullContext", nullptr, TestContextGetDistributedFilesDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDistributedFilesDir_NullBuffer", nullptr, TestContextGetDistributedFilesDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetDistributedFilesDir_NullWriteLength", nullptr,
            TestContextGetDistributedFilesDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetResourceDir_NullContext", nullptr, TestContextGetResourceDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetResourceDir_NullBuffer", nullptr, TestContextGetResourceDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetResourceDir_NullWriteLength", nullptr, TestContextGetResourceDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetCloudFileDir_NullContext", nullptr, TestContextGetCloudFileDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetCloudFileDir_NullBuffer", nullptr, TestContextGetCloudFileDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetCloudFileDir_NullWriteLength", nullptr, TestContextGetCloudFileDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetLogFileDir_NullContext", nullptr, TestContextGetLogFileDir_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetLogFileDir_NullBuffer", nullptr, TestContextGetLogFileDir_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetLogFileDir_NullWriteLength", nullptr, TestContextGetLogFileDir_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetProcessName_NullContext", nullptr, TestContextGetProcessName_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetProcessName_NullBuffer", nullptr, TestContextGetProcessName_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetProcessName_NullWriteLength", nullptr, TestContextGetProcessName_NullWriteLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetAreaMode_NullContext", nullptr, TestContextGetAreaMode_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextGetAreaMode_NullAreaMode", nullptr, TestContextGetAreaMode_NullAreaMode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testContextSetAreaMode_NullContext", nullptr, TestContextSetAreaMode_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
