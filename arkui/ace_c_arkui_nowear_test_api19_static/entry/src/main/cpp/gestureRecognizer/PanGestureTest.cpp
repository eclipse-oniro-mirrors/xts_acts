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

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node_napi.h>
#include <arkui/native_gesture.h>
#include <string>
#include "PanGestureTest.h"
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#define PARAM_NUMBER 1
#define LENGTH 64
#define STRLENGTH 0
#define ABNORMAL_PARAM 1000
#define PARAM_ERROR 401

namespace ArkUICapiTest {
    CallBackPanGestureData PanGestureTest::testCallBackPanGestureData;

  void setKeyEventData(CallBackPanGestureData data) {
    PanGestureTest::testCallBackPanGestureData = data;
  }

  ani_object PanGestureTest::GetPanGestureData(ani_env* env, ani_object info)
  {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "GetKeyEventData");
    ani_class cls{};
    env->FindClass("entry.src.main.ets.pages.gestureRecognizer.type.PanGestureData",&cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", ":", &ctor);
    ani_object panGestureData {};
    env->Object_New(cls, ctor, &panGestureData);
    env->Object_SetFieldByName_Int(panGestureData, "PanGestureSetDistanceMapCode", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --PanGestureSetDistanceMapCode",
       testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeUnknownCode", testCallBackPanGestureData.TypeUnknownCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest[11]","%{public}d --TypeUnknownCode",
       testCallBackPanGestureData.TypeUnknownCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeUnknownDiss", testCallBackPanGestureData.TypeUnknownDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest[11]","%{public}d --TypeUnknownDiss",
       testCallBackPanGestureData.TypeUnknownDiss);
    env->Object_SetFieldByName_Int(panGestureData, "TypeFingerCode", testCallBackPanGestureData.TypeFingerCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest[11]","%{public}d --TypeFingerCode",
       testCallBackPanGestureData.TypeFingerCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeFingerDiss", testCallBackPanGestureData.TypeFingerDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest[11]","%{public}d --TypeFingerDiss",
       testCallBackPanGestureData.TypeFingerDiss);
    env->Object_SetFieldByName_Int(panGestureData, "TypePenCode", testCallBackPanGestureData.TypePenCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest[11]","%{public}d --TypePenCode",
       testCallBackPanGestureData.TypePenCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypePenDiss", testCallBackPanGestureData.TypePenDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypePenDiss",
       testCallBackPanGestureData.TypePenDiss);
    env->Object_SetFieldByName_Int(panGestureData, "TypeMouseCode", testCallBackPanGestureData.TypeMouseCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeMouseCode",
       testCallBackPanGestureData.TypeMouseCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeMouseDiss", testCallBackPanGestureData.TypeMouseDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeMouseDiss",
       testCallBackPanGestureData.TypeMouseDiss);
    env->Object_SetFieldByName_Int(panGestureData, "TypeTouchPadCode", testCallBackPanGestureData.TypeTouchPadCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeTouchPadCode",
       testCallBackPanGestureData.TypeTouchPadCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeTouchPadDiss", testCallBackPanGestureData.TypeTouchPadDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeTouchPadDiss",
       testCallBackPanGestureData.TypeTouchPadDiss);
    env->Object_SetFieldByName_Int(panGestureData, "TypeJoyStickCode", testCallBackPanGestureData.TypeJoyStickCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeJoyStickCode",
       testCallBackPanGestureData.TypeJoyStickCode);
    env->Object_SetFieldByName_Int(panGestureData, "TypeJoyStickDiss", testCallBackPanGestureData.TypeJoyStickDiss);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PanGestureTest","%{public}d --TypeJoyStickDiss",
       testCallBackPanGestureData.TypeJoyStickDiss);
    return panGestureData;
  }

void PanGestureTest::PanGestureTest001(ani_env* env, ani_object info, ani_object NodeContent){
    OH_LOG_INFO(LOG_APP, " [cf]PanGestureTest001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    CallBackPanGestureData testCallBackPanGestureData;

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    // 创建手势并设置回调
    ArkUI_NumberValue value[] = {{.u32 = 0xff112233}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_NumberValue widthValue[] = {{500}};
    ArkUI_AttributeItem width = {widthValue, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &width);
    ArkUI_NumberValue heightValue[] = {{800}};
    ArkUI_AttributeItem height = {heightValue, 1};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ColumnID";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    // 创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, 6);
    auto PanGestureSetDistanceMapCode = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "11pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", PanGestureSetDistanceMapCode);
    testCallBackPanGestureData.PanGestureSetDistanceMapCode = PanGestureSetDistanceMapCode;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "12pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "pan before OH_ArkUI_PanGesture_SetDistanceMap");
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
    auto errode = OH_ArkUI_PanGesture_SetDistanceMap(LongPressGesture, 4, ttList, ttDistance);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_PanGesture_SetDistanceMap code:%{public}d", errode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
         "onLongPressCallBack, LongPressGesture pointer %{public}p", LongPressGesture);
    if (gestureApi->getGestureType) {
        ArkUI_GestureRecognizerType type = gestureApi->getGestureType(LongPressGesture);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack, ArkUI_GestureRecognizerType %{public}d", type);
        }
        // 设置回调
        auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        ArkUI_GestureEventActionType actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack,fingers=2, actionType %{public}d", actionType);
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto offsetX =  OH_ArkUI_PanGesture_GetOffsetX(event);
        auto offsety =  OH_ArkUI_PanGesture_GetOffsetY(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                 "onLongPressCallBack, LongPressGesture sourceType %{public}d, offsetX %{public}f, "
                 "offsety %{public}f", sourceType,offsetX,offsety);
        };
        auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
            auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
            double diss0 = 0.0;
            double diss1 = 0.0;
            double diss2 = 0.0;
            double diss3 = 0.0;
            double diss4 = 0.0;
            double diss5 = 0.0;
            double diss6 = 0.0;
            auto errode2 = OH_ArkUI_GetGestureParam_distance(recognizer, &diss0);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_GetGestureParam_distance code:%{public}d, diss:%{public}f", errode2, diss0);
            auto errode1 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &diss1);
            auto errode22 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_FINGER, &diss2);
            auto errode3 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_PEN, &diss3);
            auto errode4 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_MOUSE, &diss4);
            auto errode5 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD, &diss5);
            auto errode6 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK, &diss6);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN code:%{public}d, diss:%{public}f", errode1, diss1);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_FINGER code:%{public}d, diss:%{public}f", errode22, diss2);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_PEN code:%{public}d, diss:%{public}f", errode3, diss3);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_MOUSE code:%{public}d, diss:%{public}f", errode4, diss4);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD code:%{public}d, diss:%{public}f", errode5, diss5);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK code:%{public}d, diss:%{public}f", errode6, diss6);
            CallBackPanGestureData testCallBackPanGestureData;
            testCallBackPanGestureData.TypeUnknownCode = errode1;
            testCallBackPanGestureData.TypeUnknownDiss = diss1;
            testCallBackPanGestureData.TypeFingerCode = errode22;
            testCallBackPanGestureData.TypeFingerDiss = diss2;
            testCallBackPanGestureData.TypePenCode = errode3;
            testCallBackPanGestureData.TypePenDiss = diss3;
            testCallBackPanGestureData.TypeMouseCode = errode4;
            testCallBackPanGestureData.TypeMouseDiss = diss4;
            testCallBackPanGestureData.TypeTouchPadCode = errode5;
            testCallBackPanGestureData.TypeTouchPadDiss = diss5;
            testCallBackPanGestureData.TypeJoyStickCode = errode6;
            testCallBackPanGestureData.TypeJoyStickDiss = diss6;
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "14pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
            setKeyEventData(testCallBackPanGestureData);
            return GESTURE_INTERRUPT_RESULT_CONTINUE;
        };
    // 把回调挂到手势上
    gestureApi->setGestureEventTarget(LongPressGesture, GESTURE_EVENT_ACTION_ACCEPT, column, onActionCallBack);
    // 将手势设置到组件上
    gestureApi->addGestureToNode(column, LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    setKeyEventData(testCallBackPanGestureData);

 // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void PanGestureTest::PanGestureTest002(ani_env* env, ani_object info, ani_object NodeContent){
   OH_LOG_INFO(LOG_APP, " [cf]PanGestureTest002 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    CallBackPanGestureData testCallBackPanGestureData;

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    // 创建手势并设置回调
    ArkUI_NumberValue value[] = {{.u32 = 0xff00a233}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_NumberValue widthValue[] = {{500}};
    ArkUI_AttributeItem width = {widthValue, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &width);
    ArkUI_NumberValue heightValue[] = {{800}};
    ArkUI_AttributeItem height = {heightValue, 1};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ColumnID";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    // 创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    auto PanGestureSetDistanceMapCode = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "21pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", PanGestureSetDistanceMapCode);
    testCallBackPanGestureData.PanGestureSetDistanceMapCode = PanGestureSetDistanceMapCode;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "22pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "pan before OH_ArkUI_PanGesture_SetDistanceMap");
    int ttList[6] = { 
    UI_INPUT_EVENT_TOOL_TYPE_PEN,
    };
    double ttDistance[6] = { 
    10,
    };
    auto errode = OH_ArkUI_PanGesture_SetDistanceMap(LongPressGesture, 1, ttList, ttDistance);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_PanGesture_SetDistanceMap code:%{public}d", errode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
         "onLongPressCallBack, LongPressGesture pointer %{public}p", LongPressGesture);
    if (gestureApi->getGestureType) {
        ArkUI_GestureRecognizerType type = gestureApi->getGestureType(LongPressGesture);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack, ArkUI_GestureRecognizerType %{public}d", type);
        }
        // 设置回调
        auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        ArkUI_GestureEventActionType actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack,fingers=2, actionType %{public}d", actionType);
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto offsetX =  OH_ArkUI_PanGesture_GetOffsetX(event);
        auto offsety =  OH_ArkUI_PanGesture_GetOffsetY(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                 "onLongPressCallBack, LongPressGesture sourceType %{public}d, offsetX %{public}f, "
                 "offsety %{public}f", sourceType,offsetX,offsety);
        };
        auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
            auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
            double diss0 = 0.0;
            double diss1 = 0.0;
            double diss2 = 0.0;
            double diss3 = 0.0;
            double diss4 = 0.0;
            double diss5 = 0.0;
            double diss6 = 0.0;
            auto errode2 = OH_ArkUI_GetGestureParam_distance(recognizer, &diss0);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_GetGestureParam_distance code:%{public}d, diss:%{public}f", errode2, diss0);
            auto errode1 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &diss1);
            auto errode22 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_FINGER, &diss2);
            auto errode3 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_PEN, &diss3);
            auto errode4 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_MOUSE, &diss4);
            auto errode5 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD, &diss5);
            auto errode6 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK, &diss6);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN code:%{public}d, diss:%{public}f", errode1, diss1);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_FINGER code:%{public}d, diss:%{public}f", errode22, diss2);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_PEN code:%{public}d, diss:%{public}f", errode3, diss3);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_MOUSE code:%{public}d, diss:%{public}f", errode4, diss4);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD code:%{public}d, diss:%{public}f", errode5, diss5);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK code:%{public}d, diss:%{public}f", errode6, diss6);
            CallBackPanGestureData testCallBackPanGestureData;
            testCallBackPanGestureData.TypeUnknownCode = errode1;
            testCallBackPanGestureData.TypeUnknownDiss = diss1;
            testCallBackPanGestureData.TypeFingerCode = errode22;
            testCallBackPanGestureData.TypeFingerDiss = diss2;
            testCallBackPanGestureData.TypePenCode = errode3;
            testCallBackPanGestureData.TypePenDiss = diss3;
            testCallBackPanGestureData.TypeMouseCode = errode4;
            testCallBackPanGestureData.TypeMouseDiss = diss4;
            testCallBackPanGestureData.TypeTouchPadCode = errode5;
            testCallBackPanGestureData.TypeTouchPadDiss = diss5;
            testCallBackPanGestureData.TypeJoyStickCode = errode6;
            testCallBackPanGestureData.TypeJoyStickDiss = diss6;
            setKeyEventData(testCallBackPanGestureData);
            return GESTURE_INTERRUPT_RESULT_CONTINUE;
        };
    // 把回调挂到手势上
    gestureApi->setGestureEventTarget(LongPressGesture, GESTURE_EVENT_ACTION_ACCEPT, column, onActionCallBack);
    // 将手势设置到组件上
    gestureApi->addGestureToNode(column, LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    setKeyEventData(testCallBackPanGestureData);
    
    
     // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void PanGestureTest::PanGestureTest003(ani_env* env, ani_object info, ani_object NodeContent){
    OH_LOG_INFO(LOG_APP, " [cf]PanGestureTest001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    CallBackPanGestureData testCallBackPanGestureData;

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    // 创建手势并设置回调
    ArkUI_NumberValue value[] = {{.u32 = 0xff112233}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_NumberValue widthValue[] = {{500}};
    ArkUI_AttributeItem width = {widthValue, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &width);
    ArkUI_NumberValue heightValue[] = {{800}};
    ArkUI_AttributeItem height = {heightValue, 1};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ColumnID";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    // 创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, 10);
    auto PanGestureSetDistanceMapCode = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "31pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", PanGestureSetDistanceMapCode);
    testCallBackPanGestureData.PanGestureSetDistanceMapCode = PanGestureSetDistanceMapCode;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "32pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "pan before OH_ArkUI_PanGesture_SetDistanceMap");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
         "onLongPressCallBack, LongPressGesture pointer %{public}p", LongPressGesture);
    if (gestureApi->getGestureType) {
        ArkUI_GestureRecognizerType type = gestureApi->getGestureType(LongPressGesture);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack, ArkUI_GestureRecognizerType %{public}d", type);
        }
        // 设置回调
        auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        ArkUI_GestureEventActionType actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack,fingers=2, actionType %{public}d", actionType);
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto offsetX =  OH_ArkUI_PanGesture_GetOffsetX(event);
        auto offsety =  OH_ArkUI_PanGesture_GetOffsetY(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                 "onLongPressCallBack, LongPressGesture sourceType %{public}d, offsetX %{public}f, "
                 "offsety %{public}f", sourceType,offsetX,offsety);
        };
        auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
            auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
            double diss0 = 0.0;
            double diss1 = 0.0;
            double diss2 = 0.0;
            double diss3 = 0.0;
            double diss4 = 0.0;
            double diss5 = 0.0;
            double diss6 = 0.0;
            auto errode2 = OH_ArkUI_GetGestureParam_distance(recognizer, &diss0);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_GetGestureParam_distance code:%{public}d, diss:%{public}f", errode2, diss0);
            auto errode1 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &diss1);
            auto errode22 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_FINGER, &diss2);
            auto errode3 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_PEN, &diss3);
            auto errode4 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_MOUSE, &diss4);
            auto errode5 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD, &diss5);
            auto errode6 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK, &diss6);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN code:%{public}d, diss:%{public}f", errode1, diss1);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_FINGER code:%{public}d, diss:%{public}f", errode22, diss2);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_PEN code:%{public}d, diss:%{public}f", errode3, diss3);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_MOUSE code:%{public}d, diss:%{public}f", errode4, diss4);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD code:%{public}d, diss:%{public}f", errode5, diss5);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK code:%{public}d, diss:%{public}f", errode6, diss6);
            CallBackPanGestureData testCallBackPanGestureData;
            testCallBackPanGestureData.TypeUnknownCode = errode1;
            testCallBackPanGestureData.TypeUnknownDiss = diss1;
            testCallBackPanGestureData.TypeFingerCode = errode22;
            testCallBackPanGestureData.TypeFingerDiss = diss2;
            testCallBackPanGestureData.TypePenCode = errode3;
            testCallBackPanGestureData.TypePenDiss = diss3;
            testCallBackPanGestureData.TypeMouseCode = errode4;
            testCallBackPanGestureData.TypeMouseDiss = diss4;
            testCallBackPanGestureData.TypeTouchPadCode = errode5;
            testCallBackPanGestureData.TypeTouchPadDiss = diss5;
            testCallBackPanGestureData.TypeJoyStickCode = errode6;
            testCallBackPanGestureData.TypeJoyStickDiss = diss6;
            setKeyEventData(testCallBackPanGestureData);
            return GESTURE_INTERRUPT_RESULT_CONTINUE;
        };
    // 把回调挂到手势上
    gestureApi->setGestureEventTarget(LongPressGesture, GESTURE_EVENT_ACTION_ACCEPT, column, onActionCallBack);
    // 将手势设置到组件上
    gestureApi->addGestureToNode(column, LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    setKeyEventData(testCallBackPanGestureData);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void PanGestureTest::PanGestureTest004(ani_env* env, ani_object info, ani_object NodeContent){
    OH_LOG_INFO(LOG_APP, " [cf]PanGestureTest001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    CallBackPanGestureData testCallBackPanGestureData;

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    // 创建手势并设置回调
    ArkUI_NumberValue value[] = {{.u32 = 0xff00a233}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_NumberValue widthValue[] = {{500}};
    ArkUI_AttributeItem width = {widthValue, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &width);
    ArkUI_NumberValue heightValue[] = {{800}};
    ArkUI_AttributeItem height = {heightValue, 1};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ColumnID";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    // 创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, 0);
    auto PanGestureSetDistanceMapCode = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "41pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", PanGestureSetDistanceMapCode);
    testCallBackPanGestureData.PanGestureSetDistanceMapCode = PanGestureSetDistanceMapCode;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "42pan after OH_ArkUI_SetGestureRecognizerLimitFingerCount code:%{public}d", testCallBackPanGestureData.PanGestureSetDistanceMapCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "pan before OH_ArkUI_PanGesture_SetDistanceMap");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
         "onLongPressCallBack, LongPressGesture pointer %{public}p", LongPressGesture);
    if (gestureApi->getGestureType) {
        ArkUI_GestureRecognizerType type = gestureApi->getGestureType(LongPressGesture);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack, ArkUI_GestureRecognizerType %{public}d", type);
        }
        // 设置回调
        auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        ArkUI_GestureEventActionType actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "onLongPressCallBack,fingers=2, actionType %{public}d", actionType);
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto offsetX =  OH_ArkUI_PanGesture_GetOffsetX(event);
        auto offsety =  OH_ArkUI_PanGesture_GetOffsetY(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                 "onLongPressCallBack, LongPressGesture sourceType %{public}d, offsetX %{public}f, "
                 "offsety %{public}f", sourceType,offsetX,offsety);
        };
        auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
            auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
            double diss0 = 0.0;
            double diss1 = 0.0;
            double diss2 = 0.0;
            double diss3 = 0.0;
            double diss4 = 0.0;
            double diss5 = 0.0;
            double diss6 = 0.0;
            auto errode2 = OH_ArkUI_GetGestureParam_distance(recognizer, &diss0);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after OH_ArkUI_GetGestureParam_distance code:%{public}d, diss:%{public}f", errode2, diss0);
            auto errode1 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &diss1);
            auto errode22 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_FINGER, &diss2);
            auto errode3 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_PEN, &diss3);
            auto errode4 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_MOUSE, &diss4);
            auto errode5 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD, &diss5);
            auto errode6 = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK, &diss6);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN code:%{public}d, diss:%{public}f", errode1, diss1);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_FINGER code:%{public}d, diss:%{public}f", errode22, diss2);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_PEN code:%{public}d, diss:%{public}f", errode3, diss3);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_MOUSE code:%{public}d, diss:%{public}f", errode4, diss4);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD code:%{public}d, diss:%{public}f", errode5, diss5);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest", "pan after UI_INPUT_EVENT_TOOL_TYPE_JOYSTICK code:%{public}d, diss:%{public}f", errode6, diss6);
            CallBackPanGestureData testCallBackPanGestureData;
            testCallBackPanGestureData.TypeUnknownCode = errode1;
            testCallBackPanGestureData.TypeUnknownDiss = diss1;
            testCallBackPanGestureData.TypeFingerCode = errode22;
            testCallBackPanGestureData.TypeFingerDiss = diss2;
            testCallBackPanGestureData.TypePenCode = errode3;
            testCallBackPanGestureData.TypePenDiss = diss3;
            testCallBackPanGestureData.TypeMouseCode = errode4;
            testCallBackPanGestureData.TypeMouseDiss = diss4;
            testCallBackPanGestureData.TypeTouchPadCode = errode5;
            testCallBackPanGestureData.TypeTouchPadDiss = diss5;
            testCallBackPanGestureData.TypeJoyStickCode = errode6;
            testCallBackPanGestureData.TypeJoyStickDiss = diss6;
            setKeyEventData(testCallBackPanGestureData);
            return GESTURE_INTERRUPT_RESULT_CONTINUE;
        };
    // 把回调挂到手势上
    gestureApi->setGestureEventTarget(LongPressGesture, GESTURE_EVENT_ACTION_ACCEPT, column, onActionCallBack);
    // 将手势设置到组件上
    gestureApi->addGestureToNode(column, LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    setKeyEventData(testCallBackPanGestureData);
    
     // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}


} // namespace ArkUICapiTest