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

#include <asm-generic/stat.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_gesture.h>
#include <arkui/native_key_event.h>
#include <hilog/log.h>
#include "manager.h"


namespace NativeXComponentSample {
Manager Manager::manager_;
ArkUI_NodeHandle refresh;

Manager::~Manager() {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    for (auto iter = nativeXComponentMap_.begin(); iter != nativeXComponentMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            iter->second = nullptr;
        }
    }
    nativeXComponentMap_.clear();

    for (auto iter = containerMap_.begin(); iter != containerMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    containerMap_.clear();
}

static ArkUI_AnimatorHandle animatorHandle = nullptr;
static ArkUI_AnimatorOption *animatorOption = nullptr;
static ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle showContent = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;

int32_t r1 = -2;
int32_t r2= -2;
int32_t r3= -2;
int32_t r4= -2;
int32_t r5= -2;
int32_t r6= -2;
int32_t ccc= -2;
int32_t ccc1= -2;


struct AA {
    int32_t a;
};

napi_value Manager::CreateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  1111");

    size_t argCnt = 2;
    napi_value args[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }

    if (argCnt < 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  2222 %{public}s", idStr);

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  3333333");

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        static auto manager = Manager::GetInstance();
        if (manager == nullptr) {
            return nullptr;
        }
          ArkUI_NumberValue hvalue[] = {450};
        ArkUI_AttributeItem hitemPost = {hvalue, 1};
        ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_STACK);

        static ArkUI_NodeHandle cnode = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        static ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        static ArkUI_NodeHandle scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
        nodeAPI->setAttribute(scroll, NODE_HEIGHT,&hitemPost);
        ArkUI_AttributeItem TextItem2 = {.string = std::to_string(ccc).c_str()};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &TextItem2);
        
        manager->cnode_ = cnode;
        ArkUI_NumberValue value[] = {450};
        ArkUI_AttributeItem itemPost = {value, 1};

        ArkUI_AttributeItem imageSrc = {.string = "/pages/common/icon.png"};

        nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &imageSrc);
        nodeAPI->setAttribute(cnode, NODE_TEXT_LINE_HEIGHT, &itemPost);
        auto ret1 = nodeAPI->getAttribute(cnode, NODE_TEXT_LINE_HEIGHT);
        static auto Column11 = nodeAPI->createNode(ARKUI_NODE_COLUMN);

        auto innerColumn = nodeAPI->createNode(ARKUI_NODE_BUTTON);
           ArkUI_AttributeItem LABEL_inner = {.string = "原组件"};
        nodeAPI->setAttribute(innerColumn, NODE_BUTTON_LABEL, &LABEL_inner);
        static auto addButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_Item1 = {.string = "销毁cnode"};
        nodeAPI->setAttribute(addButton, NODE_BUTTON_LABEL, &LABEL_Item1);
        nodeAPI->registerNodeEvent(addButton, NODE_ON_CLICK, 0, nullptr);
        
        ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFFFF00}};
        ArkUI_AttributeItem colorItem = {colorValue, 1};
        ArkUI_NumberValue value1[] = {5};
        ArkUI_AttributeItem columnItem = {value1, 1};
         ArkUI_NumberValue value2[] = {10};
        ArkUI_AttributeItem columnIte2 = {value2, 1};
        nodeAPI->setAttribute(innerColumn, NODE_BACKGROUND_COLOR, &colorItem);
        nodeAPI->setAttribute(innerColumn, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(innerColumn, NODE_WIDTH, &columnIte2);
        
        nodeAPI->setAttribute(addButton, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(addButton, NODE_WIDTH, &columnIte2);
        
        ArkUI_NumberValue colorValue1[] = {{.u32 = 0xFFFFFF00}};
        ArkUI_AttributeItem cnodeColorItem = {colorValue1, 1};
        nodeAPI->setAttribute(cnode, NODE_BACKGROUND_COLOR, &cnodeColorItem);
        nodeAPI->setAttribute(cnode, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(cnode, NODE_WIDTH, &columnIte2);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "capi on Scroll Y: %{public}f",
                     ret1->value[0].f32);


        auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        static auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button1 = {.string = "空指针"};
        nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_button1);
        nodeAPI->setAttribute(button1, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button1, NODE_WIDTH, &columnIte2);

        auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button2 = {.string = "传入非克隆事件"};
        nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_button2);
        nodeAPI->setAttribute(button2, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button2, NODE_WIDTH, &columnIte2);

        auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button3 = {.string = "多次post到同一个node"};
        nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_button3);
        nodeAPI->setAttribute(button3, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button3, NODE_WIDTH, &columnIte2);

        auto button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button4 = {.string = "当没有touchDown时post到node"};
        nodeAPI->setAttribute(button4, NODE_BUTTON_LABEL, &LABEL_button4);
        nodeAPI->setAttribute(button4, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button4, NODE_WIDTH, &columnIte2);

        auto button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button5 = {.string = "多次post到不同一个node"};
        nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_button5);
        nodeAPI->setAttribute(button5, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button5, NODE_WIDTH, &columnIte2);

        auto button6 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button6 = {.string = "指定组件（text）没有绑定事件"};
        nodeAPI->setAttribute(button6, NODE_BUTTON_LABEL, &LABEL_button6);
        nodeAPI->setAttribute(button6, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button6, NODE_WIDTH, &columnIte2);

        auto button7 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button7 = {.string = "坐标设置为负数"};
        nodeAPI->setAttribute(button7, NODE_BUTTON_LABEL, &LABEL_button7);
        nodeAPI->setAttribute(button7, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button7, NODE_WIDTH, &columnIte2);

        auto button8 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button8 = {.string = "坐标设置为超大值"};
        nodeAPI->setAttribute(button8, NODE_BUTTON_LABEL, &LABEL_button8);
        nodeAPI->setAttribute(button8, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button8, NODE_WIDTH, &columnIte2);
        
             
         auto button9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button9 = {.string = "漏发up事件"};
        nodeAPI->setAttribute(button9, NODE_BUTTON_LABEL, &LABEL_button9);
        nodeAPI->setAttribute(button9, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button9, NODE_WIDTH, &columnIte2);
        
        auto button10 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button10 = {.string = "先销毁事件，再去派发"};
        nodeAPI->setAttribute(button10, NODE_BUTTON_LABEL, &LABEL_button10);
        nodeAPI->setAttribute(button10, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button10, NODE_WIDTH, &columnIte2);
        
        auto button11 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button11 = {.string = "node没有上树"};
        nodeAPI->setAttribute(button11, NODE_BUTTON_LABEL, &LABEL_button11);
        nodeAPI->setAttribute(button11, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button11, NODE_WIDTH, &columnIte2);
        
          auto button12 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button12 = {.string = "任意的fingerId"};
        nodeAPI->setAttribute(button12, NODE_BUTTON_LABEL, &LABEL_button12);
        nodeAPI->setAttribute(button12, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button12, NODE_WIDTH, &columnIte2);
        
               auto button13 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem LABEL_button13 = {.string = "非当前的action"};
        nodeAPI->setAttribute(button13, NODE_BUTTON_LABEL, &LABEL_button13);
        nodeAPI->setAttribute(button13, NODE_HEIGHT, &columnItem);
        nodeAPI->setAttribute(button13, NODE_WIDTH, &columnIte2);
     

        nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, 2, nullptr);
        nodeAPI->registerNodeEvent(innerColumn, NODE_TOUCH_EVENT, 3, nullptr);
        nodeAPI->registerNodeEvent(innerColumn, NODE_ON_CLICK, 4, nullptr);
        nodeAPI->registerNodeEvent(cnode, NODE_TOUCH_EVENT, 3, nullptr);
        nodeAPI->registerNodeEvent(cnode, NODE_ON_CLICK, 4, nullptr);
        nodeAPI->registerNodeEvent(button1, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button2, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button3, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button4, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button5, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button6, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button7, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button8, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button9, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button10, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button11, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button12, NODE_TOUCH_EVENT, 0, nullptr);
        nodeAPI->registerNodeEvent(button13, NODE_TOUCH_EVENT, 0, nullptr);
        
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
        
        
        auto gesture = gestureApi->createRotationGesture(2, -1);
        auto gesture1 = gestureApi->createRotationGesture(2, -1);
        
        
        auto onActionCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto time = OH_ArkUI_UIInputEvent_GetEventTime(inputEvent);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
        auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputEvent);
        auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 0);
        auto pointerIdOne = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 1);
        auto x = OH_ArkUI_PointerEvent_GetX(inputEvent);
        auto xIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputEvent, 0);
        auto y = OH_ArkUI_PointerEvent_GetY(inputEvent);
        auto yIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputEvent, 0);
        auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputEvent);
        auto displayXIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputEvent, 0);
        auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputEvent);
        auto displayYIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode b  swipe trigger end");
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode onActionCallback before setGestureEventTarget time = %{public}ld sourceType %{public}d toolType "
                     "%{public}d pointerCount %{public}d pointerId %{public}d pointerIdOne %{public}d",
                     time, sourceType, toolType, pointerCount, pointerId, pointerIdOne);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode onActionCallback before setGestureEventTarget x = "
                     "%{public}f xIndex %{public}f y = %{public}f yIndex = %{public}f displayX = %{public}f "
                     "displayXIndex = "
                     "%{public}f displayY = %{public}f displayYIndex = %{public}f ",
                     x, xIndex, y, yIndex, displayX, displayXIndex, displayY, displayYIndex);
};

gestureApi->setGestureEventTarget(gesture, GESTURE_EVENT_ACTION_ACCEPT|GESTURE_EVENT_ACTION_UPDATE| GESTURE_EVENT_ACTION_END|GESTURE_EVENT_ACTION_CANCEL, innerColumn, onActionCallback);
gestureApi->addGestureToNode(innerColumn, gesture, ArkUI_GesturePriority::PARALLEL,ArkUI_GestureMask::NORMAL_GESTURE_MASK);
        


auto onActionCallback1 = [](ArkUI_GestureEvent *event, void *extraParams) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto time = OH_ArkUI_UIInputEvent_GetEventTime(inputEvent);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
        auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputEvent);
        auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 0);
        auto pointerIdOne = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 1);
        auto x = OH_ArkUI_PointerEvent_GetX(inputEvent);
        auto xIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputEvent, 0);
        auto y = OH_ArkUI_PointerEvent_GetY(inputEvent);
        auto yIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputEvent, 0);
        auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputEvent);
        auto displayXIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputEvent, 0);
        auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputEvent);
        auto displayYIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode a  swipe trigger end");
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode onActionCallback cnode setGestureEventTarget time = %{public}ld sourceType %{public}d toolType "
                     "%{public}d pointerCount %{public}d pointerId %{public}d pointerIdOne %{public}d",
                     time, sourceType, toolType, pointerCount, pointerId, pointerIdOne);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode onActionCallback cnode setGestureEventTarget x = "
                     "%{public}f xIndex %{public}f y = %{public}f yIndex = %{public}f displayX = %{public}f "
                     "displayXIndex = "
                     "%{public}f displayY = %{public}f displayYIndex = %{public}f",
                     x, xIndex, y, yIndex, displayX, displayXIndex, displayY, displayYIndex);
};

gestureApi->setGestureEventTarget(gesture1, GESTURE_EVENT_ACTION_ACCEPT|GESTURE_EVENT_ACTION_UPDATE| GESTURE_EVENT_ACTION_END|GESTURE_EVENT_ACTION_CANCEL, cnode, onActionCallback1);
gestureApi->addGestureToNode(cnode, gesture1, ArkUI_GesturePriority::PARALLEL,ArkUI_GestureMask::NORMAL_GESTURE_MASK);



        nodeAPI->addNodeEventReceiver(addButton, [](ArkUI_NodeEvent *event) {
            if (cnode != nullptr) {
                nodeAPI->removeChild(Column11, cnode);
                nodeAPI->disposeNode(cnode);
                cnode = nullptr;
                manager->cnode_ =nullptr;
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "C-api test demo dispose cnode");
            }
          });
          nodeAPI->addNodeEventReceiver(innerColumn, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
            case NODE_TOUCH_EVENT: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
                r6 = OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto cnode = manager->GetCnode();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
               
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                ArkUI_IntOffset *offset = new ArkUI_IntOffset[2];
            
             if (cnode != nullptr) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode dispose null ");
                 }
                 auto r7=   OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode dispose OH_ArkUI_NodeUtils_GetPositionToParent = %{public}d ",r7);

                auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                r2 =OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);

                // UI_TOUCH_EVENT_ACTION_DOWN
                r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(cloneEvent, action);
                    
                r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, pointerId, 0);


                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                ArkUI_AttributeItem TextItem2 = {.string = std::to_string(ccc).c_str()};
                nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &TextItem2);
                    
                    
                    OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d， CreateClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd, r6);
                break;
            }
            case NODE_ON_CLICK: {
                  ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto action = OH_ArkUI_UIInputEvent_GetAction(inputevent);
            auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputevent);
            auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputevent);
            auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputevent, 0);
            auto x = OH_ArkUI_PointerEvent_GetX(inputevent);
            auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputevent, 0);
            auto y = OH_ArkUI_PointerEvent_GetY(inputevent);
            auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputevent, 0);
            auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputevent);
            auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputevent, 0);
            auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputevent);
            auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputevent, 0);
            auto pressure = OH_ArkUI_PointerEvent_GetPressure(inputevent, 0);
            auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputevent);
            auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputevent);
            auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputevent, 0);
            auto time = std::to_string(pressedTimeByIndex);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "CreateNativeNode addNodeEventReceiver before click event receive before GetAction action = "
                         "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                         "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                         "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                         "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                         action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
            pressure, targetDisplayId, pointerCount, time.c_str()); 
                break;
            }
                default: {
                    break;
                }
            }
        });
        
         nodeAPI->addNodeEventReceiver(button13, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
            case NODE_TOUCH_EVENT: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
               r6 = OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto cnode = manager->GetCnode();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                ArkUI_IntOffset *offset = new ArkUI_IntOffset[2];
                
                if (cnode != NULL) {
                    OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
    

                auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                r2 =OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);

                // UI_TOUCH_EVENT_ACTION_DOWN
                r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(cloneEvent, UI_TOUCH_EVENT_ACTION_UP);
                    
                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                
                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                 OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d， CreateClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd, r6);
                break;
            }
            case NODE_ON_CLICK: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
                OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before click event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                break;
            }
                default: {
                    break;
                }
            }
        });
        
         nodeAPI->addNodeEventReceiver(button12, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
            case NODE_TOUCH_EVENT: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
               r6 = OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto cnode = manager->GetCnode();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                ArkUI_IntOffset *offset = new ArkUI_IntOffset[2];
                
                if (cnode != NULL) {
                    OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
    

                auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                r2 =OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);

                // UI_TOUCH_EVENT_ACTION_DOWN
                r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(cloneEvent, action);

                r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);


                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                
                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                 OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d， CreateClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd, r6);
                break;
            }
            case NODE_ON_CLICK: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
                OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before click event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                break;
            }
                default: {
                    break;
                }
            }
        });
        
          nodeAPI->addNodeEventReceiver(button11, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
            case NODE_TOUCH_EVENT: {
                ArkUI_UIInputEvent *inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                ArkUI_UIInputEvent *cloneEvent;
               r6 = OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                auto manager = Manager::GetInstance();
                auto cnode = manager->GetCnode();
                auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);

                auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                auto time = std::to_string(pressedTimeByIndex);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                             "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                             "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                             "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  "
                             "displayYByIndex = %{public}f,"
                             "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, "
                             "pressedTimeByIndex = %{public}s",
                             action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX,
                             displayXByIndex, displayY, displayYByIndex, pressure, targetDisplayId, pointerCount,
                             time.c_str());
                ArkUI_IntOffset *offset = new ArkUI_IntOffset[2];
                
                if (cnode != NULL) {
                    OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
    

                auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                r2 =OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);

                // UI_TOUCH_EVENT_ACTION_DOWN
                r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(cloneEvent, action);


                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(button0, cloneEvent);
                
                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                 OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d， CreateClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd, r6);
                break;
            }
            case NODE_ON_CLICK: {
                     ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto action = OH_ArkUI_UIInputEvent_GetAction(inputevent);
            auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputevent);
            auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputevent);
            auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputevent, 0);
            auto x = OH_ArkUI_PointerEvent_GetX(inputevent);
            auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputevent, 0);
            auto y = OH_ArkUI_PointerEvent_GetY(inputevent);
            auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputevent, 0);
            auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputevent);
            auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputevent, 0);
            auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputevent);
            auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputevent, 0);
            auto pressure = OH_ArkUI_PointerEvent_GetPressure(inputevent, 0);
            auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputevent);
            auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputevent);
            auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputevent, 0);
            auto time = std::to_string(pressedTimeByIndex);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "CreateNativeNode addNodeEventReceiver before click event receive before GetAction action = "
                         "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                         "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                         "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                         "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                         action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
            pressure, targetDisplayId, pointerCount, time.c_str()); 
                break;
            }
                default: {
                    break;
                }
            }
        });
        
        nodeAPI->addNodeEventReceiver(button10, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				r6 = OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                //
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                // 100000
                //-100
                r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                    

                r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);

                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                cloneEvent = nullptr;
                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);


                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d， CreateClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd, r6);
                
               
                  
                
                break;
                }
                default: {
                    break;
                }
            }
        });
        
        nodeAPI->addNodeEventReceiver(button9, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN
//                  r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(cloneEvent, action);

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);


                if (action != UI_TOUCH_EVENT_ACTION_UP) {

                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);

                    auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                    OH_LOG_Print(
                        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                        "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                        "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                        "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d",
                        ccc, r1, r2, r3, r4, r5, ddd);
                }
                   
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
         nodeAPI->addNodeEventReceiver(button8, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                //
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                      //100000
                      //-100
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, 99999999999, 99999999999);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, 99999999999, 99999999999, 0);

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
                
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                   
                
      
                       auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
            nodeAPI->addNodeEventReceiver(button7, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                //
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                      //100000
                      //-100
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, -10, -10);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, -10, -10, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
                
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
              
      
                     auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });

        nodeAPI->addNodeEventReceiver(button6, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                      //100000
                      //-100
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                
                      //UI_TOUCH_EVENT_ACTION_DOWN

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(text, cloneEvent);
               
                       auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
            nodeAPI->addNodeEventReceiver(button5, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                
                      // UI_TOUCH_EVENT_ACTION_DOWN

                r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);


                ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                  ArkUI_IntOffset* offset1 = new ArkUI_IntOffset[2];
                
                  if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(text, offset);
                }

                    auto offsetx1 = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset1->x;
                    auto offsety1 = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset1->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx1, offsety1);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx1, offsety1, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN

                r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
                ccc1 = OH_ArkUI_PointerEvent_PostClonedEvent(text, cloneEvent);


                auto ddd = OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                
                
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                    "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                    "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d",
                    ccc, r1, r2, r3, r4, r5, ddd);

                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                             "CreateNativeNode post event res1 = %{public}d", ccc1);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
        nodeAPI->addNodeEventReceiver(button4, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
                
                
                  if(action == UI_TOUCH_EVENT_ACTION_UP){
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                }
                   auto ddd =  OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                                 "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                                 "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d", ccc,r1,r2,r3,r4,r5,ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
         nodeAPI->addNodeEventReceiver(button3, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(cloneEvent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(cloneEvent, offsetx, offsety, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(cloneEvent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(cloneEvent, 11, 0);
                
     
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                    ccc1 = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, cloneEvent);
                
                
                  auto ddd =  OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                                 "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                                 "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d", ccc,r1,r2,r3,r4,r5,ddd);
                
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode post event res = %{public}d", ccc1);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
         nodeAPI->addNodeEventReceiver(button2, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				OH_ArkUI_PointerEvent_CreateClonedEvent(inputevent, &cloneEvent);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    auto action = OH_ArkUI_UIInputEvent_GetAction(cloneEvent);
                   
                    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(cloneEvent);
                    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(cloneEvent);
                    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(cloneEvent, 0);
                    auto x = OH_ArkUI_PointerEvent_GetX(cloneEvent);
                    auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(cloneEvent, 0);
                    auto y = OH_ArkUI_PointerEvent_GetY(cloneEvent);
                    auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(cloneEvent, 0);
                    auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(cloneEvent);
                    auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(cloneEvent, 0);
                    auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(cloneEvent);
                    auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(cloneEvent, 0);
                    auto pressure = OH_ArkUI_PointerEvent_GetPressure(cloneEvent, 0);
                    auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(cloneEvent);
                    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(cloneEvent);
                    auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(cloneEvent, 0);
                    auto time = std::to_string(pressedTimeByIndex);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode addNodeEventReceiver before event receive before GetAction action = "
                                 "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                                 "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                                 "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                                 "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                                 action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
                    pressure, targetDisplayId, pointerCount, time.c_str());
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                //
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                      //100000
                      //-100
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(inputevent, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(inputevent, offsetx, offsety, 0);
                
                
                      //UI_TOUCH_EVENT_ACTION_DOWN
                 r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(inputevent, action);

                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(inputevent, 11);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(inputevent, 11, 0);
                    ccc = OH_ArkUI_PointerEvent_PostClonedEvent(cnode, inputevent);
                   auto ddd= OH_ArkUI_PointerEvent_DestroyClonedEvent(cloneEvent);
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                                 "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                                 "FingerIdIndex res = %{public}d , DestroyClonedEvent res = %{public}d", ccc,r1,r2,r3,r4,r5,ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
        
        nodeAPI->addNodeEventReceiver(button1, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
                case NODE_TOUCH_EVENT: {
                    ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                    ArkUI_UIInputEvent* cloneEvent;
    				r6=OH_ArkUI_PointerEvent_CreateClonedEvent(nullptr, nullptr);
                    auto manager = Manager::GetInstance();
                    auto cnode = manager->GetCnode();
                    ArkUI_IntOffset* offset = new ArkUI_IntOffset[2];
                    
                if(cnode !=NULL){
                     OH_ArkUI_NodeUtils_GetPositionToParent(cnode, offset);
                }
                   
                //
                    auto offsetx = 3.25 * (OH_ArkUI_PointerEvent_GetX(cloneEvent)) + (float)offset->x;
                    auto offsety = 3.25 * (OH_ArkUI_PointerEvent_GetY(cloneEvent)) + (float)offset->y;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode  offsetx = %{public}f, offsety = %{public}f, "
                               , offsetx,offsety);
                
                 r1 = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(nullptr, offsetx, offsety);
                 r2 = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(nullptr, offsetx, offsety, 0);
                 r3 = OH_ArkUI_PointerEvent_SetClonedEventActionType(nullptr, UI_TOUCH_EVENT_ACTION_UP);
                 r4 = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(nullptr, 22);
                 r5 = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(nullptr, 22, 1);
                 ccc = OH_ArkUI_PointerEvent_PostClonedEvent(nullptr, nullptr);
                     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode post event res = %{public}d, Position res = %{public}d, "
                                 "PositionIndex res = %{public}d,  ActionType res = %{public}d,  FingerId res = %{public}d, "
                                 "FingerIdIndex res = %{public}d ,CreateClonedEvent res = %{public}d ", ccc,r1,r2,r3,r4,r5,r6);
                
                  auto ddd =  OH_ArkUI_PointerEvent_DestroyClonedEvent(nullptr);
                
                   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                                 "CreateNativeNode DestroyClonedEvent res = %{public}d ", ddd);
                    break;
                }
                default: {
                    break;
                }
            }
        });
        
            nodeAPI->addNodeEventReceiver(cnode, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            switch (eventType) {
            case NODE_TOUCH_EVENT: {
                ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto action = OH_ArkUI_UIInputEvent_GetAction(inputevent);
            auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputevent);
            auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputevent);
            auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputevent, 0);
            auto x = OH_ArkUI_PointerEvent_GetX(inputevent);
            auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputevent, 0);
            auto y = OH_ArkUI_PointerEvent_GetY(inputevent);
            auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputevent, 0);
            auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputevent);
            auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputevent, 0);
            auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputevent);
            auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputevent, 0);
            auto pressure = OH_ArkUI_PointerEvent_GetPressure(inputevent, 0);
            auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputevent);
            auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputevent);
            auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputevent, 0);
            auto time = std::to_string(pressedTimeByIndex);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "CreateNativeNode addNodeEventReceiver after event receive before GetAction action = "
                         "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                         "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                         "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                         "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                         action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
            pressure, targetDisplayId, pointerCount, time.c_str());  
                break;
            }
            case NODE_ON_CLICK: {
                ArkUI_UIInputEvent* inputevent = OH_ArkUI_NodeEvent_GetInputEvent(event);
            auto action = OH_ArkUI_UIInputEvent_GetAction(inputevent);
            auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputevent);
            auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputevent);
            auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputevent, 0);
            auto x = OH_ArkUI_PointerEvent_GetX(inputevent);
            auto xByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputevent, 0);
            auto y = OH_ArkUI_PointerEvent_GetY(inputevent);
            auto yByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputevent, 0);
            auto displayX = OH_ArkUI_PointerEvent_GetDisplayX(inputevent);
            auto displayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputevent, 0);
            auto displayY = OH_ArkUI_PointerEvent_GetDisplayY(inputevent);
            auto displayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputevent, 0);
            auto pressure = OH_ArkUI_PointerEvent_GetPressure(inputevent, 0);
            auto targetDisplayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputevent);
            auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputevent);
            auto pressedTimeByIndex = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputevent, 0);
            auto time = std::to_string(pressedTimeByIndex);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "CreateNativeNode addNodeEventReceiver after click event receive before GetAction action = "
                         "%{public}d, sourceType = %{public}d, toolType = %{public}d, pointerId = %{public}d,"
                         "X = %{public}f, XByIndex = %{public}f,Y = %{public}f, YByIndex = %{public}f,"
                         "displayX = %{public}f,  displayXByIndex = %{public}f, displayY = %{public}f,  displayYByIndex = %{public}f,"
                         "pressure = %{public}f, targetDisplayId = %{public}d, pointerCount = %{public}d, pressedTimeByIndex = %{public}s",
                         action, sourceType, toolType, pointerId, x, xByIndex, y, yByIndex, displayX, displayXByIndex, displayY, displayYByIndex,
            pressure, targetDisplayId, pointerCount, time.c_str());  
                break;
            }
            default: {
                break;
            }
            }
            
                      
        });
        //上半区column，下半区cnode，
        nodeAPI->addChild(stack, Column11);
        nodeAPI->addChild(Column11, innerColumn);
        nodeAPI->addChild(Column11, button1);
        nodeAPI->addChild(Column11, button2);
        nodeAPI->addChild(Column11, button3);
        nodeAPI->addChild(Column11, button4);
        nodeAPI->addChild(Column11, button5);
        nodeAPI->addChild(Column11, button6);
        nodeAPI->addChild(Column11, button7);
        nodeAPI->addChild(Column11, button8);
        nodeAPI->addChild(Column11, button9);
        nodeAPI->addChild(Column11, button10);
        nodeAPI->addChild(Column11, button11);
        nodeAPI->addChild(Column11, button12);
        nodeAPI->addChild(Column11, button13);
        nodeAPI->addChild(Column11, cnode);
        nodeAPI->addChild(Column11, addButton);
        nodeAPI->addChild(Column11, text);
        OH_NativeXComponent_AttachNativeRootNode(component, stack);
    }
    return nullptr;
}

napi_value Manager::UpdateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  1111");

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "CreateNativeNode  1111 %{public}s", idStr);

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }


    if ((env == nullptr) || (info == nullptr || component == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  1111");

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  333");
    return nullptr;
}


napi_value Manager::GetContext(napi_env env, napi_callback_info info) {
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_number) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    if (napi_get_value_int64(env, args[0], &value) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

void Manager::Export(napi_env env, napi_value exports) {
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: env or exports is null");
        return;
    }

    napi_value exportInstance = nullptr;
    if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_get_named_property fail");
        return;
    }

    OH_NativeXComponent *nativeXComponent = nullptr;
    if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_unwrap fail");
        return;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "Export: OH_NativeXComponent_GetXComponentId fail");
        return;
    }

    std::string id(idStr);
    auto manager = Manager::GetInstance();
    if ((manager != nullptr) && (nativeXComponent != nullptr)) {
        manager->SetNativeXComponent(id, nativeXComponent);
        auto container = manager->GetContainer(id);
        if (container != nullptr) {
            container->RegisterCallback(nativeXComponent);
        }
    }
}

void Manager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
    if (nativeXComponent == nullptr) {
        return;
    }

    nativeXComponentMap_[id] = nativeXComponent;
}

OH_NativeXComponent *Manager::GetNativeXComponent(const std::string &id) { return nativeXComponentMap_[id]; }

Container *Manager::GetContainer(std::string &id) {
    if (containerMap_.find(id) == containerMap_.end()) {
        Container *instance = Container::GetInstance(id);
        containerMap_[id] = instance;
        return instance;
    }

    return containerMap_[id];
}
} // namespace NativeXComponentSample

        