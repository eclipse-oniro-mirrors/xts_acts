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

#ifndef ARKUI_CAPI_XTS_FOCUS_CONTROL_TEST_H
#define ARKUI_CAPI_XTS_FOCUS_CONTROL_TEST_H

#include "common/Common.h"

namespace FocusControlTest {
#define COLOR_RED 0xFFFF0000
#define COLOR_GREEN 0xFF00FF00
#define ON_CLICK_EVENT_ID 6001
#define ON_FOCUS_EVENT_ID 6002
#define ON_BLUR_EVENT_ID 6006
#define INVALID_PARAM 401
#define PARAM_1 1
#define PARAM_0 0
#define PARAM_64 64

napi_value FocusControlTest_001(napi_env env, napi_callback_info info);
napi_value FocusControlTest_002(napi_env env, napi_callback_info info);
napi_value FocusControlTest_003(napi_env env, napi_callback_info info);
napi_value FocusControlTest_004(napi_env env, napi_callback_info info);
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_FOCUS_CONTROL_TEST_H