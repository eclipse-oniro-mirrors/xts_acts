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

#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_NATIVEGESTURETEST_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_NATIVEGESTURETEST_H

#include <arkui/native_node_napi.h>
#include <napi/native_api.h>
#include <js_native_api_types.h>

namespace NativeGestureTest {
napi_value GetGestureType1(napi_env env, napi_callback_info info);
napi_value GetGestureType2(napi_env env, napi_callback_info info);
napi_value GetGestureType3(napi_env env, napi_callback_info info);
napi_value GetGestureType4(napi_env env, napi_callback_info info);
napi_value GetGestureType5(napi_env env, napi_callback_info info);
napi_value GetGestureType6(napi_env env, napi_callback_info info);
napi_value GetGestureType7(napi_env env, napi_callback_info info);

napi_value CreateGestureNode1(napi_env env, napi_callback_info info);
napi_value GetTouchRecognizers0100(napi_env env, napi_callback_info info);
napi_value GetTouchRecognizers0200(napi_env env, napi_callback_info info);
napi_value CancelTouch0100(napi_env env, napi_callback_info info);
napi_value CancelTouch0200(napi_env env, napi_callback_info info);
napi_value GetFromInterruptInfo0100(napi_env env, napi_callback_info info);
napi_value GetFromInterruptInfo0200(napi_env env, napi_callback_info info);
napi_value SetGestureRecognizerEnabled0100(napi_env env, napi_callback_info info);
napi_value SetGestureRecognizerEnabled0200(napi_env env, napi_callback_info info);
napi_value SetGestureRecognizerLimitFingerCount0100(napi_env env, napi_callback_info info);
napi_value SetGestureRecognizerLimitFingerCount0200(napi_env env, napi_callback_info info);
napi_value GetGestureRecognizerState0100(napi_env env, napi_callback_info info);
napi_value GetGestureRecognizerState0200(napi_env env, napi_callback_info info);
napi_value GetGestureEventTargetInfo0100(napi_env env, napi_callback_info info);
napi_value GetGestureEventTargetInfo0200(napi_env env, napi_callback_info info);
napi_value CreateGestureNode3(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollBegin0100(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollBegin0200(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollBegin0300(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollEnd0100(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollEnd0200(napi_env env, napi_callback_info info);
napi_value GestureEventTargetInfo_IsScrollEnd0300(napi_env env, napi_callback_info info);
napi_value GetPanGestureDirectionMask0100(napi_env env, napi_callback_info info);
napi_value GetPanGestureDirectionMask0200(napi_env env, napi_callback_info info);
napi_value GetGestureTag0100(napi_env env, napi_callback_info info);
napi_value GetGestureTag0200(napi_env env, napi_callback_info info);
napi_value GetGestureTag0300(napi_env env, napi_callback_info info);
napi_value GetGestureBindNodeId0100(napi_env env, napi_callback_info info);
napi_value GetGestureBindNodeId0200(napi_env env, napi_callback_info info);
napi_value GetGestureBindNodeId0300(napi_env env, napi_callback_info info);
napi_value GetConflictRecognizers0200(napi_env env, napi_callback_info info);
napi_value SetArkUIGestureRecognizerDisposeNotify0100(napi_env env, napi_callback_info info);
napi_value SetArkUIGestureRecognizerDisposeNotify0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_DirectMask0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_FingerCount0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_limitFingerCount0100(napi_env env, napi_callback_info info);

napi_value CreateGestureNode2(napi_env env, napi_callback_info info);
napi_value GetGestureParam_repeat0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_repeat0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_distance0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_distance0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_speed0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_speed0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_duration0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_duration0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_angle0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_angle0200(napi_env env, napi_callback_info info);
napi_value GetGestureParam_distanceThreshold0100(napi_env env, napi_callback_info info);
napi_value GetGestureParam_distanceThreshold0200(napi_env env, napi_callback_info info);
napi_value PanGesture_SetDistanceMap0100(napi_env env, napi_callback_info info);
napi_value PanGesture_SetDistanceMap0200(napi_env env, napi_callback_info info);
napi_value PanGesture_SetDistanceMap0300(napi_env env, napi_callback_info info);
napi_value CreateGestureNode4(napi_env env, napi_callback_info info);
napi_value GetDistanceByToolType0100(napi_env env, napi_callback_info info);
napi_value GetDistanceByToolType0200(napi_env env, napi_callback_info info);
napi_value GetDistanceByToolType0300(napi_env env, napi_callback_info info);
napi_value SetTouchTestDoneCallback0100(napi_env env, napi_callback_info info);
napi_value SetTouchTestDoneCallback0200(napi_env env, napi_callback_info info);
napi_value version0100(napi_env env, napi_callback_info info);
napi_value createTapGestureWithDistanceThreshold0100(napi_env env, napi_callback_info info);
napi_value gestureApi10100(napi_env env, napi_callback_info info);
napi_value PreventGestureRecognizerBegin0100(napi_env env, napi_callback_info info);
napi_value PreventGestureRecognizerBegin0200(napi_env env, napi_callback_info info);
}

#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_NATIVEGESTURETEST_H
