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


#include "scroll_hittestbehavior_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <sys/un.h>

#define SCROLL_ON_TOUCH_EVENT_ID 7001
#define SCROLL_BROTHER_ON_TOUCH_EVENT_ID 7002
#define COLUMN_ON_TOUCH_EVENT_ID 7003

namespace ArkUIAniTest {

using namespace std;

void ScrollHitTestBehaviorTest::OnEventReceive(ArkUI_NodeEvent *event)
{
    // blue
    uint32_t backgroundColor = COLOR_BLUE;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollEventOnClickTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == SCROLL_ON_TOUCH_EVENT_ID) {
        // blue
        backgroundColor = COLOR_BLUE;
    } else if (eventId == COLUMN_ON_TOUCH_EVENT_ID) {
        // white
        backgroundColor = COLOR_WHITE;
    } else if (eventId == SCROLL_BROTHER_ON_TOUCH_EVENT_ID) {
        // cyan
        backgroundColor = COLOR_CYAN;
    }

    // If it is a touch event
    if ((eventId == SCROLL_ON_TOUCH_EVENT_ID) || (eventId == SCROLL_BROTHER_ON_TOUCH_EVENT_ID) ||
        (eventId == COLUMN_ON_TOUCH_EVENT_ID)) {
        // Modify component background color
        ArkUI_NumberValue background_color_value[] = {{.u32 = backgroundColor}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

ArkUI_NodeHandle ScrollHitTestBehaviorTest::CreateSubScrollNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t hittestbehavior,
                                                                const char *onTouchTestStack)
{
    float stackWidth = SIZE_400;
    float stackHeight = SIZE_400;
    float scrollWidth = SIZE_400;
    float scrollHeight = SIZE_300;
    float columnWidth = SIZE_400;
    float columnHeight = SIZE_250;
    float scrollBrotherWidth = SIZE_400;
    float scrollBrotherHeight = SIZE_350;

    // yellow
    uint32_t stackBackgroundColor = COLOR_YELLOW;
    // red
    uint32_t scrollBackgroundColor = COLOR_RED;
    // green
    uint32_t scrollBrotherBackgroundColor = COLOR_GREEN;
    // Purple
    uint32_t columnBackgroundColor = COLOR_PURPLE;
    // Create container components
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollBrother = nodeAPI->createNode(ARKUI_NODE_SCROLL);

    // Set container ID
    ArkUI_AttributeItem idItem = {};
    idItem.string = onTouchTestStack;
    nodeAPI->setAttribute(stack, NODE_ID, &idItem);

    ArkUI_AttributeItem scrollIdItem = {};
    char scrollField[PARAM_20] = "Scroll";
    strncat(scrollField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    scrollIdItem.string = scrollField;
    nodeAPI->setAttribute(scroll, NODE_ID, &scrollIdItem);

    ArkUI_AttributeItem columnIdItem = {};
    char columnField[PARAM_20] = "Column";
    strncat(columnField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    columnIdItem.string = columnField;
    nodeAPI->setAttribute(column, NODE_ID, &columnIdItem);

    ArkUI_AttributeItem scrollBrotherrIdItem = {};
    char scrollBrotherField[PARAM_20] = "ScrollBrother";
    strncat(scrollBrotherField, onTouchTestStack, strlen(onTouchTestStack) + 1);
    scrollBrotherrIdItem.string = scrollBrotherField;
    nodeAPI->setAttribute(scrollBrother, NODE_ID, &scrollBrotherrIdItem);
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
    // Set the size of the scrollBrother component
    ArkUI_NumberValue scrollBrotherWidthValue[] = {{.f32 = scrollBrotherWidth}};
    ArkUI_AttributeItem scrollBrotherWidthItem = {scrollBrotherWidthValue,
                                                  sizeof(scrollBrotherWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollBrother, NODE_WIDTH, &scrollBrotherWidthItem);

    ArkUI_NumberValue scrollBrotherHeightValue[] = {{.f32 = scrollBrotherHeight}};
    ArkUI_AttributeItem scrollBrotherHeightItem = {scrollBrotherHeightValue,
                                                   sizeof(scrollBrotherHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollBrother, NODE_HEIGHT, &scrollBrotherHeightItem);

    // Set the background color of the scrollBrother component
    ArkUI_NumberValue scrollBrotherBackgroundColorValue[] = {{.u32 = scrollBrotherBackgroundColor}};
    ArkUI_AttributeItem scrollBrotherBackgroundColorItem = {
        scrollBrotherBackgroundColorValue, sizeof(scrollBrotherBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollBrother, NODE_BACKGROUND_COLOR, &scrollBrotherBackgroundColorItem);

    nodeAPI->registerNodeEvent(scrollBrother, NODE_TOUCH_EVENT, SCROLL_BROTHER_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_BROTHER_ON_TOUCH_EVENT_ID",
                 "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(stack, scrollBrother);
    // Set the size of the scroll component
    ArkUI_NumberValue scrollWidthValue[] = {{.f32 = scrollWidth}};
    ArkUI_AttributeItem scrollWidthItem = {scrollWidthValue, sizeof(scrollWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scrollWidthItem);

    ArkUI_NumberValue scrollHeightValue[] = {{.f32 = scrollHeight}};
    ArkUI_AttributeItem scrollHeightItem = {scrollHeightValue, sizeof(scrollHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scrollHeightItem);

    // Set the background color of the scroll component
    ArkUI_NumberValue scrollBackgroundColorValue[] = {{.u32 = scrollBackgroundColor}};
    ArkUI_AttributeItem scrollBackgroundColorItem = {scrollBackgroundColorValue,
                                                     sizeof(scrollBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &scrollBackgroundColorItem);

    // Set the touch test type value for the scroll component
    ArkUI_NumberValue scrollHittestbehaviorValue[] = {{.i32 = hittestbehavior}};
    ArkUI_AttributeItem scrollHittestbehaviorItem = {scrollHittestbehaviorValue,
                                                     sizeof(scrollHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_HIT_TEST_BEHAVIOR, &scrollHittestbehaviorItem);
    // Bind scroll touch events
    nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, SCROLL_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IMAGE_ON_TOUCH_EVENT_ID", "IMAGE_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(stack, scroll);

    // Set the size of the column component
    ArkUI_NumberValue columnWidthValue[] = {{.f32 = columnWidth}};
    ArkUI_AttributeItem columnWidthItem = {columnWidthValue, sizeof(columnWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_WIDTH, &columnWidthItem);

    ArkUI_NumberValue columnHeightValue[] = {{.f32 = columnHeight}};
    ArkUI_AttributeItem columnHeightItem = {columnHeightValue, sizeof(columnHeightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &columnHeightItem);

    ArkUI_NumberValue columnHittestbehaviorValue[] = {{.i32 = ARKUI_HIT_TEST_MODE_TRANSPARENT}};
    ArkUI_AttributeItem columnHittestbehaviorItem = {columnHittestbehaviorValue,
                                                     sizeof(columnHittestbehaviorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HIT_TEST_BEHAVIOR, &columnHittestbehaviorItem);
    // Set the background color of the column component
    ArkUI_NumberValue columnBackgroundColorValue[] = {{.u32 = columnBackgroundColor}};
    ArkUI_AttributeItem columnBackgroundColorItem = {columnBackgroundColorValue,
                                                     sizeof(columnBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &columnBackgroundColorItem);

    nodeAPI->registerNodeEvent(column, NODE_TOUCH_EVENT, COLUMN_ON_TOUCH_EVENT_ID, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SCROLL_ON_TOUCH_EVENT_ID", "IMAGE_BROTHER_ON_TOUCH_EVENT_ID");

    // Add components to container
    nodeAPI->addChild(scroll, column);
    return stack;
}

void ScrollHitTestBehaviorTest::CreateNativeNodeDefault(ani_env* env, ani_object info, ani_object NodeContent)
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
    auto stack = CreateSubScrollNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());
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

void ScrollHitTestBehaviorTest::CreateNativeNodeBlock(ani_env* env, ani_object info, ani_object NodeContent)
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
    auto stack = CreateSubScrollNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
void ScrollHitTestBehaviorTest::CreateNativeNodeTransparent(ani_env* env, ani_object info, ani_object NodeContent)
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
    auto stack = CreateSubScrollNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());
    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollHitTestBehaviorTest::CreateNativeNodeNone(ani_env* env, ani_object info, ani_object NodeContent)
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
    auto stack = CreateSubScrollNode(nodeAPI, hittestbehavior, ontouchtestStack.c_str());

    nodeAPI->addChild(column, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest