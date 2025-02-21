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
#include "scroll_scrolledge_test.h"
#include <string>

#define ON_SCROLL_EVENT_ID 6007
#define SIZE_320 320

namespace ArkUICapiTest {

static ArkUI_NodeHandle scrollEdge;
static ArkUI_ScrollEdge edgeValue;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_SCROLL_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        return;
    }

    if (eventId == ON_CLICK_EVENT_ID) {
        nodeAPI->registerNodeEvent(scrollEdge, NODE_SCROLL_EVENT_ON_SCROLL, ON_SCROLL_EVENT_ID, nullptr);
        ArkUI_NumberValue edge_value[] = {{.i32 = edgeValue}};
        ArkUI_AttributeItem edge_item = {edge_value, sizeof(edge_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_EDGE, &edge_item);
    }
}

napi_value ScrollScrollEdgeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "CreateNativeNode");

    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetContext env or info is null");
        return nullptr;
    }

    int32_t value;
    napi_get_value_int32(env, args[PARAM_1], &value);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    scrollEdge = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge";
    nodeAPI->setAttribute(scrollEdge, NODE_ID, &id_item);
    id_item.string = "ScrollEdgeButton";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollEdge, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scrollEdge, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scrollEdge, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollEdge, NODE_BACKGROUND_COLOR, &background_color_item);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetParam value: %{public}d", value);

    if (PARAM_0 == value) {
        edgeValue = ARKUI_SCROLL_EDGE_TOP;
    } else if (PARAM_1 == value) {
        edgeValue = ARKUI_SCROLL_EDGE_BOTTOM;
    } else if (PARAM_2 == value) {
        edgeValue = ARKUI_SCROLL_EDGE_START;
        ArkUI_NumberValue direction_value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
        ArkUI_AttributeItem direction_item = {direction_value, sizeof(direction_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_SCROLL_DIRECTION, &direction_item);
    } else if (PARAM_3 == value) {
        edgeValue = ARKUI_SCROLL_EDGE_END;
        ArkUI_NumberValue direction_value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
        ArkUI_AttributeItem direction_item = {direction_value, sizeof(direction_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_SCROLL_DIRECTION, &direction_item);
    }

    ArkUI_NumberValue offset_value[] = {{.f32 = PARAM_8}, {.f32 = PARAM_8}};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_OFFSET, &offset_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scrollEdge) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest",
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