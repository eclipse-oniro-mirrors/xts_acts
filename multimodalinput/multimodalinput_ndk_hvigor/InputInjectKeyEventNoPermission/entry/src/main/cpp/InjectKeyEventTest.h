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
napi_value RequestInjectionFrequent(napi_env env, napi_callback_info info);
napi_value RequestInjectionAuthorized(napi_env env, napi_callback_info info);
napi_value OHInputInjectKeyEventDenied(napi_env env, napi_callback_info info);
napi_value RequestInjectionError(napi_env env, napi_callback_info info);
napi_value AddKeyEventMonitorException(napi_env env, napi_callback_info info);
napi_value AddMouseEventMonitorException(napi_env env, napi_callback_info info);
napi_value AddTouchEventMonitorException(napi_env env, napi_callback_info info);
napi_value AddAxisEventMonitorForAllException(napi_env env, napi_callback_info info);
napi_value AddAxisEventMonitorException(napi_env env, napi_callback_info info);
napi_value RemoveKeyEventMonitorException(napi_env env, napi_callback_info info);
napi_value RemoveKeyEventMonitorDenied(napi_env env, napi_callback_info info);
napi_value RemoveMouseEventMonitorException(napi_env env, napi_callback_info info);
napi_value RemoveMouseEventMonitorDenied(napi_env env, napi_callback_info info);
napi_value RemoveTouchEventMonitorException(napi_env env, napi_callback_info info);
napi_value RemoveTouchEventMonitorDenied(napi_env env, napi_callback_info info);
napi_value RemoveAxisEventMonitorForAllException(napi_env env, napi_callback_info info);
napi_value RemoveAxisEventMonitorForAllDenied(napi_env env, napi_callback_info info);
napi_value RemoveAxisEventMonitorException(napi_env env, napi_callback_info info);
napi_value RemoveAxisEventMonitorDenied(napi_env env, napi_callback_info info);
napi_value AddKeyEventInterceptorException(napi_env env, napi_callback_info info);
napi_value AddInputEventInterceptorException(napi_env env, napi_callback_info info);
napi_value RemoveKeyEventInterceptorDenied(napi_env env, napi_callback_info info);
napi_value RemoveInputEventInterceptorDenied(napi_env env, napi_callback_info info);
napi_value UnregisterDeviceListenersException(napi_env env, napi_callback_info info);
napi_value OHInputInjectKeyEventCapsLock(napi_env env, napi_callback_info info);
napi_value OHInputInjectMouseEventSuccess(napi_env env, napi_callback_info info);
napi_value InjectMouseEventGlobalSuccess(napi_env env, napi_callback_info info);
#endif //INJECT_KEY_EVENT_TEST_H
