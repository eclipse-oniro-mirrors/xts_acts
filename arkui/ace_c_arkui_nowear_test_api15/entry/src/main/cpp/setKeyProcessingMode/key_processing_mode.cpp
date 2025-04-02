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

 #include "common/common.h"
 #include "../manager/plugin_manager.h"
 #include "key_processing_mode.h"
 #include <arkui/native_node.h>
 #include <string>
 #include <arkui/native_interface_focus.h>
 #include <arkui/native_key_event.h>
 #define INT_1 1
 #define INT_21 21
 #define INT_111 111
 #define INT_22 22
 #define INT_222 222
 #define INT_23 23
 #define INT_333 333
 
 namespace ArkUICapiTest {
 
 static ArkUI_NativeNodeAPI_1 *nodeAPI;
 
 napi_value KeyProcessingMode::KeyProcessingMode001(napi_env env, napi_callback_info info)
 {
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001", "CreateNativeNode");
     size_t argc = PARAM_1;
     napi_value args[PARAM_1] = {nullptr};
     napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
     size_t length = PARAM_64;
     size_t strLength = PARAM_0;
     char xComponentID[PARAM_64] = {PARAM_0};
     napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
 
     if ((env == nullptr) || (info == nullptr)) {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
             "GetContext env or info is null");
         return nullptr;
     }
     
     nodeAPI = nullptr;
     OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
     
     static ArkUI_ContextHandle context = nullptr;
     OH_ArkUI_FocusSetKeyProcessingMode(context, ArkUI_KeyProcessingMode::ARKUI_KEY_PROCESSING_MODE_FOCUS_NAVIGATION);
 
     // 创建 COLUMN 组件
     auto colum = nodeAPI->createNode(ARKUI_NODE_COLUMN);
     ArkUI_NumberValue stack1_colorValue[] = {{.u32 = 0xFFFF0000}};
     ArkUI_AttributeItem stack1_colorItem = {stack1_colorValue, 1};
     nodeAPI->setAttribute(colum, NODE_BACKGROUND_COLOR, &stack1_colorItem);
 
     // row2
     static auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
 
     static auto button21 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel21 = {.string = "button21"};
     nodeAPI->setAttribute(button21, NODE_BUTTON_LABEL, &buttonLabel21);
 
     static auto button22 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel22 = {.string = "button22"};
     nodeAPI->setAttribute(button22, NODE_BUTTON_LABEL, &buttonLabel22);
 
     static auto button23 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel23 = {.string = "button23"};
     nodeAPI->setAttribute(button23, NODE_BUTTON_LABEL, &buttonLabel23);
     
     static auto text21 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem21 = {.string = "21"};
     nodeAPI->setAttribute(text21, NODE_TEXT_CONTENT, &textItem21);
     ArkUI_AttributeItem textItem211 = {.string = "text21"};
     nodeAPI->setAttribute(text21, NODE_ID, &textItem211);
     
     static auto text22 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem22 = {.string = "22"};
     nodeAPI->setAttribute(text22, NODE_TEXT_CONTENT, &textItem22);
     ArkUI_AttributeItem textItem212 = {.string = "text22"};
     nodeAPI->setAttribute(text22, NODE_ID, &textItem212);
     
     static auto text23 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem23 = {.string = "23"};
     nodeAPI->setAttribute(text23, NODE_TEXT_CONTENT, &textItem23);
     ArkUI_AttributeItem textItem213 = {.string = "text23"};
     nodeAPI->setAttribute(text23, NODE_ID, &textItem213);
 
     static auto text11 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem11 = {.string = "11"};
     nodeAPI->setAttribute(text11, NODE_TEXT_CONTENT, &textItem11);
 
     nodeAPI->registerNodeEvent(colum, NODE_ON_KEY_EVENT, INT_1, nullptr);
     nodeAPI->registerNodeEvent(button21, NODE_ON_KEY_EVENT, INT_21, nullptr);
     nodeAPI->registerNodeEvent(button21, NODE_ON_FOCUS, INT_111, nullptr);
     nodeAPI->registerNodeEvent(button22, NODE_ON_KEY_EVENT, INT_22, nullptr);
     nodeAPI->registerNodeEvent(button22, NODE_ON_FOCUS, INT_222, nullptr);
     nodeAPI->registerNodeEvent(button23, NODE_ON_KEY_EVENT, INT_23, nullptr);
     nodeAPI->registerNodeEvent(button23, NODE_ON_FOCUS, INT_333, nullptr);
 
     static int i = 0;
 
     // 注册监听事件事件
     nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
         auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
 
         // 获取事件类型
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "lisitao CreateNativeNode  targetId == %{public}d", targetId);
         auto get_ArkUI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
         
         
         if (targetId == INT_1) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 1");
             ArkUI_AttributeItem textItem11 = {.string = "succ"};
             nodeAPI->setAttribute(text11, NODE_TEXT_CONTENT, &textItem11);
         } else if (targetId == INT_21) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 21");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
         } else if (targetId == INT_22) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 22");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
         }else if (targetId == INT_111) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem21 = {.string = "succ"};
             nodeAPI->setAttribute(text21, NODE_TEXT_CONTENT, &textItem21);
         }else if (targetId == INT_222) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem22 = {.string = "succ"};
             nodeAPI->setAttribute(text22, NODE_TEXT_CONTENT, &textItem22);
         }else if (targetId == INT_333) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem23 = {.string = "succ"};
             nodeAPI->setAttribute(text23, NODE_TEXT_CONTENT, &textItem23);
         }else if (targetId == INT_23) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 23");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, true);
         }
     });
 
     nodeAPI->addChild(colum, row2);
     nodeAPI->addChild(row2, button21);
     nodeAPI->addChild(row2, button22);
     nodeAPI->addChild(row2, button23);
     nodeAPI->addChild(colum, text21);
     nodeAPI->addChild(colum, text22);
     nodeAPI->addChild(colum, text23);
     nodeAPI->addChild(colum, text11);
     
     std::string id(xComponentID);
     if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), colum) ==
         INVALID_PARAM) {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
                      "OH_NativeXComponent_AttachNativeRootNode failed");
     }
     napi_value exports;
     if (napi_create_object(env, &exports) != napi_ok) {
         napi_throw_type_error(env, nullptr, "napi_create_object failed");
         return nullptr;
     }
     return exports;
 }
 
 napi_value KeyProcessingMode::KeyProcessingMode002(napi_env env, napi_callback_info info)
 {
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001", "CreateNativeNode");
     size_t argc = PARAM_1;
     napi_value args[PARAM_1] = {nullptr};
     napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
     size_t length = PARAM_64;
     size_t strLength = PARAM_0;
     char xComponentID[PARAM_64] = {PARAM_0};
     napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
 
     if ((env == nullptr) || (info == nullptr)) {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
             "GetContext env or info is null");
         return nullptr;
     }
     
     nodeAPI = nullptr;
     OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
     
     static ArkUI_ContextHandle context = nullptr;
     OH_ArkUI_FocusSetKeyProcessingMode(context,ArkUI_KeyProcessingMode::ARKUI_KEY_PROCESSING_MODE_FOCUS_ANCESTOR_EVENT );
 
     // 创建 COLUMN 组件
     auto colum = nodeAPI->createNode(ARKUI_NODE_COLUMN);
     ArkUI_NumberValue stack1_colorValue[] = {{.u32 = 0xFFFF0000}};
     ArkUI_AttributeItem stack1_colorItem = {stack1_colorValue, 1};
     nodeAPI->setAttribute(colum, NODE_BACKGROUND_COLOR, &stack1_colorItem);
 
     // row2
     static auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
 
     static auto button21 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel21 = {.string = "button21"};
     nodeAPI->setAttribute(button21, NODE_BUTTON_LABEL, &buttonLabel21);
 
     static auto button22 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel22 = {.string = "button22"};
     nodeAPI->setAttribute(button22, NODE_BUTTON_LABEL, &buttonLabel22);
 
     static auto button23 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel23 = {.string = "button23"};
     nodeAPI->setAttribute(button23, NODE_BUTTON_LABEL, &buttonLabel23);
     
     static auto text21 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem21 = {.string = "21"};
     nodeAPI->setAttribute(text21, NODE_TEXT_CONTENT, &textItem21);
     ArkUI_AttributeItem textItem211 = {.string = "text21"};
     nodeAPI->setAttribute(text21, NODE_ID, &textItem211);
     
     static auto text22 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem22 = {.string = "22"};
     nodeAPI->setAttribute(text22, NODE_TEXT_CONTENT, &textItem22);
     ArkUI_AttributeItem textItem212 = {.string = "text22"};
     nodeAPI->setAttribute(text22, NODE_ID, &textItem212);
     
     static auto text23 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem23 = {.string = "23"};
     nodeAPI->setAttribute(text23, NODE_TEXT_CONTENT, &textItem23);
     ArkUI_AttributeItem textItem213 = {.string = "text23"};
     nodeAPI->setAttribute(text23, NODE_ID, &textItem213);
 
     static auto text11 = nodeAPI->createNode(ARKUI_NODE_TEXT);
     ArkUI_AttributeItem textItem11 = {.string = "11"};
     nodeAPI->setAttribute(text11, NODE_TEXT_CONTENT, &textItem11);
 
     nodeAPI->registerNodeEvent(colum, NODE_ON_KEY_EVENT, INT_1, nullptr);
     nodeAPI->registerNodeEvent(button21, NODE_ON_KEY_EVENT, INT_21, nullptr);
     nodeAPI->registerNodeEvent(button21, NODE_ON_FOCUS, INT_111, nullptr);
     nodeAPI->registerNodeEvent(button22, NODE_ON_KEY_EVENT, INT_22, nullptr);
     nodeAPI->registerNodeEvent(button22, NODE_ON_FOCUS, INT_222, nullptr);
     nodeAPI->registerNodeEvent(button23, NODE_ON_KEY_EVENT, INT_23, nullptr);
     nodeAPI->registerNodeEvent(button23, NODE_ON_FOCUS, INT_333, nullptr);
 
     static int i = 0;
 
     // 注册监听事件事件
     nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
         auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
 
         // 获取事件类型
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "lisitao CreateNativeNode  targetId == %{public}d", targetId);
         auto get_ArkUI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
         
         if (targetId == INT_1) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 1");
             ArkUI_AttributeItem textItem11 = {.string = "succ"};
             nodeAPI->setAttribute(text11, NODE_TEXT_CONTENT, &textItem11);
         } else if (targetId == INT_21) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 21");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
         } else if (targetId == INT_22) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 22");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
         }else if (targetId == INT_111) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem21 = {.string = "succ"};
             nodeAPI->setAttribute(text21, NODE_TEXT_CONTENT, &textItem21);
         }else if (targetId == INT_222) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem22 = {.string = "succ"};
             nodeAPI->setAttribute(text22, NODE_TEXT_CONTENT, &textItem22);
         }else if (targetId == INT_333) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode focus  targetId == 111");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, false);
             ArkUI_AttributeItem textItem23 = {.string = "succ"};
             nodeAPI->setAttribute(text23, NODE_TEXT_CONTENT, &textItem23);
         }else if (targetId == INT_23) {
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  targetId == 23");
             OH_ArkUI_KeyEvent_SetConsumed(get_ArkUI_UIInputEvent, true);
         }
     });
 
     nodeAPI->addChild(colum, row2);
     nodeAPI->addChild(row2, button21);
     nodeAPI->addChild(row2, button22);
     nodeAPI->addChild(row2, button23);
     nodeAPI->addChild(colum, text21);
     nodeAPI->addChild(colum, text22);
     nodeAPI->addChild(colum, text23);
     nodeAPI->addChild(colum, text11);
     
     std::string id(xComponentID);
     if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), colum) ==
         INVALID_PARAM) {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
                      "OH_NativeXComponent_AttachNativeRootNode failed");
     }
     napi_value exports;
     if (napi_create_object(env, &exports) != napi_ok) {
         napi_throw_type_error(env, nullptr, "napi_create_object failed");
         return nullptr;
     }
     return exports;
 }
 
 } // namespace ArkUICapiTest