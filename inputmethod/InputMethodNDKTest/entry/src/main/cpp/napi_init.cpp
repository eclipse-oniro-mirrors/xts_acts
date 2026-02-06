/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "inputmethod/inputmethod_attach_options_capi.h"
#include "inputmethod/inputmethod_controller_capi.h"
#include "inputmethod/inputmethod_cursor_info_capi.h"
#include "inputmethod/inputmethod_inputmethod_proxy_capi.h"
#include "inputmethod/inputmethod_private_command_capi.h"
#include "inputmethod/inputmethod_text_avoid_info_capi.h"
#include "inputmethod/inputmethod_text_config_capi.h"
#include "inputmethod/inputmethod_text_editor_proxy_capi.h"
#include "inputmethod/inputmethod_types_capi.h"
#include "native_common.h"
#include "hilog/log.h"
#include "codecvt"
#include "locale"

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

void TextEditorProxy_Create()
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
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>TextEditorProxy_Create successful.");
    }
}

void AttachOptions_Create(bool showKeyboard)
{
    g_options = OH_AttachOptions_Create(showKeyboard);
}
void AttachOptions_CreateWithRequestKeyboardReason(bool showKeyboard,
                                                   InputMethod_RequestKeyboardReason requestKeyboardReason)
{
    g_options = OH_AttachOptions_CreateWithRequestKeyboardReason(showKeyboard, requestKeyboardReason);
}

static napi_value SUB_IMF_NDK_AttachOptions_Create_0100(napi_env env, napi_callback_info info)
{
    g_options = OH_AttachOptions_Create(true);
    bool showKeyboard = false;
    InputMethod_ErrorCode returnValue = OH_AttachOptions_IsShowKeyboard(g_options, &showKeyboard);
    OH_AttachOptions_Destroy(g_options);

    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_IsShowKeyboard successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_IsShowKeyboard fail.");
    return result;
}

static napi_value SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE(napi_env env, napi_callback_info info)
{
    g_options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true,
        InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_NONE);
    bool showKeyboard = false;
    int requestKeyboardReason = 0;
    InputMethod_ErrorCode returnValue = OH_AttachOptions_IsShowKeyboard(g_options, &showKeyboard);
    InputMethod_ErrorCode returnValueReason =
        OH_AttachOptions_GetRequestKeyboardReason(g_options, &requestKeyboardReason);
    OH_AttachOptions_Destroy(g_options);
    if (returnValueReason == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValueReason, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason fail.");
    return result;
}

static napi_value SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE(napi_env env, napi_callback_info info)
{
    g_options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true,
        InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_MOUSE);
    bool showKeyboard = false;
    int requestKeyboardReason = 0;
    InputMethod_ErrorCode returnValue = OH_AttachOptions_IsShowKeyboard(g_options, &showKeyboard);
    InputMethod_ErrorCode returnValueReason =
        OH_AttachOptions_GetRequestKeyboardReason(g_options, &requestKeyboardReason);
    OH_AttachOptions_Destroy(g_options);
    if (returnValueReason == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValueReason, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason fail.");
    return result;
}

static napi_value SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH(napi_env env, napi_callback_info info)
{
    g_options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true,
        InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_TOUCH);
    bool showKeyboard = false;
    int requestKeyboardReason = 0;
    InputMethod_ErrorCode returnValue = OH_AttachOptions_IsShowKeyboard(g_options, &showKeyboard);
    InputMethod_ErrorCode returnValueReason =
        OH_AttachOptions_GetRequestKeyboardReason(g_options, &requestKeyboardReason);
    OH_AttachOptions_Destroy(g_options);
    if (returnValueReason == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValueReason, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason fail.");
    return result;
}

static napi_value SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER(napi_env env, napi_callback_info info)
{
    g_options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true,
        InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_OTHER);
    bool showKeyboard = false;
    int requestKeyboardReason = 0;
    InputMethod_ErrorCode returnValue = OH_AttachOptions_IsShowKeyboard(g_options, &showKeyboard);
    InputMethod_ErrorCode returnValueReason =
        OH_AttachOptions_GetRequestKeyboardReason(g_options, &requestKeyboardReason);
    OH_AttachOptions_Destroy(g_options);
    if (returnValueReason == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValueReason, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_AttachOptions_GetRequestKeyboardReason fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodController_Attach_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(false);
    InputMethod_ErrorCode returnValue = OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodController_Attach_MOUSE(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_MOUSE);
    InputMethod_ErrorCode returnValue = OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodController_Attach_TOUCH(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_TOUCH);
    InputMethod_ErrorCode returnValue = OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodController_Attach_NONE(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_OTHER);
    InputMethod_ErrorCode returnValue = OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Attach fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodController_Detach_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(false);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    InputMethod_ErrorCode returnValue = OH_InputMethodController_Detach(g_inputMethodProxy);
    OH_TextEditorProxy_Destroy(g_txtEditProxy);
    g_txtEditProxy = nullptr;
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Detach successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodController_Detach fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(false);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_ShowKeyboard(g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowKeyboard successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowKeyboard fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE(napi_env env, napi_callback_info info)
{
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_NONE);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_ShowTextInput(g_inputMethodProxy, g_options);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE(napi_env env, napi_callback_info info)
{
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_MOUSE);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_ShowTextInput(g_inputMethodProxy, g_options);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH(napi_env env, napi_callback_info info)
{
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_TOUCH);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_ShowTextInput(g_inputMethodProxy, g_options);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER(napi_env env, napi_callback_info info)
{
    OH_AttachOptions_CreateWithRequestKeyboardReason(true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_OTHER);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_ShowTextInput(g_inputMethodProxy, g_options);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_ShowTextInput fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(true);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_HideKeyboard(g_inputMethodProxy);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_HideKeyboard successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_HideKeyboard fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(true);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    char16_t text[] = u"TestValue";
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_NotifySelectionChange(g_inputMethodProxy, text, 9, 1, 3);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_NotifySelectionChange successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_NotifySelectionChange fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(true);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    InputMethod_ErrorCode returnValue =
        OH_InputMethodProxy_NotifyConfigurationChange(g_inputMethodProxy, IME_ENTER_KEY_SEND, IME_TEXT_INPUT_TYPE_TEXT);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_NotifyConfigurationChange successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_NotifyConfigurationChange fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(true);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(100, 200, 300, 400);
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_NotifyCursorUpdate(g_inputMethodProxy, cursorInfo);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "NDKTest====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 successful.");
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                 "NDKTest====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 fail.");
    return result;
}

static napi_value SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    AttachOptions_Create(true);
    OH_InputMethodController_Attach(g_txtEditProxy, g_options, &g_inputMethodProxy);
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand1 = nullptr;
    keyCommand1 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand1, const_cast<char *>(valStr1.c_str()), valStr1.length());
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetStrValue successful.");

    std::string keyStr2 = "testKey_2";
    bool valStr2 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr2.c_str()), keyStr2.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr2);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetBoolValue successful.");

    std::string keyStr3 = "testKey_3";
    int32_t valStr3 = 123456789;
    InputMethod_PrivateCommand *keyCommand3 = nullptr;
    keyCommand3 = OH_PrivateCommand_Create(const_cast<char *>(keyStr3.c_str()), keyStr3.length());
    OH_PrivateCommand_SetIntValue(keyCommand3, valStr3);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetIntValue successful.");

    InputMethod_PrivateCommand *privateCommand[] = {keyCommand1, keyCommand2, keyCommand3};
    InputMethod_ErrorCode returnValue = OH_InputMethodProxy_SendPrivateCommand(g_inputMethodProxy, privateCommand, 3);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_SendPrivateCommand successful.");
        return result;
    }
    OH_PrivateCommand_Destroy(*privateCommand);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_SendPrivateCommand fail.");
    return result;
}

static napi_value SUB_IMF_NDK_PrivateCommand_SetKey_0100(napi_env env, napi_callback_info info)
{
    std::string key = "key";
    auto privateCommand = OH_PrivateCommand_Create(const_cast<char *>(key.c_str()), key.length());

    std::string newKey = "newKey";
    InputMethod_ErrorCode returnValue =
        OH_PrivateCommand_SetKey(privateCommand, const_cast<char *>(newKey.c_str()), newKey.length());
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_SendPrivateCommand fail.");
        return result;
    }

    const char *actStrKey = nullptr;
    size_t actStrKeyLength = 0;
    returnValue = OH_PrivateCommand_GetKey(privateCommand, &actStrKey, &actStrKeyLength);
    if (actStrKey != newKey) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_GetKey fail.");
        return result;
    }

    returnValue = OH_PrivateCommand_SetBoolValue(privateCommand, true);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetBoolValue successful.");
        return result;
    }

    bool actBoolValue = false;
    returnValue = OH_PrivateCommand_GetBoolValue(privateCommand, &actBoolValue);
    if (actBoolValue != true) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_GetBoolValue fail.");
        return result;
    }

    returnValue = OH_PrivateCommand_SetIntValue(privateCommand, 0);
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetIntValue successful.");
        return result;
    }

    int32_t actIntValue = 5;
    returnValue = OH_PrivateCommand_GetIntValue(privateCommand, &actIntValue);
    if (actIntValue != 0) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_GetIntValue fail.");
        return result;
    }

    std::string extStrValue = "testString";
    returnValue =
        OH_PrivateCommand_SetStrValue(privateCommand, const_cast<char *>(extStrValue.c_str()), extStrValue.length());
    if (returnValue == InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_SetStrValue successful.");
        return result;
    }

    const char *actStrValue = nullptr;
    size_t actStrValueLength = 0;
    returnValue = OH_PrivateCommand_GetStrValue(privateCommand, &actStrValue, &actStrValueLength);
    if (actStrValue != extStrValue) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>NDKTest====>OH_PrivateCommand_GetStrValue fail.");
        return result;
    }

    InputMethod_CommandValueType valueType = IME_COMMAND_VALUE_TYPE_INT32;
    OH_PrivateCommand_GetValueType(privateCommand, &valueType);
    if (valueType != IME_COMMAND_VALUE_TYPE_STRING) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_GetBoolValue fail.");
        return result;
    }

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_PrivateCommand_GetValueType fail.");
    return result;
}

static napi_value SUB_IMF_NDK_TextAvoidInfo_Create_0100(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    g_textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    double actPositionY = 0.0;
    double actHeight = 0.0;
    InputMethod_ErrorCode returnValue = OH_TextAvoidInfo_SetPositionY(g_textAvoidInfo, expPositionY);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextAvoidInfo_SetPositionY fail.");
        return result;
    }

    returnValue = OH_TextAvoidInfo_SetHeight(g_textAvoidInfo, expHeight);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextAvoidInfo_SetHeight fail.");
        return result;
    }

    returnValue = OH_TextAvoidInfo_GetPositionY(g_textAvoidInfo, &actPositionY);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextAvoidInfo_GetPositionY fail.");
        return result;
    }
    if (actPositionY != expPositionY) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>NDKTest====>expect != actual fail.");
        return result;
    }

    returnValue = OH_TextAvoidInfo_GetHeight(g_textAvoidInfo, &actHeight);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextAvoidInfo_GetHeight fail.");
        return result;
    }
    if (actHeight != expHeight) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>NDKTest====>expect != actual fail.");
        return result;
    }

    OH_TextAvoidInfo_Destroy(g_textAvoidInfo);

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SUB_IMF_NDK_TextAvoidInfo_Create_0100 successful.");
    return result;
}

static napi_value SUB_IMF_NDK_TextConfig_Create_0100(napi_env env, napi_callback_info info)
{
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType expInputType = IME_TEXT_INPUT_TYPE_NUMBER_DECIMAL;
    InputMethod_TextInputType actInputType = IME_TEXT_INPUT_TYPE_NONE;
    InputMethod_EnterKeyType expEnterKeyType = IME_ENTER_KEY_UNSPECIFIED;
    InputMethod_EnterKeyType actEnterKeyType = IME_ENTER_KEY_NONE;

    InputMethod_ErrorCode returnValue = OH_TextConfig_SetInputType(config, expInputType);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetInputType fail.");
        return result;
    }
    returnValue = OH_TextConfig_GetInputType(config, &actInputType);
    if (actInputType != expInputType) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetInputType fail.");
        return result;
    }

    returnValue = OH_TextConfig_SetEnterKeyType(config, expEnterKeyType);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetEnterKeyType fail.");
        return result;
    }
    returnValue = OH_TextConfig_GetEnterKeyType(config, &actEnterKeyType);
    if (actEnterKeyType != expEnterKeyType) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>expect != actual fail.");
        return result;
    }

    returnValue = OH_TextConfig_SetPreviewTextSupport(config, true);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetPreviewTextSupport fail.");
        return result;
    }
    bool isPreviewTextSupported = false;
    returnValue = OH_TextConfig_IsPreviewTextSupported(config, &isPreviewTextSupported);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_IsPreviewTextSupported fail.");
        return result;
    }
    if (isPreviewTextSupported != true) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_SendPrivateCommand fail.");
        return result;
    }

    int32_t expStart = 1;
    int32_t expEnd = 2;
    returnValue = OH_TextConfig_SetSelection(config, expStart, expEnd);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetSelection fail.");
        return result;
    }
    int32_t actStart = 0;
    int32_t actEnd = 0;
    returnValue = OH_TextConfig_GetSelection(config, &actStart, &actEnd);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetSelection fail.");
        return result;
    }
    if (actStart != expStart or actEnd != expEnd) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>expect != actual fail.");
        return result;
    }

    int32_t expWindowId = 1;
    returnValue = OH_TextConfig_SetWindowId(config, expWindowId);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetWindowId fail.");
        return result;
    }
    int32_t actWindowId = 2;
    returnValue = OH_TextConfig_GetWindowId(config, &actWindowId);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetWindowId fail.");
        return result;
    }
    if (actWindowId != expWindowId) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_InputMethodProxy_SendPrivateCommand fail.");
        return result;
    }

    InputMethod_CursorInfo *cursorInfo = nullptr;
    returnValue = OH_TextConfig_GetCursorInfo(config, &cursorInfo);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetCursorInfo fail.");
        return result;
    }

    double expPositionY = 20;
    double expHeight = 20;
    g_textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    returnValue = OH_TextConfig_GetTextAvoidInfo(config, &g_textAvoidInfo);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetCursorInfo fail.");
        return result;
    }

    const char16_t *expPlaceholder = u"abcdef";
    size_t expPlaceholderLength = 3;
    returnValue = OH_TextConfig_SetPlaceholder(config, expPlaceholder, expPlaceholderLength);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetPlaceholder fail.");
        return result;
    }
    char16_t actPlaceholder[5];
    size_t actPlaceholderLength = 4;
    returnValue = OH_TextConfig_GetPlaceholder(config, actPlaceholder, &actPlaceholderLength);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetPlaceholder fail.");
        return result;
    }

    const char16_t *expAbilityName = u"abcdef";
    size_t expAbilityNameLength = 3;
    returnValue = OH_TextConfig_SetAbilityName(config, expAbilityName, expAbilityNameLength);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_SetAbilityName fail.");
        return result;
    }
    char16_t actAbilityName[5];
    size_t actAbilityNameLength = 4;
    returnValue = OH_TextConfig_GetAbilityName(config, actAbilityName, &actAbilityNameLength);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextConfig_GetAbilityName fail.");
        return result;
    }

    OH_TextConfig_Destroy(config);

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SUB_IMF_NDK_TextConfig_Create_0100 successful.");
    return result;
}

static napi_value SUB_IMF_NDK_TextEditorProxy_Get_0100(napi_env env, napi_callback_info info)
{
    TextEditorProxy_Create();
    OH_TextEditorProxy_GetTextConfigFunc getTextConfigFunc = nullptr;
    InputMethod_ErrorCode returnValue = OH_TextEditorProxy_GetGetTextConfigFunc(g_txtEditProxy, &getTextConfigFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetGetTextConfigFunc fail.");
        return result;
    }

    OH_TextEditorProxy_InsertTextFunc insertTextFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetInsertTextFunc(g_txtEditProxy, &insertTextFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetInsertTextFunc fail.");
        return result;
    }

    OH_TextEditorProxy_DeleteForwardFunc deleteForwardFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetDeleteForwardFunc(g_txtEditProxy, &deleteForwardFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetDeleteForwardFunc fail.");
        return result;
    }

    OH_TextEditorProxy_DeleteBackwardFunc deleteBackwardFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetDeleteBackwardFunc(g_txtEditProxy, &deleteBackwardFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetDeleteBackwardFunc fail.");
        return result;
    }

    OH_TextEditorProxy_SendKeyboardStatusFunc sendKeyboardStatusFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetSendKeyboardStatusFunc(g_txtEditProxy, &sendKeyboardStatusFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetSendKeyboardStatusFunc fail.");
        return result;
    }

    OH_TextEditorProxy_SendEnterKeyFunc sendEnterKeyFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetSendEnterKeyFunc(g_txtEditProxy, &sendEnterKeyFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetSendEnterKeyFunc fail.");
        return result;
    }

    OH_TextEditorProxy_MoveCursorFunc moveCursorFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetMoveCursorFunc(g_txtEditProxy, &moveCursorFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetMoveCursorFunc fail.");
        return result;
    }

    OH_TextEditorProxy_HandleSetSelectionFunc handleSetSelectionFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetHandleSetSelectionFunc(g_txtEditProxy, &handleSetSelectionFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetHandleSetSelectionFunc fail.");
        return result;
    }

    OH_TextEditorProxy_HandleExtendActionFunc handleExtendActionFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetHandleExtendActionFunc(g_txtEditProxy, &handleExtendActionFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetHandleExtendActionFunc fail.");
        return result;
    }

    OH_TextEditorProxy_GetLeftTextOfCursorFunc getLeftTextOfCursorFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetGetLeftTextOfCursorFunc(g_txtEditProxy, &getLeftTextOfCursorFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetGetLeftTextOfCursorFunc fail.");
        return result;
    }

    OH_TextEditorProxy_GetRightTextOfCursorFunc getRightTextOfCursorFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetGetRightTextOfCursorFunc(g_txtEditProxy, &getRightTextOfCursorFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetGetRightTextOfCursorFunc fail.");
        return result;
    }

    OH_TextEditorProxy_GetTextIndexAtCursorFunc getTextIndexAtCursorFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetGetTextIndexAtCursorFunc(g_txtEditProxy, &getTextIndexAtCursorFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetGetTextIndexAtCursorFunc fail.");
        return result;
    }

    OH_TextEditorProxy_ReceivePrivateCommandFunc receivePrivateCommandFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetReceivePrivateCommandFunc(g_txtEditProxy, &receivePrivateCommandFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetReceivePrivateCommandFunc fail.");
        return result;
    }

    OH_TextEditorProxy_SetPreviewTextFunc setPreviewTextFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetSetPreviewTextFunc(g_txtEditProxy, &setPreviewTextFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetSetPreviewTextFunc fail.");
        return result;
    }

    OH_TextEditorProxy_FinishTextPreviewFunc finishTextPreviewFunc = nullptr;
    returnValue = OH_TextEditorProxy_GetFinishTextPreviewFunc(g_txtEditProxy, &finishTextPreviewFunc);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_TextEditorProxy_GetFinishTextPreviewFunc fail.");
        return result;
    }

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SUB_IMF_NDK_TextEditorProxy_Get_0100 successful.");
    return result;
}

static napi_value SUB_IMF_NDK_CursorInfo_Create_0100(napi_env env, napi_callback_info info)
{
    double expLeft = 1.1;
    double expTop = 2.2;
    double expWidth = 3.3;
    double expHeight = 4.4;
    auto cursorInfo = OH_CursorInfo_Create(expLeft, expTop, expWidth, expHeight);
    double actLeft = 0;
    double actTop = 0;
    double actWidth = 0;
    double actHeight = 0;
    InputMethod_ErrorCode returnValue = OH_CursorInfo_SetRect(cursorInfo, actLeft, actTop, actWidth, actHeight);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_CursorInfo_SetRect fail.");
        return result;
    }

    returnValue = OH_CursorInfo_GetRect(cursorInfo, &actLeft, &actTop, &actWidth, &actHeight);
    if (returnValue != InputMethod_ErrorCode::IME_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>OH_CursorInfo_GetRect fail.");
        return result;
    }
    if (actLeft != 0.0 or actTop != 0.0 or actWidth != 0.0 or actHeight != 0.0) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "NDKTest====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 fail.");
        return result;
    }
    OH_CursorInfo_Destroy(cursorInfo);

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "OK", NAPI_AUTO_LENGTH, &result));
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                 "NDKTest====>SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100 successful.");
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"SUB_IMF_NDK_AttachOptions_Create_0100", nullptr, SUB_IMF_NDK_AttachOptions_Create_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodController_Attach_0100", nullptr, SUB_IMF_NDK_InputMethodController_Attach_0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodController_Detach_0100", nullptr, SUB_IMF_NDK_InputMethodController_Detach_0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100", nullptr, SUB_IMF_NDK_InputMethodProxy_ShowKeyboard_0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100", nullptr, SUB_IMF_NDK_InputMethodProxy_HideKeyboard_0100,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100", nullptr,
         SUB_IMF_NDK_InputMethodProxy_NotifySelectionChange_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100", nullptr,
         SUB_IMF_NDK_InputMethodProxy_NotifyConfigurationChange_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100", nullptr,
         SUB_IMF_NDK_InputMethodProxy_NotifyCursorUpdate_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100", nullptr,
         SUB_IMF_NDK_InputMethodProxy_SendPrivateCommand_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_PrivateCommand_SetKey_0100", nullptr, SUB_IMF_NDK_PrivateCommand_SetKey_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_TextAvoidInfo_Create_0100", nullptr, SUB_IMF_NDK_TextAvoidInfo_Create_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_TextConfig_Create_0100", nullptr, SUB_IMF_NDK_TextConfig_Create_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SUB_IMF_NDK_TextEditorProxy_Get_0100", nullptr, SUB_IMF_NDK_TextEditorProxy_Get_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_CursorInfo_Create_0100", nullptr, SUB_IMF_NDK_CursorInfo_Create_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodController_Attach_MOUSE", nullptr,
         SUB_IMF_NDK_InputMethodController_Attach_MOUSE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodController_Attach_TOUCH", nullptr,
         SUB_IMF_NDK_InputMethodController_Attach_TOUCH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodController_Attach_NONE", nullptr,
         SUB_IMF_NDK_InputMethodController_Attach_NONE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE", nullptr,
         SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_NONE, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE", nullptr,
         SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_MOUSE, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH", nullptr,
         SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_TOUCH, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER", nullptr,
         SUB_IMF_NDK_AttachOptions_CreateWithRequestKeyboardReason_OTHER, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE", nullptr,
         SUB_IMF_NDK_InputMethodProxy_ShowTextInput_NONE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE", nullptr,
         SUB_IMF_NDK_InputMethodProxy_ShowTextInput_MOUSE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH", nullptr,
         SUB_IMF_NDK_InputMethodProxy_ShowTextInput_TOUCH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER", nullptr,
         SUB_IMF_NDK_InputMethodProxy_ShowTextInput_OTHER, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
