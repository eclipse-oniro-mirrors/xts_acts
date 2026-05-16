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

#include "button_onhoverevent_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUICapiTest
{
    auto GetEventTargetWidth = -1;
    auto GetEventTargetHeight = -1;
    auto GetEventTargetPositionX = -1;
    auto GetEventTargetPositionY = -1;
    auto GetEventTargetGlobalPositionX = -1;
    auto GetEventTargetGlobalPositionY = -1;
    auto IsHovered = false;
    auto GetModifierKey = -1;

    static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
    {
        auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

        ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enable_item = {enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

        ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
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

        nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_HOVER_EVENT, ON_HOVER_EVENT_ID, nullptr);

        return nodeHandle;
    }

    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive");
        if (event == nullptr)
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive: event is null");
            return;
        }

        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive eventId: %{public}d",
                     eventId);

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        uint64_t key = 1;
        uint64_t* keys = &key;
        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        GetEventTargetWidth = OH_ArkUI_UIInputEvent_GetEventTargetWidth(uiInputEvent);
        GetEventTargetHeight = OH_ArkUI_UIInputEvent_GetEventTargetHeight(uiInputEvent);
        GetEventTargetPositionX = OH_ArkUI_UIInputEvent_GetEventTargetPositionX(uiInputEvent);
        GetEventTargetPositionY = OH_ArkUI_UIInputEvent_GetEventTargetPositionY(uiInputEvent);
        GetEventTargetGlobalPositionX = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionX(uiInputEvent);
        GetEventTargetGlobalPositionY = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionY(uiInputEvent);
        IsHovered = OH_ArkUI_HoverEvent_IsHovered(uiInputEvent);
        GetModifierKey = OH_ArkUI_UIInputEvent_GetModifierKeyStates(uiInputEvent,keys);

        if (eventId == ON_HOVER_EVENT_ID && GetEventTargetWidth != -1 && GetEventTargetHeight != -1 &&
            GetEventTargetPositionX != -1 && GetEventTargetPositionY != -1 &&
            GetEventTargetGlobalPositionX != -1 && GetEventTargetGlobalPositionY != -1 && IsHovered == true &&
            GetModifierKey == 0)
        {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    void ButtonOnHoverEventTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
    {
        OH_LOG_INFO(LOG_APP, " [cf]ButtonOnHoverEventTest start -> 66");
        //获取节点的前置框架代码，直接写就行
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
        ArkUI_NodeContentHandle contentHandle;
        OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto buttonhover = createChildNode(nodeAPI, true);

        ArkUI_AttributeItem id_item = {};
        id_item.string = "OnHoverTestButton";
        nodeAPI->setAttribute(buttonhover, NODE_ID, &id_item);

        nodeAPI->addChild(column, buttonhover);

        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
        OH_ArkUI_NodeContent_AddNode(contentHandle, column);
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
        return ;
    }
} // namespace ArkUICapiTest