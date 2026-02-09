/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "gesture_interfaceTest.h"

const unsigned int isValid = 0;

namespace ArkUICapiTest {
  
 static napi_value gestureTestParaMeter001(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_IsGestureRecognizerValid(nullptr);
     ASSERT_EQ(ret, isValid);
     NAPI_END;
 }

 static napi_value gestureTestParaMeter002(napi_env env, napi_callback_info info) {
     auto ret =  OH_ArkUI_GetPanGestureDirectionMask(nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

 static napi_value gestureTestParaMeter003(napi_env env, napi_callback_info info) {
     auto ret =  OH_ArkUI_GetGestureTag(nullptr, nullptr, 0, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

 static napi_value gestureTestParaMeter004(napi_env env, napi_callback_info info) {
     auto ret =  OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

static napi_value gestureTestParaMeter005(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_GetGestureRecognizerEnabled(nullptr);
     ASSERT_EQ(ret, isValid);
     NAPI_END;
 }

static napi_value gestureTestParaMeter006(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_SetGestureRecognizerEnabled(nullptr, false);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

static napi_value gestureTestParaMeter007(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_GetGestureRecognizerState(nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

static napi_value gestureTestParaMeter008(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

static napi_value gestureTestParaMeter009(napi_env env, napi_callback_info info) {
     auto ret = OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

} // namespace ArkUICapiTest