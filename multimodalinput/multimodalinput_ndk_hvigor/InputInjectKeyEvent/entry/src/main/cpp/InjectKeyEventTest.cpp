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

#include "InjectKeyEventTest.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <cstdint>
#include <vector>
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"

void KeyEventCallback(const struct Input_KeyEvent* keyEvent)
{
    OH_Input_GetKeyEventAction(keyEvent);
    OH_Input_GetKeyEventKeyCode(keyEvent);
    OH_Input_GetKeyEventWindowId(keyEvent);
    OH_Input_GetKeyEventDisplayId(keyEvent);
}

void MouseEventCallback(const struct Input_MouseEvent* mouseEvent)
{
    OH_Input_GetMouseEventAction(mouseEvent);
    OH_Input_GetMouseEventDisplayX(mouseEvent);
    OH_Input_GetMouseEventDisplayY(mouseEvent);
    OH_Input_GetMouseEventWindowId(mouseEvent);
    OH_Input_GetMouseEventDisplayId(mouseEvent);
}

void TouchEventCallback(const struct Input_TouchEvent* touchEvent)
{
    OH_Input_GetTouchEventAction(touchEvent);
    OH_Input_GetTouchEventFingerId(touchEvent);
    OH_Input_GetTouchEventWindowId(touchEvent);
    OH_Input_GetTouchEventDisplayId(touchEvent);
}

static void HotkeyCallback(struct Input_Hotkey *hotkey)
{}

void AxisEventCallbackAll(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

void AxisEventCallback(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

napi_value OHInputInjectTouchEventError(napi_env env, napi_callback_info info)
{
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    napi_value result;
    napi_create_int32(env, OH_Input_InjectTouchEvent(touchEvent) == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputInjectTouchEventSuccess(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    int value1;
    napi_get_value_int32(env, args[0], &value1);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_DOWN);
    OH_Input_SetTouchEventFingerId(touchEvent, 0);
    OH_Input_SetTouchEventDisplayX(touchEvent, value0);
    OH_Input_SetTouchEventDisplayY(touchEvent, value1);
    OH_Input_SetTouchEventActionTime(touchEvent, -1);
    napi_value result;
    napi_create_int32(env, OH_Input_InjectTouchEvent(touchEvent) == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputInjectTouchEventGlobalError(napi_env env, napi_callback_info info)
{
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    napi_value result;
    napi_create_int32(env, OH_Input_InjectTouchEventGlobal(touchEvent) == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputInjectTouchEventGlobal(napi_env env, napi_callback_info info)
{
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_DOWN);
    OH_Input_SetTouchEventFingerId(touchEvent, 0);
    OH_Input_SetTouchEventGlobalX(touchEvent, 1);
    OH_Input_SetTouchEventGlobalY(touchEvent, 1);
    OH_Input_SetTouchEventActionTime(touchEvent, -1);
    napi_value result;
    napi_create_int32(env, OH_Input_InjectTouchEventGlobal(touchEvent) == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputGetTouchEventGlobalX(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 1);
    int32_t retResult = OH_Input_GetTouchEventGlobalX(touchEvent);
    napi_create_int32(env, retResult != 1 ? -1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputGetTouchEventGlobalY(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalY(touchEvent, 1);
    int32_t retResult = OH_Input_GetTouchEventGlobalY(touchEvent);
    napi_create_int32(env, retResult != 1 ? -1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value OHInputInjectMouseEventError(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
 
    int ret = OH_Input_InjectMouseEvent(nullptr);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, ret == INPUT_PARAMETER_ERROR ? 0 : 1, &result);
    return result;
}

napi_value OHInputInjectMouseEventGlobalEventError(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    int ret = OH_Input_InjectMouseEventGlobal(nullptr);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, ret == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value OHInputInjectMouseEventGlobalDenied(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_MOVE);
    OH_Input_SetMouseEventGlobalX(mouseEvent, 1);
    OH_Input_SetMouseEventGlobalY(mouseEvent, 1);
    OH_Input_SetMouseEventButton(mouseEvent, 0);
    OH_Input_SetMouseEventActionTime(mouseEvent, -1);
    int ret = OH_Input_InjectMouseEventGlobal(mouseEvent);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, ret == INPUT_PERMISSION_DENIED ? 0 : 1, &result);
    return result;
}

napi_value OHInputInjectMouseEventGlobalGetSetXEvent(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalX(mouseEvent, 1);
    int currentX = OH_Input_GetMouseEventGlobalX(mouseEvent);
    napi_value result;
    napi_create_int32(env, currentX != 1 ? -1 : 0, &result);
    return result;
}

napi_value OHInputInjectMouseEventGlobalGetSetYEvent(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalY(mouseEvent, 1);
    int currentY = OH_Input_GetMouseEventGlobalY(mouseEvent);
    napi_value result;
    napi_create_int32(env, currentY != 1 ? -1 :0, &result);
    return result;
}

napi_value OHInputSetAxisEventGlobalXSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int32_t displayX = 1;
    Input_Result retResult = OH_Input_SetAxisEventGlobalX(axisEvent, displayX);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value OHInputSetAxisEventGlobalYSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int32_t displayY = 1;
    Input_Result retResult = OH_Input_SetAxisEventGlobalY(axisEvent, displayY);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value OHInputGetAxisEventGlobalXSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int32_t displayX = 1;
    Input_Result retResult = OH_Input_GetAxisEventGlobalX(axisEvent, &displayX);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value OHInputGetAxisEventGlobalYSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int32_t displayY = 1;
    Input_Result retResult = OH_Input_GetAxisEventGlobalY(axisEvent, &displayY);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value OHInputSetAxisEventGlobalXError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayX = 1;
    Input_Result retResult = OH_Input_SetAxisEventGlobalX(nullptr, displayX);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value OHInputSetAxisEventGlobalYError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayY = 1;
    Input_Result retResult = OH_Input_SetAxisEventGlobalY(nullptr, displayY);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value OHInputGetAxisEventGlobalXError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayX = 1;
    Input_Result retResult = OH_Input_GetAxisEventGlobalX(nullptr, &displayX);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value OHInputGetAxisEventGlobalYError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayY = 1;
    Input_Result retResult = OH_Input_GetAxisEventGlobalY(nullptr, &displayY);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value OHInputInjectionStatusUnauthorized(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InjectionStatus status = UNAUTHORIZED;
    int32_t retResult = OH_Input_QueryAuthorizedStatus(&status);
    napi_create_int32(env, retResult == 0 ? 0 : -1, &result);
    return result;
}

napi_value OHInputInjectionStatusAuthorizing(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InjectionStatus status = AUTHORIZING;
    int32_t retResult = OH_Input_QueryAuthorizedStatus(&status);
    napi_create_int32(env, retResult == 0 ? 0 : -1, &result);
    return result;
}

napi_value OHInputInjectionStatusAuthorized(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InjectionStatus status = AUTHORIZED;
    int32_t retResult = OH_Input_QueryAuthorizedStatus(&status);
    napi_create_int32(env, retResult == 0 ? 0 : -1, &result);
    return result;
}

napi_value OHInputKeyboardTypeNone(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_NONE;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputKeyboardTypeUNKNOWN(napi_env env, napi_callback_info info)
{
napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_UNKNOWN;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputAddKeyEventMonitorPermissionDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

napi_value OHInputGetPreKeysError(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Hotkey *hotkey = OH_Input_CreateHotkey();

    int32_t prekeys[2] = { KEYCODE_ALT_LEFT, KEYCODE_ALT_RIGHT };
    OH_Input_SetPreKeys(hotkey, prekeys, 1);
    int32_t pressedKeyNum = 0;
    Input_Result result1 = OH_Input_GetPreKeys(hotkey, nullptr, &pressedKeyNum);
    napi_create_int32(env, result1 == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

napi_value OHInputGetFinalKeyError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t finalKeyCode = 0;
    Input_Result result1 = OH_Input_GetFinalKey(nullptr, &finalKeyCode);
    napi_create_int32(env, result1 == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

napi_value OHInputGetRepeatError(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool isRepeat = false;
    Input_Result result1 = OH_Input_GetRepeat(nullptr, &isRepeat);
    napi_create_int32(env, result1 == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

napi_value OHInputKeyboardTypeAlphabetic(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_ALPHABETIC;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputKeyboardTypeDigital(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_DIGITAL;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputKeyboardTypeStylus(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_STYLUS;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputKeyboardTypeControl(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 1;
    int32_t keyboardTypeInt = KEYBOARD_TYPE_REMOTE_CONTROL;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &keyboardTypeInt);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value OHInputAddMouseEventMonitorPermissionDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}

napi_value OHInputAddTouchEventMonitorPermissionDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    return result;
}

napi_value OHInputAddAxisEventMonitorForAllPermissionDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

napi_value OHInputAddAxisEventMonitorPermissionDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

napi_value OHInputAddAxisEventMonitorForAllDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

napi_value OHInputRemoveMouseEventMonitorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}


napi_value OHInputAddKeyEventInterceptorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value OHInputAddInputEventInterceptorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    if (retResult == INPUT_PERMISSION_DENIED) {
        napi_create_int32(env, 0, &result);
        OH_Input_RemoveInputEventInterceptor();
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_Input_RemoveInputEventInterceptor();
    return result;
}

napi_value OHInputGetPointerLocationSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayId = 0;
    double displayX = 0.0;
    double displayY = 0.0;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, &displayY);
    if (retResult == INPUT_SUCCESS) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value OHInputUnregisterDeviceListenerException(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);
    Input_Result retResult = OH_Input_UnregisterDeviceListener(listener1);
    napi_create_int32(env, retResult == INPUT_SERVICE_EXCEPTION ? 0 : retResult, &result);
    delete listener1;
    return result;
}

napi_value OHInputGetPointerLocationError(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetPointerLocation(nullptr, nullptr, nullptr);
    if (retResult == INPUT_PARAMETER_ERROR) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value OHInputGetPointerLocationNoPointer(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayId = 0;
    double displayX = 0.0;
    double displayY = 0.0;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, &displayY);
    if (retResult == INPUT_DEVICE_NO_POINTER) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, retResult, &result);
    return result;
}

napi_value OHInputGetPointerLocationNoFocused(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t displayId = 0;
    double displayX = 0.0;
    double displayY = 0.0;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, &displayY);
    if (retResult == INPUT_APP_NOT_FOCUSED) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, retResult, &result);
    return result;
}


napi_value OHInputQueryMaxTouchPointsSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t count = 0;
    Input_Result retResult = OH_Input_QueryMaxTouchPoints(&count);
    if (retResult == INPUT_SUCCESS) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, retResult, &result);
    return result;
}

napi_value OHInputQueryMaxTouchPointsError(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_QueryMaxTouchPoints(nullptr);
    if (retResult == INPUT_PARAMETER_ERROR) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, retResult, &result);
    return result;
}

void addInjectKeyEventTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectTouchEventGlobalError",
                       nullptr, OHInputInjectTouchEventGlobalError,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectTouchEventError",
                       nullptr, OHInputInjectTouchEventError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectTouchEventSuccess",
                       nullptr, OHInputInjectTouchEventSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventGlobalEventError",
                       nullptr, OHInputInjectMouseEventGlobalEventError,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventGlobalDenied",
                       nullptr, OHInputInjectMouseEventGlobalDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventError",
                       nullptr, OHInputInjectMouseEventError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventGlobalGetSetXEvent",
                       nullptr, OHInputInjectMouseEventGlobalGetSetXEvent,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventGlobalGetSetYEvent",
                       nullptr, OHInputInjectMouseEventGlobalGetSetYEvent,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectTouchEventGlobal",
                       nullptr, OHInputInjectTouchEventGlobal,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetTouchEventGlobalX",
                       nullptr, OHInputGetTouchEventGlobalX,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetTouchEventGlobalY",
                       nullptr, OHInputGetTouchEventGlobalY,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addInjectKeyEventTest2(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputSetAxisEventGlobalYSuccess",
                       nullptr, OHInputSetAxisEventGlobalYSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetAxisEventGlobalXSuccess",
                       nullptr, OHInputGetAxisEventGlobalXSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetAxisEventGlobalYSuccess",
                       nullptr, OHInputGetAxisEventGlobalYSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputSetAxisEventGlobalXError",
                       nullptr, OHInputSetAxisEventGlobalXError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputSetAxisEventGlobalYError",
                       nullptr, OHInputSetAxisEventGlobalYError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetAxisEventGlobalXError",
                       nullptr, OHInputGetAxisEventGlobalXError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetAxisEventGlobalYError",
                       nullptr, OHInputGetAxisEventGlobalYError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectionStatusUnauthorized",
                       nullptr, OHInputInjectionStatusUnauthorized, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectionStatusAuthorizing",
                       nullptr, OHInputInjectionStatusAuthorizing, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectionStatusAuthorized",
                       nullptr, OHInputInjectionStatusAuthorized, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputKeyboardTypeNone",
                       nullptr, OHInputKeyboardTypeNone, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputKeyboardTypeUNKNOWN",
                       nullptr, OHInputKeyboardTypeUNKNOWN, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddKeyEventMonitorPermissionDenied",
                       nullptr, OHInputAddKeyEventMonitorPermissionDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetPreKeysError",
                       nullptr, OHInputGetPreKeysError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetFinalKeyError",
                       nullptr, OHInputGetFinalKeyError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetRepeatError",
                       nullptr, OHInputGetRepeatError, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addInjectKeyEventTest3(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputAddAxisEventMonitorForAllDenied",
                       nullptr, OHInputAddAxisEventMonitorForAllDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputRemoveMouseEventMonitorDenied",
                       nullptr, OHInputRemoveMouseEventMonitorDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddKeyEventInterceptorDenied",
                       nullptr, OHInputAddKeyEventInterceptorDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddInputEventInterceptorDenied",
                       nullptr, OHInputAddInputEventInterceptorDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetPointerLocationSuccess",
                       nullptr, OHInputGetPointerLocationSuccess, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetPointerLocationError",
                       nullptr, OHInputGetPointerLocationError,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetPointerLocationNoPointer",
                       nullptr, OHInputGetPointerLocationNoPointer, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputGetPointerLocationNoFocused",
                       nullptr, OHInputGetPointerLocationNoFocused, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputQueryMaxTouchPointsSuccess",
                       nullptr, OHInputQueryMaxTouchPointsSuccess, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputQueryMaxTouchPointsError",
                       nullptr, OHInputQueryMaxTouchPointsError, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputUnregisterDeviceListenerException", nullptr,
                       OHInputUnregisterDeviceListenerException,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addInjectKeyEventTest4(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputKeyboardTypeAlphabetic",
                       nullptr, OHInputKeyboardTypeAlphabetic,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputKeyboardTypeDigital",
                       nullptr, OHInputKeyboardTypeDigital,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputKeyboardTypeStylus",
                       nullptr, OHInputKeyboardTypeStylus,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputKeyboardTypeControl",
                       nullptr, OHInputKeyboardTypeControl,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddMouseEventMonitorPermissionDenied",
                       nullptr, OHInputAddMouseEventMonitorPermissionDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddTouchEventMonitorPermissionDenied",
                       nullptr, OHInputAddTouchEventMonitorPermissionDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddAxisEventMonitorForAllPermissionDenied",
                       nullptr, OHInputAddAxisEventMonitorForAllPermissionDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputAddAxisEventMonitorPermissionDenied",
                       nullptr, OHInputAddAxisEventMonitorPermissionDenied,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputSetAxisEventGlobalXSuccess",
                       nullptr, OHInputSetAxisEventGlobalXSuccess,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addInjectKeyEventTest(std::vector<napi_property_descriptor>& descData)
{
    addInjectKeyEventTest1(descData);
    addInjectKeyEventTest2(descData);
    addInjectKeyEventTest3(descData);
    addInjectKeyEventTest4(descData);
}