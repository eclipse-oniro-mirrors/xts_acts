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
#include "NativeDisplayManagerTest.h"
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>

namespace NativeDisplayManagerTest {
int32_t g_displayId = -1;

napi_value GetDisplayId(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetDisplayId env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetDisplayId napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    napi_get_value_int32(env, args[0], &g_displayId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetDisplayId: %{public}d", g_displayId);
    return nullptr;
}

napi_value GetDisplaySourceMode001(napi_env env, napi_callback_info info)
{
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
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

napi_value GetDisplaySourceMode002(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(0, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

napi_value GetDisplaySourceMode003(napi_env env, napi_callback_info info)
{
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
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

napi_value GetDisplaySourceMode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t index = -1;
    napi_get_value_int32(env, args[0], &index);
    if (index >= PARAM_5 || index < PARAM_0) {
        napi_throw_type_error(env, NULL, "Wrong arguments");
        return nullptr;
    }
    NativeDisplayManager_SourceMode displaySourceMode = NativeDisplayManager_SourceMode(index);
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_GetDisplaySourceMode(g_displayId, &displaySourceMode);
    result = result == DISPLAY_MANAGER_OK ? DISPLAY_MANAGER_OK : result;
    result = result == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? DISPLAY_MANAGER_OK : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DisplaySourceMode000",
                 "GetDisplaySourceMode: %{public}d result: %{public}d", displaySourceMode, result);
    napi_create_int32(env, result == DISPLAY_MANAGER_OK, &retValue);
    return retValue;
}

napi_value IsFoldable(napi_env env, napi_callback_info info)
{
    bool isFoldDevice = OH_NativeDisplayManager_IsFoldable();
    OH_LOG_INFO(LOG_APP, "IsFoldable isFoldDevice =%{public}d.", isFoldDevice);
    napi_value isFold;
    napi_get_boolean(env, isFoldDevice, &isFold);
    return isFold;
}

napi_value GetFoldDisplayMode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t index = -1;
    napi_get_value_int32(env, args[0], &index);
    if (index >= PARAM_5 || index < PARAM_0) {
        napi_throw_type_error(env, NULL, "Wrong arguments");
        return nullptr;
    }
    NativeDisplayManager_FoldDisplayMode displayMode = NativeDisplayManager_FoldDisplayMode(index);
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_GetFoldDisplayMode(&displayMode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DisplayMode000",
                 "GetFoldDisplayMode: %{public}d result: %{public}d", displayMode, result);
    napi_create_int32(env, result == DISPLAY_MANAGER_OK ? DISPLAY_MANAGER_OK : result, &retValue);
    return retValue;
}

}; // namespace NativeDisplayManagerTest
