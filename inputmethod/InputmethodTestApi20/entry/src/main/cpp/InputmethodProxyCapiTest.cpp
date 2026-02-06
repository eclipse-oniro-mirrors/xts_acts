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
#include "InputmethodProxyCapiTest.h"
#include "string"
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <napi/native_api.h>

void AddInputMethodProxyCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhInputMethodProxyShowKeyboardNullPointer", nullptr,
                        TestOhInputMethodProxyShowKeyboardNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyShowKeyboardDetached", nullptr,
                        TestOhInputMethodProxyShowKeyboardDetached, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyShowTextInputNullPointer", nullptr,
                        TestOhInputMethodProxyShowTextInputNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyShowTextInputDetached", nullptr,
                        TestOhInputMethodProxyShowTextInputDetached, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyHideKeyboardNullPointer", nullptr,
                        TestOhInputMethodProxyHideKeyboardNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyHideKeyboardDetached", nullptr,
                        TestOhInputMethodProxyHideKeyboardDetached, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyNotifySelectionChangeNullPointer", nullptr,
                        TestOhInputMethodProxyNotifySelectionChangeNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyNotifySelectionChangeDetached", nullptr,
                        TestOhInputMethodProxyNotifySelectionChangeDetached, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyNotifySelectionChangeParamCheckError", nullptr,
                        TestOhInputMethodProxyNotifySelectionChangeParamCheckError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

void AddInputMethodProxyCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhInputMethodProxyNotifyConfigurationChangeNullPointer", nullptr,
                        TestOhInputMethodProxyNotifyConfigurationChangeNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyNotifyConfigurationChangeDetached", nullptr,
                        TestOhInputMethodProxyNotifyConfigurationChangeDetached, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyNotifyConfigurationChangeParamCheckError", nullptr,
                        TestOhInputMethodProxyNotifyConfigurationChangeParamCheckError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxyNotifyCursorUpdateNullPointer", nullptr,
                        TestOhInputMethodProxyNotifyCursorUpdateNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyNotifyCursorUpdateDetached", nullptr,
                        TestOhInputMethodProxyNotifyCursorUpdateDetached, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxyNotifyCursorUpdateParamCheckError", nullptr,
                        TestOhInputMethodProxyNotifyCursorUpdateParamCheckError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhInputMethodProxySendPrivateCommandNullPointer", nullptr,
                        TestOhInputMethodProxySendPrivateCommandNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxySendPrivateCommandDetached", nullptr,
                        TestOhInputMethodProxySendPrivateCommandDetached, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhInputMethodProxySendPrivateCommandParamCheckError", nullptr,
                        TestOhInputMethodProxySendPrivateCommandParamCheckError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

void AddInputMethodProxyCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputMethodProxyCapiTest1(descData);
    AddInputMethodProxyCapiTest2(descData);
}

InputMethod_TextEditorProxy *g_txtEditProxy1 = nullptr;
InputMethod_InputMethodProxy *g_inputMethodProxy1 = nullptr;
InputMethod_PrivateCommand *g_privateCommand1 = nullptr;
InputMethod_CursorInfo *g_cursorInfo1 = nullptr;
InputMethod_TextAvoidInfo *g_textAvoidInfo1 = nullptr;
InputMethod_AttachOptions *g_options1 = nullptr;

void GetTextConfigFunc1(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_TextConfig *config)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextConfigFunc successful.");
}

void InsertTextFunc1(InputMethod_TextEditorProxy *textEditorProxy, const char16_t *text, size_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>InsertTextFunc successful.");
}

void DeleteForwardFunc1(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteForwardFunc successful.");
}

void DeleteBackwardFunc1(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteBackwardFunc successful.");
}

void SendKeyboardStatusFunc1(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_KeyboardStatus keyboardStatus)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendKeyboardStatusFunc successful.");
}

void SendEnterKeyFunc1(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_EnterKeyType enterKeyType)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendEnterKeyFunc successful.");
}

void MoveCursorFunc1(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_Direction direction)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>MoveCursorFunc successful.");
}

void HandleSetSelectionFunc1(InputMethod_TextEditorProxy *textEditorProxy, int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleSetSelectionFunc successful.");
}

void HandleExtendActionFunc1(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_ExtendAction action)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleExtendActionFunc successful.");
}

void GetLeftTextOfCursorFunc1(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                              size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetLeftTextOfCursorFunc successful.");
}

void GetRightTextOfCursorFunc1(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                               size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetRightTextOfCursorFunc successful.");
}

int32_t GetTextIndexAtCursorFunc1(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextIndexAtCursorFunc successful.");
    return 0;
}

int32_t ReceivePrivateCommandFunc1(InputMethod_TextEditorProxy *textEditorProxy,
                                   InputMethod_PrivateCommand *privateCommand[], size_t size)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>ReceivePrivateCommandFunc successful.");
    return 0;
}

int32_t SetPreviewTextFunc1(InputMethod_TextEditorProxy *textEditorProxy, const char16_t text[], size_t length,
                            int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SetPreviewTextFunc successful.");
    return 0;
}

void FinishTextPreviewFunc1(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>FinishTextPreviewFunc successful.");
}

void TextEditorProxyCreate1()
{
    if (g_txtEditProxy1 == nullptr) {
        g_txtEditProxy1 = OH_TextEditorProxy_Create();
        OH_TextEditorProxy_SetGetTextConfigFunc(g_txtEditProxy1, GetTextConfigFunc1);
        OH_TextEditorProxy_SetInsertTextFunc(g_txtEditProxy1, InsertTextFunc1);
        OH_TextEditorProxy_SetDeleteForwardFunc(g_txtEditProxy1, DeleteForwardFunc1);
        OH_TextEditorProxy_SetDeleteBackwardFunc(g_txtEditProxy1, DeleteBackwardFunc1);
        OH_TextEditorProxy_SetSendKeyboardStatusFunc(g_txtEditProxy1, SendKeyboardStatusFunc1);
        OH_TextEditorProxy_SetSendEnterKeyFunc(g_txtEditProxy1, SendEnterKeyFunc1);
        OH_TextEditorProxy_SetMoveCursorFunc(g_txtEditProxy1, MoveCursorFunc1);
        OH_TextEditorProxy_SetHandleSetSelectionFunc(g_txtEditProxy1, HandleSetSelectionFunc1);
        OH_TextEditorProxy_SetHandleExtendActionFunc(g_txtEditProxy1, HandleExtendActionFunc1);
        OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(g_txtEditProxy1, GetLeftTextOfCursorFunc1);
        OH_TextEditorProxy_SetGetRightTextOfCursorFunc(g_txtEditProxy1, GetRightTextOfCursorFunc1);
        OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(g_txtEditProxy1, GetTextIndexAtCursorFunc1);
        OH_TextEditorProxy_SetReceivePrivateCommandFunc(g_txtEditProxy1, ReceivePrivateCommandFunc1);
        OH_TextEditorProxy_SetSetPreviewTextFunc(g_txtEditProxy1, SetPreviewTextFunc1);
        OH_TextEditorProxy_SetFinishTextPreviewFunc(g_txtEditProxy1, FinishTextPreviewFunc1);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>TextEditorProxy_Create successful.");
    }
}

void AttachOptionsCreate1(bool showKeyboard)
{
    g_options1 = OH_AttachOptions_Create(showKeyboard);
}

napi_value TestOhInputMethodProxyShowKeyboardNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(false);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_ShowKeyboard(nullptr);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyShowKeyboardDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(false);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_ShowKeyboard(g_inputMethodProxy1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyShowTextInputNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    InputMethod_AttachOptions *options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_NONE);
    OH_InputMethodController_Attach(g_txtEditProxy1, options, &g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_ShowTextInput(nullptr, options);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyShowTextInputDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    InputMethod_AttachOptions *options = OH_AttachOptions_CreateWithRequestKeyboardReason(
        true, InputMethod_RequestKeyboardReason::IME_REQUEST_REASON_NONE);
    OH_InputMethodController_Attach(g_txtEditProxy1, options, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_ShowTextInput(g_inputMethodProxy1, options);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyHideKeyboardNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_HideKeyboard(nullptr);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyHideKeyboardDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    int ret = OH_InputMethodProxy_HideKeyboard(g_inputMethodProxy1);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifySelectionChangeNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    char16_t text[] = u"TestValue";
    int ret = OH_InputMethodProxy_NotifySelectionChange(nullptr, text, 9, 1, 3);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifySelectionChangeDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    char16_t text[] = u"TestValue";
    int ret = OH_InputMethodProxy_NotifySelectionChange(g_inputMethodProxy1, text, 9, 1, 3);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifySelectionChangeParamCheckError(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    char16_t text[] = u"TestValue";
    int ret = OH_InputMethodProxy_NotifySelectionChange(g_inputMethodProxy1, text, 8193, 1, 3);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyConfigurationChangeNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    InputMethod_EnterKeyType enterKey = IME_ENTER_KEY_UNSPECIFIED;
    InputMethod_TextInputType textType = IME_TEXT_INPUT_TYPE_NONE;
    int ret = OH_InputMethodProxy_NotifyConfigurationChange(nullptr, enterKey, textType);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyConfigurationChangeDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    InputMethod_EnterKeyType enterKey = IME_ENTER_KEY_UNSPECIFIED;
    InputMethod_TextInputType textType = IME_TEXT_INPUT_TYPE_NONE;
    int ret = OH_InputMethodProxy_NotifyConfigurationChange(g_inputMethodProxy1, enterKey, textType);
    OH_AttachOptions_Destroy(g_options1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyConfigurationChangeParamCheckError(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    int64_t dataLength = 64;
    InputMethod_InputMethodProxy *tempProxy =
        static_cast<InputMethod_InputMethodProxy *>(malloc(dataLength));
    InputMethod_EnterKeyType enterKey = IME_ENTER_KEY_UNSPECIFIED;
    InputMethod_TextInputType textType = IME_TEXT_INPUT_TYPE_NONE;
    int ret = OH_InputMethodProxy_NotifyConfigurationChange(tempProxy, enterKey, textType);
    OH_AttachOptions_Destroy(g_options1);
    free(tempProxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyCursorUpdateNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    double left = 100;
    double top = 200;
    double width = 300;
    double height = 400;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    int ret = OH_InputMethodProxy_NotifyCursorUpdate(nullptr, cursorInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyCursorUpdateDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    double left = 100;
    double top = 200;
    double width = 300;
    double height = 400;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    int ret = OH_InputMethodProxy_NotifyCursorUpdate(g_inputMethodProxy1, cursorInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxyNotifyCursorUpdateParamCheckError(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    int64_t dataLength = 64;
    InputMethod_InputMethodProxy *tempProxy =
        static_cast<InputMethod_InputMethodProxy *>(malloc(dataLength));
    double left = 100;
    double top = 200;
    double width = 300;
    double height = 400;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    int ret = OH_InputMethodProxy_NotifyCursorUpdate(tempProxy, cursorInfo);
    free(tempProxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxySendPrivateCommandNullPointer(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand1 = nullptr;
    keyCommand1 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand1, const_cast<char *>(valStr1.c_str()), valStr1.length());
    std::string keyStr2 = "testKey_2";
    bool valStr2 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr2.c_str()), keyStr2.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr2);
    std::string keyStr3 = "testKey_3";
    int32_t valStr3 = 123456789;
    InputMethod_PrivateCommand *keyCommand3 = nullptr;
    keyCommand3 = OH_PrivateCommand_Create(const_cast<char *>(keyStr3.c_str()), keyStr3.length());
    OH_PrivateCommand_SetIntValue(keyCommand3, valStr3);
    InputMethod_PrivateCommand *privateCommand[] = {keyCommand1, keyCommand2, keyCommand3};
    size_t size = sizeof(privateCommand) / sizeof(privateCommand[0]);
    int ret = OH_InputMethodProxy_SendPrivateCommand(nullptr, privateCommand, size);
    OH_PrivateCommand_Destroy(*privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxySendPrivateCommandDetached(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    OH_InputMethodController_Detach(g_inputMethodProxy1);
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand1 = nullptr;
    keyCommand1 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand1, const_cast<char *>(valStr1.c_str()), valStr1.length());
    std::string keyStr2 = "testKey_2";
    bool valStr2 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr2.c_str()), keyStr2.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr2);
    std::string keyStr3 = "testKey_3";
    int32_t valStr3 = 123456789;
    InputMethod_PrivateCommand *keyCommand3 = nullptr;
    keyCommand3 = OH_PrivateCommand_Create(const_cast<char *>(keyStr3.c_str()), keyStr3.length());
    OH_PrivateCommand_SetIntValue(keyCommand3, valStr3);
    InputMethod_PrivateCommand *privateCommand[] = {keyCommand1, keyCommand2, keyCommand3};
    size_t size = sizeof(privateCommand) / sizeof(privateCommand[0]);
    int ret = OH_InputMethodProxy_SendPrivateCommand(g_inputMethodProxy1, privateCommand, size);
    OH_PrivateCommand_Destroy(*privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_DETACHED ? 0 : -1, &result);
    return result;
}

napi_value TestOhInputMethodProxySendPrivateCommandParamCheckError(napi_env env, napi_callback_info info)
{
    TextEditorProxyCreate1();
    AttachOptionsCreate1(true);
    OH_InputMethodController_Attach(g_txtEditProxy1, g_options1, &g_inputMethodProxy1);
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand1 = nullptr;
    keyCommand1 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand1, const_cast<char *>(valStr1.c_str()), valStr1.length());
    std::string keyStr2 = "testKey_2";
    bool valStr2 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr2.c_str()), keyStr2.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr2);
    std::string keyStr3 = "testKey_3";
    int32_t valStr3 = 123456789;
    InputMethod_PrivateCommand *keyCommand3 = nullptr;
    keyCommand3 = OH_PrivateCommand_Create(const_cast<char *>(keyStr3.c_str()), keyStr3.length());
    OH_PrivateCommand_SetIntValue(keyCommand3, valStr3);
    InputMethod_PrivateCommand *privateCommand[] = {keyCommand1, keyCommand2, keyCommand3};
    size_t size = sizeof(privateCommand);
    int ret = OH_InputMethodProxy_SendPrivateCommand(g_inputMethodProxy1, privateCommand, size);
    OH_PrivateCommand_Destroy(*privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_PARAMCHECK ? 0 : -1, &result);
    return result;
}