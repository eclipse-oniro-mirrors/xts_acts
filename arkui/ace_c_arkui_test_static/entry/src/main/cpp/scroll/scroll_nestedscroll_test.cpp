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

#include "scroll_nestedscroll_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

#define ON_SCROLL_EVENT_PARENT_ID 66001
#define ON_SCROLL_EVENT_CHILD_ID 66002
#define ON_RESET_EVENT_ID 66003
#define ON_CLEAR_DATA_EVENT_ID 66004
#define ON_COMPARE_EVENT_ID 66005
#define OFFSET_TO_BOTTOM 10000

static ArkUI_NodeHandle nestedScrollRoot;
static ArkUI_NodeHandle parentScroll;
static ArkUI_NodeHandle childScroll;
static ArkUI_NodeHandle compareButton;
static int32_t testType;
static int32_t scrollForward;
static int32_t scrollBackward;
static uint64_t parentScrollTime;
static uint64_t selfScrollTime;

static void SetAttributes(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle nodeHandle, float width, float height,
                          uint32_t backgroundColor)
{
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = height}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = backgroundColor}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);
}

static uint64_t GetCurrentSystemTime()
{
    auto timeNow = std::chrono::system_clock::now();
    auto timeNowMs = std::chrono::time_point_cast<std::chrono::milliseconds>(timeNow);
    uint64_t timestampMs = timeNowMs.time_since_epoch().count();
    return timestampMs;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeComponentEvent *componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);

    if (eventId == ON_SCROLL_EVENT_PARENT_ID) {
        float xOffset = componentEvent->data[PARAM_0].f32;
        float yOffset = componentEvent->data[PARAM_1].f32;
        if ((xOffset != PARAM_0 || yOffset != PARAM_0) && parentScrollTime == PARAM_0) {
            parentScrollTime = GetCurrentSystemTime();
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "OnScroll parentScrollTime: %{public}llu", parentScrollTime);
    } else if (eventId == ON_SCROLL_EVENT_CHILD_ID) {
        float xOffset = componentEvent->data[PARAM_0].f32;
        float yOffset = componentEvent->data[PARAM_1].f32;
        if ((xOffset != PARAM_0 || yOffset != PARAM_0) && selfScrollTime == PARAM_0) {
            selfScrollTime = GetCurrentSystemTime();
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "OnScroll selfScrollTime: %{public}llu", selfScrollTime);
    } else if (eventId == ON_RESET_EVENT_ID) {
        int32_t resetOffset = ARKUI_SCROLL_EDGE_TOP;
        if (testType > PARAM_4) {
            resetOffset = ARKUI_SCROLL_EDGE_BOTTOM;
        }
        ArkUI_NumberValue edge_value[] = {{.i32 = resetOffset}};
        ArkUI_AttributeItem edge_item = {edge_value, sizeof(edge_value) / sizeof(ArkUI_NumberValue)};
        if (parentScroll != nullptr) {
            nodeAPI->setAttribute(parentScroll, NODE_SCROLL_EDGE, &edge_item);
        }
        if (childScroll != nullptr) {
            nodeAPI->setAttribute(childScroll, NODE_SCROLL_EDGE, &edge_item);
        }
    } else if (eventId == ON_CLEAR_DATA_EVENT_ID) {
        selfScrollTime = PARAM_0;
        parentScrollTime = PARAM_0;
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GRAY}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        if (compareButton != nullptr) {
            nodeAPI->setAttribute(compareButton, NODE_BACKGROUND_COLOR, &background_color_item);
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "ClearData parentScrollTime: %{public}llu", parentScrollTime);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "ClearData selfScrollTime: %{public}llu", selfScrollTime);
    } else if (eventId == ON_COMPARE_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "CompareData parentScrollTime: %{public}llu", parentScrollTime);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "CompareData selfScrollTime: %{public}llu", selfScrollTime);
        bool compareResult = false;
        switch (testType) {
            case PARAM_1:
                compareResult = (parentScrollTime == PARAM_0 && selfScrollTime != PARAM_0);
                break;
            case PARAM_2:
                compareResult = (parentScrollTime > selfScrollTime && selfScrollTime > PARAM_0);
                break;
            case PARAM_3:
                compareResult = (parentScrollTime < selfScrollTime && parentScrollTime > PARAM_0);
                break;
            case PARAM_4:
                compareResult = (parentScrollTime > PARAM_0 && selfScrollTime > PARAM_0);
                break;
            case PARAM_5:
                compareResult = (parentScrollTime == PARAM_0 && selfScrollTime != PARAM_0);
                break;
            case PARAM_6:
                compareResult = (parentScrollTime > selfScrollTime && selfScrollTime > PARAM_0);
                break;
            case PARAM_7:
                compareResult = (parentScrollTime < selfScrollTime && parentScrollTime > PARAM_0);
                break;
            case PARAM_8:
                compareResult = (parentScrollTime > PARAM_0 && selfScrollTime > PARAM_0);
                break;
            default:
                break;
        }
        uint32_t color = COLOR_GRAY;
        if (compareResult) {
            color = COLOR_GREEN;
        } else {
            color = COLOR_RED;
        }
        ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        if (compareButton != nullptr) {
            nodeAPI->setAttribute(compareButton, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollNestedScrollTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    nestedScrollRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    compareButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto resetButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto clearDataButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    parentScroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    childScroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto parentInnerColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto topColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto bottomColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto childInnerColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "nestedScrollRoot";
    nodeAPI->setAttribute(nestedScrollRoot, NODE_ID, &id_item);
    id_item.string = "compareButton";
    nodeAPI->setAttribute(compareButton, NODE_ID, &id_item);
    id_item.string = "resetButton";
    nodeAPI->setAttribute(resetButton, NODE_ID, &id_item);
    id_item.string = "clearDataButton";
    nodeAPI->setAttribute(clearDataButton, NODE_ID, &id_item);

    // set nestedScroll
    ArkUI_NumberValue nested_scroll_value[] = {{.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY},
                                               {.i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY}};
    ArkUI_AttributeItem nested_scroll_item = {nested_scroll_value,
                                              sizeof(nested_scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(childScroll, NODE_SCROLL_NESTED_SCROLL, &nested_scroll_item);

    // set button size&backgroundColor
    SetAttributes(nodeAPI, resetButton, SIZE_50, SIZE_50, COLOR_BLUE);
    SetAttributes(nodeAPI, compareButton, SIZE_50, SIZE_50, COLOR_GRAY);
    SetAttributes(nodeAPI, clearDataButton, SIZE_50, SIZE_50, COLOR_PURPLE);

    // set scroller size&backgroundColor
    SetAttributes(nodeAPI, parentScroll, SIZE_300, SIZE_200, COLOR_PURPLE);
    SetAttributes(nodeAPI, topColumn, SIZE_200, SIZE_50, COLOR_GREEN);
    SetAttributes(nodeAPI, childScroll, SIZE_200, SIZE_150, COLOR_GRAY);
    SetAttributes(nodeAPI, childInnerColumn, SIZE_150, SIZE_200, COLOR_YELLOW);
    SetAttributes(nodeAPI, bottomColumn, SIZE_200, SIZE_50, COLOR_GREEN);

    // add to node
    nodeAPI->addChild(nestedScrollRoot, row);
    nodeAPI->addChild(row, resetButton);
    nodeAPI->addChild(row, compareButton);
    nodeAPI->addChild(row, clearDataButton);
    nodeAPI->addChild(nestedScrollRoot, parentScroll);
    nodeAPI->addChild(parentScroll, parentInnerColumn);
    nodeAPI->addChild(parentInnerColumn, topColumn);
    nodeAPI->addChild(parentInnerColumn, childScroll);
    nodeAPI->addChild(childScroll, childInnerColumn);
    nodeAPI->addChild(parentInnerColumn, bottomColumn);

    nodeAPI->registerNodeEvent(parentScroll, NODE_SCROLL_EVENT_ON_SCROLL, ON_SCROLL_EVENT_PARENT_ID, nullptr);
    nodeAPI->registerNodeEvent(childScroll, NODE_SCROLL_EVENT_ON_SCROLL, ON_SCROLL_EVENT_CHILD_ID, nullptr);
    nodeAPI->registerNodeEvent(compareButton, NODE_ON_CLICK, ON_COMPARE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(resetButton, NODE_ON_CLICK, ON_RESET_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(clearDataButton, NODE_ON_CLICK, ON_CLEAR_DATA_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, nestedScrollRoot);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollNestedScrollTest::ChangeTestType(ani_env* env, ani_object info, ani_int num)
{
    testType = num;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    // translate to enum
    switch (testType) {
        case PARAM_1:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            break;
        case PARAM_2:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            break;
        case PARAM_3:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            break;
        case PARAM_4:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_PARALLEL;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            break;
        case PARAM_5:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            break;
        case PARAM_6:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
            break;
        case PARAM_7:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
            break;
        case PARAM_8:
            scrollForward = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
            scrollBackward = ARKUI_SCROLL_NESTED_MODE_PARALLEL;
            break;
        default:
            break;
    }

    // set nestedScroll
    if (childScroll != nullptr) {
        ArkUI_NumberValue nested_scroll_value[] = {{.i32 = scrollForward}, {.i32 = scrollBackward}};
        ArkUI_AttributeItem nested_scroll_item = {nested_scroll_value,
                                                  sizeof(nested_scroll_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(childScroll, NODE_SCROLL_NESTED_SCROLL, &nested_scroll_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollNestedScrollTest",
                     "ChangeTestType testType= %{public}d", testType);
    }

    return ;
}

} // namespace ArkUIAniTest