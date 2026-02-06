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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "ListDraggingEventTest.h"
#define ON_START_WILL_DRAGGING_EVENT_ID 61001
#define ON_STOP_WILL_DRAGGING_EVENT_ID 61002
#define ON_STOP_DID_DRAGGING_EVENT_ID 61003
#define PARAM_0_POINT_2 0.2

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {

static ArkUI_NodeHandle ListDraggingHandle(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue size_value[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem size_item = {size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH, &size_item);
    nodeAPI->setAttribute(list, NODE_HEIGHT, &size_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "list_dragging_event";
    nodeAPI->setAttribute(list, NODE_ID, &id_item);
    ArkUI_NumberValue sticky_value[] = {{.i32 = ARKUI_STICKY_STYLE_BOTH }};
    ArkUI_AttributeItem sticky_item = { sticky_value, sizeof(sticky_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(list, NODE_LIST_STICKY, &sticky_item);
    ArkUI_NumberValue back_color_value[] = {{.u32 = 0xFFfffacd}};
    ArkUI_AttributeItem back_color_item = {back_color_value, sizeof(back_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &back_color_item);

    nodeAPI->registerNodeEvent(list, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, ON_STOP_WILL_DRAGGING_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING, ON_START_WILL_DRAGGING_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING, ON_STOP_DID_DRAGGING_EVENT_ID, nullptr);

    auto listItemGroup = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NodeHandle header = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem itemString = {nullptr, 0, "header"};
    nodeAPI->setAttribute(header, NODE_TEXT_CONTENT, &itemString);
    ArkUI_NumberValue value[] = {200};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = PARAM_1;
    nodeAPI->setAttribute(header, NODE_WIDTH_PERCENT, &item);
    value[0].f32 = PARAM_20;
    nodeAPI->setAttribute(header, NODE_HEIGHT, &item);
    ArkUI_NumberValue h_color_value[] = {{.u32 = 0xFFDCDCDC}};
    ArkUI_AttributeItem h_color_item = {h_color_value, sizeof(h_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(header, NODE_BACKGROUND_COLOR, &h_color_item);
    ArkUI_AttributeItem header_item = {.object = header};
    nodeAPI->setAttribute(listItemGroup, NODE_LIST_ITEM_GROUP_SET_HEADER, &header_item);

    // 2：创建ListItem并挂载到ListItemGroup上
    for (int32_t i = 0; i < SIZE_30; i++) {
        auto listItem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
        auto textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
        value[0].f32 = PARAM_1;
        nodeAPI->setAttribute(textNode, NODE_WIDTH_PERCENT, &item);
        value[0].f32 = PARAM_0_POINT_2;
        nodeAPI->setAttribute(textNode, NODE_HEIGHT_PERCENT, &item);

        std::string str = "item_" + std::to_string(i);
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        ArkUI_NumberValue font_color_value[] = {{.u32 = COLOR_PINK}};
        ArkUI_AttributeItem font_color_item = {font_color_value, sizeof(font_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textNode, NODE_FONT_COLOR, &font_color_item);
        ArkUI_NumberValue textAlign_value[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_CENTER}};
        ArkUI_AttributeItem textAlign_item = {textAlign_value, sizeof(textAlign_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &textAlign_item);
        nodeAPI->addChild(listItem, textNode);
        nodeAPI->addChild(listItemGroup, listItem);
    }

    nodeAPI->addChild(list, listItemGroup);
    nodeAPI->addChild(column, list);

    return column;
}

napi_value ListDraggingEventTest::ListWillStopDraggingTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillStopDragging", "ListDraggingHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = ListDraggingHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        if (eventId == ON_STOP_WILL_DRAGGING_EVENT_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListWillStopDraggingTest", "onWillStopDragging");
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListDraggingEventTest::ListWillStartDraggingTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillStartDragging", "ListDraggingHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = ListDraggingHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        if (eventId == ON_START_WILL_DRAGGING_EVENT_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListWillStartDraggingTest", "onWillStartDragging");
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListDraggingEventTest::ListDidStopDraggingTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onDidStopDragging", "ListDraggingHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = ListDraggingHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        if (eventId == ON_STOP_DID_DRAGGING_EVENT_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListDidStopDraggingTest", "onDidStopDragging");
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListDraggingEventTest",
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