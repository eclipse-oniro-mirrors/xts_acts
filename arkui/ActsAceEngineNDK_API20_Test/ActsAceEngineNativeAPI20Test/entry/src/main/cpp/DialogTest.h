/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef ACTSACEENGINENATIVEAPI20TEST_DIALOGTEST_H
#define ACTSACEENGINENATIVEAPI20TEST_DIALOGTEST_H
#include "AbilityKit/ability_runtime/application_context.h"
#include "DialogGetStateTest.h"
#include "napi/native_api.h"
#include <arkui/native_node_napi.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#define ON_CLICK_EVENT_ID 6001
#define ON_CLICK_EVENT_ID2 6015
#define ON_CLICK_EVENT_ID3 6016
#define ON_CLICK_EVENT_ID4 6017
#define ON_CLICK_EVENT_ID5 6018
#define SIZE_200 200
#define SIZE_300 300
#define COLOR_GREEN 0xFF00FF00
#define COLOR_BLUE 0xFF0000FF
#define PARAM_0 0
#define LOG_PRINT_DOMAIN 0xFF00
#include "DialogGetStateTest.h"
napi_value OpenDialog();
napi_value DialogDismissBackPress(napi_env env, napi_callback_info info);
napi_value DialogDismissCloseButton(napi_env env, napi_callback_info info);
napi_value DialogDismissSlideDown(napi_env env, napi_callback_info info);
napi_value DialogDismissTouchOutside(napi_env env, napi_callback_info info);
napi_value DialogModelTest_001(napi_env env, napi_callback_info info);
napi_value DialogModelTest_002(napi_env env, napi_callback_info info);

#endif //ACTSACEENGINENATIVEAPI20TEST_DIALOGTEST_H
