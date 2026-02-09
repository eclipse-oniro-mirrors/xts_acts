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
#include "DisplayManagerTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
#include <js_native_api_types.h>
#include "common/Common.h"
#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <hilog/log.h>
namespace DisplayManager {

napi_value GetDefaultDisplayId(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayId(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayWidth(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayWidth(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayHeight(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayHeight(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayRotation(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_Rotation displayRotation;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayRotation(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayOrientation(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_Orientation displayOrientation;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayOrientation(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayVirtualPixelRatio(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dmVirtualPixels;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayRefreshRate(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t dmRefreshRate;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayRefreshRate(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayDensityDpi(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t dmDensityDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityDpi(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayDensityPixels(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dmDensityPixels;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityPixels(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayScaledDensity(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dmScaledDensity;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayScaledDensity(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayDensityXdpi(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dmxDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDefaultDisplayDensityYdpi(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dmyDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value CreateDefaultDisplayCutoutInfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_CutoutInfo *cutOutInfo = NULL;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value DestroyDefaultDisplayCutoutInfoSuccess(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "ArkData", "=======zh  OH_RdbTrans_Insert errCode = %{public}d", 1);
    napi_value result;
    NativeDisplayManager_CutoutInfo *cutOutInfo = NULL;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo(&cutOutInfo);
    errCode = OH_NativeDisplayManager_DestroyDefaultDisplayCutoutInfo(cutOutInfo);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_OK ? 0 : -1, &result);
    return result;
}

napi_value DestroyDefaultDisplayCutoutInfoError(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_CutoutInfo *cutOutInfo = NULL;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo(&cutOutInfo);
    errCode = OH_NativeDisplayManager_DestroyDefaultDisplayCutoutInfo(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetFoldDisplayMode(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_FoldDisplayMode displayMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetFoldDisplayMode(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

void DisplayChangeCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayChangeCallback displayId=%{public}lu.", displayId);
}

napi_value RegisterDisplayChangeListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterDisplayChangeListener(
        DisplayChangeCallback, NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value UnRegisterDisplayChangeListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex;
    OH_NativeDisplayManager_RegisterDisplayChangeListener(
        DisplayChangeCallback, &listenerIndex);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayChangeListener(listenerIndex);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_OK ? 0 : -1, &result);
    return result;
}

void FoldDisplayModeChangeCallback(NativeDisplayManager_FoldDisplayMode displayMode)
{
    OH_LOG_INFO(LOG_APP, "displayMode=%{public}d.", displayMode);
}

napi_value RegisterFoldDisplayModeChangeListenerNoSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener(
        FoldDisplayModeChangeCallback, &listenerIndex);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? 0 : -1, &result);
    return result;
}

napi_value RegisterFoldDisplayModeChangeListenerInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener(
        FoldDisplayModeChangeCallback, NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetAllDisplay(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_DisplaysInfo *displaysInfo = nullptr;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateAllDisplays(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value GetDisplayById(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayId;
    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDisplayById(displayId, NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

napi_value CreatePrimaryDisplay(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreatePrimaryDisplay(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

void AvailableAreaChangeCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "AvailableAreaChangeCallback displayId=%{public}lu.", displayId);
}

napi_value RegisterAvailableAreaChangeListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterAvailableAreaChangeListener(
        AvailableAreaChangeCallback, NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM ||
                      errCode == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? 0 : -1, &result);
    return result;
}

napi_value DestroyAvailableArea(napi_env env, napi_callback_info info)
{
    napi_value result;
    NativeDisplayManager_Rect *availableAreaInfo;
    OH_NativeDisplayManager_CreateAvailableArea(0, &availableAreaInfo);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_DestroyAvailableArea(NULL);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM ||
                      errCode == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? 0 : -1, &result);
    return result;
}

void DisplayAddCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayAddCallback displayId=%{public}lu.", displayId);
}

napi_value RegisterDisplayAddListener(napi_env env, napi_callback_info info) // 1400004
{
    napi_value result;
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterDisplayAddListener(nullptr,
        &listenerIndex);
    OH_NativeDisplayManager_UnregisterDisplayAddListener(listenerIndex);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM ||
                      errCode == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? 0 : -1, &result);
    return result;
}

void DisplayRemoveCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayRemoveCallback displayId=%{public}lu.", displayId);
}

napi_value RegisterDisplayRemoveListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode =
        OH_NativeDisplayManager_RegisterDisplayRemoveListener(NULL, &listenerIndex);
    napi_create_int32(env, errCode == DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM ||
                      errCode == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? 0 : -1, &result);
    return result;
}

}
