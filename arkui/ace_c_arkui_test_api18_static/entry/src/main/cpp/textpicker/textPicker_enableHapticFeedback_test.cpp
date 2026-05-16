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

#include "textPicker_enableHapticFeedback_test.h"
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include <string>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include "arkui/native_node_ani.h"
#include "ani/ani.h"

#define HEIGHT_PERCENT_1 0.3
#define WIDTH_PERCENT_1 0.5


namespace ArkUIAniTest {
 
void TextPickerEnableHapticFeedbackTest::TextPickerEnableHapticFeedback(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TextPickerEnableHapticFeedbackTest::TextPickerEnableHapticFeedback start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textPicker1 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    auto textPicker2 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    auto textPicker3 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
 
    ArkUI_NumberValue width_value[] = { { .f32 = WIDTH_PERCENT_1 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textPicker1, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(textPicker2, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(textPicker3, NODE_WIDTH_PERCENT, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = HEIGHT_PERCENT_1 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textPicker1, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(textPicker2, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(textPicker3, NODE_HEIGHT_PERCENT, &height_item);
     
    nodeAPI->addChild(column, textPicker1);
    nodeAPI->addChild(column, textPicker2);
    nodeAPI->addChild(column, textPicker3);
 
    ArkUI_NumberValue value[] = {{.i32 = 0}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), nullptr, nullptr};
    item.string = "qqq;wwww;eeee;rrrr;ttt;bbbb;yyyy";
    nodeAPI->setAttribute(textPicker1, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    nodeAPI->setAttribute(textPicker2, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    nodeAPI->setAttribute(textPicker3, NODE_TEXT_PICKER_OPTION_RANGE, &item);
    
    ArkUI_NumberValue true_value[] = {{.i32 = true}};
    ArkUI_AttributeItem true_value_item = {true_value, sizeof(true_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker1, NODE_TEXT_PICKER_ENABLE_HAPTIC_FEEDBACK, &true_value_item);
 
    ArkUI_NumberValue false_value[] = {{.i32 = false}};
    ArkUI_AttributeItem false_value_item = {false_value, sizeof(false_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker2, NODE_TEXT_PICKER_ENABLE_HAPTIC_FEEDBACK, &false_value_item);
 
    ArkUI_NumberValue exception_value[] = {{.i32 = -1}};
    ArkUI_AttributeItem exception_value_item = {exception_value, sizeof(exception_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker3, NODE_TEXT_PICKER_ENABLE_HAPTIC_FEEDBACK, &exception_value_item);
  
    ArkUI_AttributeItem textId = {.string = "enableHapticFeedback_0001"};
    nodeAPI->setAttribute(textPicker1, NODE_ID, &textId);
    ArkUI_AttributeItem textId1 = {.string = "enableHapticFeedback_0002"};
    nodeAPI->setAttribute(textPicker2, NODE_ID, &textId1);
    ArkUI_AttributeItem textId2 = {.string = "enableHapticFeedback_0003"};
    nodeAPI->setAttribute(textPicker3, NODE_ID, &textId2);
  
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICApiDemo