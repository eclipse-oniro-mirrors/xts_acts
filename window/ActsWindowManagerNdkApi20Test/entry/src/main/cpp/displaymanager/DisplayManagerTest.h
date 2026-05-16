#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
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
#include "common.h"

namespace DisplayManager {
    napi_value GetDefaultDisplayId(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayWidth(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayHeight(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayRotation(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayOrientation(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayVirtualPixelRatio(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayRefreshRate(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayDensityDpi(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayDensityPixels(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayScaledDensity(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayDensityXdpi(napi_env env, napi_callback_info info);
    napi_value GetDefaultDisplayDensityYdpi(napi_env env, napi_callback_info info);
    napi_value CreateDefaultDisplayCutoutInfo(napi_env env, napi_callback_info info);
    napi_value DestroyDefaultDisplayCutoutInfoSuccess(napi_env env, napi_callback_info info);
    napi_value DestroyDefaultDisplayCutoutInfoError(napi_env env, napi_callback_info info);
    napi_value GetFoldDisplayMode(napi_env env, napi_callback_info info);
    napi_value RegisterDisplayChangeListener(napi_env env, napi_callback_info info);
    napi_value UnRegisterDisplayChangeListener(napi_env env, napi_callback_info info);
    napi_value RegisterFoldDisplayModeChangeListenerNoSupport(napi_env env, napi_callback_info info);
    napi_value RegisterFoldDisplayModeChangeListenerInvalidParam(napi_env env, napi_callback_info info);
    napi_value GetAllDisplay(napi_env env, napi_callback_info info);
    napi_value GetDisplayById(napi_env env, napi_callback_info info);
    napi_value CreatePrimaryDisplay(napi_env env, napi_callback_info info);
    napi_value RegisterAvailableAreaChangeListener(napi_env env, napi_callback_info info);
    napi_value DestroyAvailableArea(napi_env env, napi_callback_info info);
    napi_value RegisterDisplayAddListener(napi_env env, napi_callback_info info);
    napi_value RegisterDisplayRemoveListener(napi_env env, napi_callback_info info);
}
#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
