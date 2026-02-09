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

#include "../manager/plugin_manager.h"
#include "text_picker_range_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUICapiTest {
    static auto SetWidth(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float width)
    {
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    return nodeHandle;
    }

    static auto SetHeight(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float height)
    {
    ArkUI_NumberValue height_value[] = {{.f32 = height}};
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);
    return nodeHandle;
    }

    static auto SetBackgroundColor(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle nodeHandle, uint32_t color)
    {
    ArkUI_NumberValue color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color_item);
    return nodeHandle;
    }

    static auto SetDialog(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle)
    {
    nodeHandle = SetWidth(nodeAPI, nodeHandle, SIZE_200);
    nodeHandle = SetHeight(nodeAPI, nodeHandle, SIZE_300);
    nodeHandle = SetBackgroundColor(nodeAPI, nodeHandle, COLOR_BLUE);
    return nodeHandle;
    }

    static auto SetId(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id)
    {
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);
    return nodeHandle;
    }

    static auto SetButton(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id)
    {
    nodeHandle = SetWidth(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = SetHeight(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = SetBackgroundColor(nodeAPI, nodeHandle, COLOR_RED);
    nodeHandle = SetId(nodeAPI, nodeHandle, id);
    return nodeHandle;
    }

    static auto CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle parentNode, ArkUI_NodeType type)
    {
    auto childNode = nodeAPI->createNode(type);
    nodeAPI->addChild(parentNode, childNode);
    return childNode;
    }

    static auto SetDialogBuild(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle column)
    {
    auto textPicker5 = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    ArkUI_NumberValue height_value5[] = { {.i32 = ARKUI_TEXTPICKER_RANGETYPE_RANGE_CONTENT}};
    auto hande = OH_ArkUI_TextPickerRangeContentArray_Create(3);
    OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex(hande, "video", 0);
    OH_ArkUI_TextPickerRangeContentArray_SetIconAtIndex(hande, "resource://base/media/icon.png", 0);
    OH_ArkUI_TextPickerRangeContentArray_SetTextAtIndex(hande, "test", 1);
    ArkUI_AttributeItem range_item_M5 = { height_value5, sizeof(height_value5) / sizeof(ArkUI_NumberValue)};
    range_item_M5.object = hande;
    ArkUI_AttributeItem tp0_id = {.string = "textpicker"};
    nodeAPI->setAttribute(textPicker5, NODE_ID, &tp0_id);
    nodeAPI->setAttribute(textPicker5, NODE_TEXT_PICKER_OPTION_RANGE, &range_item_M5);
    nodeAPI->addChild(column, textPicker5);
    auto textPicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);
    ArkUI_NumberValue height_value[] = { {.i32 = ARKUI_TEXTPICKER_RANGETYPE_CASCADE_RANGE_CONTENT}};
    auto handle = OH_ArkUI_TextCascadePickerRangeContentArray_Create(10);
    const int cityIndex = 2;
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle, "test1", 0);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle, "test5", 1);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle, "test6", cityIndex);
    auto handle_city_l = OH_ArkUI_TextCascadePickerRangeContentArray_Create(3);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle_city_l, "test2", 0);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle_city_l, "test3", 1);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetTextAtIndex(handle_city_l, "test4", cityIndex);
    OH_ArkUI_TextCascadePickerRangeContentArray_SetChildAtIndex(handle, handle_city_l, 0);
    ArkUI_AttributeItem range_item_M4 = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    range_item_M4.object = handle;
    nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_RANGE, &range_item_M4);
    ArkUI_AttributeItem tp1_id = {.string = "textpicker2"};
    nodeAPI->setAttribute(textPicker, NODE_ID, &tp1_id);
    nodeAPI->addChild(column, textPicker);
    OH_ArkUI_TextPickerRangeContentArray_Destroy(hande);
    OH_ArkUI_TextCascadePickerRangeContentArray_Destroy(handle);
    }

    void TextPickerRangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
    {
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetDialogBuild(nodeAPI, column);
    ArkUI_NativeNodeAPI_1 *nodeAPI9 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI9);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICapiTest
