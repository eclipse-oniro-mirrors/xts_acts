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

#ifndef ACE_C_ARKUI_TEST_API22_LONGPRESSGESTURETEST_H
#define ACE_C_ARKUI_TEST_API22_LONGPRESSGESTURETEST_H
#include <napi/native_api.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <string>

#include "component/ComponentTest.h"

namespace ArkUICapiTest {
class LongPressGestureTest : public Component {
public:
    ~LongPressGestureTest();
    static napi_value SetAllowableMovement(napi_env env, napi_callback_info info);
    static napi_value SetAllowableMovement_Invalid(napi_env env, napi_callback_info info);
    static napi_value SetAllowableMovement_notSup(napi_env env, napi_callback_info info);
    static napi_value GetAllowableMovement_Invalid(napi_env env, napi_callback_info info);
    static napi_value GetAllowableMovement(napi_env env, napi_callback_info info);
    static napi_value SetMeasureFromViewport(napi_env env, napi_callback_info info);
    static napi_value SetMeasureFromViewport_Invalid(napi_env env, napi_callback_info info);
    static napi_value GetAllowableMovement_SUPPORTED(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif //ACE_C_ARKUI_TEST_API22_LONGPRESSGESTURETEST_H