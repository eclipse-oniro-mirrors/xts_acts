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

#ifndef INPUTMETHODTESTAPI20_INPUTMETHODTYPESCAPITEST_H
#define INPUTMETHODTESTAPI20_INPUTMETHODTYPESCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void AddInputmethodTypesCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestImeKeyBoardStatusNone(napi_env env, napi_callback_info info);
napi_value TestImeKeyBoardStatusHide(napi_env env, napi_callback_info info);
napi_value TestImeKeyBoardStatusShow(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeyGo(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeySearch(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeyNext(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeyDone(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeyPrevious(napi_env env, napi_callback_info info);
napi_value TestImeEnterKeyNewline(napi_env env, napi_callback_info info);
napi_value TestImeErrDetached(napi_env env, napi_callback_info info);
napi_value TestImeErrNullPointer(napi_env env, napi_callback_info info);
napi_value TestImeErrQueryFailed(napi_env env, napi_callback_info info);
napi_value TestImeErrParamcheck(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeMultiline(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeNumber(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypePhone(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeDatetime(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeAddress(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeUrl(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeVisiblePassword(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeNumberPassword(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeScreenLockPassword(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeUserName(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeNewPassword(napi_env env, napi_callback_info info);
napi_value TestImeTextInputTypeOneTimeCode(napi_env env, napi_callback_info info);
napi_value TestImeCommandValueTypeNone(napi_env env, napi_callback_info info);
napi_value TestImeCommandValueTypeBool(napi_env env, napi_callback_info info);
napi_value TestImeDirectionUp(napi_env env, napi_callback_info info);
napi_value TestImeDirectionDown(napi_env env, napi_callback_info info);
napi_value TestImeDirectionLeft(napi_env env, napi_callback_info info);
napi_value TestImeDirectionRight(napi_env env, napi_callback_info info);
napi_value TestImeExtendAction(napi_env env, napi_callback_info info);
napi_value TestImeExtendActionSelectAll(napi_env env, napi_callback_info info);
napi_value TestImeExtendActionCut(napi_env env, napi_callback_info info);
napi_value TestImeExtendActionCopy(napi_env env, napi_callback_info info);
napi_value TestImeExtendActionPaste(napi_env env, napi_callback_info info);
#endif //INPUTMETHODTESTAPI20_INPUTMETHODTYPESCAPITEST_H