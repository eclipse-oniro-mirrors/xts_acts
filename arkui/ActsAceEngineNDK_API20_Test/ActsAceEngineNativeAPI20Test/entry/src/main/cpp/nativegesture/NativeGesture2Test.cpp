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
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <cstdint>

namespace NativeGestureTest {
static ArkUI_NodeContentHandle g_content;
static ArkUI_NodeContentHandle g_content4;
static int32_t g_version = 1;
static ArkUI_GestureRecognizer* g_recognizer;
static ArkUI_GestureRecognizer* g_LongPressGesture;
static ArkUI_GestureRecognizer* g_PinchGesture;
static ArkUI_GestureRecognizer* g_SwipeGesture;
static ArkUI_GestureRecognizer* g_PanGesture;
static ArkUI_GestureRecognizer* g_PanGesture2;
static ArkUI_GestureRecognizer* g_RotationGesture;
static ArkUI_GestureRecognizer* g_TapGesture;

napi_value CreateGestureNode2(napi_env env, napi_callback_info info)
{
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(g_content, column);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFC0CB }};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem item0 = { .string = "Column1" };
    nodeAPI->setAttribute(column, NODE_ID, &item0);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    g_LongPressGesture = gestureApi->createLongPressGesture(1, true, PARAM_1000);
    g_PinchGesture = gestureApi->createPinchGesture(PARAM_2, PARAM_5);
    g_SwipeGesture = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_LEFT, PARAM_100);
    g_PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, PARAM_5);
    g_RotationGesture = gestureApi->createRotationGesture(PARAM_2, 1);
    g_TapGesture = gestureApi->createTapGesture(1, 1);
    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    gestureApi->addGestureToNode(column, g_LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->addGestureToNode(column, g_PinchGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->addGestureToNode(column, g_SwipeGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->addGestureToNode(column, g_PanGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->addGestureToNode(column, g_RotationGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->addGestureToNode(column, g_TapGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GetGestureParam_repeat0100(napi_env env, napi_callback_info info)
{
    bool isLimited = true;
    int32_t result = OH_ArkUI_GetGestureParam_repeat(g_SwipeGesture, &isLimited);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_repeat0200(napi_env env, napi_callback_info info)
{
    bool isLimited = true;
    int32_t result = OH_ArkUI_GetGestureParam_repeat(g_LongPressGesture, &isLimited);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_distance0100(napi_env env, napi_callback_info info)
{
    double distance = 5;
    int32_t result = OH_ArkUI_GetGestureParam_distance(g_SwipeGesture, &distance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_distance0200(napi_env env, napi_callback_info info)
{
    double distance = 5;
    int32_t result = OH_ArkUI_GetGestureParam_distance(g_PinchGesture, &distance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_speed0100(napi_env env, napi_callback_info info)
{
    double speed = 100;
    int32_t result = OH_ArkUI_GetGestureParam_speed(g_PanGesture, &speed);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_speed0200(napi_env env, napi_callback_info info)
{
    double speed = 100;
    int32_t result = OH_ArkUI_GetGestureParam_speed(g_SwipeGesture, &speed);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_duration0100(napi_env env, napi_callback_info info)
{
    int duration = 500;
    int32_t result = OH_ArkUI_GetGestureParam_duration(g_SwipeGesture, &duration);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_duration0200(napi_env env, napi_callback_info info)
{
    int duration = 500;
    int32_t result = OH_ArkUI_GetGestureParam_duration(g_LongPressGesture, &duration);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_angle0100(napi_env env, napi_callback_info info)
{
    double angle = 1;
    int32_t result = OH_ArkUI_GetGestureParam_angle(g_LongPressGesture, &angle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_angle0200(napi_env env, napi_callback_info info)
{
    double angle = 1;
    int32_t result = OH_ArkUI_GetGestureParam_angle(g_RotationGesture, &angle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_distanceThreshold0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PinchGesture = gestureApi->createPinchGesture(2, 5);
    double distanceThreshold = 50;
    int32_t result = OH_ArkUI_GetGestureParam_distanceThreshold(PinchGesture, &distanceThreshold);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_distanceThreshold0200(napi_env env, napi_callback_info info)
{
    double distanceThreshold = 50.0;
    int32_t result = OH_ArkUI_GetGestureParam_distanceThreshold(g_TapGesture, &distanceThreshold);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value PanGesture_SetDistanceMap0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto SwipeGesture = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_LEFT, 1);
    int size = 4;
    int ttList[6] = {
        UI_INPUT_EVENT_TOOL_TYPE_FINGER,
        UI_INPUT_EVENT_TOOL_TYPE_PEN,
        UI_INPUT_EVENT_TOOL_TYPE_MOUSE,
        UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD,
    };
    double ttDistance[6] = {
        8,
        10,
        4,
        12,
    };
    int32_t result = OH_ArkUI_PanGesture_SetDistanceMap(SwipeGesture, size, ttList, ttDistance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value PanGesture_SetDistanceMap0200(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, PARAM_5);
    int size = NULL;
    int* toolTypeArray = NULL;
    double* distanceArray = NULL;
    int32_t result = OH_ArkUI_PanGesture_SetDistanceMap(PanGesture, size, toolTypeArray, distanceArray);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value PanGesture_SetDistanceMap0300(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, 5);
    int size = 4;
    int ttList[6] = {
        UI_INPUT_EVENT_TOOL_TYPE_FINGER,
        UI_INPUT_EVENT_TOOL_TYPE_PEN,
        UI_INPUT_EVENT_TOOL_TYPE_MOUSE,
        UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD,
    };
    double ttDistance[6] = {
        8,
        10,
        4,
        12,
    };
    int32_t result = OH_ArkUI_PanGesture_SetDistanceMap(PanGesture, size, ttList, ttDistance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value CreateGestureNode4(napi_env env, napi_callback_info info)
{
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    nodeAPI->addChild(column, button2);
    OH_ArkUI_NodeContent_AddNode(g_content, column);
    ArkUI_AttributeItem item0 = { .string = "Column1" };
    nodeAPI->setAttribute(column, NODE_ID, &item0);
    ArkUI_AttributeItem button1item0 = { .string = "buttonId1" };
    nodeAPI->setAttribute(button1, NODE_ID, &button1item0);
    ArkUI_AttributeItem button2item0 = { .string = "buttonId2" };
    nodeAPI->setAttribute(button2, NODE_ID, &button2item0);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NumberValue width1[] = {{ .f32 = 100 }};
    ArkUI_AttributeItem item11 = {.value = width1, .size = PARAM_1};
    nodeAPI->setAttribute(button1, NODE_WIDTH, &item11);
    nodeAPI->setAttribute(button1, NODE_HEIGHT, &item11);
    nodeAPI->setAttribute(button2, NODE_WIDTH, &item11);
    nodeAPI->setAttribute(button2, NODE_HEIGHT, &item11);
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    g_PanGesture2 = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, PARAM_1_POINT_5);
    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_PanGesture2 = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    gestureApi->addGestureToNode(column, g_PanGesture2, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GetDistanceByToolType0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PinchGesture = gestureApi->createPinchGesture(2, 5);
    int toolType = UI_INPUT_EVENT_TOOL_TYPE_PEN;
    double distance = 0.0;
    int32_t result = OH_ArkUI_PanGesture_GetDistanceByToolType(PinchGesture, toolType, &distance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED ?
                      PARAM_180102 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetDistanceByToolType0200(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, PARAM_5);
    int toolType = UI_INPUT_EVENT_TOOL_TYPE_PEN;
    double distance = 0.0;
    int32_t result = OH_ArkUI_PanGesture_GetDistanceByToolType(PanGesture, toolType, &distance);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetDistanceByToolType0300(napi_env env, napi_callback_info info)
{
    double distance = PARAM_0;
    int32_t result = PARAM_0;
    result = OH_ArkUI_PanGesture_GetDistanceByToolType(g_PanGesture2, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &distance) ==
             ARKUI_ERROR_CODE_NO_ERROR;
    napi_value retValue;
    if (!result) {
        napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "drag", "drag failed: %{public}d", result);
    napi_create_int32(env, distance - PARAM_1_POINT_5 <= PARMA_0_POINT_0001 &&
                      distance - PARAM_1_POINT_5 >= PARMA_NEGATIVE_0_POINT_0001 ?
                      PARAM_0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetTouchTestDoneCallback0100(napi_env env, napi_callback_info info)
{
    static ArkUI_NativeNodeAPI_1 *nodeApi = nullptr;
    nodeApi = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_NodeHandle node = nodeApi->createNode(ARKUI_NODE_XCOMPONENT);
    void* userData = nullptr;
    auto onTouchTestDoneCallback = [](ArkUI_GestureEvent *event, ArkUI_GestureRecognizerHandleArray recognizers,
                                              int32_t count, void *userData) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone",
                             "touchTestDone count is %{public}d", count);
                for (int i = 0; i < count; i++) {
                    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
                    auto type = gestureApi->getGestureType(recognizers[i]);
                    if (type == ArkUI_GestureRecognizerType::TAP_GESTURE) {
                        OH_ArkUI_PreventGestureRecognizerBegin(recognizers[i]);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "i is %{public}d", i);
                    }
                }
            };
    int32_t result = OH_ArkUI_SetTouchTestDoneCallback(node, userData, onTouchTestDoneCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetTouchTestDoneCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_NodeHandle node = nullptr;
    void* userData = nullptr;
    auto onTouchTestDoneCallback = [](ArkUI_GestureEvent *event, ArkUI_GestureRecognizerHandleArray recognizers,
                                              int32_t count, void *userData) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone",
                             "touchTestDone count is %{public}d", count);
                for (int i = 0; i < count; i++) {
                    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
                    auto type = gestureApi->getGestureType(recognizers[i]);
                    if (type == ArkUI_GestureRecognizerType::TAP_GESTURE) {
                        OH_ArkUI_PreventGestureRecognizerBegin(recognizers[i]);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "i is %{public}d", i);
                    }
                }
            };
    int32_t result = OH_ArkUI_SetTouchTestDoneCallback(node, userData, onTouchTestDoneCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value version0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    int32_t result = gestureApi->version;
    napi_value retValue;
    napi_create_int32(env, !(result == g_version), &retValue);
    return retValue;
}

napi_value createTapGestureWithDistanceThreshold0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* TapGestureWithDistanceThreshold =
        gestureApi->createTapGestureWithDistanceThreshold(1, 1, 10.0);
    napi_value retValue;
    napi_create_int32(env, !(TapGestureWithDistanceThreshold != nullptr), &retValue);
    return retValue;
}

napi_value gestureApi10100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_2 *gestureApi2 = nullptr;
    gestureApi2 = reinterpret_cast<ArkUI_NativeGestureAPI_2 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_2"));
    napi_value retValue;
    napi_create_int32(env, !(gestureApi2->gestureApi1 != nullptr), &retValue);
    return retValue;
}

napi_value PreventGestureRecognizerBegin0100(napi_env env, napi_callback_info info)
{
    int32_t result = OH_ArkUI_PreventGestureRecognizerBegin(g_LongPressGesture);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value PreventGestureRecognizerBegin0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizer* recognizer = nullptr;
    int32_t result = OH_ArkUI_PreventGestureRecognizerBegin(recognizer);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}