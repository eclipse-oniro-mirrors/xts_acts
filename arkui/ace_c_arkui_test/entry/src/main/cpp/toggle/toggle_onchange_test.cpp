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

#include "toggle_onchange_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

#define ON_CHANGE_ISON_EVENT_ID 7007

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ToggleOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ToggleOnChangeTest", "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == ON_CHANGE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[0].i32) {
            ArkUI_NumberValue switch_point_color_value[] = {{.u32 = COLOR_RED}};
            ArkUI_AttributeItem switch_point_color_item = {switch_point_color_value, sizeof(switch_point_color_value) /
                                                                                         sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_TOGGLE_SWITCH_POINT_COLOR, &switch_point_color_item);
        }
    }

    if (eventId == ON_CHANGE_ISON_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (!result->data[0].i32) {
            ArkUI_NumberValue switch_point_color_value[] = {{.u32 = COLOR_RED}};
            ArkUI_AttributeItem switch_point_color_item = {switch_point_color_value, sizeof(switch_point_color_value) /
                                                                                         sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_TOGGLE_SWITCH_POINT_COLOR, &switch_point_color_item);
        }
    }
}

napi_value ToggleOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ToggleOnChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ToggleOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    // parent column
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // first toggle
    auto toggle = nodeAPI->createNode(ARKUI_NODE_TOGGLE);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnChangeToggle";
    nodeAPI->setAttribute(toggle, NODE_ID, &id_item);

    nodeAPI->addChild(column, toggle);

    // second toggle
    auto toggleSecond = nodeAPI->createNode(ARKUI_NODE_TOGGLE);
    ArkUI_AttributeItem id_second_item = {};
    id_second_item.string = "OnChangeIsOnToggle";
    nodeAPI->setAttribute(toggleSecond, NODE_ID, &id_second_item);
    ArkUI_NumberValue switch_value[] = {{.i32 = true}};
    ArkUI_AttributeItem switch_item = {switch_value, sizeof(switch_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(toggleSecond, NODE_TOGGLE_VALUE, &switch_item);

    nodeAPI->addChild(column, toggleSecond);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(toggle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(toggle, NODE_TOGGLE_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(toggleSecond, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(toggleSecond, NODE_TOGGLE_ON_CHANGE, ON_CHANGE_ISON_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ToggleOnChangeTest",
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