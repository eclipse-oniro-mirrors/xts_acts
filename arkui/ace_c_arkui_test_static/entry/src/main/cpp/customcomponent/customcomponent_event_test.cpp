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
#include "ani/ani.h"
#include "customcomponent_event_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
namespace {
uint32_t defalutColor = 0xffff0000;
uint32_t actionedColor = 0xff00ff00;
bool g_flag = false;
constexpr int32_t DRAW_EVENT_ID = 3;
constexpr int32_t LAYOUT_EVENT_ID = 4;
constexpr int32_t MEASURE_EVENT_ID = 5;
constexpr int32_t FOREGROUND_EVENT_ID = 5;
constexpr int32_t BACKGROUND_EVENT_ID = 6;
constexpr int32_t MIN_WIDTH = 100;
constexpr int32_t MIN_HEIGHT = 100;
constexpr int32_t MAX_WIDTH = 200;
constexpr int32_t MAX_HEIGHT = 200;
constexpr int32_t PERCENT_REFERENCE_WIDTH = 50;
constexpr int32_t PERCENT_REFERENCE_HEIGHT = 50;
}

ArkUI_NodeHandle customNode;

void OnActioned()
{
    if (!g_flag && customNode) {
        g_flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(customNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "SWIPEGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

void CustomComponentEventTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    g_flag = false;
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    customNode = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue widthValue[] = { {.f32 = 500} };
    ArkUI_AttributeItem widthItem = { .value = widthValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue heightValue[] = { {.f32 = 500} };
    ArkUI_AttributeItem heightItem = { .value = heightValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue value[] = {{.u32 = defalutColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(customNode, NODE_BACKGROUND_COLOR, &value_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "customEventComponentID";
    nodeAPI->setAttribute(customNode, NODE_ID, &id_item);
    nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, MEASURE_EVENT_ID, nullptr);
    nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, LAYOUT_EVENT_ID, nullptr);
    nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, DRAW_EVENT_ID, nullptr);
    nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_FOREGROUND_DRAW,
        FOREGROUND_EVENT_ID, nullptr);
    nodeAPI->registerNodeCustomEvent(customNode, ARKUI_NODE_CUSTOM_EVENT_ON_OVERLAY_DRAW, BACKGROUND_EVENT_ID, nullptr);
    nodeAPI->registerNodeCustomEventReceiver([] (ArkUI_NodeCustomEvent* event) {
        OnActioned();
        auto targetId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
        auto userData = OH_ArkUI_NodeCustomEvent_GetUserData(event);
        auto nodeHandle = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
        auto type = OH_ArkUI_NodeCustomEvent_GetEventType(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "NodeCustomEvent targetId %{public}d", targetId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "NodeCustomEvent  userData %{public}d", !!userData);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "NodeCustomEvent  nodeHandle %{public}d", !!nodeHandle);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "NodeCustomEvent type  %{public}d", type);
        if (type == ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT) {
            auto constrait = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(event);
            OH_ArkUI_LayoutConstraint_SetMinWidth(constrait, MIN_WIDTH);
            OH_ArkUI_LayoutConstraint_SetMinHeight(constrait, MIN_HEIGHT);
            OH_ArkUI_LayoutConstraint_SetMaxWidth(constrait, MAX_WIDTH);
            OH_ArkUI_LayoutConstraint_SetMaxHeight(constrait, MAX_HEIGHT);
            OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth(constrait,
                PERCENT_REFERENCE_WIDTH);
            OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight(constrait,
                PERCENT_REFERENCE_HEIGHT);
        }
        auto constrait = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(event);
        auto minWidth = OH_ArkUI_LayoutConstraint_GetMinWidth(constrait);
        auto minHeight = OH_ArkUI_LayoutConstraint_GetMinHeight(constrait);
        auto maxWidth = OH_ArkUI_LayoutConstraint_GetMaxWidth(constrait);
        auto maxHeight = OH_ArkUI_LayoutConstraint_GetMaxHeight(constrait);
        auto percentReferenceWidth = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(constrait);
        auto percentReferenceHeight = OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight(constrait);
        auto* cavaseContext = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(event);
        auto* canvas = OH_ArkUI_DrawContext_GetCanvas(cavaseContext);
        auto size = OH_ArkUI_DrawContext_GetSize(cavaseContext);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "NodeCustomEvent constrait  %{public}d", !!constrait);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint minWidth  %{public}d", minWidth);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint minWidth  %{public}d", minWidth);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint maxWidth  %{public}d", maxWidth);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint maxHeight  %{public}d", maxHeight);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint percentReferenceWidth  %{public}d", percentReferenceWidth);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint percentReferenceHeight  %{public}d", percentReferenceHeight);

        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint cavaseContext  %{public}d", !!cavaseContext);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint canvas  %{public}d", !!canvas);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LayoutConstraint size.width  %{public}d", size.width);
    });
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, customNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
