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

#include "../manager/plugin_manager.h"
#include "listitem_hittestbehavior_test.h"

#include <string>
#include <sys/un.h>

#define COLUMN_ON_TOUCH_EVENT_ID 7002
#define LISTITEM_ON_TOUCH_EVENT_ID 7003
namespace ArkUICapiTest {

using namespace std;

void ListItemHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListItemOnClickTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemOnClickTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListItemOnClickTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == LISTITEM_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_WHITE;
    } else if (eventId == COLUMN_ON_TOUCH_EVENT_ID) {
        backgroundColor = COLOR_CYAN;
    }

    if ((eventId == COLUMN_ON_TOUCH_EVENT_ID) || (eventId == LISTITEM_ON_TOUCH_EVENT_ID)) {
        ArkUI_NumberValue backgroundColor_value[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColor_value,
                                                   sizeof(backgroundColor_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
    }
}

ArkUI_NodeHandle ListItemHitTestBehaviorTest::CreateSubListNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t hittestbehavior,
                                                                const char *onTouchTestStack)
{
    float stackWidth = SIZE_400;
    float stackHeight = SIZE_400;
    float listWidth = SIZE_400;
    float listHeight = SIZE_300;
    float listItemWidth = SIZE_400;
    float listItemHeight = SIZE_250;
    float columnWidth = SIZE_400;
    float columnHeight = SIZE_200;
    uint32_t stackBackgroundColor = COLOR_YELLOW;
    uint32_t listBackgroundColor = COLOR_RED;
    uint32_t columnBackgroundColor = COLOR_GREEN;
    uint32_t listItemBackgroundColor = COLOR_PURPLE;

    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    auto listItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem idItem = {};
    idItem.string = onTouchTestStack;
    nodeAPI->setAttribute(stack, NODE_ID, &idItem);

    ArkUI_AttributeItem listIdItem = {};
    char listField[PARAM_20] = "List";
    strncat(listField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    listIdItem.string = listField;
    nodeAPI->setAttribute(list, NODE_ID, &listIdItem);

    ArkUI_AttributeItem listItemIdItem = {};
    char listItemField[PARAM_20] = "ListItem";
    strncat(listItemField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    listItemIdItem.string = listItemField;
    nodeAPI->setAttribute(listItem, NODE_ID, &listItemIdItem);

    ArkUI_AttributeItem columnIdItem = {};
    char columnField[PARAM_20] = "Column";
    strncat(columnField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    columnIdItem.string = columnField;
    nodeAPI->setAttribute(Column, NODE_ID, &columnIdItem);

    ArkUI_NumberValue stackWidthValue[] = {{.f32 = stackWidth}};
    ArkUI_AttributeItem stackWidthItem = {stackWidthValue, sizeof(stackWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stackWidthItem);

    ArkUI_NumberValue stackHeightValue[] = {{.f32 = stackHeight}};
    ArkUI_AttributeItem stackHeightItem = {stackHeightValue, sizeof(stackHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stackHeightItem);

    ArkUI_NumberValue stackBackgroundColorValue[] = {{.u32 = stackBackgroundColor}};
    ArkUI_AttributeItem stackBackgroundColorItem = {stackBackgroundColorValue,
                                                    sizeof(stackBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &stackBackgroundColorItem);

    ArkUI_NumberValue columnWidthValue[] = {{.f32 = columnWidth}};
    ArkUI_AttributeItem columnBrotherWidthItem = {columnWidthValue,
                                                  sizeof(columnWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Column, NODE_WIDTH, &columnBrotherWidthItem);

    ArkUI_NumberValue columnHeightValue[] = {{.f32 = columnHeight}};
    ArkUI_AttributeItem columnHeightValueItem = {columnHeightValue,
                                                 sizeof(columnHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Column, NODE_HEIGHT, &columnHeightValueItem);

    ArkUI_NumberValue columnBackgroundColorValue[] = {{.u32 = columnBackgroundColor}};
    ArkUI_AttributeItem columnBackgroundColoItem = {columnBackgroundColorValue,
                                                    sizeof(columnBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Column, NODE_BACKGROUND_COLOR, &columnBackgroundColoItem);

    nodeAPI->registerNodeEvent(Column, NODE_TOUCH_EVENT, COLUMN_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_BROTHER_ON_TOUCH_EVENT_ID",
                 "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    nodeAPI->addChild(listItem, Column);
    ArkUI_NumberValue listWidthValue[] = {{.f32 = listWidth}};
    ArkUI_AttributeItem listWidthItem = {listWidthValue, sizeof(listWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH, &listWidthItem);

    ArkUI_NumberValue listHeightValue[] = {{.f32 = listHeight}};
    ArkUI_AttributeItem listHeightItem = {listHeightValue, sizeof(listHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_HEIGHT, &listHeightItem);

    ArkUI_NumberValue listBackgroundColorValue[] = {{.u32 = listBackgroundColor}};
    ArkUI_AttributeItem listBackgroundColorItem = {listBackgroundColorValue,
                                                   sizeof(listBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &listBackgroundColorItem);

    nodeAPI->addChild(stack, list);

    ArkUI_NumberValue listItemWidthValue[] = {{.f32 = listItemWidth}};
    ArkUI_AttributeItem listItemWidthItem = {listItemWidthValue,
                                             sizeof(listItemWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_WIDTH, &listItemWidthItem);

    ArkUI_NumberValue listItemHeightValue[] = {{.f32 = listItemHeight}};
    ArkUI_AttributeItem listItemHeightItem = {listItemHeightValue,
                                              sizeof(listItemHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_HEIGHT, &listItemHeightItem);

    ArkUI_NumberValue listItemBackgroundColorValue[] = {{.u32 = listItemBackgroundColor}};
    ArkUI_AttributeItem listItemBackgroundColorItem = {
        listItemBackgroundColorValue, sizeof(listItemBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_BACKGROUND_COLOR, &listItemBackgroundColorItem);

    ArkUI_NumberValue listItemHittestbehaviorValue[] = {{.i32 = hittestbehavior}};
    ArkUI_AttributeItem listItemHittestbehaviorItem = {
        listItemHittestbehaviorValue, sizeof(listItemHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_HIT_TEST_BEHAVIOR, &listItemHittestbehaviorItem);

    nodeAPI->registerNodeEvent(listItem, NODE_TOUCH_EVENT, LISTITEM_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LISTITEM_ON_TOUCH_EVENT_ID", "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    nodeAPI->addChild(list, listItem);
    return stack;
}

napi_value ListItemHitTestBehaviorTest::CreateNativeNodeDefault(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    // 创建容器组件
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_DEFAULT;
    string ontouchtestStack = "Default";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ListItemHitTestBehaviorTest::CreateNativeNodeBlock(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_BLOCK;
    string ontouchtestStack = "Block";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value ListItemHitTestBehaviorTest::CreateNativeNodeTransparent(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_TRANSPARENT;
    string ontouchtestStack = "Transparent";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ListItemHitTestBehaviorTest::CreateNativeNodeNone(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_NONE;
    string ontouchtestStack = "None";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest