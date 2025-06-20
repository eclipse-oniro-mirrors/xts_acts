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

#include "ButtonOnHoverEventTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>

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

    napi_value ButtonOnHoverEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest", "CreateNativeNode");

        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest",
                         "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto buttonhover = createChildNode(nodeAPI, true);

        ArkUI_AttributeItem id_item = {};
        id_item.string = "OnHoverTestButton";
        nodeAPI->setAttribute(buttonhover, NODE_ID, &id_item);

        nodeAPI->addChild(column, buttonhover);

        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) == INVALID_PARAM)
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverEventTest",
                         "OH_NativeXComponent_AttachNativeRootNode failed");
        }

        napi_value exports;
        if (napi_create_object(env, &exports) != napi_ok)
        {
            napi_throw_type_error(env, nullptr, "napi_create_object failed");
            return nullptr;
        }

        return exports;
    }
} // namespace ArkUICapiTest