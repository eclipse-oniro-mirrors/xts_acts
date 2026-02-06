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

#ifndef NATIVE_DIALOG_TESTCASE_H
#define NATIVE_DIALOG_TESTCASE_H

#include "common/Common.h"

napi_value ArkUILevelModeEmbedded(napi_env env, napi_callback_info info);
napi_value ArkUIImmersiveModeExtend(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnWillDismissWithUserData(napi_env env, napi_callback_info info);
napi_value ArkUINativeDialogAPI1(napi_env env, napi_callback_info info);
napi_value ArkUISetKeyboardAvoidDistance(napi_env env, napi_callback_info info);
napi_value ArkUINativeDialogAPI2(napi_env env, napi_callback_info info);
napi_value ArkUISetLevelOrder(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnWillAppear(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnDidAppear(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnWillDisappear(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnDidDisappear(napi_env env, napi_callback_info info);
napi_value ArkUISetFocusable(napi_env env, napi_callback_info info);

#endif