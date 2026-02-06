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
#include "list_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
static int g_num2 = 2;
static int g_num3 = 3;
static int g_num4 = 4;
static int g_num5 = 5;
static int g_num6 = 6;
static int g_num7 = 7;
static int g_num8 = 8;
static int g_num9 = 9;
static int g_num30 = 30;
static int g_num40 = 40;
static int g_num50 = 50;
static int g_num51 = 51;
static int g_num100 = 100;
static int g_num200 = 200;
static int g_num300 = 300;
static int g_num720 = 720;
static uint32_t g_unum2 = 2;
static ArkUI_NativeNodeAPI_1 *nodeAPI;
ArkUI_NodeHandle list;
ArkUI_NodeHandle CreateButton(ArkUI_NativeNodeAPI_1 *nodeAPI, std::string buttonName, int eventId)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = buttonName.c_str()};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, eventId, nullptr);
    ArkUI_AttributeItem buttonId = {.string = buttonName.c_str()};
    nodeAPI->setAttribute(button, NODE_ID, &buttonId);
    return button;
}

void ProcessEvent(ArkUI_NativeNodeAPI_1 *nodeAPI, int eventId)
{
    if (eventId == 0) {
        ArkUI_NumberValue value[] = {-1, 10, 20, 80};
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list, NODE_LIST_LANES, &item);
    } else if (eventId == 1) {
        ArkUI_NumberValue value[] = {2, -1, -1, 0};
        value[0].u32 = g_unum2;
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list, NODE_LIST_LANES, &item);
    } else if (eventId == g_num2) {
        nodeAPI->resetAttribute(list, NODE_LIST_LANES);
    } else if (eventId == g_num3) {
        ArkUI_NumberValue value[] = {3};
        value[0].i32 = g_num3;
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN, &item);
    } else if (eventId == g_num4) {
        nodeAPI->resetAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    } else if (eventId == g_num5) {
        ArkUI_NumberValue value[] = {1};
        value[0].f32 = g_num100;
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(list, NODE_SCROLL_CONTENT_START_OFFSET, &item);
        nodeAPI->setAttribute(list, NODE_SCROLL_CONTENT_END_OFFSET, &item);
    } else if (eventId == g_num6) {
        ArkUI_NumberValue value[] = {0, 1, 2};
        value[0].i32 = g_num40;
        value[1].i32 = 1;
        value[g_num2].i32 = 0;
        ArkUI_AttributeItem item = {value, 3};
        nodeAPI->setAttribute(list, NODE_LIST_SCROLL_TO_INDEX, &item);
    } else if (eventId == g_num7) {
        ArkUI_NumberValue value[] = {0, 1, 0, 0};
        value[0].i32 = 0;
        value[1].i32 = 1;
        value[g_num2].i32 = 0;
        value[g_num3].f32 = g_num30;
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list, NODE_LIST_SCROLL_TO_INDEX, &item);
    } else if (eventId == g_num8) {
        nodeAPI->resetAttribute(list, NODE_SCROLL_CONTENT_START_OFFSET);
        nodeAPI->resetAttribute(list, NODE_SCROLL_CONTENT_END_OFFSET);
    } else if (eventId == g_num9) {
        nodeAPI->resetAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    }
}

void AddListItem(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list)
{
    ArkUI_NumberValue value[] = {1};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = g_num300;
    nodeAPI->setAttribute(list, NODE_WIDTH, &item);
    value[0].f32 = g_num720;
    nodeAPI->setAttribute(list, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF1CAE;
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem listId = {.string = "ListId"};
    nodeAPI->setAttribute(list, NODE_ID, &listId);
    value[0].i32 = 1;
    nodeAPI->setAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION, &item);
    for (int i = 1; i < g_num51; i++) {
        auto listItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
        ArkUI_NumberValue value[] = {250};
        ArkUI_AttributeItem item = {value, 1};
        value[0].f32 = g_num200;
        nodeAPI->setAttribute(listItem, NODE_WIDTH, &item);
        value[0].f32 = g_num50;
        nodeAPI->setAttribute(listItem, NODE_HEIGHT, &item);
        value[0].u32 = (i % g_num2 == 0 ? 0xFF0000FF : 0xFF00FF00);
        nodeAPI->setAttribute(listItem, NODE_BACKGROUND_COLOR, &item);
        ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        std::string str = "第" + std::to_string(i) + "行";
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);
        nodeAPI->addChild(listItem, text);
        nodeAPI->addChild(list, listItem);
    }
}

ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {30};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column1, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column2, NODE_WIDTH, &item);
    auto setLanesButton = CreateButton(nodeAPI, "setLanes", 0);
    nodeAPI->addChild(column1, setLanesButton);
    auto setLanesButton1 = CreateButton(nodeAPI, "setLanes1", 1);
    nodeAPI->addChild(column1, setLanesButton1);
    auto resetLanesButton = CreateButton(nodeAPI, "resetLanes", 2);
    nodeAPI->addChild(column1, resetLanesButton);
    auto setscrollSnapAlignButton = CreateButton(nodeAPI, "setscrollAlign", 3);
    nodeAPI->addChild(column1, setscrollSnapAlignButton);
    auto resetscrollSnapAlignButton = CreateButton(nodeAPI, "resetscrollAlign", 4);
    nodeAPI->addChild(column1, resetscrollSnapAlignButton);
    auto setcontentOffsetButton = CreateButton(nodeAPI, "setcontentOffset", 5);
    nodeAPI->addChild(column2, setcontentOffsetButton);
    auto scrollToIndex40 = CreateButton(nodeAPI, "scrollToIndex40", 6);
    nodeAPI->addChild(column2, scrollToIndex40);
    auto scrollToIndex0 = CreateButton(nodeAPI, "scrollToIndex0", 7);
    nodeAPI->addChild(column2, scrollToIndex0);
    auto resetcontentOffsetButton = CreateButton(nodeAPI, "resetcontentOffset", 8);
    nodeAPI->addChild(column2, resetcontentOffsetButton);
    auto resetPositionButton = CreateButton(nodeAPI, "resetmaintainVisibleContentPosition", 9);
    nodeAPI->addChild(column2, resetPositionButton);
    nodeAPI->addChild(stack, column1);
    nodeAPI->addChild(stack, column2);
    list = nodeAPI->createNode(ARKUI_NODE_LIST);
    AddListItem(nodeAPI, list);
    nodeAPI->addChild(stack, list);
    return stack;
}

void ListTest::ListCaseTest(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto testNode = CreateChildNode(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        ProcessEvent(nodeAPI, eventId);
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, testNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest