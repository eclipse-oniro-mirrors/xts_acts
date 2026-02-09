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

#include "common/Common.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <nativegesture/NativeGestureTest.h>
#include <vector>

EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("GetGestureType1", NativeGestureTest::GetGestureType1));
    desc.push_back(XL("GetGestureType2", NativeGestureTest::GetGestureType2));
    desc.push_back(XL("GetGestureType3", NativeGestureTest::GetGestureType3));
    desc.push_back(XL("GetGestureType4", NativeGestureTest::GetGestureType4));
    desc.push_back(XL("GetGestureType5", NativeGestureTest::GetGestureType5));
    desc.push_back(XL("GetGestureType6", NativeGestureTest::GetGestureType6));
    desc.push_back(XL("GetGestureType7", NativeGestureTest::GetGestureType7));
    desc.push_back(XL("CreateGestureNode1", NativeGestureTest::CreateGestureNode1));
    desc.push_back(XL("GetTouchRecognizers0100", NativeGestureTest::GetTouchRecognizers0100));
    desc.push_back(XL("GetTouchRecognizers0200", NativeGestureTest::GetTouchRecognizers0200));
    desc.push_back(XL("CancelTouch0100", NativeGestureTest::CancelTouch0100));
    desc.push_back(XL("CancelTouch0200", NativeGestureTest::CancelTouch0200));
    desc.push_back(XL("GetFromInterruptInfo0100", NativeGestureTest::GetFromInterruptInfo0100));
    desc.push_back(XL("GetFromInterruptInfo0200", NativeGestureTest::GetFromInterruptInfo0200));
    desc.push_back(XL("SetGestureRecognizerEnabled0100", NativeGestureTest::SetGestureRecognizerEnabled0100));
    desc.push_back(XL("SetGestureRecognizerEnabled0200", NativeGestureTest::SetGestureRecognizerEnabled0200));
    desc.push_back(XL("SetGestureRecognizerLimitFingerCount0100",
                      NativeGestureTest::SetGestureRecognizerLimitFingerCount0100));
    desc.push_back(XL("SetGestureRecognizerLimitFingerCount0200",
                      NativeGestureTest::SetGestureRecognizerLimitFingerCount0200));
    desc.push_back(XL("GetGestureRecognizerState0100", NativeGestureTest::GetGestureRecognizerState0100));
    desc.push_back(XL("GetGestureRecognizerState0200", NativeGestureTest::GetGestureRecognizerState0200));
    desc.push_back(XL("GetGestureEventTargetInfo0100", NativeGestureTest::GetGestureEventTargetInfo0100));
    desc.push_back(XL("GetGestureEventTargetInfo0200", NativeGestureTest::GetGestureEventTargetInfo0200));
    desc.push_back(XL("CreateGestureNode3", NativeGestureTest::CreateGestureNode3));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollBegin0100",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollBegin0100));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollBegin0200",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollBegin0200));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollBegin0300",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollBegin0300));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollEnd0100",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollEnd0100));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollEnd0200",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollEnd0200));
    desc.push_back(XL("GestureEventTargetInfo_IsScrollEnd0300",
                      NativeGestureTest::GestureEventTargetInfo_IsScrollEnd0300));
    desc.push_back(XL("GetPanGestureDirectionMask0100", NativeGestureTest::GetPanGestureDirectionMask0100));
    desc.push_back(XL("GetPanGestureDirectionMask0200", NativeGestureTest::GetPanGestureDirectionMask0200));
    desc.push_back(XL("GetGestureTag0100", NativeGestureTest::GetGestureTag0100));
    desc.push_back(XL("GetGestureTag0200", NativeGestureTest::GetGestureTag0200));
    desc.push_back(XL("GetGestureTag0300", NativeGestureTest::GetGestureTag0300));
    desc.push_back(XL("GetGestureBindNodeId0100", NativeGestureTest::GetGestureBindNodeId0100));
    desc.push_back(XL("GetGestureBindNodeId0200", NativeGestureTest::GetGestureBindNodeId0200));
    desc.push_back(XL("GetGestureBindNodeId0300", NativeGestureTest::GetGestureBindNodeId0300));
    desc.push_back(XL("GetConflictRecognizers0200", NativeGestureTest::GetConflictRecognizers0200));
}

static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("SetArkUIGestureRecognizerDisposeNotify0100",
                      NativeGestureTest::SetArkUIGestureRecognizerDisposeNotify0100));
    desc.push_back(XL("SetArkUIGestureRecognizerDisposeNotify0200",
                      NativeGestureTest::SetArkUIGestureRecognizerDisposeNotify0200));
    desc.push_back(XL("GetGestureParam_DirectMask0100", NativeGestureTest::GetGestureParam_DirectMask0100));
    desc.push_back(XL("GetGestureParam_FingerCount0100", NativeGestureTest::GetGestureParam_FingerCount0100));
    desc.push_back(XL("GetGestureParam_limitFingerCount0100",
                      NativeGestureTest::GetGestureParam_limitFingerCount0100));
    
    desc.push_back(XL("CreateGestureNode2", NativeGestureTest::CreateGestureNode2));
    desc.push_back(XL("GetGestureParam_repeat0100", NativeGestureTest::GetGestureParam_repeat0100));
    desc.push_back(XL("GetGestureParam_repeat0200", NativeGestureTest::GetGestureParam_repeat0200));
    desc.push_back(XL("GetGestureParam_distance0100", NativeGestureTest::GetGestureParam_distance0100));
    desc.push_back(XL("GetGestureParam_distance0200", NativeGestureTest::GetGestureParam_distance0200));
    desc.push_back(XL("GetGestureParam_speed0100", NativeGestureTest::GetGestureParam_speed0100));
    desc.push_back(XL("GetGestureParam_speed0200", NativeGestureTest::GetGestureParam_speed0200));
    desc.push_back(XL("GetGestureParam_duration0100", NativeGestureTest::GetGestureParam_duration0100));
    desc.push_back(XL("GetGestureParam_duration0200", NativeGestureTest::GetGestureParam_duration0200));
    desc.push_back(XL("GetGestureParam_angle0100", NativeGestureTest::GetGestureParam_angle0100));
    desc.push_back(XL("GetGestureParam_angle0200", NativeGestureTest::GetGestureParam_angle0200));
    desc.push_back(XL("GetGestureParam_distanceThreshold0100",
                      NativeGestureTest::GetGestureParam_distanceThreshold0100));
    desc.push_back(XL("GetGestureParam_distanceThreshold0200",
                      NativeGestureTest::GetGestureParam_distanceThreshold0200));
    desc.push_back(XL("PanGesture_SetDistanceMap0100", NativeGestureTest::PanGesture_SetDistanceMap0100));
    desc.push_back(XL("PanGesture_SetDistanceMap0200", NativeGestureTest::PanGesture_SetDistanceMap0200));
    desc.push_back(XL("PanGesture_SetDistanceMap0300", NativeGestureTest::PanGesture_SetDistanceMap0300));
    desc.push_back(XL("CreateGestureNode4", NativeGestureTest::CreateGestureNode4));
    desc.push_back(XL("GetDistanceByToolType0100", NativeGestureTest::GetDistanceByToolType0100));
    desc.push_back(XL("GetDistanceByToolType0200", NativeGestureTest::GetDistanceByToolType0200));
    desc.push_back(XL("GetDistanceByToolType0300", NativeGestureTest::GetDistanceByToolType0300));
    desc.push_back(XL("SetTouchTestDoneCallback0100", NativeGestureTest::SetTouchTestDoneCallback0100));
    desc.push_back(XL("SetTouchTestDoneCallback0200", NativeGestureTest::SetTouchTestDoneCallback0200));
    desc.push_back(XL("version0100", NativeGestureTest::version0100));
    desc.push_back(XL("createTapGestureWithDistanceThreshold0100",
                      NativeGestureTest::createTapGestureWithDistanceThreshold0100));
    desc.push_back(XL("gestureApi10100", NativeGestureTest::gestureApi10100));
    desc.push_back(XL("PreventGestureRecognizerBegin0100", NativeGestureTest::PreventGestureRecognizerBegin0100));
    desc.push_back(XL("PreventGestureRecognizerBegin0200", NativeGestureTest::PreventGestureRecognizerBegin0200));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativegesturendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
