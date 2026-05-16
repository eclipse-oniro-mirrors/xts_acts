/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "customcomponent_unregisternodecustomevent_test.h"

#include <string>

#include "../manager/plugin_manager.h"
#define ON_CUSTOM_EVENT_1_ID 1011
#define ON_CUSTOM_EVENT_2_ID 1022

namespace ArkUICapiTest {
static auto createColumn(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // set width
    ArkUI_NumberValue columnWidthValue[] = { { .f32 = 200 } };
    ArkUI_AttributeItem columnWidthItem = { columnWidthValue, sizeof(columnWidthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH, &columnWidthItem);
    // set height
    ArkUI_NumberValue columnHeightValue[] = { { .f32 = 200 } };
    ArkUI_AttributeItem columnHeightItem = { columnHeightValue, sizeof(columnHeightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT, &columnHeightItem);
    ArkUI_NumberValue columnColorValue[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem columnColorItem = { columnColorValue, sizeof(columnColorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &columnColorItem);
    columnColorItem.string = "column";
    nodeAPI->setAttribute(column, NODE_ID, &columnColorItem);
    return column;
}
static auto createButton(ArkUI_NativeNodeAPI_1* nodeAPI, uint32_t color)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue buttonWidthValue[] = { { .f32 = 50 } };
    ArkUI_AttributeItem buttonWidthItem = { buttonWidthValue, sizeof(buttonWidthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    // set height
    ArkUI_NumberValue buttonHeightValue[] = { { .f32 = 50 } };
    ArkUI_AttributeItem buttonHeightItem = { buttonHeightValue, sizeof(buttonHeightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    ArkUI_NumberValue buttonColorValue[] = { { .u32 = color } };
    ArkUI_AttributeItem buttonColorItem = { buttonColorValue, sizeof(buttonColorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &buttonColorItem);
    buttonColorItem.string = "button";
    nodeAPI->setAttribute(button, NODE_ID, &buttonColorItem);
    return button;
}
static void OnEventReceive(ArkUI_NodeCustomEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest",
        "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_RED } };
        ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &colorItem);
        return;
    }
}
static void OnEventReceive1(ArkUI_NodeCustomEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest", "OnEventReceive1");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentCustomEventTest",
        "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_CUSTOM_EVENT_2_ID) {
        ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_RED } };
        ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &colorItem);
        return;
    }
}
napi_value CustomComponentUnregisterNodeCustomEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentUnregisterNodeCustomEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentUnregisterNodeCustomEventTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // set parent node
    auto column = createColumn(nodeAPI);
    auto button1 = createButton(nodeAPI, COLOR_GREEN);
    ArkUI_AttributeItem buttonColorItem1 = {};
    buttonColorItem1.string = "button1";
    nodeAPI->setAttribute(button1, NODE_ID, &buttonColorItem1);
    nodeAPI->addChild(column, button1);
    auto button2 = createButton(nodeAPI, COLOR_BLUE);
    ArkUI_AttributeItem buttonColorItem2 = {};
    buttonColorItem2.string = "button2";
    nodeAPI->setAttribute(button2, NODE_ID, &buttonColorItem2);
    nodeAPI->addChild(column, button2);
    nodeAPI->registerNodeCustomEvent(button1, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive);
    nodeAPI->unregisterNodeCustomEvent(button1, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW);
    nodeAPI->unregisterNodeCustomEventReceiver();

    nodeAPI->registerNodeCustomEvent(button2, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, ON_CUSTOM_EVENT_2_ID, nullptr);
    nodeAPI->addNodeCustomEventReceiver(button2, &OnEventReceive1);
    nodeAPI->removeNodeCustomEventReceiver(button2, &OnEventReceive1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
