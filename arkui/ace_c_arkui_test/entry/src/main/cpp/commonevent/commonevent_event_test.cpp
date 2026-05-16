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

#include "commonevent_event_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#define COMMONEVENT_EVENT_ID 6070
#define ON_TOUCH_EVENT_STOP_ID 6071
#define ON_TOUCH_EVENT_INTERCEPT_DEFAULT_ID 6072
#define ON_TOUCH_EVENT_INTERCEPT_BLOCK_ID 6073
#define ON_TOUCH_EVENT_INTERCEPT_TRANSPARENT_ID 6074
#define ON_TOUCH_EVENT_INTERCEPT_NONE_ID 6075
#define PARAM_400 400

namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildNodeOnHover(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "onHoverTest";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(button, NODE_ON_HOVER, COMMONEVENT_EVENT_ID, nullptr);

    nodeAPI->addChild(column, button);

    return column;
}

static ArkUI_NodeHandle CreateChildNodeOnMouse(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto buttonRight = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonLeft = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonMiddle = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonMove = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_20}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonRight, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonLeft, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonMiddle, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonMove, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonRight, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonLeft, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonMiddle, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonMove, NODE_HEIGHT, &button_length_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "onMouseRightTest";
    nodeAPI->setAttribute(buttonRight, NODE_ID, &id_item);
    id_item.string = "onMouseLeftTest";
    nodeAPI->setAttribute(buttonLeft, NODE_ID, &id_item);
    id_item.string = "onMouseMiddleTest";
    nodeAPI->setAttribute(buttonMiddle, NODE_ID, &id_item);
    id_item.string = "onMouseMoveTest";
    nodeAPI->setAttribute(buttonMove, NODE_ID, &id_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonRight, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(buttonLeft, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(buttonMiddle, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(buttonMove, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(buttonRight, NODE_ON_MOUSE, COMMONEVENT_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(buttonLeft, NODE_ON_MOUSE, COMMONEVENT_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(buttonMiddle, NODE_ON_MOUSE, COMMONEVENT_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(buttonMove, NODE_ON_MOUSE, COMMONEVENT_EVENT_ID, nullptr);

    nodeAPI->addChild(column, buttonRight);
    nodeAPI->addChild(column, buttonLeft);
    nodeAPI->addChild(column, buttonMiddle);
    nodeAPI->addChild(column, buttonMove);

    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == COMMONEVENT_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

static void OnEventReceiveOnHover(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == COMMONEVENT_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[PARAM_0].i32 == PARAM_1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CommonEventEventTest::CreateNativeNodeOnHover(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = CreateChildNodeOnHover(nodeAPI);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnHover);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value CommonEventEventTest::CreateNativeNodeOnMouse(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = CreateChildNodeOnMouse(nodeAPI);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeOnDisappear(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto buttonClick = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonDisappaer = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonClick, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonDisappaer, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonClick, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonDisappaer, NODE_HEIGHT, &button_length_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "onDisappearTestButtonClick";
    nodeAPI->setAttribute(buttonClick, NODE_ID, &id_item);
    id_item.string = "OnDisappearTest";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(buttonClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(buttonDisappaer, NODE_EVENT_ON_DISAPPEAR, COMMONEVENT_EVENT_ID, nullptr);

    nodeAPI->addChild(column, buttonClick);
    nodeAPI->insertChildAfter(column, buttonDisappaer, buttonClick);

    return column;
}

static void OnEventReceiveOnDisappear(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == COMMONEVENT_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeHandler), NODE_BACKGROUND_COLOR, &background_color_item);
    }

    if (eventId == ON_CLICK_EVENT_ID) {
        nodeAPI->removeChild(nodeAPI->getParent(nodeHandler), nodeAPI->getNextSibling(nodeHandler));
    }
}

napi_value CommonEventEventTest::CreateNativeNodeOnDisappear(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = CreateChildNodeOnDisappear(nodeAPI);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnDisappear);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeOnVisibleAreaChange(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto buttonClick = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonVisibleAreaChange = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonVisibleAreaChange, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonVisibleAreaChange, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonClick, NODE_WIDTH, &button_length_item);

    button_length_value[0] = {.f32 = SIZE_400};
    button_length_item = {button_length_value, sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonClick, NODE_HEIGHT, &button_length_item);

    ArkUI_NumberValue scroll_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scroll_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scroll_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "onVisibleAreaChangeTestButtonClick";
    nodeAPI->setAttribute(buttonClick, NODE_ID, &id_item);
    id_item.string = "onVisibleAreaChangeTestButtonChange";
    nodeAPI->setAttribute(buttonVisibleAreaChange, NODE_ID, &id_item);
    id_item.string = "OnVisibleAreaChangeTest";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, buttonVisibleAreaChange);
    nodeAPI->addChild(column, buttonClick);

    ArkUI_NumberValue change_value[] = {{.f32 = PARAM_0_POINT_5}};
    ArkUI_AttributeItem change_item = {change_value, sizeof(change_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonVisibleAreaChange, NODE_VISIBLE_AREA_CHANGE_RATIO, &change_item);
    nodeAPI->registerNodeEvent(buttonVisibleAreaChange, NODE_EVENT_ON_VISIBLE_AREA_CHANGE, COMMONEVENT_EVENT_ID,
        nullptr);
    nodeAPI->registerNodeEvent(buttonClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    return scroll;
}

static void OnEventReceiveOnVisibleAreaChange(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnVisibleAreaChange", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnVisibleAreaChange", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnVisibleAreaChange", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == COMMONEVENT_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[PARAM_0].i32 == PARAM_0 && result->data[PARAM_1].f32 == PARAM_0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getParent(nodeHandler), NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    if (eventId == ON_CLICK_EVENT_ID) {
        ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_400}};
        ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
        auto scroll = nodeAPI->getParent(nodeAPI->getParent(nodeHandler));
        nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    }
}

napi_value CommonEventEventTest::CreateNativeNodeOnVisibleAreaChange(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnVisibleAreaChange", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnVisibleAreaChange", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeOnVisibleAreaChange(nodeAPI);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnVisibleAreaChange);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnVisibleAreaChange",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeOnTouchPropagation(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto buttonPropagation = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto buttonStopPropagation = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto scrollPropagation = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto scrollStopPropagation = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(buttonPropagation, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonStopPropagation, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(buttonPropagation, NODE_HEIGHT, &button_length_item);
    nodeAPI->setAttribute(buttonStopPropagation, NODE_HEIGHT, &button_length_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "buttonPropagation";
    nodeAPI->setAttribute(buttonPropagation, NODE_ID, &id_item);
    id_item.string = "buttonStopPropagation";
    nodeAPI->setAttribute(buttonStopPropagation, NODE_ID, &id_item);
    id_item.string = "OnTouchPropagationTest";
    nodeAPI->setAttribute(scrollPropagation, NODE_ID, &id_item);
    id_item.string = "OnTouchStopPropagationTest";
    nodeAPI->setAttribute(scrollStopPropagation, NODE_ID, &id_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scrollPropagation, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scrollStopPropagation, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(buttonPropagation, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(buttonStopPropagation, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_STOP_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollPropagation, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollStopPropagation, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_STOP_ID, nullptr);

    nodeAPI->addChild(scrollPropagation, buttonPropagation);
    nodeAPI->addChild(scrollStopPropagation, buttonStopPropagation);
    nodeAPI->addChild(column, scrollPropagation);
    nodeAPI->addChild(column, scrollStopPropagation);

    return column;
}

static void OnEventReceiveOnTouchPropagation(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);

    if (eventId == ON_TOUCH_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_ArkUI_PointerEvent_SetStopPropagation(uiInputEvent, false);
    }

    if (eventId == ON_TOUCH_EVENT_STOP_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_ArkUI_PointerEvent_SetStopPropagation(uiInputEvent, true);
    }
}

napi_value CommonEventEventTest::CreateNativeNodeOnTouchPropagation(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = CreateChildNodeOnTouchPropagation(nodeAPI);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnTouchPropagation);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeOnTouchInterceptDefault(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto scroll2 = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_item);
    ArkUI_NumberValue scroll2_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem scroll2_item = {scroll2_value, sizeof(scroll2_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll2, NODE_WIDTH, &scroll2_item);
    nodeAPI->setAttribute(scroll2, NODE_HEIGHT, &scroll2_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scroll_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scroll_item);
    ArkUI_NumberValue stack_value[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem stack_item = {stack_value, sizeof(stack_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stack_item);
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stack_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "defaultParent";
    nodeAPI->setAttribute(stack, NODE_ID, &id_item);
    id_item.string = "defaultItself";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    id_item.string = "defaultBrother";
    nodeAPI->setAttribute(scroll2, NODE_ID, &id_item);
    id_item.string = "defaultChild";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll2, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(scroll, NODE_ON_TOUCH_INTERCEPT, ON_TOUCH_EVENT_INTERCEPT_DEFAULT_ID, nullptr);
    nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll2, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, button);
    nodeAPI->addChild(stack, scroll2);
    nodeAPI->addChild(stack, scroll);

    return stack;
}

static ArkUI_NodeHandle CreateChildNodeOnTouchInterceptBlock(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto scroll2 = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_item);
    ArkUI_NumberValue scroll2_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem scroll2_item = {scroll2_value, sizeof(scroll2_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll2, NODE_WIDTH, &scroll2_item);
    nodeAPI->setAttribute(scroll2, NODE_HEIGHT, &scroll2_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scroll_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scroll_item);
    ArkUI_NumberValue stack_value[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem stack_item = {stack_value, sizeof(stack_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stack_item);
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stack_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "blockParent";
    nodeAPI->setAttribute(stack, NODE_ID, &id_item);
    id_item.string = "blockItself";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    id_item.string = "blockBrother";
    nodeAPI->setAttribute(scroll2, NODE_ID, &id_item);
    id_item.string = "blockChild";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll2, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(scroll, NODE_ON_TOUCH_INTERCEPT, ON_TOUCH_EVENT_INTERCEPT_BLOCK_ID, nullptr);
    nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll2, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, button);
    nodeAPI->addChild(stack, scroll2);
    nodeAPI->addChild(stack, scroll);

    return stack;
}

static ArkUI_NodeHandle CreateChildNodeOnTouchInterceptTransparent(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto scroll2 = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_item);
    ArkUI_NumberValue scroll2_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem scroll2_item = {scroll2_value, sizeof(scroll2_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll2, NODE_WIDTH, &scroll2_item);
    nodeAPI->setAttribute(scroll2, NODE_HEIGHT, &scroll2_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scroll_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scroll_item);
    ArkUI_NumberValue stack_value[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem stack_item = {stack_value, sizeof(stack_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stack_item);
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stack_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "transparentParent";
    nodeAPI->setAttribute(stack, NODE_ID, &id_item);
    id_item.string = "transparentItself";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    id_item.string = "transparentBrother";
    nodeAPI->setAttribute(scroll2, NODE_ID, &id_item);
    id_item.string = "transparentChild";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll2, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(scroll, NODE_ON_TOUCH_INTERCEPT, ON_TOUCH_EVENT_INTERCEPT_TRANSPARENT_ID, nullptr);
    nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll2, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, button);
    nodeAPI->addChild(stack, scroll2);
    nodeAPI->addChild(stack, scroll);

    return stack;
}

static ArkUI_NodeHandle CreateChildNodeOnTouchInterceptNone(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto scroll2 = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_item);
    ArkUI_NumberValue scroll2_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem scroll2_item = {scroll2_value, sizeof(scroll2_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll2, NODE_WIDTH, &scroll2_item);
    nodeAPI->setAttribute(scroll2, NODE_HEIGHT, &scroll2_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &scroll_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &scroll_item);
    ArkUI_NumberValue stack_value[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem stack_item = {stack_value, sizeof(stack_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_WIDTH, &stack_item);
    nodeAPI->setAttribute(stack, NODE_HEIGHT, &stack_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "noneParent";
    nodeAPI->setAttribute(stack, NODE_ID, &id_item);
    id_item.string = "noneItself";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    id_item.string = "noneBrother";
    nodeAPI->setAttribute(scroll2, NODE_ID, &id_item);
    id_item.string = "noneChild";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(scroll2, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(scroll, NODE_ON_TOUCH_INTERCEPT, ON_TOUCH_EVENT_INTERCEPT_NONE_ID, nullptr);
    nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll2, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    nodeAPI->addChild(scroll, button);
    nodeAPI->addChild(stack, scroll2);
    nodeAPI->addChild(stack, scroll);

    return stack;
}

static void OnEventReceiveOnTouchIntercept(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);

    if (eventId == ON_TOUCH_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest",
            "OnEventReceiveOnTouchIntercept nodeId: %{public}s", nodeAPI->getAttribute(nodeHandler, NODE_ID)->string);
    }

    if (eventId == ON_TOUCH_EVENT_INTERCEPT_DEFAULT_ID) {
        OH_ArkUI_PointerEvent_SetInterceptHitTestMode(uiInputEvent, HitTestMode::HTM_DEFAULT);
    }
    if (eventId == ON_TOUCH_EVENT_INTERCEPT_BLOCK_ID) {
        OH_ArkUI_PointerEvent_SetInterceptHitTestMode(uiInputEvent, HitTestMode::HTM_BLOCK);
    }
    if (eventId == ON_TOUCH_EVENT_INTERCEPT_TRANSPARENT_ID) {
        OH_ArkUI_PointerEvent_SetInterceptHitTestMode(uiInputEvent, HitTestMode::HTM_TRANSPARENT);
    }
    if (eventId == ON_TOUCH_EVENT_INTERCEPT_NONE_ID) {
        OH_ArkUI_PointerEvent_SetInterceptHitTestMode(uiInputEvent, HitTestMode::HTM_NONE);
    }
}

napi_value CommonEventEventTest::CreateNativeNodeOnTouchInterceptDefault(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack = CreateChildNodeOnTouchInterceptDefault(nodeAPI);
    nodeAPI->addChild(rootColumn, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnTouchIntercept);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value CommonEventEventTest::CreateNativeNodeOnTouchInterceptBlock(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack = CreateChildNodeOnTouchInterceptBlock(nodeAPI);
    nodeAPI->addChild(rootColumn, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnTouchIntercept);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value CommonEventEventTest::CreateNativeNodeOnTouchInterceptTransparent(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack = CreateChildNodeOnTouchInterceptTransparent(nodeAPI);
    nodeAPI->addChild(rootColumn, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnTouchIntercept);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value CommonEventEventTest::CreateNativeNodeOnTouchInterceptNone(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack = CreateChildNodeOnTouchInterceptNone(nodeAPI);
    nodeAPI->addChild(rootColumn, stack);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnTouchIntercept);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventEventTest",
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