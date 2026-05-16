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
#include <arkui/native_gesture.h>
#include <cstdint>

namespace NativeGestureTest {

napi_value GetGestureType1(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* LongPressGesture = gestureApi->createLongPressGesture(1, true, 1000);
    auto type = gestureApi->getGestureType(LongPressGesture);
    napi_value retValue;
    napi_create_int32(env, type == LONG_PRESS_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType2(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* PinchGesture = gestureApi->createPinchGesture(2, 10);
    auto type = gestureApi->getGestureType(PinchGesture);
    napi_value retValue;
    napi_create_int32(env, type == PINCH_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType3(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* RotationGestur = gestureApi->createRotationGesture(2, 1.0);
    auto type = gestureApi->getGestureType(RotationGestur);
    napi_value retValue;
    napi_create_int32(env, type == ROTATION_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType4(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* SwipeGesture = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_LEFT, 100.0);
    auto type = gestureApi->getGestureType(SwipeGesture);
    napi_value retValue;
    napi_create_int32(env, type == SWIPE_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType5(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* GroupGesture = gestureApi->createGroupGesture(SEQUENTIAL_GROUP);
    auto type = gestureApi->getGestureType(GroupGesture);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "type5", "type5: %{public}d", type);
    napi_value retValue;
    napi_create_int32(env, type == GROUP_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType6(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* TapGesture = gestureApi->createTapGesture(1, 1);
    auto type = gestureApi->getGestureType(TapGesture);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "type6", "type6: %{public}d", type);
    napi_value retValue;
    napi_create_int32(env, type == CLICK_GESTURE ? 1 : 0, &retValue);
    return retValue;
}

napi_value GetGestureType7(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, 10);
    auto type = gestureApi->getGestureType(PanGesture);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "type7", "type7: %{public}d", type);
    napi_value retValue;
    napi_create_int32(env, type == DRAG_DROP ? 1 : 0, &retValue);
    return retValue;
}
}
