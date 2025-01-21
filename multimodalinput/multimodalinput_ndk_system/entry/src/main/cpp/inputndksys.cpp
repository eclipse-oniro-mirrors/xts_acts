/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "oh_input_manager.h"
#include "oh_key_code.h"

constexpr float DISPLAY_X { 100.0 };
constexpr float DISPLAY_Y { 200.0 };
constexpr double DEFAULT_AXIS_VALUE { 50.0 };
constexpr double AXIS_VALUE { 100.0 };
constexpr int64_t DEFAULT_ACTIONE_TIME { 10 };
constexpr int64_t ACTIONE_TIME { 20 };

static void KeyEventCallback(const struct Input_KeyEvent* keyEvent)
{
    OH_Input_GetKeyEventAction(keyEvent);
    OH_Input_GetKeyEventKeyCode(keyEvent);
}

static void MouseEventCallback(const struct Input_MouseEvent* mouseEvent)
{
    OH_Input_GetMouseEventAction(mouseEvent);
    OH_Input_GetMouseEventDisplayX(mouseEvent);
    OH_Input_GetMouseEventDisplayY(mouseEvent);
}

static void TouchEventCallback(const struct Input_TouchEvent* touchEvent)
{
    OH_Input_GetTouchEventAction(touchEvent);
    OH_Input_GetTouchEventFingerId(touchEvent);
}

static void AxisEventCallbackAll(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

static void AxisEventCallback(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

static napi_value GetAxisEventAction(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisAction action = AXIS_ACTION_BEGIN;
    Input_Result retResult = OH_Input_SetAxisEventAction(axisEvent, action);
    action = AXIS_ACTION_UPDATE;
    retResult = OH_Input_GetAxisEventAction(axisEvent, &action);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && action==AXIS_ACTION_BEGIN) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventDisplayX(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    float displayX = DISPLAY_X;
    Input_Result retResult = OH_Input_SetAxisEventDisplayX(axisEvent, displayX);
    displayX = DISPLAY_Y;
    retResult = OH_Input_GetAxisEventDisplayX(axisEvent, &displayX);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && displayX==DISPLAY_X) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventDisplayY(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    float displayY = DISPLAY_Y;
    Input_Result retResult = OH_Input_SetAxisEventDisplayY(axisEvent, displayY);
    displayY = DISPLAY_X;
    retResult = OH_Input_GetAxisEventDisplayY(axisEvent, &displayY);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && displayY==DISPLAY_Y) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventAxisValue(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    axisValue = AXIS_VALUE;
    retResult = OH_Input_GetAxisEventAxisValue(axisEvent, axisType, &axisValue);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && axisValue==DEFAULT_AXIS_VALUE) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventActionTime(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int64_t actionTime = DEFAULT_ACTIONE_TIME;
    Input_Result retResult = OH_Input_SetAxisEventActionTime(axisEvent, actionTime);
    actionTime = ACTIONE_TIME;
    retResult = OH_Input_GetAxisEventActionTime(axisEvent, &actionTime);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && actionTime==DEFAULT_ACTIONE_TIME) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventType(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_SetAxisEventType(axisEvent, axisEventType);
    axisEventType = AXIS_EVENT_TYPE_SCROLL;
    retResult = OH_Input_GetAxisEventType(axisEvent, &axisEventType);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && axisEventType==AXIS_EVENT_TYPE_PINCH) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventSourceType(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();

    InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
    Input_Result retResult = OH_Input_SetAxisEventSourceType(axisEvent, sourceType);
    sourceType = SOURCE_TYPE_TOUCHSCREEN;
    retResult = OH_Input_GetAxisEventSourceType(axisEvent, &sourceType);
    napi_create_int32(env, (retResult==INPUT_SUCCESS && sourceType==SOURCE_TYPE_MOUSE) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value DestroyAxisEvent(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();

    InputEvent_AxisAction action = AXIS_ACTION_BEGIN;
    Input_Result retResult = OH_Input_SetAxisEventAction(axisEvent, action);
    action = AXIS_ACTION_UPDATE;
    retResult = OH_Input_GetAxisEventAction(axisEvent, &action);

    float displayX = DISPLAY_X;
    retResult = OH_Input_SetAxisEventDisplayX(axisEvent, displayX);
    displayX = DISPLAY_Y;
    retResult = OH_Input_GetAxisEventDisplayX(axisEvent, &displayX);

    float displayY = DISPLAY_Y;
    retResult = OH_Input_SetAxisEventDisplayY(axisEvent, displayY);
    displayY = DISPLAY_X;
    retResult = OH_Input_GetAxisEventDisplayY(axisEvent, &displayY);

    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    axisValue = AXIS_VALUE;
    retResult = OH_Input_GetAxisEventAxisValue(axisEvent, axisType, &axisValue);

    int64_t actionTime = DEFAULT_ACTIONE_TIME;
    retResult = OH_Input_SetAxisEventActionTime(axisEvent, actionTime);
    actionTime = ACTIONE_TIME;
    retResult = OH_Input_GetAxisEventActionTime(axisEvent, &actionTime);

    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    retResult = OH_Input_SetAxisEventType(axisEvent, axisEventType);
    axisEventType = AXIS_EVENT_TYPE_SCROLL;
    retResult = OH_Input_GetAxisEventType(axisEvent, &axisEventType);

    InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
    retResult = OH_Input_SetAxisEventSourceType(axisEvent, sourceType);
    sourceType = SOURCE_TYPE_TOUCHSCREEN;
    retResult = OH_Input_GetAxisEventSourceType(axisEvent, &sourceType);

    retResult = OH_Input_DestroyAxisEvent(&axisEvent);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

static napi_value RemoveKeyEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddMouseEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}

static napi_value RemoveMouseEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddTouchEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    return result;
}

static napi_value RemoveTouchEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddAxisEventMonitorForAll(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

static napi_value RemoveAxisEventMonitorForAll(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddAxisEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

static napi_value RemoveAxisEventMonitor(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventInterceptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(nullptr, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventInterceptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    retResult = OH_Input_RemoveKeyEventInterceptor();
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddInputEventInterceptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(nullptr, option);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveInputEventInterceptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    retResult = OH_Input_RemoveInputEventInterceptor();
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetAxisEventAction", nullptr, GetAxisEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayX", nullptr, GetAxisEventDisplayX, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayY", nullptr, GetAxisEventDisplayY, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue", nullptr, GetAxisEventAxisValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventActionTime", nullptr, GetAxisEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventType", nullptr, GetAxisEventType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventSourceType", nullptr, GetAxisEventSourceType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyAxisEvent", nullptr, DestroyAxisEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventMonitor", nullptr, AddKeyEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventMonitor", nullptr, RemoveKeyEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddMouseEventMonitor", nullptr, AddMouseEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveMouseEventMonitor", nullptr, RemoveMouseEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddTouchEventMonitor", nullptr, AddTouchEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveTouchEventMonitor", nullptr, RemoveTouchEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorForAll", nullptr, AddAxisEventMonitorForAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitorForAll", nullptr, RemoveAxisEventMonitorForAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitor", nullptr, AddAxisEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor", nullptr, RemoveAxisEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventInterceptor", nullptr, AddKeyEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventInterceptor", nullptr, RemoveKeyEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddInputEventInterceptor", nullptr, AddInputEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveInputEventInterceptor", nullptr, RemoveInputEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libinputndksys",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}