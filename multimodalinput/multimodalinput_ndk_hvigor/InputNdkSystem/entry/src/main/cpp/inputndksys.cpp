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
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"

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

static napi_value CreateAxisEvent(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    napi_create_int32(env, axisEvent != nullptr ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value SetAxisEventAction(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisAction action = AXIS_ACTION_BEGIN;
    Input_Result retResult = OH_Input_SetAxisEventAction(axisEvent, action);
    napi_create_int32(env, (retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
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

static napi_value SetAxisEventDisplayX(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    float displayX = DISPLAY_X;
    Input_Result retResult = OH_Input_SetAxisEventDisplayX(axisEvent, displayX);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value SetAxisEventDisplayY(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    float displayY = DISPLAY_Y;
    Input_Result retResult = OH_Input_SetAxisEventDisplayY(axisEvent, displayY);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value SetAxisEventAxisValue(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value SetAxisEventActionTime(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    int64_t actionTime = DEFAULT_ACTIONE_TIME;
    Input_Result retResult = OH_Input_SetAxisEventActionTime(axisEvent, actionTime);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value SetAxisEventType(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_SetAxisEventType(axisEvent, axisEventType);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value SetAxisEventSourceType(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
    Input_Result retResult = OH_Input_SetAxisEventSourceType(axisEvent, sourceType);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
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

static napi_value DestroyAxisEvent2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_DestroyAxisEvent(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventAction2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisAction action = AXIS_ACTION_BEGIN;
    Input_Result retResult = OH_Input_SetAxisEventAction(nullptr, action);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventAction2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventAction(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventAction3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisAction action = AXIS_ACTION_END;
    Input_Result retResult = OH_Input_GetAxisEventAction(nullptr, &action);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventDisplayX2(napi_env env, napi_callback_info info)
{
    napi_value result;
    float displayX = DISPLAY_X;
    Input_Result retResult = OH_Input_SetAxisEventDisplayX(nullptr, displayX);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventDisplayX2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventDisplayX(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventDisplayX3(napi_env env, napi_callback_info info)
{
    napi_value result;
    float displayX = DISPLAY_X;
    Input_Result retResult = OH_Input_GetAxisEventDisplayX(nullptr, &displayX);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventDisplayY2(napi_env env, napi_callback_info info)
{
    napi_value result;
    float displayY = DISPLAY_Y;
    Input_Result retResult = OH_Input_SetAxisEventDisplayY(nullptr, displayY);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventDisplayY2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventDisplayY(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventDisplayY3(napi_env env, napi_callback_info info)
{
    napi_value result;
    float displayY = DISPLAY_Y;
    Input_Result retResult = OH_Input_GetAxisEventDisplayY(nullptr, &displayY);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventDisplayY4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetAxisEventDisplayY(nullptr, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventAxisValue2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(nullptr, axisType, axisValue);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventAxisValue2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    Input_Result retResult = OH_Input_GetAxisEventAxisValue(axisEvent, axisType, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventAxisValue3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    Input_Result retResult = OH_Input_GetAxisEventAxisValue(nullptr, axisType, &axisValue);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventAxisValue4(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    Input_Result retResult = OH_Input_GetAxisEventAxisValue(nullptr, axisType, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventAxisValue5(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = DEFAULT_AXIS_VALUE;
    Input_Result retResult = OH_Input_GetAxisEventAxisValue(axisEvent, axisType, &axisValue);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value SetAxisEventActionTime2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t actionTime = DEFAULT_ACTIONE_TIME;
    Input_Result retResult = OH_Input_SetAxisEventActionTime(nullptr, actionTime);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventActionTime2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventActionTime(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventActionTime3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t actionTime = DEFAULT_ACTIONE_TIME;
    Input_Result retResult = OH_Input_GetAxisEventActionTime(nullptr, &actionTime);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventActionTime4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetAxisEventActionTime(nullptr, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventType2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_SetAxisEventType(nullptr, axisEventType);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventType2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventType(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventType3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_GetAxisEventType(nullptr, &axisEventType);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventType4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetAxisEventType(nullptr, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetAxisEventSourceType2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
    Input_Result retResult = OH_Input_SetAxisEventSourceType(nullptr, sourceType);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventSourceType2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    Input_Result retResult = OH_Input_GetAxisEventSourceType(axisEvent, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetAxisEventSourceType3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
    Input_Result retResult = OH_Input_GetAxisEventSourceType(nullptr, &sourceType);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetAxisEventSourceType4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetAxisEventSourceType(nullptr, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
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

static napi_value AddKeyEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

static napi_value RemoveKeyEventMonitor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
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

static napi_value AddMouseEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveMouseEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveMouseEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveMouseEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value AddMouseEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}

static napi_value RemoveMouseEventMonitor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
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

static napi_value AddTouchEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveTouchEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveTouchEventMonitor(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveTouchEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value AddTouchEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    return result;
}

static napi_value RemoveTouchEventMonitor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
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

static napi_value AddAxisEventMonitorForAll2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveAxisEventMonitorForAll2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitorForAll(nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveAxisEventMonitorForAll3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value AddAxisEventMonitorForAll3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

static napi_value RemoveAxisEventMonitorForAll4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
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

static napi_value AddAxisEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveAxisEventMonitor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, nullptr);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveAxisEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value AddAxisEventMonitor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

static napi_value RemoveAxisEventMonitor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_RemoveAxisEventMonitor(AXIS_EVENT_TYPE_SCROLL, AxisEventCallback);
    napi_create_int32(env, (retResult==INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

static napi_value RemoveAxisEventMonitor5(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    retResult = OH_Input_RemoveAxisEventMonitor(AXIS_EVENT_TYPE_SCROLL, AxisEventCallback);
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

static napi_value AddKeyEventInterceptor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventInterceptor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    napi_create_int32(env, (retResult==INPUT_REPEAT_INTERCEPTOR) ? 1 : 0, &result);
    OH_Input_RemoveKeyEventInterceptor();
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

static napi_value RemoveKeyEventInterceptor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventInterceptor();
    napi_create_int32(env, (retResult==INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventInterceptor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventInterceptor();
    retResult = OH_Input_AddKeyEventInterceptor(KeyEventCallback, nullptr);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveKeyEventInterceptor();
    return result;
}

static napi_value RemoveKeyEventInterceptor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventInterceptor();
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

static napi_value AddInputEventInterceptor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveInputEventInterceptor();
    return result;
}

static napi_value AddInputEventInterceptor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    Input_Result retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    napi_create_int32(env, (retResult==INPUT_REPEAT_INTERCEPTOR) ? 1 : 0, &result);
    OH_Input_RemoveInputEventInterceptor();
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

static napi_value RemoveInputEventInterceptor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveInputEventInterceptor();
    napi_create_int32(env, (retResult==INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value AddInputEventInterceptor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveInputEventInterceptor();
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_RemoveInputEventInterceptor();
    return result;
}

static napi_value RemoveInputEventInterceptor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveInputEventInterceptor();
    Input_InterceptorEventCallback callback;
    callback.mouseCallback = MouseEventCallback;
    callback.touchCallback = TouchEventCallback;
    callback.axisCallback = AxisEventCallback;
    Input_InterceptorOptions *option = nullptr;
    retResult = OH_Input_AddInputEventInterceptor(&callback, option);
    retResult = OH_Input_RemoveInputEventInterceptor();
    napi_create_int32(env, (retResult==INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CreateAxisEvent", nullptr, CreateAxisEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventAction", nullptr, SetAxisEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAction", nullptr, GetAxisEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventDisplayX", nullptr, SetAxisEventDisplayX, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayX", nullptr, GetAxisEventDisplayX, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventDisplayY", nullptr, SetAxisEventDisplayY, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayY", nullptr, GetAxisEventDisplayY, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventAxisValue", nullptr, SetAxisEventAxisValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue", nullptr, GetAxisEventAxisValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventActionTime", nullptr, SetAxisEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventActionTime", nullptr, GetAxisEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventType", nullptr, SetAxisEventType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventType", nullptr, GetAxisEventType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventSourceType", nullptr, SetAxisEventSourceType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventSourceType", nullptr, GetAxisEventSourceType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyAxisEvent", nullptr, DestroyAxisEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyAxisEvent2", nullptr, DestroyAxisEvent2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventAction2", nullptr, SetAxisEventAction2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAction2", nullptr, GetAxisEventAction2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAction3", nullptr, GetAxisEventAction3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventDisplayX2", nullptr, SetAxisEventDisplayX2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayX2", nullptr, GetAxisEventDisplayX2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayX3", nullptr, GetAxisEventDisplayX3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventDisplayY2", nullptr, SetAxisEventDisplayY2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayY2", nullptr, GetAxisEventDisplayY2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayY3", nullptr, GetAxisEventDisplayY3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventDisplayY4", nullptr, GetAxisEventDisplayY4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventAxisValue2", nullptr, SetAxisEventAxisValue2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue2", nullptr, GetAxisEventAxisValue2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue3", nullptr, GetAxisEventAxisValue3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue4", nullptr, GetAxisEventAxisValue4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventAxisValue5", nullptr, GetAxisEventAxisValue5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventActionTime2", nullptr, SetAxisEventActionTime2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventActionTime2", nullptr, GetAxisEventActionTime2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventActionTime3", nullptr, GetAxisEventActionTime3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventActionTime4", nullptr, GetAxisEventActionTime4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventType2", nullptr, SetAxisEventType2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventType2", nullptr, GetAxisEventType2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventType3", nullptr, GetAxisEventType3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventType4", nullptr, GetAxisEventType4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAxisEventSourceType2", nullptr, SetAxisEventSourceType2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventSourceType2", nullptr, GetAxisEventSourceType2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventSourceType3", nullptr, GetAxisEventSourceType3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAxisEventSourceType4", nullptr, GetAxisEventSourceType4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventMonitor", nullptr, AddKeyEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventMonitor", nullptr, RemoveKeyEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventMonitor2", nullptr, AddKeyEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventMonitor2", nullptr, RemoveKeyEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventMonitor3", nullptr, RemoveKeyEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventMonitor3", nullptr, AddKeyEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventMonitor4", nullptr, RemoveKeyEventMonitor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddMouseEventMonitor", nullptr, AddMouseEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveMouseEventMonitor", nullptr, RemoveMouseEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddMouseEventMonitor2", nullptr, AddMouseEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveMouseEventMonitor2", nullptr, RemoveMouseEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveMouseEventMonitor3", nullptr, RemoveMouseEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddMouseEventMonitor3", nullptr, AddMouseEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveMouseEventMonitor4", nullptr, RemoveMouseEventMonitor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddTouchEventMonitor", nullptr, AddTouchEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveTouchEventMonitor", nullptr, RemoveTouchEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddTouchEventMonitor2", nullptr, AddTouchEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveTouchEventMonitor2", nullptr, RemoveTouchEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveTouchEventMonitor3", nullptr, RemoveTouchEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddTouchEventMonitor3", nullptr, AddTouchEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveTouchEventMonitor4", nullptr, RemoveTouchEventMonitor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorForAll", nullptr, AddAxisEventMonitorForAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitorForAll", nullptr, RemoveAxisEventMonitorForAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorForAll2", nullptr, AddAxisEventMonitorForAll2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitorForAll2", nullptr, RemoveAxisEventMonitorForAll2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitorForAll3", nullptr, RemoveAxisEventMonitorForAll3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorForAll3", nullptr, AddAxisEventMonitorForAll3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitorForAll4", nullptr, RemoveAxisEventMonitorForAll4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitor", nullptr, AddAxisEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor", nullptr, RemoveAxisEventMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitor2", nullptr, AddAxisEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor2", nullptr, RemoveAxisEventMonitor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor3", nullptr, RemoveAxisEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitor3", nullptr, AddAxisEventMonitor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor4", nullptr, RemoveAxisEventMonitor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveAxisEventMonitor5", nullptr, RemoveAxisEventMonitor5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventInterceptor", nullptr, AddKeyEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventInterceptor2", nullptr, AddKeyEventInterceptor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventInterceptor3", nullptr, AddKeyEventInterceptor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventInterceptor", nullptr, RemoveKeyEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventInterceptor2", nullptr, RemoveKeyEventInterceptor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventInterceptor4", nullptr, AddKeyEventInterceptor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventInterceptor3", nullptr, RemoveKeyEventInterceptor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddInputEventInterceptor", nullptr, AddInputEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddInputEventInterceptor2", nullptr, AddInputEventInterceptor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddInputEventInterceptor3", nullptr, AddInputEventInterceptor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveInputEventInterceptor", nullptr, RemoveInputEventInterceptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveInputEventInterceptor2", nullptr, RemoveInputEventInterceptor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddInputEventInterceptor4", nullptr, AddInputEventInterceptor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveInputEventInterceptor3", nullptr, RemoveInputEventInterceptor3, nullptr, nullptr, nullptr, napi_default, nullptr},
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