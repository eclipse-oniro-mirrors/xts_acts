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

#include "InputmethodControllerCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

void AddInputMethodControllerCapiTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhInputMethodControllerAttachNullPointer", nullptr,
                        TestOhInputMethodControllerAttachNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodControllerDetachNullPointer", nullptr,
                        TestOhInputMethodControllerDetachNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

InputMethod_TextEditorProxy *g_txtEditProxy = nullptr;
InputMethod_InputMethodProxy *g_inputMethodProxy = nullptr;
InputMethod_PrivateCommand *g_privateCommand = nullptr;
InputMethod_CursorInfo *g_cursorInfo = nullptr;
InputMethod_TextAvoidInfo *g_textAvoidInfo = nullptr;
InputMethod_AttachOptions *g_options = nullptr;

void GetTextConfigFunc(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_TextConfig *config)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextConfigFunc successful.");
}

void InsertTextFunc(InputMethod_TextEditorProxy *textEditorProxy, const char16_t *text, size_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>InsertTextFunc successful.");
}

void DeleteForwardFunc(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteForwardFunc successful.");
}

void DeleteBackwardFunc(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteBackwardFunc successful.");
}

void SendKeyboardStatusFunc(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_KeyboardStatus keyboardStatus)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendKeyboardStatusFunc successful.");
}

void SendEnterKeyFunc(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_EnterKeyType enterKeyType)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendEnterKeyFunc successful.");
}

void MoveCursorFunc(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_Direction direction)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>MoveCursorFunc successful.");
}

void HandleSetSelectionFunc(InputMethod_TextEditorProxy *textEditorProxy, int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleSetSelectionFunc successful.");
}

void HandleExtendActionFunc(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_ExtendAction action)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleExtendActionFunc successful.");
}

void GetLeftTextOfCursorFunc(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                             size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetLeftTextOfCursorFunc successful.");
}

void GetRightTextOfCursorFunc(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                              size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetRightTextOfCursorFunc successful.");
}

int32_t GetTextIndexAtCursorFunc(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextIndexAtCursorFunc successful.");
    return 0;
}

int32_t ReceivePrivateCommandFunc(InputMethod_TextEditorProxy *textEditorProxy,
                                  InputMethod_PrivateCommand *privateCommand[], size_t size)
                                  {
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>ReceivePrivateCommandFunc successful.");
    return 0;
}

int32_t SetPreviewTextFunc(InputMethod_TextEditorProxy *textEditorProxy, const char16_t text[], size_t length,
                           int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SetPreviewTextFunc successful.");
    return 0;
}

void FinishTextPreviewFunc(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>FinishTextPreviewFunc successful.");
}

void TextEditorProxyCreate()
{
    if (g_txtEditProxy == nullptr) {
        g_txtEditProxy = OH_TextEditorProxy_Create();
        OH_TextEditorProxy_SetGetTextConfigFunc(g_txtEditProxy, GetTextConfigFunc);
        OH_TextEditorProxy_SetInsertTextFunc(g_txtEditProxy, InsertTextFunc);
        OH_TextEditorProxy_SetDeleteForwardFunc(g_txtEditProxy, DeleteForwardFunc);
        OH_TextEditorProxy_SetDeleteBackwardFunc(g_txtEditProxy, DeleteBackwardFunc);
        OH_TextEditorProxy_SetSendKeyboardStatusFunc(g_txtEditProxy, SendKeyboardStatusFunc);
        OH_TextEditorProxy_SetSendEnterKeyFunc(g_txtEditProxy, SendEnterKeyFunc);
        OH_TextEditorProxy_SetMoveCursorFunc(g_txtEditProxy, MoveCursorFunc);
        OH_TextEditorProxy_SetHandleSetSelectionFunc(g_txtEditProxy, HandleSetSelectionFunc);
        OH_TextEditorProxy_SetHandleExtendActionFunc(g_txtEditProxy, HandleExtendActionFunc);
        OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(g_txtEditProxy, GetLeftTextOfCursorFunc);
        OH_TextEditorProxy_SetGetRightTextOfCursorFunc(g_txtEditProxy, GetRightTextOfCursorFunc);
        OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(g_txtEditProxy, GetTextIndexAtCursorFunc);
        OH_TextEditorProxy_SetReceivePrivateCommandFunc(g_txtEditProxy, ReceivePrivateCommandFunc);
        OH_TextEditorProxy_SetSetPreviewTextFunc(g_txtEditProxy, SetPreviewTextFunc);
        OH_TextEditorProxy_SetFinishTextPreviewFunc(g_txtEditProxy, FinishTextPreviewFunc);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>TextEditorProxyCreate successful.");
    }
}

void AttachOptionsCreate(bool showKeyboard)
{
    g_options = OH_AttachOptions_Create(showKeyboard);
}

napi_value TestOhInputMethodControllerAttachNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate();
    AttachOptionsCreate(false);
    int ret = OH_InputMethodController_Attach(nullptr, g_options, &g_inputMethodProxy);
    OH_AttachOptions_Destroy(g_options);
    OH_TextEditorProxy_Destroy(g_txtEditProxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodControllerDetachNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Detach(inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}