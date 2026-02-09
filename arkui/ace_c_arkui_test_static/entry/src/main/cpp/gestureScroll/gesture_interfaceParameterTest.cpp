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

#include "gesture_interfaceTest.h"

const unsigned int isValid = 0;

namespace ArkUIAniTest {
  
 static ani_double gestureTestParaMeter001(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_IsGestureRecognizerValid(nullptr);
     ASSERT_EQ(ret, isValid);
     NAPI_END;
 }

 static ani_double gestureTestParaMeter002(ani_env* env, ani_object info) {
     auto ret =  OH_ArkUI_GetPanGestureDirectionMask(nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

 static ani_double gestureTestParaMeter003(ani_env* env, ani_object info) {
     auto ret =  OH_ArkUI_GetGestureTag(nullptr, nullptr, 0, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

 static ani_double gestureTestParaMeter004(ani_env* env, ani_object info) {
     auto ret =  OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

static ani_double gestureTestParaMeter005(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_GetGestureRecognizerEnabled(nullptr);
     ASSERT_EQ(ret, isValid);
     NAPI_END;
 }

static ani_double gestureTestParaMeter006(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_SetGestureRecognizerEnabled(nullptr, false);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
 }

static ani_double gestureTestParaMeter007(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_GetGestureRecognizerState(nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

static ani_double gestureTestParaMeter008(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

static ani_double gestureTestParaMeter009(ani_env* env, ani_object info) {
     auto ret = OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(nullptr, nullptr, nullptr);
     ASSERT_EQ(ret, INVALID_PARAM);
     NAPI_END;
}

} // namespace ArkUIAniTest