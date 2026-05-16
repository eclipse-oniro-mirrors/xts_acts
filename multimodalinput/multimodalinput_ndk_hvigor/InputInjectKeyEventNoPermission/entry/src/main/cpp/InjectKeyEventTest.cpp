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
#include <hilog/log.h>

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

napi_value OHInputInjectKeyEventDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_B);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value RequestInjectionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RequestInjection(nullptr);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 0 : -1, &result);
    return result;
}

napi_value AddKeyEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

napi_value AddMouseEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}

napi_value AddTouchEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    return result;
}

napi_value AddAxisEventMonitorForAllException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

napi_value AddAxisEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

napi_value RemoveKeyEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value RemoveKeyEventMonitorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value RemoveMouseEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value RemoveMouseEventMonitorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value RemoveTouchEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value RemoveTouchEventMonitorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value RemoveAxisEventMonitorForAllException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value RemoveAxisEventMonitorForAllDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value RemoveAxisEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value RemoveAxisEventMonitorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value AddKeyEventInterceptorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    return result;
}

napi_value AddInputEventInterceptorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    OH_Input_RemoveInputEventInterceptor();
    return result;
}

napi_value RemoveKeyEventInterceptorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    retResult = OH_Input_RemoveKeyEventInterceptor();
    napi_create_int32(env, (retResult == INPUT_SERVICE_EXCEPTION ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value RemoveInputEventInterceptorDenied(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    retResult = OH_Input_RemoveInputEventInterceptor();
    napi_create_int32(env, (retResult == INPUT_SERVICE_EXCEPTION ||
                      retResult == INPUT_PERMISSION_DENIED) ? 0 : -1, &result);
    return result;
}

napi_value UnregisterDeviceListenersException(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);

    auto listener2 = new (std::nothrow) Input_DeviceListener();
    if (listener2 == nullptr) {
        return nullptr;
    }
    listener2->deviceAddedCallback = [](int32_t deviceId) {};
    listener2->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener2);
    int errorCode = OH_Input_UnregisterDeviceListeners();
    napi_create_int32(env, (errorCode== INPUT_SUCCESS || errorCode== INPUT_SERVICE_EXCEPTION) ? 0 : -1, &result);
    delete listener1;
    delete listener2;
    return result;
}

napi_value OHInputInjectKeyEventCapsLock(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_CAPS_LOCK);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectMouseEventSuccess(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_MOVE);
    OH_Input_SetMouseEventDisplayX(mouseEvent, 1);
    OH_Input_SetMouseEventDisplayY(mouseEvent, 1);
    OH_Input_SetMouseEventButton(mouseEvent, 0);
    OH_Input_SetMouseEventActionTime(mouseEvent, -1);
    int retResult = OH_Input_InjectMouseEvent(mouseEvent);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED || retResult == INPUT_SUCCESS) ? 0 : -1, &result);
    return result;
}

napi_value InjectMouseEventGlobalSuccess(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_MOVE);
    OH_Input_SetMouseEventGlobalX(mouseEvent, 1);
    OH_Input_SetMouseEventGlobalY(mouseEvent, 1);
    OH_Input_SetMouseEventButton(mouseEvent, 0);
    OH_Input_SetMouseEventActionTime(mouseEvent, -1);
    int retResult = OH_Input_InjectMouseEventGlobal(mouseEvent);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED || retResult == INPUT_SUCCESS) ? 0 : -1, &result);
    return result;
}

void addSetKeyEventKeyCodeTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventDenied",
                       nullptr, OHInputInjectKeyEventDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RequestInjectionError",
                       nullptr, RequestInjectionError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddKeyEventMonitorException",
                       nullptr, AddKeyEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddMouseEventMonitorException",
                       nullptr, AddMouseEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddTouchEventMonitorException",
                       nullptr, AddTouchEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddAxisEventMonitorForAllException",
                       nullptr, AddAxisEventMonitorForAllException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddAxisEventMonitorException",
                       nullptr, AddAxisEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveKeyEventMonitorException",
                       nullptr, RemoveKeyEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveKeyEventMonitorDenied",
                       nullptr, RemoveKeyEventMonitorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveMouseEventMonitorException",
                       nullptr, RemoveMouseEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveMouseEventMonitorDenied",
                       nullptr, RemoveMouseEventMonitorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveTouchEventMonitorException",
                       nullptr, RemoveTouchEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveTouchEventMonitorDenied",
                       nullptr, RemoveTouchEventMonitorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveAxisEventMonitorForAllException",
                       nullptr, RemoveAxisEventMonitorForAllException,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveAxisEventMonitorForAllDenied",
                       nullptr, RemoveAxisEventMonitorForAllDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveAxisEventMonitorException",
                       nullptr, RemoveAxisEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveAxisEventMonitorDenied",
                       nullptr, RemoveAxisEventMonitorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddKeyEventInterceptorException",
                       nullptr, AddKeyEventInterceptorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AddInputEventInterceptorException",
                       nullptr, AddInputEventInterceptorException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"RemoveKeyEventInterceptorDenied",
                       nullptr, RemoveKeyEventInterceptorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest2(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"RemoveInputEventInterceptorDenied",
                       nullptr, RemoveInputEventInterceptorDenied, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UnregisterDeviceListenersException",
                       nullptr, UnregisterDeviceListenersException, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventCapsLock",
                       nullptr, OHInputInjectKeyEventCapsLock, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectMouseEventSuccess",
                       nullptr, OHInputInjectMouseEventSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"InjectMouseEventGlobalSuccess",
                       nullptr, InjectMouseEventGlobalSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addInjectKeyEventTest(std::vector<napi_property_descriptor>& descData)
{
    addSetKeyEventKeyCodeTest1(descData);
    addSetKeyEventKeyCodeTest2(descData);
}