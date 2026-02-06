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

#ifndef INJECT_KEY_EVENT_TEST_H
#define INJECT_KEY_EVENT_TEST_H


#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <vector>
void addInjectKeyEventTest(std::vector<napi_property_descriptor>& descData);

napi_value OHInputInjectTouchEventGlobalError(napi_env env, napi_callback_info info);
napi_value OHInputInjectTouchEventGlobal(napi_env env, napi_callback_info info);
napi_value OHInputInjectTouchEventError(napi_env env, napi_callback_info info);
napi_value OHInputInjectTouchEventSuccess(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventGlobalEventError(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventGlobalDenied(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventError(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventGlobalGetSetXEvent(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventGlobalGetSetYEvent(napi_env env, napi_callback_info info);
napi_value OHInputGetTouchEventGlobalX(napi_env env, napi_callback_info info);
napi_value OHInputGetTouchEventGlobalY(napi_env env, napi_callback_info info);
napi_value OHInputSetAxisEventGlobalXSuccess(napi_env env, napi_callback_info info);
napi_value OHInputSetAxisEventGlobalYSuccess(napi_env env, napi_callback_info info);
napi_value OHInputGetAxisEventGlobalXSuccess(napi_env env, napi_callback_info info);
napi_value OHInputGetAxisEventGlobalYSuccess(napi_env env, napi_callback_info info);
napi_value OHInputSetAxisEventGlobalXError(napi_env env, napi_callback_info info);
napi_value OHInputSetAxisEventGlobalYError(napi_env env, napi_callback_info info);
napi_value OHInputGetAxisEventGlobalXError(napi_env env, napi_callback_info info);
napi_value OHInputGetAxisEventGlobalYError(napi_env env, napi_callback_info info);
napi_value OHInputInjectionStatusUnauthorized(napi_env env, napi_callback_info info);
napi_value OHInputInjectionStatusAuthorizing(napi_env env, napi_callback_info info);
napi_value OHInputInjectionStatusAuthorized(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeNone(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeUNKNOWN(napi_env env, napi_callback_info info);
napi_value OHInputAddKeyEventMonitorPermissionDenied(napi_env env, napi_callback_info info);
napi_value OHInputGetPreKeysError(napi_env env, napi_callback_info info);
napi_value OHInputGetFinalKeyError(napi_env env, napi_callback_info info);
napi_value OHInputGetRepeatError(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeAlphabetic(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeDigital(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeStylus(napi_env env, napi_callback_info info);
napi_value OHInputKeyboardTypeControl(napi_env env, napi_callback_info info);
napi_value OHInputAddMouseEventMonitorPermissionDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddTouchEventMonitorPermissionDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddAxisEventMonitorForAllPermissionDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddAxisEventMonitorPermissionDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddAxisEventMonitorForAllDenied(napi_env env, napi_callback_info info);
napi_value OHInputRemoveMouseEventMonitorDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddKeyEventInterceptorDenied(napi_env env, napi_callback_info info);
napi_value OHInputAddInputEventInterceptorDenied(napi_env env, napi_callback_info info);
napi_value OHInputGetPointerLocationSuccess(napi_env env, napi_callback_info info);
napi_value OHInputGetPointerLocationError(napi_env env, napi_callback_info info);
napi_value OHInputGetPointerLocationNoPointer(napi_env env, napi_callback_info info);
napi_value OHInputGetPointerLocationNoFocused(napi_env env, napi_callback_info info);
napi_value OHInputQueryMaxTouchPointsSuccess(napi_env env, napi_callback_info info);
napi_value OHInputQueryMaxTouchPointsError(napi_env env, napi_callback_info info);
napi_value OHInputUnregisterDeviceListenerException(napi_env env, napi_callback_info info);
#endif //INJECT_KEY_EVENT_TEST_H
