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

#include "datePicker_enableHapticFeedback_test.h"
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include <string>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include "arkui/native_node_ani.h"
#include "ani/ani.h"
#include "hilog/log.h"

#define HEIGHT_PERCENT_1 0.3
#define WIDTH_PERCENT_1 0.5


namespace ArkUIAniTest {

void DatePickerEnableTest::DatePickerEnableHapticFeedback(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]DatePickerEnableTest::DatePickerEnableHapticFeedback start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto datePicker1 = nodeAPI->createNode(ARKUI_NODE_DATE_PICKER);
    auto datePicker2 = nodeAPI->createNode(ARKUI_NODE_DATE_PICKER);
    auto datePicker3 = nodeAPI->createNode(ARKUI_NODE_DATE_PICKER);

    ArkUI_NumberValue width_value[] = { { .f32 = WIDTH_PERCENT_1 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(datePicker1, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(datePicker2, NODE_WIDTH_PERCENT, &width_item);
    nodeAPI->setAttribute(datePicker3, NODE_WIDTH_PERCENT, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = HEIGHT_PERCENT_1 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(datePicker1, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(datePicker2, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(datePicker3, NODE_HEIGHT_PERCENT, &height_item);

    nodeAPI->addChild(column, datePicker1);
    nodeAPI->addChild(column, datePicker2);
    nodeAPI->addChild(column, datePicker3);

    ArkUI_AttributeItem selected_value_item = {.string = "2024-5-1"};
    nodeAPI->setAttribute(datePicker1, NODE_DATE_PICKER_SELECTED, &selected_value_item);
    nodeAPI->setAttribute(datePicker2, NODE_DATE_PICKER_SELECTED, &selected_value_item);
    nodeAPI->setAttribute(datePicker3, NODE_DATE_PICKER_SELECTED, &selected_value_item);

    ArkUI_AttributeItem textId = {.string = "enableHapticFeedback_001"};
    nodeAPI->setAttribute(datePicker1, NODE_ID, &textId);
    ArkUI_AttributeItem textId1 = {.string = "enableHapticFeedback_002"};
    nodeAPI->setAttribute(datePicker2, NODE_ID, &textId1);
    ArkUI_AttributeItem textId2 = {.string = "enableHapticFeedback_003"};
    nodeAPI->setAttribute(datePicker3, NODE_ID, &textId2);

    ArkUI_NumberValue true_value[] = {{.i32 = true}};
    ArkUI_AttributeItem true_value_item = {true_value, sizeof(true_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker1, NODE_DATE_PICKER_ENABLE_HAPTIC_FEEDBACK, &true_value_item);

    ArkUI_NumberValue false_value[] = {{.i32 = false}};
    ArkUI_AttributeItem false_value_item = {false_value, sizeof(false_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker2, NODE_DATE_PICKER_ENABLE_HAPTIC_FEEDBACK, &false_value_item);

    ArkUI_NumberValue exception_value[] = {{.i32 = -1}};
    ArkUI_AttributeItem exception_value_item = {exception_value, sizeof(exception_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker3, NODE_DATE_PICKER_ENABLE_HAPTIC_FEEDBACK, &exception_value_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest