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

#ifndef WEB_ERROR_CODE_WEBSCHEMEHANDLERTEST_H
#define WEB_ERROR_CODE_WEBSCHEMEHANDLERTEST_H

#include <string>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include "web/arkweb_scheme_handler.h"

ArkWeb_CustomSchemeOption GetSchemeOptionByName(const std::string name);
napi_value WebRegisterCustomSchemes(napi_env env, napi_callback_info info);
napi_value WebSchemeHandlerProcess(napi_env env, napi_callback_info info);
napi_value ArkWebResourceRequestSetUserDataInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebResourceRequestSetUserDataOK(napi_env env, napi_callback_info info);
napi_value SetSchemeHandler(napi_env env, napi_callback_info info);
ArkWeb_CustomSchemeOption GetSchemeOptionByName(const std::string name);
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept);
napi_value InitResourceManager(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamSetUserDataInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamSetReadCallbackOK(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamSetReadCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamSetAsyncReadCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamInitInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebRegisterCustomSchemesOK(napi_env env, napi_callback_info info);
napi_value ArkWebHttpBodyStreamAsyncRead(napi_env env, napi_callback_info info);
napi_value ArkWebResourceRequestDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value ArkWebRegisterCustomSchemesOK(napi_env env, napi_callback_info info);
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept);
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request);
napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info);
napi_value RequestStop(napi_env env, napi_callback_info info);
napi_value SetAsyncReadCallback(napi_env env, napi_callback_info info);

#endif //WEB_ERROR_CODE_WEBSCHEMEHANDLERTEST_H
