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
#include "NativeDisplayManagerErrorCodeTest.h"
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
namespace NativeDisplayManagerErrorCodeTest {

napi_value DisplayManagerErrorCode401(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_ErrorCode errorCodeData = DISPLAY_MANAGER_ERROR_INVALID_PARAM;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int64_t displayId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int64(env, args[0], &displayId);
    OH_LOG_INFO(LOG_APP, "displayId =%{public}d.", displayId);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayId(nullptr);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode == errorCodeData ? errorCodeData : errCode, &result);
    return result;
}

napi_value DisplayManagerErrorCode801(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_ErrorCode errorCodeData = DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int64_t displayId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int64(env, args[0], &displayId);
    OH_LOG_INFO(LOG_APP, "displayId =%{public}d.", displayId);
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode =
        OH_NativeDisplayManager_GetDisplaySourceMode(displayId, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode == errorCodeData ? errorCodeData : errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

napi_value DisplayManagerErrorCode1400001(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_ErrorCode errorCodeData = DISPLAY_MANAGER_ERROR_INVALID_SCREEN;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int64_t displayId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int64(env, args[0], &displayId);
    OH_LOG_INFO(LOG_APP, "displayId =%{public}d.", displayId);
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode =
        OH_NativeDisplayManager_GetDisplaySourceMode(displayId, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode == errorCodeData ? errorCodeData : errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

napi_value DisplayManagerErrorCode1400003(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_ErrorCode errorCodeData = DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL;
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(9999, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode == errorCodeData ? errorCodeData : errCode, &errorCode);
    return errorCode;
}

napi_value DisplayManagerErrorCode1400004(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_ErrorCode errorCodeData = DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM;
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(-1, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode == errorCodeData ? errorCodeData : errCode, &errorCode);
    return errorCode;
}

};