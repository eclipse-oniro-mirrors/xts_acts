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

#ifndef INPUTMETHODTESTAPI20_INPUTMETHODTEXTCONFIGCAPITEST_H
#define INPUTMETHODTESTAPI20_INPUTMETHODTEXTCONFIGCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void AddInputMethodTextConfigCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestOhTextConfigSetInputTypeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetInputTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetEnterKeyTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetPreviewTextSupportNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetPreviewTextSupportOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetSelectionNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetSelectionOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetWindowIdNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetWindowIdOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetPlaceholderNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetPlaceholderOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetAbilityNameNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigSetAbilityNameOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetInputTypeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetInputTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetEnterKeyTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigIsPreviewTextSupportedNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigIsPreviewTextSupportedOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetCursorInfoNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetCursorInfoOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetTextAvoidInfoNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetTextAvoidInfoOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetSelectionNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetSelectionOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetWindowIdNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetWindowIdOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetPlaceholderNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetPlaceholderOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetPlaceholderParamCheckError(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetAbilityNameNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetAbilityNameOk(napi_env env, napi_callback_info info);
napi_value TestOhTextConfigGetAbilityNameParamCheckError(napi_env env, napi_callback_info info);

#endif //INPUTMETHODTESTAPI20_INPUTMETHODTEXTCONFIGCAPITEST_H