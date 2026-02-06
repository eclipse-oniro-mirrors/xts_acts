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
    OH_PixelmapNative* pixelMap = (OH_PixelmapNative*)malloc(PARAM_100);
    int32_t result = OH_NativeDisplayManager_CaptureScreenPixelmap(Window::g_displayId, &pixelMap);
    result = result != DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? result == DISPLAY_MANAGER_ERROR_NO_PERMISSION ?
             DISPLAY_MANAGER_ERROR_NO_PERMISSION : DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED : result ==
             DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED ? DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Display",
                 "CaptureScreenPixelmapNoPermission: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

}
