/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "gesture_interfaceTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
const unsigned int nodeIdNumber = 6;
const unsigned int loopCountNumber = 19;
namespace {

    ArkUI_GestureInterruptResult GestureInterruptFunc(ArkUI_GestureInterruptInfo *info) {
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "GestureInterruptFunc  trigger");
       auto outerRecognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
       if (!outerRecognizer) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
       
       char *nodeId = static_cast<char*>(malloc(nodeIdNumber));  
       int  *result = static_cast<int*>(malloc(sizeof(int)));
     
       OH_ArkUI_GetGestureBindNodeId(outerRecognizer, nodeId,  nodeIdNumber, result);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "GestureInterruptFunc  current nodeId %{public}s", nodeId);
       ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
       OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
       if (!gestureAPI) {
           return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
       }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                 "GestureInterruptFunc  strcmp  %{public}s && OH_ArkUI_GetGestureBuiltInFlag(outerRecognizer) "
                 "%{public}d && gestureAPI->getGestureType(outerRecognizer) %{public}d aaa %{public}d bbb %{public}d",
                 nodeId, OH_ArkUI_IsBuiltInGesture(outerRecognizer),
                 gestureAPI->getGestureType(outerRecognizer) == ArkUI_GestureRecognizerType::PAN_GESTURE,
                 OH_ArkUI_GetGestureRecognizerEnabled(outerRecognizer),
                 OH_ArkUI_IsGestureRecognizerValid(outerRecognizer));

    if (strcmp(nodeId, "outer") == 0 && OH_ArkUI_IsBuiltInGesture(outerRecognizer) &&
        OH_ArkUI_GetGestureRecognizerEnabled(outerRecognizer) && OH_ArkUI_IsGestureRecognizerValid(outerRecognizer) &&
        gestureAPI->getGestureType(outerRecognizer) == ArkUI_GestureRecognizerType::PAN_GESTURE) {
           int *count = (int *)malloc(sizeof(int));
           ArkUI_GestureRecognizer **recognizers;
           OH_ArkUI_GetResponseRecognizersFromInterruptInfo(info, &recognizers, count);
           OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
              "GestureInterruptFunc  trigger count %{public}d", *count);
           for (int index = 0; index < *count; index++) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                   "GestureInterruptFunc  trigger index %{public}d", index);
                auto item = recognizers[index];
                if (!item) {
                    continue;
                }
              
                char* childNodeId = static_cast<char*>(malloc(nodeIdNumber)); 
                int* childResult = static_cast<int*>(malloc(sizeof(int))); 
               
                OH_ArkUI_GetGestureBindNodeId(item, childNodeId, nodeIdNumber, childResult);
                if (strcmp(childNodeId, "inner") == 0) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                       " GestureInterruptFunc  childNodeId inner ");
                    ArkUI_GestureEvent *event = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
                    if (!event) {
                        return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
                    }
                    auto offsetY = OH_ArkUI_PanGesture_GetOffsetY(event);
                    auto manager =  ArkUICapiTest::GestureInterfaceTest::getInstance();
                    if (!manager) {
                        return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
                    }
                    auto currentRecognizer = manager->getcurrentRecongnizer();
                    auto childRecognizer = manager->getChildRecongnizer();
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                       "GestureInterruptFunc  get SetCurrentRecognizer %{public}p child %{public}p",
                        currentRecognizer, childRecognizer);
                    ArkUI_GestureEventTargetInfo *targetInfo;
                    OH_ArkUI_GetGestureEventTargetInfo(childRecognizer, &targetInfo);
                    if (targetInfo) {
                       
                        bool* childIsEnd = static_cast<bool*>(malloc(sizeof(bool))); 
                        OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(targetInfo, childIsEnd);
                       
                        bool* childIsBegin = static_cast<bool*>(malloc(sizeof(bool)));
                        OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(targetInfo, childIsBegin);
                        if (*childIsEnd) {
                            if (offsetY < 0) {
                                OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);
                            } else {
                                 OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                 OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                            }
                        } else if (*childIsBegin) {
                            if (offsetY > 0) {
                                OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);
                            } else {
                                OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                            }
                        } else {
                            OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                            OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                        }
                    }
                }
           }
        }
       return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
    }
    
    ArkUI_GestureRecognizer *ParallelInnerGestureFunc(ArkUI_ParallelInnerGestureEvent *event) {
       int count = 0;
       ArkUI_GestureRecognizer **others;
       OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers(event, &others, &count);
       auto current = OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer(event);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
          "ParallelInnerGestureFunc  trigger count %{public}d", count);
       auto dataE = OH_ArkUI_ParallelInnerGestureEvent_GetUserData(event);
       OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
          "ParallelInnerGestureFunc  data %{public}p", dataE);
       for (auto index = 0; index < count; index++) {
            auto item = others[index];
            if (!item) {
                continue;
            }
     
            char *nodeId = static_cast<char*>(malloc(nodeIdNumber)); 
            int  *result = static_cast<int*>(malloc(sizeof(int)));
            OH_ArkUI_GetGestureBindNodeId(item, nodeId,  nodeIdNumber, result);
            if (strcmp(nodeId, "inner") == 0) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                   "ParallelInnerGestureFunc  trigger nodeId %{public}s", nodeId);
                auto isBuiltIn = OH_ArkUI_IsBuiltInGesture(item);
                ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
                OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
                ArkUI_GestureRecognizerType type = ArkUI_GestureRecognizerType::TAP_GESTURE;
                if (gestureAPI != nullptr) {
                    type = gestureAPI->getGestureType(item);
                }
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "ParallelInnerGestureFunc  trigger isBuiltIn %{public}d type %{public}d", isBuiltIn,
                type);
            
                if (isBuiltIn && type == ArkUI_GestureRecognizerType::PAN_GESTURE) {
                   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     " ParallelInnerGestureFunc  trigger find child pan");
                    auto manager =  ArkUICapiTest::GestureInterfaceTest::getInstance();
                    if (manager != nullptr) {
                        manager->setCurrentRecognizer(current);
                        manager->setChildRecognizer(item);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "ParallelInnerGestureFunc  set SetCurrentRecognizer %{public}p child %{public}p",
                            current, item);
                            return item;
                    }
                }
            }
       }
            return nullptr;
    }
} // namespace

namespace ArkUICapiTest {

    
    GestureInterfaceTest GestureInterfaceTest::gestureInterfaceTest_;

    GestureInterfaceTest ::~GestureInterfaceTest() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    }



napi_value GestureInterfaceTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB  222--1");
            ArkUI_NodeHandle scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            ArkUI_NodeHandle list = nodeAPI->createNode(ARKUI_NODE_LIST);
            ArkUI_NumberValue listWidthValue[] = {PARAM_1_POINT_0};
            ArkUI_AttributeItem listWidthItem = {listWidthValue, 1};
            nodeAPI->setAttribute(list, NODE_WIDTH_PERCENT, &listWidthItem);
            ArkUI_NumberValue listHeightValue[] = {PARAM_0_POINT_5};
            ArkUI_AttributeItem listHeightItem = {listHeightValue, 1};
            nodeAPI->setAttribute(list, NODE_HEIGHT_PERCENT, &listHeightItem);
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

            ArkUI_NumberValue edgeEffectValue[] = {{.i32 = ARKUI_EDGE_EFFECT_NONE}};
            ArkUI_AttributeItem edgeEffectItem = {edgeEffectValue, 1};
            nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
            auto ss = nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", " CreateNativeNode  list == %{public}d",
                     ss->value[0].i32);

            ArkUI_AttributeItem nodeIdItem = {.string = "inner"};
            nodeAPI->setAttribute(list, NODE_ID, &nodeIdItem);

            for (int i = 0; i < loopCountNumber; i++) {
                 ArkUI_NumberValue widthValue[] = {PARAM_0_POINT_5};
                 ArkUI_AttributeItem widthItem = {widthValue, 1};
                 ArkUI_NumberValue heightValue[] = {PARAM_01};
                 ArkUI_AttributeItem heightItem = {heightValue, 1};
                 ArkUI_NumberValue backColorvalue[] = {{.u32 = 0xFF0000FF}};
                 ArkUI_AttributeItem backColoritem = {backColorvalue, 1};
                 ArkUI_NodeHandle FlowItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
                 ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
                 nodeAPI->setAttribute(text, NODE_WIDTH_PERCENT, &widthItem);
                 nodeAPI->setAttribute(text, NODE_HEIGHT_PERCENT, &heightItem);
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

            ArkUI_NumberValue itemWidthValue[] = {PARAM_0_POINT_8};
            ArkUI_AttributeItem itemWidthItem = {itemWidthValue, 1};
            ArkUI_NumberValue itemHeightValue[] = {PARAM_0_POINT_2};
            ArkUI_AttributeItem itemHeightItem = {itemHeightValue, 1};
            ArkUI_NumberValue itemBackColorvalue[] = {{.u32 = 0xFF00FFFF}};
            ArkUI_AttributeItem itemBackColoritem = {itemBackColorvalue, 1};
            ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            nodeAPI->setAttribute(text, NODE_WIDTH_PERCENT, &itemWidthItem);
            nodeAPI->setAttribute(text, NODE_HEIGHT_PERCENT, &itemHeightItem);
            nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &itemBackColoritem);
            ArkUI_AttributeItem contentItem = {.string = "scrollItem"};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);

            ArkUI_NumberValue scrollWidthValue[] = {PARAM_1_POINT_0};
            ArkUI_AttributeItem scrollWidthItem = {scrollWidthValue, 1};
            nodeAPI->setAttribute(scroll, NODE_WIDTH_PERCENT, &scrollWidthItem);
            ArkUI_NumberValue scrollHeightValue[] = {PARAM_0_POINT_6};
            ArkUI_AttributeItem scrollHeightItem = {scrollHeightValue, 1};
            nodeAPI->setAttribute(scroll, NODE_HEIGHT_PERCENT, &scrollHeightItem);
            ArkUI_NumberValue scrollColorvalue[] = {{.u32 = 0xFF2F2F4F}};
            ArkUI_AttributeItem backColoritem = {scrollColorvalue, 1};
            nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &backColoritem);

            ArkUI_AttributeItem scrollNodeIdItem = {.string = "outer"};
            nodeAPI->setAttribute(scroll, NODE_ID, &scrollNodeIdItem);

            ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->addChild(column, text);
            nodeAPI->addChild(column, list);

            nodeAPI->addChild(scroll, column);
                   
            std::string id(xComponentID);
            if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) == 
                INVALID_PARAM) {
                  OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "gestureInterfaceTest",
                                                             "OH_NativeXComponent_AttachNativeRootNode failed");
                }
            ArkUI_NativeGestureAPI_1 *gestureAPI = nullptr;
            
                 
            OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
            if (gestureAPI != nullptr) {
                gestureAPI->setGestureInterrupterToNode(scroll, GestureInterruptFunc);
                gestureAPI->setInnerGestureParallelTo(scroll, nullptr, ParallelInnerGestureFunc);

                if (gestureAPI->createPanGesture) {
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "panGesture not null");
                } else {
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "panGesture is null");
                }
                   auto panGesture = gestureAPI->createPanGesture(1, 15, 5);
                
                   auto onActionUpdateCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
                        auto manager = ArkUICapiTest::GestureInterfaceTest::getInstance();
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
                           "panGesture update state current %{public}d child %{public}d", *childState,
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
                                         "panGesture update state offsetY %{public}f GetLastOffset %{public}f",
                                         offsetY, manager->getLastOffset());
                         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                         "panGesture update state childRecognizer isBegin %{public}d isEnd %{public}d "
                                         "currentRecognizer isBegin %{public}d isEnd %{public}d",
                                         childIsBegin, childIsEnd, currentIsBegin, currentIsEnd);
                        if (childIsEnd) {
                                if (offsetY - manager->getLastOffset() < 0) {
                                    OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                    if (currentIsEnd) {
                                        OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                                    } else {
                                        OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);
                                    }
                                } else {
                                    OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                    OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                                }
                            } else if (childIsBegin) {
                                if (offsetY - manager->getLastOffset() > 0) {
                                    OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, false);
                                    if (currentIsBegin) {
                                        OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                                    } else {
                                        OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, true);
                                    }
                                } else {
                                    OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                    OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                                }
                            } else {
                                OH_ArkUI_SetGestureRecognizerEnabled(childRecognizer, true);
                                OH_ArkUI_SetGestureRecognizerEnabled(currentRecognizer, false);
                            }
                            manager->setLastOffset(offsetY);
                        };
                        // 将手势设置到组件上
                   gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_UPDATE, scroll,
                                                          onActionUpdateCallBack);
                   gestureAPI->addGestureToNode(scroll, panGesture, PARALLEL, NORMAL_GESTURE_MASK);
                }
        }
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

void GestureInterfaceTest::setCurrentRecognizer(ArkUI_GestureRecognizer *current) { currentRecognizer_ = current; }

void GestureInterfaceTest::setChildRecognizer(ArkUI_GestureRecognizer *child) { childRecognizer_ = child; }

} // namespace ArkUICapiTest