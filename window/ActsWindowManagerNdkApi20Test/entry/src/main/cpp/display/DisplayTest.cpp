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

#include "display/Display.h"
#include "window/Window.h"

namespace Display {

napi_value CaptureScreenPixelmapInvalidParamOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_CaptureScreenPixelmap(0, nullptr);
    result = result == DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED : result;
    result = result == DISPLAY_MANAGER_ERROR_INVALID_PARAM ? DISPLAY_MANAGER_ERROR_INVALID_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "CaptureScreenPixelmapInvalidParamOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CaptureScreenPixelmapNoPermission(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_PixelmapNative* pixelMap = (OH_PixelmapNative*)malloc(sizeof(OH_PixelmapNative*));
    int32_t result = OH_NativeDisplayManager_CaptureScreenPixelmap(Window::g_displayId, &pixelMap);
    result = result != DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? result == DISPLAY_MANAGER_ERROR_NO_PERMISSION ?
             DISPLAY_MANAGER_ERROR_NO_PERMISSION : DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED : result ==
             DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "CaptureScreenPixelmapNoPermission: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TestCaptureScreenPixelmapBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_PixelmapNative* pixelMap = nullptr;
    int32_t result = OH_NativeDisplayManager_CaptureScreenPixelmap(PARAM_4294967294, &pixelMap);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCaptureScreenPixelmapBoundaryValue 1: %{public}d", result);
    
    int32_t result2 = OH_NativeDisplayManager_CaptureScreenPixelmap(PARAM_4294967295, &pixelMap);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCaptureScreenPixelmapBoundaryValue 2: %{public}d", result2);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestCreateDisplayByIdBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    int32_t result = OH_NativeDisplayManager_CreateDisplayById(0, &displayInfo);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCreateDisplayByIdBoundaryValue 1: %{public}d", result);
    
    int32_t result2 = OH_NativeDisplayManager_CreateDisplayById(PARAM_4294967294, &displayInfo);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCreateDisplayByIdBoundaryValue 2: %{public}d", result2);
    
    int32_t result3 = OH_NativeDisplayManager_CreateDisplayById(PARAM_4294967295, &displayInfo);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCreateDisplayByIdBoundaryValue 2: %{public}d", result3);
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_3] = {result, result2, result3};
    for (int i = 0; i < PARAM_3; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestUnregisterAvailableAreaChangeListenerBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener(PARAM_4294967295);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestUnregisterAvailableAreaChangeListenerBoundaryValue 1: %{public}d", result);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_1] = {result};
    for (int i = 0; i < PARAM_1; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestCreateAvailableAreaBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    NativeDisplayManager_Rect* availableArea = nullptr;
    int32_t result = OH_NativeDisplayManager_CreateAvailableArea(PARAM_18446744073709551614, &availableArea);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCreateAvailableAreaBoundaryValue 1: %{public}d", result);
    
    int32_t result2 = OH_NativeDisplayManager_CreateAvailableArea(PARAM_18446744073709551615, &availableArea);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestCreateAvailableAreaBoundaryValue 2: %{public}d", result2);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}
    
napi_value TestUnregisterDisplayAddListenerBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_UnregisterDisplayAddListener(PARAM_4294967295);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestUnregisterDisplayAddListenerBoundaryValue 1: %{public}d", result);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_1] = {result};
    for (int i = 0; i < PARAM_1; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestUnregisterDisplayRemoveListenerBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeDisplayManager_UnregisterDisplayRemoveListener(PARAM_4294967295);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestUnregisterDisplayRemoveListenerBoundaryValue 1: %{public}d", result);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_1] = {result};
    for (int i = 0; i < PARAM_1; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestGetDisplaySourceModeBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    NativeDisplayManager_SourceMode displaySourceMode;
    int32_t result = OH_NativeDisplayManager_GetDisplaySourceMode(PARAM_18446744073709551614, &displaySourceMode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestGetDisplaySourceModeBoundaryValue 1: %{public}d", result);
    
    int32_t result2 = OH_NativeDisplayManager_GetDisplaySourceMode(PARAM_18446744073709551615, &displaySourceMode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestGetDisplaySourceModeBoundaryValue 2: %{public}d", result2);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestGetDisplayPositionBoundaryValue(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t x;
    int32_t y;
    int32_t result = OH_NativeDisplayManager_GetDisplayPosition(PARAM_18446744073709551614, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestGetDisplayPositionBoundaryValue 1: %{public}d", result);
    
    int32_t result2 = OH_NativeDisplayManager_GetDisplayPosition(PARAM_18446744073709551615, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "TestGetDisplayPositionBoundaryValue 2: %{public}d", result2);
    
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}
}
