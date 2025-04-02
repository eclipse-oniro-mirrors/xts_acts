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

#include "commonattrs_enabled_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
    ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    uint32_t color = COLOR_PURPLE;
    switch (eventId) {
        case ON_CLICK_EVENT_ID:
            color = COLOR_GREEN;
            break;
        case ON_FOCUS_EVENT_ID:
            color = COLOR_BLUE;
            break;
        case ON_BLUR_EVENT_ID:
            color = COLOR_YELLOW;
            break;
        default:
            break;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

napi_value CommonAttrsEnabledTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI, true);
    auto buttonCompare = createChildNode(nodeAPI, true);
    auto buttonDisable = createChildNode(nodeAPI, false);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "EnabledTestButton";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    id_item.string = "EnabledTestButtonCompare";
    nodeAPI->setAttribute(buttonCompare, NODE_ID, &id_item);
    id_item.string = "EnabledTestButtonDisable";
    nodeAPI->setAttribute(buttonDisable, NODE_ID, &id_item);

    nodeAPI->addChild(column, button);
    nodeAPI->addChild(column, buttonCompare);
    nodeAPI->addChild(column, buttonDisable);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsEnabledTest",
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