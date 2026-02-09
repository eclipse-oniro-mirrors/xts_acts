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
#include "list_scroll_to_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>

namespace ArkUICapiTest {
static int g_num2 = 2;
static int g_num3 = 3;
static int g_num7 = 7;
static int g_num10 = 10;
static int g_num30 = 30;
static int g_num38 = 38;
static int g_num40 = 40;
static int g_num50 = 50;
static int g_num100 = 100;
static int g_num200 = 200;
static int g_num250 = 250;
static int g_num500 = 500;
static ArkUI_NativeNodeAPI_1 *nodeAPI;
static ArkUI_NodeHandle list1;
static ArkUI_NodeHandle listItemGroup1;
static ArkUI_NodeHandle list2;
ArkUI_NodeHandle ListScrollToTest::CreateButton(ArkUI_NativeNodeAPI_1 *nodeAPI, std::string buttonName, int eventId)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = buttonName.c_str()};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, eventId, nullptr);
    ArkUI_AttributeItem buttonId = {.string = buttonName.c_str()};
    nodeAPI->setAttribute(button, NODE_ID, &buttonId);
    return button;
}

void ListScrollToTest::ProcessEvent(ArkUI_NativeNodeAPI_1 *nodeAPI, int eventId)
{
    if (eventId == 0) {
        ArkUI_NumberValue value[] = {-1, 40, 50, 80};
        value[0].i32 = g_num10;
        value[1].i32 = 1;
        value[g_num2].i32 = 0;
        value[g_num3].f32 = g_num30;
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list1, NODE_LIST_SCROLL_TO_INDEX, &item);
    } else if (eventId == 1) {
        ArkUI_NumberValue value[] = {2, -1, -1, 0};
        value[0].i32 = g_num7;
        value[1].i32 = g_num2;
        value[g_num2].i32 = 1;
        value[g_num3].i32 = 0;
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list2, NODE_LIST_SCROLL_TO_INDEX_IN_GROUP, &item);
    } else if (eventId == g_num2) {
        ArkUI_NumberValue value[] = {-1, 40, 50, 80};
        value[0].i32 = g_num38;
        value[1].i32 = 1;
        value[g_num2].i32 = 0;
        value[g_num3].f32 = 0;
        ArkUI_AttributeItem item = {value, 4};
        nodeAPI->setAttribute(list1, NODE_LIST_SCROLL_TO_INDEX, &item);
    } else if (eventId == g_num3) {
        nodeAPI->resetAttribute(listItemGroup1, NODE_LIST_ITEM_GROUP_SET_HEADER);
        nodeAPI->resetAttribute(listItemGroup1, NODE_LIST_ITEM_GROUP_SET_FOOTER);
    }
}

void ListScrollToTest::AddListItem(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list)
{
    ArkUI_NumberValue value[] = {1};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = g_num200;
    nodeAPI->setAttribute(list, NODE_WIDTH, &item);
    value[0].f32 = g_num500;
    nodeAPI->setAttribute(list, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF1CAE;
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem listId = {.string = "ListId1"};
    nodeAPI->setAttribute(list, NODE_ID, &listId);
    for (int i = 1; i < g_num40; i++) {
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
        std::string str = "第" + std::to_string(i - 1) + "个";
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);
        nodeAPI->addChild(listItem, text);
        str = "listItem" + std::to_string(i - 1);
        ArkUI_AttributeItem nodeId = {.string = str.c_str()};
        nodeAPI->setAttribute(listItem, NODE_ID, &nodeId);
        nodeAPI->addChild(list, listItem);
    }
    AddListItemGroup1(nodeAPI, list);
}

void ListScrollToTest::AddListItemGroup1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list)
{
    listItemGroup1 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NodeHandle textTemp = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = { .string = "setHeader" };
    nodeAPI->setAttribute(textTemp, NODE_TEXT_CONTENT, &content);
    nodeAPI->setAttribute(textTemp, NODE_ID, &content);
    ArkUI_AttributeItem header = {.object = textTemp};
    nodeAPI->setAttribute(listItemGroup1, NODE_LIST_ITEM_GROUP_SET_HEADER, &header);
    for (int i = 1; i < g_num3; i++) {
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
        std::string str = "Group第" + std::to_string(i - 1) + "个";
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->addChild(listItemGroup1, listItem);
    }
    ArkUI_NodeHandle textTemp2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content2 = { .string = "setFooter" };
    nodeAPI->setAttribute(textTemp2, NODE_TEXT_CONTENT, &content2);
    nodeAPI->setAttribute(textTemp2, NODE_ID, &content2);
    ArkUI_AttributeItem footer = {.object = textTemp2};
    nodeAPI->setAttribute(listItemGroup1, NODE_LIST_ITEM_GROUP_SET_FOOTER, &footer);
    nodeAPI->addChild(list, listItemGroup1);
}

void ListScrollToTest::AddListItemGroup(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list2)
{
    ArkUI_NumberValue value[] = {1};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = g_num200;
    nodeAPI->setAttribute(list2, NODE_WIDTH, &item);
    value[0].f32 = g_num500;
    nodeAPI->setAttribute(list2, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF1CAE;
    nodeAPI->setAttribute(list2, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem listId = {.string = "ListId2"};
    nodeAPI->setAttribute(list2, NODE_ID, &listId);
    for (int i = 1; i < g_num10; i++) {
        auto listItemGroup = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
        for (int j = 1; j < g_num10; j++) {
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
            std::string str = "第" + std::to_string(i - 1) + "组第" + std::to_string(j - 1) + "个";
            ArkUI_AttributeItem content = {.string = str.c_str()};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);
            nodeAPI->addChild(listItem, text);
            str = "listItem" + std::to_string(i - 1) + "to" + std::to_string(j - 1);
            ArkUI_AttributeItem listItemId = {.string = str.c_str()};
            nodeAPI->setAttribute(listItem, NODE_ID, &listItemId);
            nodeAPI->addChild(listItemGroup, listItem);
        }
        nodeAPI->addChild(list2, listItemGroup);
    }
}

ArkUI_NodeHandle ListScrollToTest::CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle row = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {250};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = g_num250;
    nodeAPI->setAttribute(column1, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column2, NODE_WIDTH, &item);
    value[0].f32 = g_num100;
    nodeAPI->setAttribute(row, NODE_HEIGHT, &item);
    ArkUI_NodeHandle column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollToIndex10 = CreateButton(nodeAPI, "scrollToIndex10", 0);
    nodeAPI->addChild(column3, scrollToIndex10);
    auto scrollTo7In2 = CreateButton(nodeAPI, "scrollTo7In2", 1);
    nodeAPI->addChild(column3, scrollTo7In2);
    nodeAPI->addChild(row, column3);
    ArkUI_NodeHandle column4 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollToEnd = CreateButton(nodeAPI, "scrollToEnd", 2);
    nodeAPI->addChild(column4, scrollToEnd);
    auto resetHeaderFooter = CreateButton(nodeAPI, "resetHeaderFooter", 3);
    nodeAPI->addChild(column4, resetHeaderFooter);
    nodeAPI->addChild(row, column4);

    list1 = nodeAPI->createNode(ARKUI_NODE_LIST);
    AddListItem(nodeAPI, list1);
    nodeAPI->addChild(column1, list1);
    nodeAPI->addChild(row1, column1);

    list2 = nodeAPI->createNode(ARKUI_NODE_LIST);
    AddListItemGroup(nodeAPI, list2);
    nodeAPI->addChild(column2, list2);
    nodeAPI->addChild(row1, column2);
    nodeAPI->addChild(stack, row);
    nodeAPI->addChild(stack, row1);
    return stack;
}

napi_value ListScrollToTest::ListScrollToIndexTest(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollToTest", "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollToTest",
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