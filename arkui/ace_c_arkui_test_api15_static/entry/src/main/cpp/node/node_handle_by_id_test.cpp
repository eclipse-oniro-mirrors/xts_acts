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
#include "node_handle_by_id_test.h"
#include <arkui/native_node.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

ArkUI_NativeNodeAPI_1 *nodeAPI1 = nullptr;
static int NUMBER_0 = 0;
static int NUMBER_1 = 1;
static int NUMBER_2 = 2;
static int NUMBER_9 = 9;

namespace ArkUIAniTest {
static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    // 创建文本
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text_item = {.string = "C API"};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &text_item);
    ArkUI_AttributeItem text_id = {.string = "Text_CAPI"};
    nodeAPI->setAttribute(text, NODE_ID, &text_id);
    
    // 创建button
    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item = {.string = "Click"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &button_item);
    ArkUI_AttributeItem button_id = {.string = "Same_CAPI"};
    nodeAPI->setAttribute(button, NODE_ID, &button_id);
    
    // 创建文本
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text_item1 = {.string = "C API1"};
    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &text_item1);
    ArkUI_AttributeItem text_id1 = {.string = "Same_CAPI"};
    nodeAPI->setAttribute(text1, NODE_ID, &text_id);
    
    // 创建文本2
    ArkUI_NodeHandle text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text_item2 = {.string = "C API2"};
    nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &text_item2);
    ArkUI_AttributeItem text_id2 = {.string = "Same_CAPI2"};
    nodeAPI->setAttribute(text2, NODE_ID, &text_id2);
    
    // 创建button2
    ArkUI_NodeHandle button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item2 = {.string = "Click2"};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &button_item2);
    ArkUI_AttributeItem button_id2 = {.string = "Same_CAPI2"};
    nodeAPI->setAttribute(button2, NODE_ID, &button_id2);
    
    // 创建bt0
    ArkUI_NodeHandle bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt0_item = {.string = "no error"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    ArkUI_AttributeItem bt0_id = {.string = "button_id0"};
    nodeAPI->setAttribute(bt0, NODE_ID, &bt0_id);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, NUMBER_0, nullptr);
    
    // 创建bt1
    ArkUI_NodeHandle bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt1_item = {.string = "invalid"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    ArkUI_AttributeItem bt1_id = {.string = "button_id1"};
    nodeAPI->setAttribute(bt1, NODE_ID, &bt1_id);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, NUMBER_1, nullptr);
    
    // 创建bt2
    ArkUI_NodeHandle bt2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt2_item = {.string = "same id"};
    nodeAPI->setAttribute(bt2, NODE_BUTTON_LABEL, &bt2_item);
    ArkUI_AttributeItem bt2_id = {.string = "button_id2"};
    nodeAPI->setAttribute(bt2, NODE_ID, &bt2_id);
    nodeAPI->registerNodeEvent(bt2, NODE_ON_CLICK, NUMBER_2, nullptr);

    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(column, text1);
    nodeAPI->addChild(column, text2);
    nodeAPI->addChild(column, button2);
    nodeAPI->addChild(column, bt0);
    nodeAPI->addChild(column, bt1);
    nodeAPI->addChild(column, bt2);
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testNodeHandleById001", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testNodeHandleById001",
            "OnEventReceive: event is null");
        return;
    }

    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NodeHandle node_ptr = nullptr;
    if (targetId == NUMBER_0) {
        auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("Text_CAPI", &node_ptr);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk getNodeType %{public}d --ec = %{public}d ", OH_ArkUI_NodeUtils_GetNodeType(node_ptr), ret);
        if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
            nodeAPI1->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (targetId == NUMBER_1) {
        auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("NoId", &node_ptr);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk getNodeType %{public}d --ec = %{public}d ", OH_ArkUI_NodeUtils_GetNodeType(node_ptr), ret);
        if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI1->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (targetId == NUMBER_2) {
        ArkUI_NodeHandle node_ptr1 = nullptr;
        auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("Same_CAPI", &node_ptr);
        auto ret1 = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("Same_CAPI2", &node_ptr1);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk getNodeType %{public}d --ec = %{public}d ", OH_ArkUI_NodeUtils_GetNodeType(node_ptr), ret);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
            "kkk getNodeType %{public}d --ec = %{public}d ", OH_ArkUI_NodeUtils_GetNodeType(node_ptr1), ret1); 
        if (OH_ArkUI_NodeUtils_GetNodeType(node_ptr) == NUMBER_9 && OH_ArkUI_NodeUtils_GetNodeType(node_ptr1) == NUMBER_1) {
            nodeAPI1->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void NodeHandleByIdTest::testNodeHandleById001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]testNodeHandleById001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);


    static ArkUI_NodeHandle root = CreateChildNode(nodeAPI1);
    nodeAPI1->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, root);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest