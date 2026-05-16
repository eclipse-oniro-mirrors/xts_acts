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

#include "checkbox_group_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static auto createDefaultChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t select, const char* group)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX_GROUP);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue select_value[] = {{.i32 = select}};
    ArkUI_AttributeItem select_item = {select_value, sizeof(select_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP_SELECT_ALL, &select_item);
    
    ArkUI_AttributeItem group_item = {};
    group_item.string = group;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP_NAME, &group_item);

    return nodeHandle;
}

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, const char* name, const char* group)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_AttributeItem name_item = {};
    name_item.string = name;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_NAME, &name_item);
    
    ArkUI_AttributeItem group_item = {};
    group_item.string = group;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP, &group_item);

    return nodeHandle;
}

void CheckboxGroupTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto checkboxgroupTrue = createDefaultChildNode(nodeAPI, true, "checkboxgroupTrue");
    auto checkbox1 = createChildNode(nodeAPI, "checkbox1", "checkboxgroupTrue");
    ArkUI_AttributeItem textId1 = {.string = "checkbox1"};
    nodeAPI->setAttribute(checkbox1, NODE_ID, &textId1);
    
    auto checkboxgroupFalse = createDefaultChildNode(nodeAPI, false, "checkboxgroupFalse");
    auto checkbox2 = createChildNode(nodeAPI, "checkbox2", "checkboxgroupFalse");
    ArkUI_AttributeItem textId2 = {.string = "checkbox2"};
    nodeAPI->setAttribute(checkbox2, NODE_ID, &textId2);

    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    auto result = nodeAPI->getAttribute(checkbox1, NODE_CHECKBOX_NAME);
    ArkUI_AttributeItem name1_item = {};
    name1_item.string = result->string;
    nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_TEXT, &name1_item);
    
    nodeAPI->addChild(column, checkboxgroupTrue);
    nodeAPI->addChild(column, checkbox1);
    nodeAPI->addChild(column, checkboxgroupFalse);
    nodeAPI->addChild(column, checkbox2);
    nodeAPI->addChild(column, textinput);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest
