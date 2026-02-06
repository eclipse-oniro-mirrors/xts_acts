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
#include "InputmethodTextConfigCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_text_avoid_info_capi.h>
#include <inputmethod/inputmethod_text_config_capi.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

void AddInputMethodTextConfigCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextConfigSetInputTypeNullPointer", nullptr, TestOhTextConfigSetInputTypeNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetInputTypeOk", nullptr, TestOhTextConfigSetInputTypeOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetEnterKeyTypeNullPointer", nullptr,
                        TestOhTextConfigSetEnterKeyTypeNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetEnterKeyTypeOk", nullptr, TestOhTextConfigSetEnterKeyTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPreviewTextSupportNullPointer", nullptr,
                        TestOhTextConfigSetPreviewTextSupportNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextConfigSetPreviewTextSupportOk", nullptr, TestOhTextConfigSetPreviewTextSupportOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetSelectionNullPointer", nullptr, TestOhTextConfigSetSelectionNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetSelectionOk", nullptr, TestOhTextConfigSetSelectionOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetWindowIdNullPointer", nullptr, TestOhTextConfigSetWindowIdNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetWindowIdOk", nullptr, TestOhTextConfigSetWindowIdOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPlaceholderNullPointer", nullptr, TestOhTextConfigSetPlaceholderNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetPlaceholderOk", nullptr, TestOhTextConfigSetPlaceholderOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetAbilityNameNullPointer", nullptr, TestOhTextConfigSetAbilityNameNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigSetAbilityNameOk", nullptr, TestOhTextConfigSetAbilityNameOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

void AddInputMethodTextConfigCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextConfigGetInputTypeNullPointer", nullptr, TestOhTextConfigGetInputTypeNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetInputTypeOk", nullptr, TestOhTextConfigGetInputTypeOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetEnterKeyTypeNullPointer", nullptr,
                        TestOhTextConfigGetEnterKeyTypeNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetEnterKeyTypeOk", nullptr, TestOhTextConfigGetEnterKeyTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigIsPreviewTextSupportedNullPointer", nullptr,
                        TestOhTextConfigIsPreviewTextSupportedNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextConfigIsPreviewTextSupportedOk", nullptr, TestOhTextConfigIsPreviewTextSupportedOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetCursorInfoNullPointer", nullptr, TestOhTextConfigGetCursorInfoNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetCursorInfoOk", nullptr, TestOhTextConfigGetCursorInfoOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetTextAvoidInfoNullPointer", nullptr,
                        TestOhTextConfigGetTextAvoidInfoNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetTextAvoidInfoOk", nullptr, TestOhTextConfigGetTextAvoidInfoOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetSelectionNullPointer", nullptr, TestOhTextConfigGetSelectionNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetSelectionOk", nullptr, TestOhTextConfigGetSelectionOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetWindowIdNullPointer", nullptr, TestOhTextConfigGetWindowIdNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetWindowIdOk", nullptr, TestOhTextConfigGetWindowIdOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetPlaceholderNullPointer", nullptr, TestOhTextConfigGetPlaceholderNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetPlaceholderOk", nullptr, TestOhTextConfigGetPlaceholderOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetPlaceholderParamCheckError", nullptr,
                        TestOhTextConfigGetPlaceholderParamCheckError, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextConfigGetAbilityNameNullPointer", nullptr, TestOhTextConfigGetAbilityNameNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetAbilityNameOk", nullptr, TestOhTextConfigGetAbilityNameOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextConfigGetAbilityNameParamCheckError", nullptr,
                        TestOhTextConfigGetAbilityNameParamCheckError, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

void AddInputMethodTextConfigCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputMethodTextConfigCapiTest1(descData);
    AddInputMethodTextConfigCapiTest2(descData);
}

napi_value TestOhTextConfigSetInputTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    int ret = OH_TextConfig_SetInputType(nullptr, inputType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetInputTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    int ret = OH_TextConfig_SetInputType(config, inputType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    int ret = OH_TextConfig_SetEnterKeyType(nullptr, enterKeyType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetEnterKeyTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    int ret = OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPreviewTextSupportNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_SetPreviewTextSupport(nullptr, supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPreviewTextSupportOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_SetPreviewTextSupport(config, supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetSelectionNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    int ret = OH_TextConfig_SetSelection(nullptr, start, end);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetSelectionOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    int ret = OH_TextConfig_SetSelection(config, start, end);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetWindowIdNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 1;
    int ret = OH_TextConfig_SetWindowId(nullptr, windowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetWindowIdOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 1;
    int ret = OH_TextConfig_SetWindowId(config, windowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPlaceholderNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t length = 3;
    int ret = OH_TextConfig_SetPlaceholder(nullptr, placeholder, length);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetPlaceholderOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t length = 3;
    int ret = OH_TextConfig_SetPlaceholder(config, placeholder, length);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetAbilityNameNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    int ret = OH_TextConfig_SetAbilityName(nullptr, abilityName, abilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigSetAbilityNameOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    int ret = OH_TextConfig_SetAbilityName(config, abilityName, abilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetInputTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType inputType1;
    int ret = OH_TextConfig_GetInputType(nullptr, &inputType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetInputTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType inputType1;
    int ret = OH_TextConfig_GetInputType(config, &inputType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetEnterKeyTypeNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType enterKeyType1;
    int ret = OH_TextConfig_GetEnterKeyType(nullptr, &enterKeyType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetEnterKeyTypeOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType enterKeyType1;
    int ret = OH_TextConfig_GetEnterKeyType(config, &enterKeyType1);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigIsPreviewTextSupportedNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_IsPreviewTextSupported(nullptr, &supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigIsPreviewTextSupportedOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    bool supported = true;
    int ret = OH_TextConfig_IsPreviewTextSupported(config, &supported);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetCursorInfoNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    double left = 100;
    double top = 200;
    double width = 300;
    double height = 400;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    int ret = OH_TextConfig_GetCursorInfo(nullptr, &cursorInfo);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetCursorInfoOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    double left = 100;
    double top = 200;
    double width = 300;
    double height = 400;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    int ret = OH_TextConfig_GetCursorInfo(config, &cursorInfo);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetTextAvoidInfoNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    double positionY = 20;
    double height = 20;
    InputMethod_TextAvoidInfo *avoidInfo = OH_TextAvoidInfo_Create(positionY, height);
    int ret = OH_TextConfig_GetTextAvoidInfo(nullptr, &avoidInfo);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetTextAvoidInfoOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    double positionY = 20;
    double height = 20;
    InputMethod_TextAvoidInfo *avoidInfo = OH_TextAvoidInfo_Create(positionY, height);
    int ret = OH_TextConfig_GetTextAvoidInfo(config, &avoidInfo);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetSelectionNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    OH_TextConfig_SetSelection(config, start, end);
    int32_t expStart;
    int32_t expEnd;
    int ret = OH_TextConfig_GetSelection(nullptr, &expStart, &expEnd);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetSelectionOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t start = 1;
    int32_t end = 2;
    OH_TextConfig_SetSelection(config, start, end);
    int32_t expStart;
    int32_t expEnd;
    int ret = OH_TextConfig_GetSelection(config, &expStart, &expEnd);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetWindowIdNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 100;
    OH_TextConfig_SetWindowId(config, windowId);
    int32_t expWindowId = 0;
    int ret = OH_TextConfig_GetWindowId(nullptr, &expWindowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetWindowIdOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    int32_t windowId = 100;
    OH_TextConfig_SetWindowId(config, windowId);
    int32_t expWindowId = 0;
    int ret = OH_TextConfig_GetWindowId(config, &expWindowId);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetPlaceholderNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t placeholderLength = 3;
    OH_TextConfig_SetPlaceholder(config, placeholder, placeholderLength);
    char16_t exPlaceholder[5];
    size_t exPlaceholderLength = 4;
    int ret = OH_TextConfig_GetPlaceholder(nullptr, exPlaceholder, &exPlaceholderLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetPlaceholderOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t placeholderLength = 3;
    OH_TextConfig_SetPlaceholder(config, placeholder, placeholderLength);
    char16_t exPlaceholder[5];
    size_t exPlaceholderLength = 4;
    int ret = OH_TextConfig_GetPlaceholder(config, exPlaceholder, &exPlaceholderLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetPlaceholderParamCheckError(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *placeholder = u"abcdef";
    size_t placeholderLength = 3;
    OH_TextConfig_SetPlaceholder(config, placeholder, placeholderLength);
    char16_t exPlaceholder[5];
    size_t exPlaceholderLength = 2;
    int ret = OH_TextConfig_GetPlaceholder(config, exPlaceholder, &exPlaceholderLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetAbilityNameNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    OH_TextConfig_SetAbilityName(config, abilityName, abilityNameLength);
    char16_t expAbilityName[5];
    size_t expAbilityNameLength = 4;
    int ret = OH_TextConfig_GetAbilityName(nullptr, expAbilityName, &expAbilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetAbilityNameOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    OH_TextConfig_SetAbilityName(config, abilityName, abilityNameLength);
    char16_t expAbilityName[5];
    size_t expAbilityNameLength = 4;
    int ret = OH_TextConfig_GetAbilityName(config, expAbilityName, &expAbilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextConfigGetAbilityNameParamCheckError(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    const char16_t *abilityName = u"abcdef";
    size_t abilityNameLength = 3;
    OH_TextConfig_SetAbilityName(config, abilityName, abilityNameLength);
    char16_t expAbilityName[5];
    size_t expAbilityNameLength = 2;
    int ret = OH_TextConfig_GetAbilityName(config, expAbilityName, &expAbilityNameLength);
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}