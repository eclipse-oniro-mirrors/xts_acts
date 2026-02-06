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

#include "focus_Control.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = "button"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
    return button;
}
ArkUI_NodeHandle button2;
ArkUI_NodeHandle button;
ArkUI_NodeHandle button4x;

ArkUI_NodeHandle button1xx;
static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID)  {
          auto buttonContext2 = OH_ArkUI_GetContextByNode(button2);
          OH_ArkUI_FocusActivate(buttonContext2, true, true);
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest2", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest2", "OnEventReceive2: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    
    
     int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID )  {
          auto buttonContext2 = OH_ArkUI_GetContextByNode(button1xx);
          OH_ArkUI_FocusClear(buttonContext2);
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest4", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest4", "OnEventReceive2: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    
    
     int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID )  {
          auto buttonContext4x = OH_ArkUI_GetContextByNode(button4x);
          OH_ArkUI_FocusSetAutoTransfer(buttonContext4x, false);
          
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}

void FocusControlTest::FocusControlTest_003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button1"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);
    nodeAPI->addChild(column, button);


    button2 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "button2"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId2);
    nodeAPI->addChild(column, button2);

    nodeAPI->registerNodeEvent(button2, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    auto buttonContext2 = OH_ArkUI_GetContextByNode(button2);
    OH_ArkUI_FocusActivate(buttonContext2, true, true);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}


void FocusControlTest::FocusControlTest_004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button4 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button4"};
    nodeAPI->setAttribute(button4, NODE_ID, &textId);
    nodeAPI->addChild(column, button4);
    
    button4x = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "button4x"};
    nodeAPI->setAttribute(button4x, NODE_ID, &textId2);
    nodeAPI->addChild(column, button4x);
    nodeAPI->registerNodeEvent(button4x, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
     nodeAPI->registerNodeEvent(button4x, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}


} // namespace ArkUIAniTest