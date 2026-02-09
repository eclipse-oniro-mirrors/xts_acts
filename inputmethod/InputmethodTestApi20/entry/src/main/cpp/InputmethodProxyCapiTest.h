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
#ifndef INPUTMETHODTESTAPI20_INPUTMETHODPROXYCAPITEST_H
#define INPUTMETHODTESTAPI20_INPUTMETHODPROXYCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void AddInputMethodProxyCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestOhInputMethodProxyShowKeyboardNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyShowKeyboardDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyShowTextInputNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyShowTextInputDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyHideKeyboardNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyHideKeyboardDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifySelectionChangeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifySelectionChangeDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifySelectionChangeParamCheckError(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyConfigurationChangeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyConfigurationChangeDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyConfigurationChangeParamCheckError(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyCursorUpdateNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyCursorUpdateDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxyNotifyCursorUpdateParamCheckError(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxySendPrivateCommandNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxySendPrivateCommandDetached(napi_env env, napi_callback_info info);
napi_value TestOhInputMethodProxySendPrivateCommandParamCheckError(napi_env env, napi_callback_info info);

#endif //INPUTMETHODTESTAPI20_INPUTMETHODPROXYCAPITEST_H