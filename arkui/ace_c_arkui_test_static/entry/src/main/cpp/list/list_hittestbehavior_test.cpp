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


#include "list_hittestbehavior_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <sys/un.h>

#define LIST_ON_TOUCH_EVENT_ID 7001
#define LIST_BROTHER_ON_TOUCH_EVENT_ID 7002
#define LISTITEM_ON_TOUCH_EVENT_ID 7003

namespace ArkUIAniTest {

using namespace std;

void ListHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    // blue
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListOnClickTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListOnClickTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListOnClickTest", "OnEventReceive eventId: %{public}d", eventId);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == LIST_ON_TOUCH_EVENT_ID) {
        // blue
        backgroundColor = COLOR_BLUE;
    } else if (eventId == LISTITEM_ON_TOUCH_EVENT_ID) {
        // white
        backgroundColor = COLOR_WHITE;
    } else if (eventId == LIST_BROTHER_ON_TOUCH_EVENT_ID) {
        // cyan
        backgroundColor = COLOR_CYAN;
    }

    // If it is a touch event
    if ((eventId == LIST_ON_TOUCH_EVENT_ID) || (eventId == LIST_BROTHER_ON_TOUCH_EVENT_ID) ||
        (eventId == LISTITEM_ON_TOUCH_EVENT_ID)) {
        // Modify component background color
        ArkUI_NumberValue background_color_value[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

ArkUI_NodeHandle ListHitTestBehaviorTest::CreateSubListNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t hittestbehavior,
                                                            const char *onTouchTestStack)
{
    float stackWidth = SIZE_400;
    float stackHeight = SIZE_400;
    float listWidth = SIZE_400;
    float listHeight = SIZE_300;
    float listItemWidth = SIZE_400;
    float listItemHeight = SIZE_250;
    float listBrotherWidth = SIZE_400;
    float listBrotherHeight = SIZE_350;

    // yellow
    uint32_t stackBackgroundColor = COLOR_YELLOW;
    // red
    uint32_t listBackgroundColor = COLOR_RED;
    // green
    uint32_t listBrotherBackgroundColor = COLOR_GREEN;
    // Purple
    uint32_t listItemBackgroundColor = COLOR_PURPLE;
    // Create container components
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    auto listItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto listBrother = nodeAPI->createNode(ARKUI_NODE_LIST);

    // Set container ID
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

    ArkUI_AttributeItem listBrotherIdItem = {};
    char listBrotherField[PARAM_20] = "ListBrother";
    strncat(listBrotherField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    listBrotherIdItem.string = listBrotherField;
    nodeAPI->setAttribute(listBrother, NODE_ID, &listBrotherIdItem);
    // Set container size
    ArkUI_NumberValue stackWidthValue[] = {{.f32 = stackWidth}};
    ArkUI_AttributeItem stackWidthItem = {stackWidthValue, sizeof(stackWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stackWidthItem);

    ArkUI_NumberValue stackHeightValue[] = {{.f32 = stackHeight}};
    ArkUI_AttributeItem stackHeightItem = {stackHeightValue, sizeof(stackHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stackHeightItem);

    // Set container component background color
    ArkUI_NumberValue stackBackgroundColorValue[] = {{.u32 = stackBackgroundColor}};
    ArkUI_AttributeItem stackBackgroundColorItem = {stackBackgroundColorValue,
                                                    sizeof(stackBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &stackBackgroundColorItem);
    // Set the size of the listBrother component
    ArkUI_NumberValue listBrotherWidthValue[] = {{.f32 = listBrotherWidth}};
    ArkUI_AttributeItem listBrotherWidthItem = {listBrotherWidthValue,
                                                sizeof(listBrotherWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listBrother, NODE_WIDTH, &listBrotherWidthItem);

    ArkUI_NumberValue listBrotherHeightValue[] = {{.f32 = listBrotherHeight}};
    ArkUI_AttributeItem listBrotherHeightItem = {listBrotherHeightValue,
                                                 sizeof(listBrotherHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listBrother, NODE_HEIGHT, &listBrotherHeightItem);

    // Set the background color of the listBrother component
    ArkUI_NumberValue listBrotherBackgroundColorValue[] = {{.u32 = listBrotherBackgroundColor}};
    ArkUI_AttributeItem listBrotherBackgroundColorItem = {
        listBrotherBackgroundColorValue, sizeof(listBrotherBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listBrother, NODE_BACKGROUND_COLOR, &listBrotherBackgroundColorItem);

    nodeAPI->registerNodeEvent(listBrother, NODE_TOUCH_EVENT, LIST_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_BROTHER_ON_TOUCH_EVENT_ID",
                 "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(stack, listBrother);
    // Set the size of the list component
    ArkUI_NumberValue listWidthValue[] = {{.f32 = listWidth}};
    ArkUI_AttributeItem listWidthItem = {listWidthValue, sizeof(listWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH, &listWidthItem);

    ArkUI_NumberValue listHeightValue[] = {{.f32 = listHeight}};
    ArkUI_AttributeItem listHeightItem = {listHeightValue, sizeof(listHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_HEIGHT, &listHeightItem);

    // Set the background color of the list component
    ArkUI_NumberValue listBackgroundColorValue[] = {{.u32 = listBackgroundColor}};
    ArkUI_AttributeItem listBackgroundColorItem = {listBackgroundColorValue,
                                                   sizeof(listBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &listBackgroundColorItem);

    // Set the touch test type value for the list component
    ArkUI_NumberValue listHittestbehaviorValue[] = {{.i32 = hittestbehavior}};
    ArkUI_AttributeItem listHittestbehaviorItem = {listHittestbehaviorValue,
                                                   sizeof(listHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_HIT_TEST_BEHAVIOR, &listHittestbehaviorItem);
    // Bind list touch events
    nodeAPI->registerNodeEvent(list, NODE_TOUCH_EVENT, LIST_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_ON_TOUCH_EVENT_ID", "IMAGE_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(stack, list);

    // Set the size of the listItem component
    ArkUI_NumberValue listItemWidthValue[] = {{.f32 = listItemWidth}};
    ArkUI_AttributeItem listItemWidthItem = {listItemWidthValue,
                                             sizeof(listItemWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_WIDTH, &listItemWidthItem);

    ArkUI_NumberValue listItemHeightValue[] = {{.f32 = listItemHeight}};
    ArkUI_AttributeItem listItemHeightItem = {listItemHeightValue,
                                              sizeof(listItemHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_HEIGHT, &listItemHeightItem);

    ArkUI_NumberValue listItemHittestbehaviorValue[] = {{.i32 = ARKUI_HIT_TEST_MODE_TRANSPARENT}};
    ArkUI_AttributeItem listItemHittestbehaviorItem = {
        listItemHittestbehaviorValue, sizeof(listItemHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_HIT_TEST_BEHAVIOR, &listItemHittestbehaviorItem);
    // Set the background color of the listItem component
    ArkUI_NumberValue listItemBackgroundColorValue[] = {{.u32 = listItemBackgroundColor}};
    ArkUI_AttributeItem listItemBackgroundColorItem = {
        listItemBackgroundColorValue, sizeof(listItemBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(listItem, NODE_BACKGROUND_COLOR, &listItemBackgroundColorItem);

    nodeAPI->registerNodeEvent(listItem, NODE_TOUCH_EVENT, LISTITEM_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LISTITEM_ON_TOUCH_EVENT_ID", "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(list, listItem);
    return stack;
}

void ListHitTestBehaviorTest::CreateNativeNodeDefault(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    // Create node components
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    // Create container components
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_DEFAULT;
    string ontouchtestStack = "Default";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());
    // Add components to container
    nodeAPI->addChild(column, stack);

    // Bind component touch events
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListHitTestBehaviorTest::CreateNativeNodeBlock(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_BLOCK;
    string ontouchtestStack = "Block";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
void ListHitTestBehaviorTest::CreateNativeNodeTransparent(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_TRANSPARENT;
    string ontouchtestStack = "Transparent";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());
    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListHitTestBehaviorTest::CreateNativeNodeNone(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    int32_t hittestbehavior = ArkUI_HitTestMode::ARKUI_HIT_TEST_MODE_NONE;
    string ontouchtestStack = "None";
    auto stack = CreateSubListNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest