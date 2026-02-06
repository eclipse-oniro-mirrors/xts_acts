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

#ifndef INPUTMETHODTESTAPI20_INPUTMETHODTEXTEDITORPROXYCAPITEST_H
#define INPUTMETHODTESTAPI20_INPUTMETHODTEXTEDITORPROXYCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void AddInputMethodTextEditorProxyCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestOhTextEditorProxySetGetTextConfigFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetTextConfigFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetInsertTextFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetInsertTextFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetDeleteForwardFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetDeleteForwardFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetDeleteBackwardFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetDeleteBackwardFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSendKeyboardStatusFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSendKeyboardStatusFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSendEnterKeyFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSendEnterKeyFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetMoveCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetMoveCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetHandleSetSelectionFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetHandleSetSelectionFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetHandleExtendActionFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetHandleExtendActionFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetLeftTextOfCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetRightTextOfCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetGetTextIndexAtCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetReceivePrivateCommandFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetReceivePrivateCommandFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSetPreviewTextFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetSetPreviewTextFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetFinishTextPreviewFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxySetFinishTextPreviewFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetTextConfigFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetTextConfigFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetInsertTextFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetInsertTextFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetDeleteForwardFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetDeleteForwardFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetDeleteBackwardFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetDeleteBackwardFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSendKeyboardStatusFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSendKeyboardStatusFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSendEnterKeyFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSendEnterKeyFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetMoveCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetMoveCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetHandleSetSelectionFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetHandleSetSelectionFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetHandleExtendActionFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetHandleExtendActionFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetLeftTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetLeftTextOfCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetRightTextOfCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetRightTextOfCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetTextIndexAtCursorFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetGetTextIndexAtCursorFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetReceivePrivateCommandFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetReceivePrivateCommandFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSetPreviewTextFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetSetPreviewTextFuncOk(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetFinishTextPreviewFuncNullPointer(napi_env env, napi_callback_info info);
napi_value TestOhTextEditorProxyGetFinishTextPreviewFuncOk(napi_env env, napi_callback_info info);
#endif //INPUTMETHODTESTAPI20_INPUTMETHODTEXTEDITORPROXYCAPITEST_H