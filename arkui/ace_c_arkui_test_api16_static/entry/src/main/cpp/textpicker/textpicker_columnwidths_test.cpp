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

#include "textpicker_columnwidths_test.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

int32_t g_count = 0;
namespace ArkUIAniTest {
void TextPickerTest::TextPickerColumnWidths(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
        ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
        
        ArkUI_NodeHandle textPicker1 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
        ArkUI_NodeHandle textPicker2 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
        ArkUI_NodeHandle textPicker3 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
        ArkUI_NodeHandle textPicker4 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
        ArkUI_NumberValue NodeWidthValue[] = {{.f32 = 100}};
        ArkUI_AttributeItem NodeWidthItem1 = {NodeWidthValue, sizeof(NodeWidthValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textPicker1, NODE_WIDTH, &NodeWidthItem1);
        nodeAPI->setAttribute(textPicker2, NODE_WIDTH, &NodeWidthItem1);
        nodeAPI->setAttribute(textPicker3, NODE_WIDTH, &NodeWidthItem1);
        ArkUI_NumberValue width_item[] = {{.f32 = 0.5}};
        ArkUI_NumberValue multi_value[] = {{.i32 = ARKUI_TEXTPICKER_RANGETYPE_MULTI}};
        ArkUI_NumberValue multi_value1[] = {{.i32 = ARKUI_TEXTPICKER_RANGETYPE_SINGLE}};
        ArkUI_AttributeItem multi_item1 = {multi_value1, sizeof(multi_value1) / sizeof(ArkUI_NumberValue)};
        ArkUI_AttributeItem multi_item2 = {multi_value1, sizeof(multi_value1) / sizeof(ArkUI_NumberValue)};
        ArkUI_AttributeItem multi_item3 = {multi_value, sizeof(multi_value) / sizeof(ArkUI_NumberValue)};
        
        multi_item1.string = "123456789,123456789,123456789,changchangapweoffierhgb";
        multi_item2.string = "sghfdjufovk,cyrtdmlvkls,aoiejrnnvmvl,cyrhtnmgljo";
        multi_item3.string = "12345,56789,12345;12345,56789,12345;12345,56789,12345";
        nodeAPI->setAttribute(textPicker1, NODE_TEXT_PICKER_OPTION_RANGE, &multi_item1);
        nodeAPI->setAttribute(textPicker2, NODE_TEXT_PICKER_OPTION_RANGE, &multi_item2);
        nodeAPI->setAttribute(textPicker3, NODE_TEXT_PICKER_OPTION_RANGE, &multi_item3);
        
        // 设置列宽
        ArkUI_NumberValue widthValue1[] = {{.f32 = 0.5}};
        ArkUI_NumberValue widthValue2[] = {{.f32 = 1}};
        ArkUI_NumberValue widthValue3[] = {{.f32 = 0.6}, {.f32 = 0.2}, {.f32 = 0.2}};
        ArkUI_AttributeItem widthItem1 = {widthValue1, sizeof(widthValue1) / sizeof(ArkUI_NumberValue)};
        ArkUI_AttributeItem widthItem2 = {widthValue2, sizeof(widthValue2) / sizeof(ArkUI_NumberValue)};
        ArkUI_AttributeItem widthItem3 = {widthValue3, sizeof(widthValue3) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textPicker1, NODE_TEXT_PICKER_COLUMN_WIDTHS, &widthItem1);
        ArkUI_AttributeItem textId = {.string = "columnWidths_001"};
        nodeAPI->setAttribute(textPicker1, NODE_ID, &textId);
        nodeAPI->setAttribute(textPicker2, NODE_TEXT_PICKER_COLUMN_WIDTHS, &widthItem2);
        ArkUI_AttributeItem textId1 = {.string = "columnWidths_002"};
        nodeAPI->setAttribute(textPicker2, NODE_ID, &textId1);
        nodeAPI->setAttribute(textPicker3, NODE_TEXT_PICKER_COLUMN_WIDTHS, &widthItem3);
        ArkUI_AttributeItem textId2 = {.string = "columnWidths_003"};
        nodeAPI->setAttribute(textPicker3, NODE_ID, &textId2);
        nodeAPI->setAttribute(textPicker4, NODE_TEXT_PICKER_COLUMN_WIDTHS, nullptr);
        nodeAPI->addChild(column, row1);
        nodeAPI->addChild(row1, textPicker1);
        nodeAPI->addChild(row1, textPicker2);
        nodeAPI->addChild(column, textPicker4);
        nodeAPI->addChild(column, textPicker3);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // ArkUIAniTest
