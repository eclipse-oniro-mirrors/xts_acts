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

#include "InputmethodTypesCapiTest.h"
#include "napi/native_api.h"
#include "string"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_text_avoid_info_capi.h>
#include  <inputmethod/inputmethod_text_editor_proxy_capi.h>
#include <napi/native_api.h>

void AddInputmethodTypesCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testImeKeyBoardStatusNone", nullptr, TestImeKeyBoardStatusNone, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeKeyBoardStatusHide", nullptr, TestImeKeyBoardStatusHide, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeKeyBoardStatusShow", nullptr, TestImeKeyBoardStatusShow, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testImeEnterKeyGo", nullptr, TestImeEnterKeyGo, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeEnterKeySearch", nullptr, TestImeEnterKeySearch, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeEnterKeyNext", nullptr, TestImeEnterKeyNext, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeEnterKeyDone", nullptr, TestImeEnterKeyDone, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testImeEnterKeyPrevious", nullptr, TestImeEnterKeyPrevious, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testImeEnterKeyNewline", nullptr, TestImeEnterKeyNewline, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeErrDetached", nullptr, TestImeErrDetached, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeErrNullPointer", nullptr, TestImeErrNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeErrQueryFailed", nullptr, TestImeErrQueryFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testImeErrParamcheck", nullptr, TestImeErrParamcheck, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeMultiline", nullptr, TestImeTextInputTypeMultiline, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeNumber", nullptr, TestImeTextInputTypeNumber, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeTextInputTypePhone", nullptr, TestImeTextInputTypePhone, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeDatetime", nullptr, TestImeTextInputTypeDatetime, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeAddress", nullptr, TestImeTextInputTypeAddress, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeUrl", nullptr, TestImeTextInputTypeUrl, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeVisiblePassword", nullptr, TestImeTextInputTypeVisiblePassword, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeNumberPassword", nullptr, TestImeTextInputTypeNumberPassword, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
}

void AddInputmethodTypesCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testImeTextInputTypeScreenLockPassword", nullptr, TestImeTextInputTypeScreenLockPassword,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeUserName", nullptr, TestImeTextInputTypeUserName, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeNewPassword", nullptr, TestImeTextInputTypeNewPassword, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeTextInputTypeOneTimeCode", nullptr, TestImeTextInputTypeOneTimeCode, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeCommandValueTypeNone", nullptr, TestImeCommandValueTypeNone, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeCommandValueTypeBool", nullptr, TestImeCommandValueTypeBool, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeDirectionUp", nullptr, TestImeDirectionUp, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeDirectionDown", nullptr, TestImeDirectionDown, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeDirectionLeft", nullptr, TestImeDirectionLeft, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeDirectionRight", nullptr, TestImeDirectionRight, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeExtendAction", nullptr, TestImeExtendAction, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeExtendActionSelectAll", nullptr, TestImeExtendActionSelectAll, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeExtendActionCut", nullptr, TestImeExtendActionCut, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeExtendActionCopy", nullptr, TestImeExtendActionCopy, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testImeExtendActionPaste", nullptr, TestImeExtendActionPaste, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

void AddInputmethodTypesCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputmethodTypesCapiTest1(descData);
    AddInputmethodTypesCapiTest2(descData);
}

InputMethod_TextEditorProxy *g_txtEditProxy2 = nullptr;
InputMethod_InputMethodProxy *g_inputMethodProxy2 = nullptr;
InputMethod_PrivateCommand *g_privateCommand2 = nullptr;
InputMethod_CursorInfo *g_cursorInfo2 = nullptr;
InputMethod_TextAvoidInfo *g_textAvoidInfo2 = nullptr;
InputMethod_AttachOptions *g_options2 = nullptr;
int g_handleExtendActionSelectAll = -1;
int g_handleExtendActionCut = -1;
int g_handleExtendActionCopy = -1;
int g_handleExtendActionPaste = -1;

void GetTextConfigFunc3(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_TextConfig *config)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "====NDKTest====>GetTextConfigFunc3 successful.");
}

void InsertTextFunc3(InputMethod_TextEditorProxy *textEditorProxy, const char16_t *text, size_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "====NDKTest====>InsertTextFunc3 successful.");
}

void DeleteForwardFunc3(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteForwardFunc3 successful.");
}

void DeleteBackwardFunc3(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteBackwardFunc3 successful.");
}

void SendKeyboardStatusFunc3(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_KeyboardStatus keyboardStatus)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "====NDKTest====>SendKeyboardStatusFunc3 successful.");
    if (keyboardStatus == InputMethod_KeyboardStatus::IME_KEYBOARD_STATUS_NONE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>SendKeyboardStatusFunc3 status IME_KEYBOARD_STATUS_NONE.");
    }
    if (keyboardStatus == InputMethod_KeyboardStatus::IME_KEYBOARD_STATUS_HIDE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>SendKeyboardStatusFunc3 status IME_KEYBOARD_STATUS_HIDE.");
    }
    if (keyboardStatus == InputMethod_KeyboardStatus::IME_KEYBOARD_STATUS_SHOW) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>SendKeyboardStatusFunc3 status IME_KEYBOARD_STATUS_SHOW.");
    }
}

void SendEnterKeyFunc3(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_EnterKeyType enterKeyType)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "======NDKTest====>== successful.");
}

void MoveCursorFunc3(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_Direction direction)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>MoveCursorFunc3 successful.");
    if (direction == InputMethod_Direction::IME_DIRECTION_UP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>MoveCursorFunc3 status IME_DIRECTION_UP.");
    }
    if (direction == InputMethod_Direction::IME_DIRECTION_DOWN) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>MoveCursorFunc3 status IME_DIRECTION_DOWN.");
    }
    if (direction == InputMethod_Direction::IME_DIRECTION_LEFT) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>MoveCursorFunc3 status IME_DIRECTION_LEFT.");
    }
    if (direction == InputMethod_Direction::IME_DIRECTION_RIGHT) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>MoveCursorFunc3 status IME_DIRECTION_RIGHT.");
    }
}

void HandleSetSelectionFunc3(InputMethod_TextEditorProxy *textEditorProxy, int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleSetSelectionFunc3 successful.");
}

void HandleExtendActionFunc3(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_ExtendAction action)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleExtendActionFunc3 successful. %{public}d", action);
    if (action == InputMethod_ExtendAction::IME_EXTEND_ACTION_SELECT_ALL) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>HandleExtendActionFunc3 action IME_EXTEND_ACTION_SELECT_ALL.");
        g_handleExtendActionSelectAll = 0;
    }
    if (action == InputMethod_ExtendAction::IME_EXTEND_ACTION_CUT) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>HandleExtendActionFunc3 action IME_EXTEND_ACTION_CUT.");
        g_handleExtendActionCut = 0;
    }
    if (action == InputMethod_ExtendAction::IME_EXTEND_ACTION_COPY) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>HandleExtendActionFunc3 action IME_EXTEND_ACTION_COPY.");
        g_handleExtendActionCopy = 0;
    }
    if (action == InputMethod_ExtendAction::IME_EXTEND_ACTION_PASTE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "",
                     "====NDKTest====>HandleExtendActionFunc3 action IME_EXTEND_ACTION_PASTE.");
        g_handleExtendActionPaste = 0;
    }
}

void GetLeftTextOfCursorFunc3(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                              size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetLeftTextOfCursorFunc3 successful.");
}

void GetRightTextOfCursorFunc3(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                               size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetRightTextOfCursorFunc3 successful.");
}

int32_t GetTextIndexAtCursorFunc3(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextIndexAtCursorFunc3 successful.");
    return 0;
}

int32_t ReceivePrivateCommandFunc3(InputMethod_TextEditorProxy *textEditorProxy,
                                   InputMethod_PrivateCommand *privateCommand[], size_t size)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>ReceivePrivateCommandFunc3 successful.");
    return 0;
}

int32_t SetPreviewTextFunc3(InputMethod_TextEditorProxy *textEditorProxy, const char16_t text[], size_t length,
                            int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SetPreviewTextFunc3 successful.");
    return 0;
}

void FinishTextPreviewFunc3(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>FinishTextPreviewFunc3 successful.");
}

void TextEditorProxyCreate3()
{
    if (g_txtEditProxy2 == nullptr) {
        g_txtEditProxy2 = OH_TextEditorProxy_Create();
        OH_TextEditorProxy_SetGetTextConfigFunc(g_txtEditProxy2, GetTextConfigFunc3);
        OH_TextEditorProxy_SetInsertTextFunc(g_txtEditProxy2, InsertTextFunc3);
        OH_TextEditorProxy_SetDeleteForwardFunc(g_txtEditProxy2, DeleteForwardFunc3);
        OH_TextEditorProxy_SetDeleteBackwardFunc(g_txtEditProxy2, DeleteBackwardFunc3);
        OH_TextEditorProxy_SetSendKeyboardStatusFunc(g_txtEditProxy2, SendKeyboardStatusFunc3);
        OH_TextEditorProxy_SetSendEnterKeyFunc(g_txtEditProxy2, SendEnterKeyFunc3);
        OH_TextEditorProxy_SetMoveCursorFunc(g_txtEditProxy2, MoveCursorFunc3);
        OH_TextEditorProxy_SetHandleSetSelectionFunc(g_txtEditProxy2, HandleSetSelectionFunc3);
        OH_TextEditorProxy_SetHandleExtendActionFunc(g_txtEditProxy2, HandleExtendActionFunc3);
        OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(g_txtEditProxy2, GetLeftTextOfCursorFunc3);
        OH_TextEditorProxy_SetGetRightTextOfCursorFunc(g_txtEditProxy2, GetRightTextOfCursorFunc3);
        OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(g_txtEditProxy2, GetTextIndexAtCursorFunc3);
        OH_TextEditorProxy_SetReceivePrivateCommandFunc(g_txtEditProxy2, ReceivePrivateCommandFunc3);
        OH_TextEditorProxy_SetSetPreviewTextFunc(g_txtEditProxy2, SetPreviewTextFunc3);
        OH_TextEditorProxy_SetFinishTextPreviewFunc(g_txtEditProxy2, FinishTextPreviewFunc3);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>TextEditorProxy_Create successful.");
    }
}

napi_value TestImeKeyBoardStatusNone(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    int ret = OH_InputMethodProxy_ShowKeyboard(inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeKeyBoardStatusHide(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    int ret = OH_InputMethodProxy_HideKeyboard(inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeKeyBoardStatusShow(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    int ret = OH_InputMethodProxy_ShowKeyboard(inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeyGo(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_GO;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_GO) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeySearch(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_SEARCH;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_SEARCH) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeyNext(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_NEXT;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_NEXT) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeyDone(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_DONE;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_DONE) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeyPrevious(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_PREVIOUS;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_PREVIOUS) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeEnterKeyNewline(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_EnterKeyType enterKeyType = IME_ENTER_KEY_NEWLINE;
    OH_TextConfig_SetEnterKeyType(config, enterKeyType);
    InputMethod_EnterKeyType expEnterKeyType;
    OH_TextConfig_GetEnterKeyType(config, &expEnterKeyType);
    if (expEnterKeyType == InputMethod_EnterKeyType::IME_ENTER_KEY_NEWLINE) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeErrDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    OH_InputMethodController_Detach(inputMethodProxy);
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(100, 200, 300, 400);
    int ret = OH_InputMethodProxy_NotifyCursorUpdate(inputMethodProxy, cursorInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestImeErrNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = nullptr;
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Attach(proxy, options, &inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestImeErrQueryFailed(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue";
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand2, const_cast<char *>(valStr1.c_str()), valStr1.length());
    bool type = false;
    int ret = OH_PrivateCommand_GetBoolValue(keyCommand2, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_QUERY_FAILED ? 0 : -1, &result);
    return result;
}

napi_value TestImeErrParamcheck(napi_env env, napi_callback_info info)
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

napi_value TestImeTextInputTypeMultiline(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_MULTILINE;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_MULTILINE) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeNumber(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_NUMBER) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypePhone(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_PHONE;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_PHONE) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeDatetime(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_DATETIME;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_DATETIME) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeAddress(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_EMAIL_ADDRESS;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_EMAIL_ADDRESS) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeUrl(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_URL;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_URL) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeVisiblePassword(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_VISIBLE_PASSWORD;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_VISIBLE_PASSWORD) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeNumberPassword(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NUMBER_PASSWORD;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_NUMBER_PASSWORD) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeScreenLockPassword(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_SCREEN_LOCK_PASSWORD;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_SCREEN_LOCK_PASSWORD) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeUserName(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_USER_NAME;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_USER_NAME) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeNewPassword(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_NEW_PASSWORD;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_NEW_PASSWORD) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeTextInputTypeOneTimeCode(napi_env env, napi_callback_info info)
{
    int ret = -1;
    InputMethod_TextConfig *config = OH_TextConfig_Create();
    InputMethod_TextInputType inputType = IME_TEXT_INPUT_TYPE_ONE_TIME_CODE;
    OH_TextConfig_SetInputType(config, inputType);
    InputMethod_TextInputType expInputType;
    OH_TextConfig_GetInputType(config, &expInputType);
    if (expInputType == InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_ONE_TIME_CODE) {
        ret = 0;
    }
    OH_TextConfig_Destroy(config);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeCommandValueTypeNone(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    InputMethod_PrivateCommand *keyCommand = nullptr;
    keyCommand = OH_PrivateCommand_Create((char*)keyStr1.c_str(), keyStr1.size());
    InputMethod_CommandValueType type = IME_COMMAND_VALUE_TYPE_NONE;
    int ret = OH_PrivateCommand_GetValueType(keyCommand, &type);
    OH_PrivateCommand_Destroy(keyCommand);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeCommandValueTypeBool(napi_env env, napi_callback_info info)
{
    std::string keyStr = "testKey_1";
    bool valStr = true;
    InputMethod_PrivateCommand *keyCommand = nullptr;
    keyCommand = OH_PrivateCommand_Create(const_cast<char *>(keyStr.c_str()), keyStr.length());
    OH_PrivateCommand_SetBoolValue(keyCommand, valStr);
    InputMethod_CommandValueType type;
    OH_PrivateCommand_GetValueType(keyCommand, &type);
    OH_PrivateCommand_Destroy(keyCommand);
    napi_value result;
    napi_create_int32(env, type == InputMethod_CommandValueType::IME_COMMAND_VALUE_TYPE_BOOL ? 0 : -1, &result);
    return result;
}

napi_value TestImeDirectionUp(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeDirectionDown(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeDirectionLeft(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeDirectionRight(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    int ret = OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestImeExtendAction(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate3();
    InputMethod_AttachOptions *options = OH_AttachOptions_Create(true);
    InputMethod_InputMethodProxy *inputMethodProxy = nullptr;
    OH_InputMethodController_Attach(g_txtEditProxy2, options, &inputMethodProxy);
    return nullptr;
}

napi_value TestImeExtendActionSelectAll(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_handleExtendActionSelectAll, &result);
    return result;
}

napi_value TestImeExtendActionCut(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_handleExtendActionCut, &result);
    return result;
}

napi_value TestImeExtendActionCopy(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_handleExtendActionCopy, &result);
    return result;
}

napi_value TestImeExtendActionPaste(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, g_handleExtendActionPaste, &result);
    return result;
}