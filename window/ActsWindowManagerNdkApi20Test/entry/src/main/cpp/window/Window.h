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

#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_WINDOW_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_WINDOW_H

#include "common/Common.h"

namespace Window {

extern int32_t g_windowId;
extern int32_t g_mainWindowId;
extern int32_t g_displayId;

bool MouseEventFilter(Input_MouseEvent* mouseEvent);
bool TouchEventFilter(Input_TouchEvent* touchEvent);

napi_value GetWindowId(napi_env env, napi_callback_info info);
napi_value GetMainWindowId(napi_env env, napi_callback_info info);
napi_value GetDisplayId(napi_env env, napi_callback_info info);
napi_value SetWindowStatusBarEnabledInvalidParam(napi_env env, napi_callback_info info);
napi_value SetWindowStatusBarEnabledSystemAbnormal(napi_env env, napi_callback_info info);
napi_value GetWindowAvoidAreaInvalidParam(napi_env env, napi_callback_info info);
napi_value IsWindowShownInvalidParam(napi_env env, napi_callback_info info);
napi_value GetWindowPropertiesInvalidParam(napi_env env, napi_callback_info info);
napi_value SnapshotOk(napi_env env, napi_callback_info info);
napi_value SnapshotInvalidParam(napi_env env, napi_callback_info info);
napi_value SnapshotStateAbnormal(napi_env env, napi_callback_info info);
napi_value GetAllWindowLayoutInfoListParameterOverride(napi_env env, napi_callback_info info);
napi_value GetAllWindowLayoutInfoListOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value InjectTouchEventParameterOverride(napi_env env, napi_callback_info info);
napi_value InjectTouchEventSystemAbnormal(napi_env env, napi_callback_info info);
napi_value InjectTouchEventStateAbnormal(napi_env env, napi_callback_info info);
napi_value SetWindowPrivacyModeNoPermission(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeOk(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeNoPermission(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeInvalidParam(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeInvalidWindowId(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeStateAbnormal(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeSystemAbnormal(napi_env env, napi_callback_info info);
napi_value GetWindowAvoidAreaType(napi_env env, napi_callback_info info);
napi_value GetWindowType(napi_env env, napi_callback_info info);
napi_value RegisterMouseEventFilterOkOrServiceError(napi_env env, napi_callback_info info);
napi_value RegisterMouseEventFilterInvaildWindowId(napi_env env, napi_callback_info info);
napi_value UnregisterMouseEventFilterOkOrServiceError(napi_env env, napi_callback_info info);
napi_value UnregisterMouseEventFilterInvaildWindowId(napi_env env, napi_callback_info info);
napi_value RegisterTouchEventFilterOkOrServiceError(napi_env env, napi_callback_info info);
napi_value RegisterTouchEventFilterInvaildWindowId(napi_env env, napi_callback_info info);
napi_value UnregisterTouchEventFilterOkOrServiceError(napi_env env, napi_callback_info info);
napi_value UnregisterTouchEventFilterInvaildWindowId(napi_env env, napi_callback_info info);
};

#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_WINDOW_H
