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

#include "InputmethodAttachOptionsCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <napi/native_api.h>

void AddInputMethodAttachOptionsCapiTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhAttachOptionsIsShowKeyboardNullPointer", nullptr,
                        TestOhAttachOptionsIsShowKeyboardNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhAttachOptionsGetRequestKeyboardReasonNullPointer", nullptr,
                        TestOhAttachOptionsGetRequestKeyboardReasonNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

napi_value TestOhAttachOptionsIsShowKeyboardNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_AttachOptions *options = nullptr;
    bool showKeyboard = true;
    int ret = OH_AttachOptions_IsShowKeyboard(options, &showKeyboard);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhAttachOptionsGetRequestKeyboardReasonNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_AttachOptions *options = nullptr;
    int requestKeyboardReason = 0;
    int ret = OH_AttachOptions_GetRequestKeyboardReason(options, &requestKeyboardReason);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}