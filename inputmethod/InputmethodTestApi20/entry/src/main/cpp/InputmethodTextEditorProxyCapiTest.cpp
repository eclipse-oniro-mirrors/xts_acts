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

#include "InputmethodTextEditorProxyCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_text_avoid_info_capi.h>
#include  <inputmethod/inputmethod_text_editor_proxy_capi.h>
#include <napi/native_api.h>

void AddInputMethodTextEditorProxyCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextEditorProxySetGetTextConfigFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetGetTextConfigFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetGetTextConfigFuncOk", nullptr,
                        TestOhTextEditorProxySetGetTextConfigFuncOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetInsertTextFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetInsertTextFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetInsertTextFuncOk", nullptr, TestOhTextEditorProxySetInsertTextFuncOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetDeleteForwardFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetDeleteForwardFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetDeleteForwardFuncOk", nullptr,
                        TestOhTextEditorProxySetDeleteForwardFuncOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetDeleteBackwardFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetDeleteBackwardFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetDeleteBackwardFuncOk", nullptr,
                        TestOhTextEditorProxySetDeleteBackwardFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetSendKeyboardStatusFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetSendKeyboardStatusFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetSendKeyboardStatusFuncOk", nullptr,
                        TestOhTextEditorProxySetSendKeyboardStatusFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetSendEnterKeyFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetSendEnterKeyFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetSendEnterKeyFuncOk", nullptr,
                        TestOhTextEditorProxySetSendEnterKeyFuncOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetMoveCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetMoveCursorFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetMoveCursorFuncOk", nullptr, TestOhTextEditorProxySetMoveCursorFuncOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetHandleSetSelectionFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetHandleSetSelectionFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetHandleSetSelectionFuncOk", nullptr,
                        TestOhTextEditorProxySetHandleSetSelectionFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

void AddInputMethodTextEditorProxyCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextEditorProxySetHandleExtendActionFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetHandleExtendActionFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetHandleExtendActionFuncOk", nullptr,
                        TestOhTextEditorProxySetHandleExtendActionFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetGetLeftTextOfCursorFuncOk", nullptr,
                        TestOhTextEditorProxySetGetLeftTextOfCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetGetRightTextOfCursorFuncOk", nullptr,
                        TestOhTextEditorProxySetGetRightTextOfCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetGetTextIndexAtCursorFuncOk", nullptr,
                        TestOhTextEditorProxySetGetTextIndexAtCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetReceivePrivateCommandFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetReceivePrivateCommandFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetReceivePrivateCommandFuncOk", nullptr,
                        TestOhTextEditorProxySetReceivePrivateCommandFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetSetPreviewTextFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetSetPreviewTextFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetSetPreviewTextFuncOk", nullptr,
                        TestOhTextEditorProxySetSetPreviewTextFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxySetFinishTextPreviewFuncNullPointer", nullptr,
                        TestOhTextEditorProxySetFinishTextPreviewFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxySetFinishTextPreviewFuncOk", nullptr,
                        TestOhTextEditorProxySetFinishTextPreviewFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

void AddInputMethodTextEditorProxyCapiTest3(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextEditorProxyGetGetTextConfigFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetGetTextConfigFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetTextConfigFuncOk", nullptr,
                        TestOhTextEditorProxyGetGetTextConfigFuncOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetInsertTextFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetInsertTextFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetInsertTextFuncOk", nullptr, TestOhTextEditorProxyGetInsertTextFuncOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetDeleteForwardFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetDeleteForwardFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetDeleteForwardFuncOk", nullptr,
                        TestOhTextEditorProxyGetDeleteForwardFuncOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetDeleteBackwardFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetDeleteBackwardFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetDeleteBackwardFuncOk", nullptr,
                        TestOhTextEditorProxyGetDeleteBackwardFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetSendKeyboardStatusFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetSendKeyboardStatusFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetSendKeyboardStatusFuncOk", nullptr,
                        TestOhTextEditorProxyGetSendKeyboardStatusFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetSendEnterKeyFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetSendEnterKeyFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetSendEnterKeyFuncOk", nullptr,
                        TestOhTextEditorProxyGetSendEnterKeyFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetMoveCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetMoveCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetMoveCursorFuncOk", nullptr,
                        TestOhTextEditorProxyGetMoveCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetHandleSetSelectionFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetHandleSetSelectionFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetHandleSetSelectionFuncOk", nullptr,
                        TestOhTextEditorProxyGetHandleSetSelectionFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

void AddInputMethodTextEditorProxyCapiTest4(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextEditorProxyGetHandleExtendActionFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetHandleExtendActionFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetHandleExtendActionFuncOk", nullptr,
                        TestOhTextEditorProxyGetHandleExtendActionFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetLeftTextOfCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetGetLeftTextOfCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetLeftTextOfCursorFuncOk", nullptr,
                        TestOhTextEditorProxyGetGetLeftTextOfCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetRightTextOfCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetGetRightTextOfCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetRightTextOfCursorFuncOk", nullptr,
                        TestOhTextEditorProxyGetGetRightTextOfCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetTextIndexAtCursorFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetGetTextIndexAtCursorFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetGetTextIndexAtCursorFuncOk", nullptr,
                        TestOhTextEditorProxyGetGetTextIndexAtCursorFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetReceivePrivateCommandFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetReceivePrivateCommandFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetReceivePrivateCommandFuncOk", nullptr,
                        TestOhTextEditorProxyGetReceivePrivateCommandFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetSetPreviewTextFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetSetPreviewTextFuncNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetSetPreviewTextFuncOk", nullptr,
                        TestOhTextEditorProxyGetSetPreviewTextFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhTextEditorProxyGetFinishTextPreviewFuncNullPointer", nullptr,
                        TestOhTextEditorProxyGetFinishTextPreviewFuncNullPointer, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhTextEditorProxyGetFinishTextPreviewFuncOk", nullptr,
                        TestOhTextEditorProxyGetFinishTextPreviewFuncOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

void AddInputMethodTextEditorProxyCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputMethodTextEditorProxyCapiTest1(descData);
    AddInputMethodTextEditorProxyCapiTest2(descData);
    AddInputMethodTextEditorProxyCapiTest3(descData);
    AddInputMethodTextEditorProxyCapiTest4(descData);
}

void GetTextConfigFunc2(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_TextConfig *config)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextConfigFunc2 successful.");
}

void InsertTextFunc2(InputMethod_TextEditorProxy *textEditorProxy, const char16_t *text, size_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>InsertTextFunc2 successful.");
}

void DeleteForwardFunc2(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteForwardFunc2 successful.");
}

void DeleteBackwardFunc2(InputMethod_TextEditorProxy *textEditorProxy, int32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>DeleteBackwardFunc2 successful.");
}

void SendKeyboardStatusFunc2(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_KeyboardStatus keyboardStatus)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendKeyboardStatusFunc2 successful.");
}

void SendEnterKeyFunc2(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_EnterKeyType enterKeyType)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SendEnterKeyFunc2 successful.");
}

void MoveCursorFunc2(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_Direction direction)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>MoveCursorFunc2 successful.");
}

void HandleSetSelectionFunc2(InputMethod_TextEditorProxy *textEditorProxy, int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleSetSelectionFunc2 successful.");
}

void HandleExtendActionFunc2(InputMethod_TextEditorProxy *textEditorProxy, InputMethod_ExtendAction action)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>HandleExtendActionFunc2 successful.");
}

void GetLeftTextOfCursorFunc2(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                              size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetLeftTextOfCursorFunc2 successful.");
}

void GetRightTextOfCursorFunc2(InputMethod_TextEditorProxy *textEditorProxy, int32_t number, char16_t text[],
                               size_t *length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetRightTextOfCursorFunc2 successful.");
}

int32_t GetTextIndexAtCursorFunc2(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>GetTextIndexAtCursorFunc2 successful.");
    return 0;
}

int32_t ReceivePrivateCommandFunc2(InputMethod_TextEditorProxy *textEditorProxy,
                                   InputMethod_PrivateCommand *privateCommand[], size_t size)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>ReceivePrivateCommandFunc2 successful.");
    return 0;
}

int32_t SetPreviewTextFunc2(InputMethod_TextEditorProxy *textEditorProxy, const char16_t text[], size_t length,
                            int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>SetPreviewTextFunc2 successful.");
    return 0;
}

void FinishTextPreviewFunc2(InputMethod_TextEditorProxy *textEditorProxy)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "", "NDKTest====>FinishTextPreviewFunc2 successful.");
}

napi_value TestOhTextEditorProxySetGetTextConfigFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetTextConfigFunc(nullptr, GetTextConfigFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetTextConfigFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetTextConfigFunc(proxy, GetTextConfigFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetInsertTextFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetInsertTextFunc(nullptr, InsertTextFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetInsertTextFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetInsertTextFunc(proxy, InsertTextFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetDeleteForwardFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetDeleteForwardFunc(nullptr, DeleteForwardFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetDeleteForwardFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetDeleteForwardFunc(proxy, DeleteForwardFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetDeleteBackwardFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetDeleteBackwardFunc(nullptr, DeleteBackwardFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetDeleteBackwardFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetDeleteBackwardFunc(proxy, DeleteBackwardFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSendKeyboardStatusFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSendKeyboardStatusFunc(nullptr, SendKeyboardStatusFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSendKeyboardStatusFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSendKeyboardStatusFunc(proxy, SendKeyboardStatusFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSendEnterKeyFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSendEnterKeyFunc(nullptr, SendEnterKeyFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSendEnterKeyFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSendEnterKeyFunc(proxy, SendEnterKeyFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetMoveCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetMoveCursorFunc(nullptr, MoveCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetMoveCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetMoveCursorFunc(proxy, MoveCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetHandleSetSelectionFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetHandleSetSelectionFunc(nullptr, HandleSetSelectionFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetHandleSetSelectionFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetHandleSetSelectionFunc(proxy, HandleSetSelectionFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetHandleExtendActionFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetHandleExtendActionFunc(nullptr, HandleExtendActionFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetHandleExtendActionFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetHandleExtendActionFunc(proxy, HandleExtendActionFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(nullptr, GetLeftTextOfCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetLeftTextOfCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(proxy, GetLeftTextOfCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetRightTextOfCursorFunc(nullptr, GetRightTextOfCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetRightTextOfCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetRightTextOfCursorFunc(proxy, GetRightTextOfCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(nullptr, GetTextIndexAtCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetGetTextIndexAtCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(proxy, GetTextIndexAtCursorFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetReceivePrivateCommandFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetReceivePrivateCommandFunc(nullptr, ReceivePrivateCommandFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetReceivePrivateCommandFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetReceivePrivateCommandFunc(proxy, ReceivePrivateCommandFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSetPreviewTextFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSetPreviewTextFunc(nullptr, SetPreviewTextFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetSetPreviewTextFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetSetPreviewTextFunc(proxy, SetPreviewTextFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetFinishTextPreviewFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetFinishTextPreviewFunc(nullptr, FinishTextPreviewFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxySetFinishTextPreviewFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    int ret = OH_TextEditorProxy_SetFinishTextPreviewFunc(proxy, FinishTextPreviewFunc2);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetTextConfigFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetTextConfigFunc(proxy, GetTextConfigFunc2);
    OH_TextEditorProxy_GetTextConfigFunc getTextConfigFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetTextConfigFunc(nullptr, &getTextConfigFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetTextConfigFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetTextConfigFunc(proxy, GetTextConfigFunc2);
    OH_TextEditorProxy_GetTextConfigFunc getTextConfigFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetTextConfigFunc(proxy, &getTextConfigFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetInsertTextFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetInsertTextFunc(proxy, InsertTextFunc2);
    OH_TextEditorProxy_InsertTextFunc insertTextFunc = nullptr;
    int ret = OH_TextEditorProxy_GetInsertTextFunc(nullptr, &insertTextFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetInsertTextFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetInsertTextFunc(proxy, InsertTextFunc2);
    OH_TextEditorProxy_InsertTextFunc insertTextFunc = nullptr;
    int ret = OH_TextEditorProxy_GetInsertTextFunc(proxy, &insertTextFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetDeleteForwardFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetDeleteForwardFunc(proxy, DeleteForwardFunc2);
    OH_TextEditorProxy_DeleteForwardFunc deleteForwardFunc = nullptr;
    int ret = OH_TextEditorProxy_GetDeleteForwardFunc(nullptr, &deleteForwardFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetDeleteForwardFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetDeleteForwardFunc(proxy, DeleteForwardFunc2);
    OH_TextEditorProxy_DeleteForwardFunc deleteForwardFunc = nullptr;
    int ret = OH_TextEditorProxy_GetDeleteForwardFunc(proxy, &deleteForwardFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetDeleteBackwardFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetDeleteBackwardFunc(proxy, DeleteBackwardFunc2);
    OH_TextEditorProxy_DeleteBackwardFunc deleteBackwardFunc = nullptr;
    int ret = OH_TextEditorProxy_GetDeleteBackwardFunc(nullptr, &deleteBackwardFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetDeleteBackwardFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetDeleteBackwardFunc(proxy, DeleteBackwardFunc2);
    OH_TextEditorProxy_DeleteBackwardFunc deleteBackwardFunc = nullptr;
    int ret = OH_TextEditorProxy_GetDeleteBackwardFunc(proxy, &deleteBackwardFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSendKeyboardStatusFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSendKeyboardStatusFunc(proxy, SendKeyboardStatusFunc2);
    OH_TextEditorProxy_SendKeyboardStatusFunc sendKeyboardStatusFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSendKeyboardStatusFunc(nullptr, &sendKeyboardStatusFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSendKeyboardStatusFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSendKeyboardStatusFunc(proxy, SendKeyboardStatusFunc2);
    OH_TextEditorProxy_SendKeyboardStatusFunc sendKeyboardStatusFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSendKeyboardStatusFunc(proxy, &sendKeyboardStatusFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSendEnterKeyFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSendEnterKeyFunc(proxy, SendEnterKeyFunc2);
    OH_TextEditorProxy_SendEnterKeyFunc sendEnterKeyFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSendEnterKeyFunc(nullptr, &sendEnterKeyFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSendEnterKeyFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSendEnterKeyFunc(proxy, SendEnterKeyFunc2);
    OH_TextEditorProxy_SendEnterKeyFunc sendEnterKeyFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSendEnterKeyFunc(proxy, &sendEnterKeyFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetMoveCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetMoveCursorFunc(proxy, MoveCursorFunc2);
    OH_TextEditorProxy_MoveCursorFunc moveCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetMoveCursorFunc(nullptr, &moveCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetMoveCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetMoveCursorFunc(proxy, MoveCursorFunc2);
    OH_TextEditorProxy_MoveCursorFunc moveCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetMoveCursorFunc(proxy, &moveCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetHandleSetSelectionFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetHandleSetSelectionFunc(proxy, HandleSetSelectionFunc2);
    OH_TextEditorProxy_HandleSetSelectionFunc handleSetSelectionFunc = nullptr;
    int ret = OH_TextEditorProxy_GetHandleSetSelectionFunc(nullptr, &handleSetSelectionFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetHandleSetSelectionFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetHandleSetSelectionFunc(proxy, HandleSetSelectionFunc2);
    OH_TextEditorProxy_HandleSetSelectionFunc handleSetSelectionFunc = nullptr;
    int ret = OH_TextEditorProxy_GetHandleSetSelectionFunc(proxy, &handleSetSelectionFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetHandleExtendActionFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetHandleExtendActionFunc(proxy, HandleExtendActionFunc2);
    OH_TextEditorProxy_HandleExtendActionFunc handleExtendActionFunc = nullptr;
    int ret = OH_TextEditorProxy_GetHandleExtendActionFunc(nullptr, &handleExtendActionFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetHandleExtendActionFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetHandleExtendActionFunc(proxy, HandleExtendActionFunc2);
    OH_TextEditorProxy_HandleExtendActionFunc handleExtendActionFunc = nullptr;
    int ret = OH_TextEditorProxy_GetHandleExtendActionFunc(proxy, &handleExtendActionFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetLeftTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(proxy, GetLeftTextOfCursorFunc2);
    OH_TextEditorProxy_GetLeftTextOfCursorFunc getLeftTextOfCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetLeftTextOfCursorFunc(nullptr, &getLeftTextOfCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetLeftTextOfCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(proxy, GetLeftTextOfCursorFunc2);
    OH_TextEditorProxy_GetLeftTextOfCursorFunc getLeftTextOfCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetLeftTextOfCursorFunc(proxy, &getLeftTextOfCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetRightTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetRightTextOfCursorFunc(proxy, GetRightTextOfCursorFunc2);
    OH_TextEditorProxy_GetRightTextOfCursorFunc getRightTextOfCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetRightTextOfCursorFunc(nullptr, &getRightTextOfCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetRightTextOfCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetRightTextOfCursorFunc(proxy, GetRightTextOfCursorFunc2);
    OH_TextEditorProxy_GetRightTextOfCursorFunc getRightTextOfCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetRightTextOfCursorFunc(proxy, &getRightTextOfCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetTextIndexAtCursorFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(proxy, GetTextIndexAtCursorFunc2);
    OH_TextEditorProxy_GetTextIndexAtCursorFunc getTextIndexAtCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetTextIndexAtCursorFunc(nullptr, &getTextIndexAtCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetGetTextIndexAtCursorFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(proxy, GetTextIndexAtCursorFunc2);
    OH_TextEditorProxy_GetTextIndexAtCursorFunc getTextIndexAtCursorFunc = nullptr;
    int ret = OH_TextEditorProxy_GetGetTextIndexAtCursorFunc(proxy, &getTextIndexAtCursorFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetReceivePrivateCommandFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetReceivePrivateCommandFunc(proxy, ReceivePrivateCommandFunc2);
    OH_TextEditorProxy_ReceivePrivateCommandFunc receivePrivateCommandFunc = nullptr;
    int ret = OH_TextEditorProxy_GetReceivePrivateCommandFunc(nullptr, &receivePrivateCommandFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetReceivePrivateCommandFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetReceivePrivateCommandFunc(proxy, ReceivePrivateCommandFunc2);
    OH_TextEditorProxy_ReceivePrivateCommandFunc receivePrivateCommandFunc = nullptr;
    int ret = OH_TextEditorProxy_GetReceivePrivateCommandFunc(proxy, &receivePrivateCommandFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSetPreviewTextFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSetPreviewTextFunc(proxy, SetPreviewTextFunc2);
    OH_TextEditorProxy_SetPreviewTextFunc setPreviewTextFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSetPreviewTextFunc(nullptr, &setPreviewTextFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetSetPreviewTextFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetSetPreviewTextFunc(proxy, SetPreviewTextFunc2);
    OH_TextEditorProxy_SetPreviewTextFunc setPreviewTextFunc = nullptr;
    int ret = OH_TextEditorProxy_GetSetPreviewTextFunc(proxy, &setPreviewTextFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetFinishTextPreviewFuncNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetFinishTextPreviewFunc(proxy, FinishTextPreviewFunc2);
    OH_TextEditorProxy_FinishTextPreviewFunc finishTextPreviewFunc = nullptr;
    int ret = OH_TextEditorProxy_GetFinishTextPreviewFunc(nullptr, &finishTextPreviewFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextEditorProxyGetFinishTextPreviewFuncOk(napi_env env, napi_callback_info info)
{
    InputMethod_TextEditorProxy *proxy = OH_TextEditorProxy_Create();
    OH_TextEditorProxy_SetFinishTextPreviewFunc(proxy, FinishTextPreviewFunc2);
    OH_TextEditorProxy_FinishTextPreviewFunc finishTextPreviewFunc = nullptr;
    int ret = OH_TextEditorProxy_GetFinishTextPreviewFunc(proxy, &finishTextPreviewFunc);
    OH_TextEditorProxy_Destroy(proxy);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}