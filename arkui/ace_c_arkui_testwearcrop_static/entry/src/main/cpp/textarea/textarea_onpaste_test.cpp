/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "textarea_onpaste_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUICapiTest {

#define TEXT_AREA_ON_PASTE_TEST_STRING "X"
#define TEXT_AREA_DISABLE_ON_PASTE_TEST_STRING "Y"
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_50}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_AREA_ON_PASTE, ON_PASTE_EVENT_ID, nullptr);

    return nodeHandle;
}

static auto createRowNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_ROW);

    ArkUI_NumberValue size_value[] = {{.f32 = SIZE_300}, {.f32 = SIZE_300}};
    ArkUI_AttributeItem size_item = {size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_SIZE, &size_item);

    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_VERTICAL_ALIGNMENT_TOP}};
    ArkUI_AttributeItem align_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_ROW_ALIGN_ITEMS, &align_item);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnPasteTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnPasteTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnPasteTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_PASTE_EVENT_ID) {
        ArkUI_StringAsyncEvent *result = OH_ArkUI_NodeEvent_GetStringAsyncEvent(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnPasteTest", "OnEventReceive pStr: %{public}s",
                     result->pStr);
        if (::strcmp(result->pStr, TEXT_AREA_ON_PASTE_TEST_STRING) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void TextAreaOnPasteTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TextAreaOnPasteTest::CreateNativeNode start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto row = createRowNode(nodeAPI);
    auto textArea = createChildNode(nodeAPI);
    auto textAreaDisable = createChildNode(nodeAPI);

    ArkUI_NumberValue enter_value[] = {{.i32 = ARKUI_ENTER_KEY_TYPE_NEW_LINE}};
    ArkUI_AttributeItem enter_item = {enter_value, sizeof(enter_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaDisable, NODE_TEXT_AREA_ENTER_KEY_TYPE, &enter_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnPasteTestTextArea";
    nodeAPI->setAttribute(textArea, NODE_ID, &id_item);
    id_item.string = "OnPasteTestTextAreaCompare";
    nodeAPI->setAttribute(textAreaDisable, NODE_ID, &id_item);

    ArkUI_AttributeItem text_item = {};
    text_item.string = TEXT_AREA_ON_PASTE_TEST_STRING;
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &text_item);
    
    text_item.string = TEXT_AREA_DISABLE_ON_PASTE_TEST_STRING;
    nodeAPI->setAttribute(textAreaDisable, NODE_TEXT_AREA_TEXT, &text_item);

    nodeAPI->addChild(row, textArea);
    nodeAPI->addChild(row, textAreaDisable);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, row);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICapiTest