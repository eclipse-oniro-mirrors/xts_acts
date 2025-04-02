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
#include "scroll_scrollto_test.h"
#include <string>
#define SCROLL_TO_EVENT_ID 1111

#define SIZE_320 320

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32 == PARAM_0 &&
            nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32 == PARAM_10) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value ScrollScrollToTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_LINEAR}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeEase(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeEaseInOut(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_IN_OUT}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeEaseIn(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeEaseOut(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_OUT}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeExtremeDeceleration(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EXTREME_DECELERATION}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeFastOutLinearIn(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FAST_OUT_LINEAR_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeFastOutSlowIn(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FAST_OUT_SLOW_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeFriction(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FRICTION}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeLinearOutSlowIn(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_LINEAR_OUT_SLOW_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeRhythm(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_RHYTHM}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeSharp(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_SHARP}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollToTest::CreateNativeNodeSmooth(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_SMOOTH}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest",
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