/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gesture_cancel.h"
#include <cstdint>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <string>

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
const unsigned int nodeIdNumber = 60;
const unsigned int loopCountNumber = 19;

const int32_t listTouchId = 1;
const int32_t ColumnTouchId = 3;
const int32_t ScrollTouchId = 2;

int count1 = 0;
int count2 = 0;
int count3 = 0;

TestTouchEventData ArkUIAniTest::GestureInterfaceCancelTest::testTouchEventData;

void setTouchEventData(TestTouchEventData data) {
    ArkUIAniTest::GestureInterfaceCancelTest::testTouchEventData = data;
    
}


namespace {

    ArkUI_GestureInterruptResult childGestureInterruptFunc(ArkUI_GestureInterruptInfo *info) {
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "GestureInterruptFunc  trigger");
       auto manager =  ArkUIAniTest::GestureInterfaceCancelTest::getInstance();
       if (!manager) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
       auto currentRecognizer = manager->getcurrentRecongnizer();
       auto childRecognizer = manager->getChildRecongnizer();
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptCancelFunc  getsetRecongnizer  %{public}p child %{public}p",currentRecognizer, childRecognizer);    
       char *nodeId = static_cast<char*>(malloc(nodeIdNumber));  
       int  *result = static_cast<int*>(malloc(sizeof(int)));
    
       OH_ArkUI_GetGestureBindNodeId(currentRecognizer, nodeId,  nodeIdNumber, result);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptCancelFunc  current nodeId %{public}s", nodeId);
    
       char *childNodeId = static_cast<char*>(malloc(nodeIdNumber));  
       int  *childResult = static_cast<int*>(malloc(sizeof(int)));
       OH_ArkUI_GetGestureBindNodeId(childRecognizer, childNodeId,  nodeIdNumber, childResult);
    
      
       ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
       OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
       if (!gestureAPI) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
       
       if (strcmp(nodeId, "outer") == 0 && OH_ArkUI_IsBuiltInGesture(currentRecognizer) &&
           gestureAPI->getGestureType(currentRecognizer) == ArkUI_GestureRecognizerType::PAN_GESTURE && strcmp(childNodeId, "inner") == 0) {
           ArkUI_GestureEvent *event = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
           if (!event) {
                return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
           }
           auto offsetY = OH_ArkUI_PanGesture_GetOffsetY(event);
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptCancelFunc  offsetY %{public}f", offsetY);
        
           ArkUI_GestureEventTargetInfo *childtargetInfo;
           OH_ArkUI_GetGestureEventTargetInfo(childRecognizer, &childtargetInfo);
        
           ArkUI_GestureEventTargetInfo *currenttargetInfo;
           OH_ArkUI_GetGestureEventTargetInfo(currentRecognizer, &currenttargetInfo);
           
           if (!childtargetInfo || !currenttargetInfo) {
               return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
           }
           bool childIsEnd = false;
           OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(childtargetInfo, &childIsEnd);
           
           bool childIsBegin = false;
           OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(childtargetInfo, &childIsBegin);
          
           bool currentIsEnd = false; 
           OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(currenttargetInfo, &currentIsEnd);
           
           bool currentIsBegin = false;
           OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(currenttargetInfo, &currentIsBegin);
           if (offsetY < 0) {
               if (currentIsEnd) {
                   OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                   OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer,false);
                
               } else {
                   OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                   OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer,true);
                
               }
                
           } else if (offsetY > 0) {
            
                if (childIsBegin) {
                   OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                   OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);
                
                } else {
                   OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                   OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                
               }
            
           }
        
       
      }
        return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
    }
     // cancel gesture
    void cancelTouch (ArkUI_GestureInterruptInfo *info) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptCancelFunc  get C APiRecognizer 111");
        
        ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);
        
        ArkUI_NativeNodeAPI_1 *nodeApi = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeApi);
        
        ArkUI_GestureRecognizer *currentRecognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        int32_t arraySize = 0;
        ArkUI_TouchRecognizerHandleArray fromTouchArray;
    
        //get componentId
        char *nodeId = new char[256];
        int  *result = new int;
    
       int ret2 =  OH_ArkUI_GetGestureBindNodeId(currentRecognizer, nodeId, 256, result);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx  ret2 = %{public}d ",ret2);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx nodeID = %{public}s type = %{public}d",nodeId, gestureApi->getGestureType(currentRecognizer));
    
       if (strcmp(nodeId, "column") != 0 || gestureApi->getGestureType(currentRecognizer) != ArkUI_GestureRecognizerType::PAN_GESTURE) {
          return ;
        }
        auto ret = OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers(info, &fromTouchArray, &arraySize);
       
    
        if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx failed");
           return;
        }
    
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx success num =  %{public}d", arraySize);
    
        for (int i = 0; i< arraySize; i++) {
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest cancel touch");
           ArkUI_NodeHandle handle = OH_ArkUI_TouchRecognizer_GetNodeHandle(fromTouchArray[i]);
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest cancel2 touch");
           const ArkUI_AttributeItem *arkUI_AttributeItem = nodeApi->getAttribute(handle, NODE_ID);
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx  canceled, %{public}s",arkUI_AttributeItem->string);
           OH_ArkUI_TouchRecognizer_CancelTouch(fromTouchArray[i], info);
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx  canceled touch success, %{public}s",arkUI_AttributeItem->string);
           // cancel sub touch event
           if (strcmp(arkUI_AttributeItem->string, "inner") == 0) {
               OH_ArkUI_TouchRecognizer_CancelTouch(fromTouchArray[i], info);
               OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "gestureCancelTest GetTouchRecognizerx  canceled touch success2, %{public}s",arkUI_AttributeItem->string);
           }
        
        }
        return;
    }


    ArkUI_GestureInterruptResult GestureInterruptFunc(ArkUI_GestureInterruptInfo *info) {
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "GestureInterruptFunc  triggerxx");
       auto outerRecognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
       if (!outerRecognizer) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
       
       char *nodeId = (char *)malloc(sizeof(char) *60);  
       int  *result = (int *)malloc(sizeof(int)); 
     
       OH_ArkUI_GetGestureBindNodeId(outerRecognizer, nodeId,  60, result);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptFunc  current nodeIdxx %{public}s", nodeId);
       ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
       OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
       if (!gestureAPI) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
       
    
    
    
       cancelTouch(info);
       return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
    }

    ArkUI_GestureRecognizer *ParallelInnerGestureFunc(ArkUI_ParallelInnerGestureEvent *event) {
       int count = 0;
       ArkUI_GestureRecognizer **others;
       OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers(event, &others, &count);
       auto current = OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer(event);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
          "gestureCancelTest ParallelInnerGestureFunc  trigger count %{public}d", count);
       auto dataE = OH_ArkUI_ParallelInnerGestureEvent_GetUserData(event);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
          "gestureCancelTest ParallelInnerGestureFunc  data %{public}p", dataE);
       for (auto index = 0; index < count; index++) {
            auto item = others[index];
            if (!item) {
                continue;
            }
     
            char *nodeId = (char *)malloc(sizeof(char) *6); 
            int  *result = (int *)malloc(sizeof(int)); 
        
            OH_ArkUI_GetGestureBindNodeId(item, nodeId,  nodeIdNumber, result);
            if (strcmp(nodeId, "inner") == 0) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                   "gestureCancelTest ParallelInnerGestureFunc  trigger nodeId %{public}s", nodeId);
                auto isBuiltIn = OH_ArkUI_IsBuiltInGesture(item);
                ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
                OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
                ArkUI_GestureRecognizerType type = ArkUI_GestureRecognizerType::TAP_GESTURE;
                if (gestureAPI != nullptr) {
                    type = gestureAPI->getGestureType(item);
                }
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "gestureCancelTest ParallelInnerGestureFunc  triggerx isBuiltIn %{public}d type %{public}d", isBuiltIn,
                type);
            
                if (isBuiltIn && type == ArkUI_GestureRecognizerType::PAN_GESTURE) {
                   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "gestureCancelTest ParallelInnerGestureFunc  trigger find child pan");
                    auto manager =  ArkUIAniTest::GestureInterfaceCancelTest::getInstance();
                    if (manager != nullptr) {
                        manager->setCurrentRecognizer(current);
                        manager->setChildRecognizer(item);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "gestureCancelTest ParallelInnerGestureFunc  set SetCurrentRecognizer %{public}p child %{public}p",
                            current, item);
                            return item;
                    }
                }
            }
       }
            return nullptr;
    }
} // namespace

namespace ArkUIAniTest {

    
    GestureInterfaceCancelTest  GestureInterfaceCancelTest::gestureInterfaceTest_;

   GestureInterfaceCancelTest  ::~GestureInterfaceCancelTest() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    }



void GestureInterfaceCancelTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB  222--1");
            
            
            ArkUI_NodeHandle scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            ArkUI_NodeHandle list = nodeAPI->createNode(ARKUI_NODE_LIST);
            
            
            ArkUI_NumberValue listWidthValue[] = {500};
            ArkUI_AttributeItem listWidthItem = {listWidthValue, 1};
            nodeAPI->setAttribute(list, NODE_WIDTH, &listWidthItem);
            
            ArkUI_NumberValue listHeightValue[] = {400};
            ArkUI_AttributeItem listHeightItem = {listHeightValue, 1};
            nodeAPI->setAttribute(list, NODE_HEIGHT, &listHeightItem);
            
            ArkUI_NumberValue borderColorValue[] = {{.u32 = 0xCCCCCCCC}};
            ArkUI_AttributeItem borderColorItem = {borderColorValue, 1};
            nodeAPI->setAttribute(list, NODE_BORDER_COLOR, &borderColorItem);
            
            ArkUI_NumberValue borderWidthValue[] = {5};
            ArkUI_AttributeItem borderWidthItem = {borderWidthValue, 1};
            nodeAPI->setAttribute(list, NODE_BORDER_WIDTH, &borderWidthItem);
            
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "yc-pre-initialIndex %{public}d",
            nodeAPI->getAttribute(list, NODE_POSITION)->value[0].i32);
            
            ArkUI_NumberValue initialIndexValue[] = {{.i32 = 5}};
            ArkUI_AttributeItem initialIndexItem = {initialIndexValue, 1};
            nodeAPI->setAttribute(list, NODE_LIST_INITIAL_INDEX, &initialIndexItem);
            
            nodeAPI->registerNodeEvent(list, NODE_TOUCH_EVENT, listTouchId, nullptr);
            nodeAPI->registerNodeEvent(list, NODE_ON_CLICK_EVENT, listTouchId, nullptr);
            nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, ScrollTouchId, nullptr); 
            
            nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event){
                 auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
                 TestTouchEventData testEventData;
                 if (targetId == listTouchId) {
                     count1 ++;
                     OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "gestureCancelTest", "list onTouch == %{public}d", count1);
                 } else if (targetId == ColumnTouchId) {
                      count2 ++;
                      OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "gestureCancelTest", "column onTouch == %{public}d", count2);
                      testEventData.columnCount = count2;
                 } else if (targetId == ScrollTouchId) {
                      count3 ++;
                      OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "gestureCancelTest", "Scroll onTouch == %{public}d", count3);   
                      testEventData.scrollCount = count3;

                 }
                setTouchEventData(testTouchEventData);
            });
            

            ArkUI_NumberValue edgeEffectValue[] = {{.i32 = ARKUI_EDGE_EFFECT_NONE}};
            ArkUI_AttributeItem edgeEffectItem = {edgeEffectValue, 1};
            nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
            
            auto ss = nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", " CreateNativeNode  list == %{public}d",
                     ss->value[0].i32);

            ArkUI_AttributeItem nodeIdItem = {.string = "inner"};
            nodeAPI->setAttribute(list, NODE_ID, &nodeIdItem);

            for (int i = 0; i < loopCountNumber; i++) {
                 ArkUI_NumberValue widthValue[] = {200};
                 ArkUI_AttributeItem widthItem = {widthValue, 1};
                 ArkUI_NumberValue heightValue[] = {100};
                 ArkUI_AttributeItem heightItem = {heightValue, 1};
                 ArkUI_NumberValue backColorvalue[] = {{.u32 = 0xFF0000FF}};
                 ArkUI_AttributeItem backColoritem = {backColorvalue, 1};
                 ArkUI_NodeHandle FlowItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
                 ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
                 nodeAPI->setAttribute(text, NODE_WIDTH, &widthItem);
                 nodeAPI->setAttribute(text, NODE_HEIGHT, &heightItem);
                 nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &backColoritem);
                 std::string contentS = "flowItem" + std::to_string(i);
                 const char * contentSS = contentS.c_str();
                 ArkUI_AttributeItem contentItem = {.string = contentSS};
                       
                 nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "yc-pre-position-X %{public}f,y:%{public}f ",
                    nodeAPI->getAttribute(FlowItem, NODE_POSITION)->value[0].f32,
                    nodeAPI->getAttribute(FlowItem, NODE_POSITION)->value[1].f32);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                       "yc-after-position-X %{public}f,y:%{public}f ",
                       nodeAPI->getAttribute(FlowItem, NODE_POSITION)->value[0].f32,
                       nodeAPI->getAttribute(FlowItem, NODE_POSITION)->value[1].f32);
                    nodeAPI->addChild(FlowItem, text);
                    nodeAPI->addChild(list, FlowItem);
            }

            ArkUI_NumberValue itemWidthValue[] = {400};
            ArkUI_AttributeItem itemWidthItem = {itemWidthValue, 1};
            ArkUI_NumberValue itemHeightValue[] = {400};
            ArkUI_AttributeItem itemHeightItem = {itemHeightValue, 1};
            ArkUI_NumberValue itemBackColorvalue[] = {{.u32 = 0xFF00FFFF}};
            ArkUI_AttributeItem itemBackColoritem = {itemBackColorvalue, 1};
            ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            nodeAPI->setAttribute(text, NODE_WIDTH, &itemWidthItem);
            nodeAPI->setAttribute(text, NODE_HEIGHT, &itemHeightItem);
            nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &itemBackColoritem);
            ArkUI_AttributeItem contentItem = {.string = "scrollItem"};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);

            ArkUI_NumberValue scrollWidthValue[] = {500};
            ArkUI_AttributeItem scrollWidthItem = {scrollWidthValue, 1};
            nodeAPI->setAttribute(scroll, NODE_WIDTH, &scrollWidthItem);
            
            ArkUI_NumberValue scrollHeightValue[] = {600};
            ArkUI_AttributeItem scrollHeightItem = {scrollHeightValue, 1};
            nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scrollHeightItem);
            ArkUI_NumberValue scrollColorvalue[] = {{.u32 = 0xFF2F2F4F}};
            ArkUI_AttributeItem backColoritem = {scrollColorvalue, 1};
            nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &backColoritem);

            ArkUI_AttributeItem scrollNodeIdItem = {.string = "outer"};
            nodeAPI->setAttribute(scroll, NODE_ID, &scrollNodeIdItem);

            ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            ArkUI_AttributeItem columnId = {.string = "column"};
            nodeAPI->setAttribute(column, NODE_ID, &columnId);
            
             nodeAPI->registerNodeEvent(column, NODE_TOUCH_EVENT, ColumnTouchId, nullptr);
            
            nodeAPI->addChild(column, text);
            nodeAPI->addChild(column, list);
    
            nodeAPI->addChild(scroll, column);
                   
            // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
            OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
            OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
            OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
            return ;
            
            ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
            
                 
            OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
            if (gestureAPI != nullptr) {
                gestureAPI->setGestureInterrupterToNode(list, childGestureInterruptFunc);
                gestureAPI->setGestureInterrupterToNode(column, GestureInterruptFunc);
                gestureAPI->setInnerGestureParallelTo(scroll, nullptr, ParallelInnerGestureFunc);

                if (gestureAPI->createPanGesture) {
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "panGesture not null");
                } else {
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "panGesture is null");
                }
                auto panGesture = gestureAPI->createPanGesture(1, 15, 5);
                
                auto onActionUpdateCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
                        auto manager = ArkUIAniTest::GestureInterfaceCancelTest::getInstance();
                        if (!manager) {
                                return;
                        }
                        auto currentRecognizer = manager->getcurrentRecongnizer();
                        auto childRecognizer = manager->getChildRecongnizer();
                        ArkUI_GestureRecognizerState *childState =
                           (ArkUI_GestureRecognizerState *)malloc(sizeof(ArkUI_GestureRecognizerState));
                        ArkUI_GestureRecognizerState *currentState =
                                (ArkUI_GestureRecognizerState *)malloc(sizeof(ArkUI_GestureRecognizerState));
                        OH_ArkUI_GetGestureRecognizerState(childRecognizer, childState);
                        OH_ArkUI_GetGestureRecognizerState(currentRecognizer, currentState);
                        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                           "gestureCancelTest panGesture update state current %{public}d child %{public}d", *childState,
                            *childState);
                        if (*childState != ArkUI_GestureRecognizerState::ARKUI_GESTURE_RECOGNIZER_STATE_SUCCESSFUL ||
                            *currentState != ArkUI_GestureRecognizerState::ARKUI_GESTURE_RECOGNIZER_STATE_SUCCESSFUL) {
                            return;
                        }

                        auto offsetY = OH_ArkUI_PanGesture_GetOffsetY(event);
                        ArkUI_GestureEventTargetInfo *childTargetInfo;
                        OH_ArkUI_GetGestureEventTargetInfo(childRecognizer, &childTargetInfo);
                        ArkUI_GestureEventTargetInfo *currentTargetInfo;
                        OH_ArkUI_GetGestureEventTargetInfo(currentRecognizer, &currentTargetInfo);
                        if (!childTargetInfo || !currentTargetInfo) {
                            return;
                        }
                        bool childIsEnd = false;
                        OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(childTargetInfo, &childIsEnd);
                        bool childIsBegin = false;
                        OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(childTargetInfo, &childIsBegin);
                        bool currentIsEnd = false;
                        OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(currentTargetInfo, &currentIsEnd);
                        bool currentIsBegin = false;
                        OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(currentTargetInfo, &currentIsBegin);
                        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                         "gestureCancelTest panGesture update state offsetY %{public}f GetLastOffset %{public}f",
                                         offsetY, manager->getLastOffset());
                         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                         "gestureCancelTest panGesture update state childRecognizer isBegin %{public}d isEnd %{public}d "
                                         "gestureCancelTest currentRecognizer isBegin %{public}d isEnd %{public}d",
                                         childIsBegin, childIsEnd, currentIsBegin, currentIsEnd);
                         if (offsetY - manager->getLastOffset() < 0) {
                             if (currentIsEnd) {
                                 OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                 OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);  
                             } else {
                                 OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                 OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);  
                             }
                         }  else if (offsetY - manager->getLastOffset() > 0) {
                               if (childIsBegin) {
                                  OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                  OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);  
                               } else {
                                  OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                 OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false); 
                               }
                            }
                         manager->setLastOffset(offsetY);
                    
                };
                        // 将手势设置到组件上
                gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_UPDATE, column,
                                                          onActionUpdateCallBack);
                gestureAPI->addGestureToNode(column, panGesture, PARALLEL, NORMAL_GESTURE_MASK);
            }
        }
    }
    
    return ;
}

ani_object GestureInterfaceCancelTest::GetTouchEventData(ani_env* env, ani_object info)
{
    ani_class cls{};
    env->FindClass("entry.src.main.ets.pages.gestureCancel.TouchEventData.TouchEventData",&cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", ":", &ctor);
    ani_object touchEventData {};
    env->Object_New(cls, ctor, &touchEventData);
    env->Object_SetFieldByName_Int(touchEventData, "scrollCount", count3);
    env->Object_SetFieldByName_Int(touchEventData, "columnCount", count2);
    return touchEventData;
}

void GestureInterfaceCancelTest::setCurrentRecognizer(ArkUI_GestureRecognizer *current) { currentRecognizer_ = current; }

void GestureInterfaceCancelTest::setChildRecognizer(ArkUI_GestureRecognizer *child) { childRecognizer_ = child; }

} // namespace ArkUIAniTest