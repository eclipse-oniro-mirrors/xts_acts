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

#include "button_rollangle_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {
    auto g_getRollAngle = -1;

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

        nodeAPI->registerNodeEvent(nodeHandle, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

        return nodeHandle;
    }

    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive: event is null");
            return;
        }

        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive eventId: %{public}d",
            eventId);

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        double rollAngle = -1.0f;
        g_getRollAngle = OH_ArkUI_PointerEvent_GetRollAngle(uiInputEvent, &rollAngle);
        if (eventId == ON_TOUCH_EVENT_ID && g_getRollAngle == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    napi_value ButtonRollAngleTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonRollAngleTest", "CreateNativeNode");

        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "ButtonRollAngleTest", "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto buttonangle = createChildNode(nodeAPI, true);

        ArkUI_AttributeItem id_item = {};
        id_item.string = "RollAngleTestButton";
        nodeAPI->setAttribute(buttonangle, NODE_ID, &id_item);

        nodeAPI->addChild(column, buttonangle);

        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
            column) == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonRollAngleTest",
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