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

#define ON_SCROLL_EVENT_ON_REACH_EDGE_ID 6091
#define SIZE_320 320

namespace ArkUICapiTest {

static ArkUI_NodeHandle scrollEdge;
static ArkUI_ScrollEdge edgeValue;
static int32_t g_value;

static void CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
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

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollEdge, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->addChild(scrollEdge, column);
    nodeAPI->addChild(column, button);

    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetParam g_value: %{public}d", g_value);

    if (g_value == PARAM_0) {
        edgeValue = ARKUI_SCROLL_EDGE_TOP;
    } else if (g_value == PARAM_1) {
        edgeValue = ARKUI_SCROLL_EDGE_BOTTOM;
    } else if (g_value == PARAM_2) {
        edgeValue = ARKUI_SCROLL_EDGE_START;
        ArkUI_NumberValue direction_value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
        ArkUI_AttributeItem direction_item = {direction_value, sizeof(direction_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_SCROLL_DIRECTION, &direction_item);
    } else if (g_value == PARAM_3) {
        edgeValue = ARKUI_SCROLL_EDGE_END;
        ArkUI_NumberValue direction_value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
        ArkUI_AttributeItem direction_item = {direction_value, sizeof(direction_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_SCROLL_DIRECTION, &direction_item);
    }
}

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

    if (eventId == ON_SCROLL_EVENT_ON_REACH_EDGE_ID) {
        auto ret = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
        if ((ret == PARAM_0 && g_value == PARAM_0) || (ret == PARAM_1 && g_value == PARAM_1) ||
            (ret == PARAM_2 && g_value == PARAM_2) || (ret == PARAM_3 && g_value == PARAM_3)) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            return;
        }
    }

    if (eventId == ON_CLICK_EVENT_ID) {
        ArkUI_NumberValue value[] = {{.i32 = edgeValue}};
        ArkUI_AttributeItem edgeItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_EDGE, &edgeItem);
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

    napi_get_value_int32(env, args[PARAM_1], &g_value);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    CreateChildNode(nodeAPI);

    nodeAPI->registerNodeEvent(scrollEdge, NODE_SCROLL_EVENT_ON_REACH_START, ON_SCROLL_EVENT_ON_REACH_EDGE_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollEdge, NODE_SCROLL_EVENT_ON_REACH_END, ON_SCROLL_EVENT_ON_REACH_EDGE_ID, nullptr);

    ArkUI_NumberValue offset_value[] = {{.f32 = PARAM_8}, {.f32 = PARAM_8}};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_OFFSET, &offset_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

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

static void OnEventReceive001(ArkUI_NodeEvent *event)
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

    if (eventId == ON_CLICK_EVENT_ID) {
        auto scroll = nodeAPI->getParent(nodeAPI->getParent(nodeHandler));
        ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
        ArkUI_AttributeItem edgeItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE, &edgeItem);
        auto ret = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollEdge001", "ret = %{public}d", ret);
        if (ret == PARAM_NEGATIVE_1) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static ArkUI_NodeHandle CreateChildNodeScrollEdge001(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge001Button";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    return scroll;
}

napi_value ScrollScrollEdgeTest::CreateNativeNodeScrollEdge001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollEdge001(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge001";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    ArkUI_NumberValue offset_value[] = {{.f32 = PARAM_8}, {.f32 = PARAM_8}};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &offset_item);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive001);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
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

static void OnEventReceive002(ArkUI_NodeEvent *event)
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

    if (eventId == ON_CLICK_EVENT_ID) {
        auto scroll = nodeAPI->getParent(nodeAPI->getParent(nodeHandler));
        ArkUI_NumberValue value[] = {{.i32 = PARAM_4}};
        ArkUI_AttributeItem edgeItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE, &edgeItem);
        auto ret = nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollEdge002", "ret = %{public}d", ret);
        if (ret == PARAM_NEGATIVE_1) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static ArkUI_NodeHandle CreateChildNodeScrollEdge002(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge002Button";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    return scroll;
}

napi_value ScrollScrollEdgeTest::CreateNativeNodeScrollEdge002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollEdge002(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge002";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    ArkUI_NumberValue offset_value[] = {{.f32 = PARAM_8}, {.f32 = PARAM_8}};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &offset_item);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive002);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
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

static ArkUI_NodeHandle CreateChildNodeScrollEdge003(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge003Button";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    return scroll;
}

napi_value ScrollScrollEdgeTest::CreateNativeNodeScrollEdge003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEdgeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollEdge003(nodeAPI);
    ArkUI_AttributeItem edgeItem = {};
    auto ret = nodeAPI->setAttribute(scrollEdge, NODE_SCROLL_EDGE, &edgeItem);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollEdge003", "ret = %{public}d", ret);
    ASSERT_EQ(ret, INVALID_PARAM);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollEdge003";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
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