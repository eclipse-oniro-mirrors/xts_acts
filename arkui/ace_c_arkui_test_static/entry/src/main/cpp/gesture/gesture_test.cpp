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
#include "gesture_test.h"
#include "common/common.h"
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

uint32_t defalutColor = 0xffff0000;
uint32_t actionedColor = 0xff00ff00;
bool flag = false;
ArkUI_NodeHandle longpressNode;

std::vector<double> GestureTest::AxisDataValue = {};
static ani_object SetArrayAniDataWithGesture(const std::vector<double>&values, ani_env* env)
{
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class doubleCls {};
    ani_method doubleCtor {};
    if (ANI_OK != env->FindClass("std.core.Double", &doubleCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Int error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(doubleCls, "<ctor>", "d:", &doubleCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find double Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object doubleObj {};
        if (ANI_OK != env->Object_New(doubleCls, doubleCtor, &doubleObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, doubleObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set double error");
            return nullptr;
        }
    }
    return aniArray;
};

void OnActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
    auto action = OH_ArkUI_UIInputEvent_GetAction(inputEvent);
    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputEvent);
    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 0);
    auto getXByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputEvent, 0);
    auto getYByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputEvent, 0);
    auto getWindowXByIndex = OH_ArkUI_PointerEvent_GetWindowXByIndex(inputEvent, 0);
    auto getWindowYByIndex = OH_ArkUI_PointerEvent_GetWindowYByIndex(inputEvent, 0);
    auto getDisplayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputEvent, 0);
    auto getDisplayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputEvent, 0);
    auto getPressure = OH_ArkUI_PointerEvent_GetPressure(inputEvent, 0);
    auto getTiltX = OH_ArkUI_PointerEvent_GetTiltX(inputEvent, 0);
    auto getTiltY = OH_ArkUI_PointerEvent_GetTiltY(inputEvent, 0);
    auto getTouchAreaWidth = OH_ArkUI_PointerEvent_GetTouchAreaWidth(inputEvent, 0);
    auto getTouchAreaHeight = OH_ArkUI_PointerEvent_GetTouchAreaHeight(inputEvent, 0);
    auto getHistorySize = OH_ArkUI_PointerEvent_GetHistorySize(inputEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  inputEvent %{public}d",
        !!inputEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  sourceType %{public}d",
        sourceType);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  action %{public}d",
        action);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  toolType %{public}d",
        toolType);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  pointerCount %{public}d",
        pointerCount);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  pointerId %{public}d",
        pointerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getXByIndex %{public}f",
        getXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getYByIndex %{public}f",
        getYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getWindowXByIndex %{public}f",
        getWindowXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getWindowYByIndex %{public}f",
        getWindowYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getDisplayXByIndex %{public}f",
        getDisplayXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getDisplayYByIndex %{public}f",
        getDisplayYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getPressure %{public}f",
        getPressure);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTiltY %{public}f",
        getTiltX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTiltY %{public}f",
        getTiltY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  historySize %{public}lu",
        getHistorySize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTouchAreaWidth %{public}f",
        getTouchAreaWidth);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTouchAreaHeight %{public}f",
        getTouchAreaHeight);
    if (!flag && longpressNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(
            ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(longpressNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LONGPRESSGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

ArkUI_NodeHandle CreateNativeNode(char* rootId)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto nativeNode = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue widthValue[] = { {.f32 = 150} };
    ArkUI_AttributeItem widthItem = { .value = widthValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nativeNode, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue heightValue[] = { {.f32 = 150} };
    ArkUI_AttributeItem heightItem = { .value = heightValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nativeNode, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue value[] = {{.u32 = defalutColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nativeNode, NODE_BACKGROUND_COLOR, &value_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = rootId;
    nodeAPI->setAttribute(nativeNode, NODE_ID, &id_item);
    return nativeNode;
}

void GestureTest::CreateLongPressNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    longpressNode = CreateNativeNode("longPressID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(
            ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto longPressGuesture = guestureAPI->createLongPressGesture(1, true, 100);
    guestureAPI->setGestureEventTarget(longPressGuesture, GESTURE_EVENT_ACTION_ACCEPT,
        longpressNode, &OnActionCallBack);
    guestureAPI->addGestureToNode(longpressNode,
        longPressGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, longpressNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ArkUI_NodeHandle swipeNode;
void OnSwipeActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto angle = OH_ArkUI_SwipeGesture_GetAngle(event);
    auto velocity = OH_ArkUI_SwipeGesture_GetVelocity(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "SWIPEGESTURE  swipAction %{public}f", angle);
    if (!flag && swipeNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(swipeNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "SWIPEGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

void GestureTest::CreateSwipeNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    swipeNode = CreateNativeNode("swipeID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGuesture = guestureAPI->createSwipeGesture(1, GESTURE_DIRECTION_ALL, 10);
    guestureAPI->setGestureEventTarget(swipeGuesture,
        GESTURE_EVENT_ACTION_ACCEPT, swipeNode, &OnSwipeActionCallBack);
    guestureAPI->addGestureToNode(swipeNode, swipeGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, swipeNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
static void PushBackDoubleToData(std::vector<double>& data, double value)
{
    data.push_back(value);
}

ArkUI_NodeHandle swipeAxisNode;

void OnActionCallBackAxiss(ArkUI_GestureEvent *event, void *extraparam)
{  
    auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    auto time = OH_ArkUI_UIInputEvent_GetEventTime(inputEvent);
    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputEvent);
    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 0);
    auto pointerIdOne = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 1);
    auto x = OH_ArkUI_PointerEvent_GetX(inputEvent);
    auto XIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputEvent, 0);
    auto y = OH_ArkUI_PointerEvent_GetY(inputEvent);
    auto yIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputEvent, 0);
    
    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputEvent);
    auto displayXIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputEvent, 0);
    
    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputEvent);
    auto displayYIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputEvent, 0);
    
    auto windowX = OH_ArkUI_PointerEvent_GetWindowX(inputEvent);
    auto windowXIndex = OH_ArkUI_PointerEvent_GetWindowXByIndex(inputEvent, 0);
    
    auto windowY = OH_ArkUI_PointerEvent_GetWindowY(inputEvent);
    auto windowYIndex = OH_ArkUI_PointerEvent_GetWindowYByIndex(inputEvent, 0);
    
    auto vertical = OH_ArkUI_AxisEvent_GetVerticalAxisValue(inputEvent);
    auto horizontal = OH_ArkUI_AxisEvent_GetHorizontalAxisValue(inputEvent);
    auto pinch = OH_ArkUI_AxisEvent_GetPinchAxisScaleValue(inputEvent);
   
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "time =  %{public}lld sourceType  %{public}ld toolType  %{public}d pointerCount %{public}d"
    " pointerId %{public}d pointerIdOne%{public}d ", time, sourceType, toolType, pointerCount, pointerId, pointerIdOne);  
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "x =  %{public}f y = %{public}f  xIndex =  %{public}f yIndex = %{public}f "

    "displayX = %{public}f  displayY = %{public}f displayXIndex = %{public}f  windowX = %{public}f windowXIndex = %{public}f windowY =  %{public}f"
     "windowYIndex = %{public}f displayYIndex = %{public}f ", x, y, XIndex, yIndex, displayX, displayY, displayXIndex, windowX,  windowXIndex, windowY,
     windowYIndex, displayYIndex);  

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "vertical =  %{public}f  horizontal =  %{public}f pinch =  %{public}f ", vertical, horizontal
     , pinch);

    PushBackDoubleToData(GestureTest::AxisDataValue, time);
    PushBackDoubleToData(GestureTest::AxisDataValue, sourceType);
    PushBackDoubleToData(GestureTest::AxisDataValue, toolType);
    PushBackDoubleToData(GestureTest::AxisDataValue, pointerCount);
    PushBackDoubleToData(GestureTest::AxisDataValue, pointerId);
    PushBackDoubleToData(GestureTest::AxisDataValue, pointerIdOne);
    PushBackDoubleToData(GestureTest::AxisDataValue, x);
    PushBackDoubleToData(GestureTest::AxisDataValue, XIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, y);
    PushBackDoubleToData(GestureTest::AxisDataValue, yIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, displayX);
    
    PushBackDoubleToData(GestureTest::AxisDataValue, displayXIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, displayY);
    PushBackDoubleToData(GestureTest::AxisDataValue, displayYIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, windowX);
    PushBackDoubleToData(GestureTest::AxisDataValue, windowXIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, windowY);
    PushBackDoubleToData(GestureTest::AxisDataValue, windowYIndex);
    PushBackDoubleToData(GestureTest::AxisDataValue, vertical);
    PushBackDoubleToData(GestureTest::AxisDataValue, horizontal);
    PushBackDoubleToData(GestureTest::AxisDataValue, pinch);
    if (!flag && swipeAxisNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(
            ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(swipeAxisNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "swipe setBackgroundColor result %{public}d", ret);
    }
}



void GestureTest::CreateSwipeAxisNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    swipeAxisNode = CreateNativeNode("swipeAxisID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGuesture = guestureAPI->createSwipeGesture(1, GESTURE_DIRECTION_ALL, 10);
    guestureAPI->setGestureEventTarget(swipeGuesture,
        GESTURE_EVENT_ACTION_ACCEPT, swipeAxisNode, &OnActionCallBackAxiss);
    guestureAPI->addGestureToNode(swipeAxisNode, swipeGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, swipeAxisNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
ArkUI_NodeHandle panNode;
void OnPanActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto offsetY = OH_ArkUI_PanGesture_GetOffsetY(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  offsetY %{public}f", offsetY);
    if (!flag && panNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(panNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
            "Manager", "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

void GestureTest::CreatePanNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    panNode = CreateNativeNode("panID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGuesture = guestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    guestureAPI->setGestureEventTarget(panGuesture, GESTURE_EVENT_ACTION_ACCEPT, panNode, &OnPanActionCallBack);
    guestureAPI->addGestureToNode(panNode, panGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, panNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ArkUI_NodeHandle pinchNode;
void OnPinchActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto scale = OH_ArkUI_PinchGesture_GetScale(event);
    auto centerX = OH_ArkUI_PinchGesture_GetCenterX(event);
    auto centerY = OH_ArkUI_PinchGesture_GetCenterY(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  scale %{public}f", scale);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  centerX %{public}f", centerX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  centerY %{public}f", centerY);
    if (!flag && pinchNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(pinchNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

void GestureTest::CreatePinchNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    pinchNode = CreateNativeNode("PinchID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto pincheGuesture = guestureAPI->createPinchGesture(2, 50);
    guestureAPI->setGestureEventTarget(pincheGuesture,
        GESTURE_EVENT_ACTION_ACCEPT, pinchNode, &OnPinchActionCallBack);
    guestureAPI->addGestureToNode(pinchNode, pincheGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, pinchNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ArkUI_NodeHandle rotateNode;
void OnRotateActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto angle = OH_ArkUI_RotationGesture_GetAngle(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager", "PANGESTURE  angle %{public}f", angle);
    if (!flag && rotateNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));        
        auto ret = nodeAPI->setAttribute(rotateNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

void GestureTest::CreateRotateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    rotateNode = CreateNativeNode("rotateID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto rotateGuesture = guestureAPI->createRotationGesture(2, 0);
    guestureAPI->setGestureEventTarget(
        rotateGuesture, GESTURE_EVENT_ACTION_ACCEPT, rotateNode, &OnRotateActionCallBack);
    guestureAPI->addGestureToNode(rotateNode, rotateGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rotateNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ArkUI_NodeHandle interruptNode;
ArkUI_GestureInterruptResult OnInterruptCallback(ArkUI_GestureInterruptInfo* info)
{
    auto systag = OH_ArkUI_GestureInterruptInfo_GetSystemFlag(info);
    auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
    auto gestureEvent = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto recognizerType = OH_ArkUI_GestureInterruptInfo_GetSystemRecognizerType(info);
    if (gestureEvent == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "onPanCallBack, gestureEvent nullptr");
    } else {
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(gestureEvent);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                         "onPanCallBack, PanGesture sourceType %{public}d", sourceType);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                                     "onPanCallBack, PanGesture toolType %{public}d", toolType);
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "OnInterruptCallback,systag %{public}d", systag);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OnInterruptCallback,systag %{public}d", recognizerType);
    if (!flag && interruptNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(interruptNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

void GestureTest::CreateInterruptNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    flag = false;
    interruptNode = CreateNativeNode("interruptID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGuesture = guestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    guestureAPI->setGestureEventTarget(panGuesture, GESTURE_EVENT_ACTION_ACCEPT, interruptNode, &OnPanActionCallBack);
    guestureAPI->addGestureToNode(interruptNode, panGuesture, PARALLEL, NORMAL_GESTURE_MASK);
    guestureAPI->setGestureInterrupterToNode(interruptNode, &OnInterruptCallback);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, interruptNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
