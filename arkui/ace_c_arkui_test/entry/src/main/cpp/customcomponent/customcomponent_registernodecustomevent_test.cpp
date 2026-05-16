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

#include "customcomponent_registernodecustomevent_test.h"

#include <string>

#include "../manager/plugin_manager.h"
#define ON_CUSTOM_EVENT_1_ID 1033
#define ON_CUSTOM_EVENT_2_ID 1044

namespace ArkUICapiTest {
static auto CreateRowNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NumberValue rowPercentWith[] = { { .f32 = 0.8 } };
    ArkUI_AttributeItem rowPercentWithItem = { rowPercentWith, sizeof(rowPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_WIDTH_PERCENT, &rowPercentWithItem);
    ArkUI_NumberValue rowPercentHeight[] = { { .f32 = 0.15 } };
    ArkUI_AttributeItem rowPercentHeightItem = { rowPercentHeight,
        sizeof(rowPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_HEIGHT_PERCENT, &rowPercentHeightItem);
    ArkUI_NumberValue rowColor[] = { { .u32 = COLOR_GRAY } };
    ArkUI_AttributeItem rowColorItem = { rowColor, sizeof(rowColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_BACKGROUND_COLOR, &rowColorItem);
    ArkUI_NumberValue rowMargin[] = { { .f32 = 5 } };
    ArkUI_AttributeItem rowMarginItem = { rowMargin, sizeof(rowMargin) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_MARGIN, &rowMarginItem);
    return row;
}
static auto CreateCustomNode(ArkUI_NativeNodeAPI_1* nodeAPI, uint32_t color, float width, float height)
{
    auto customNode = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue customNodeWith[] = { { .f32 = width } };
    ArkUI_AttributeItem customNodeWithItem = { customNodeWith, sizeof(customNodeWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_WIDTH, &customNodeWithItem);
    ArkUI_NumberValue customNodeHeight[] = { { .f32 = height } };
    ArkUI_AttributeItem customNodeHeightItem = { customNodeHeight,
        sizeof(customNodeHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_HEIGHT, &customNodeHeightItem);
    ArkUI_NumberValue customNodeColor[] = { { .u32 = color } };
    ArkUI_AttributeItem customNodeColorItem = { customNodeColor, sizeof(customNodeColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_BACKGROUND_COLOR, &customNodeColorItem);
    return customNode;
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
        ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_BLUE } };
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
napi_value CustomComponentRegisterNodeCustomEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentRegisterNodeCustomEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentRegisterNodeCustomEventTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = CreateRowNode(nodeAPI);
    nodeAPI->addChild(parentColumn, row);

    auto customNode1 = CreateCustomNode(nodeAPI, COLOR_GREEN, 200, 200);

    ArkUI_AttributeItem colorItem = {};
    colorItem.string = "customNode1";
    nodeAPI->setAttribute(customNode1, NODE_ID, &colorItem);
    nodeAPI->addChild(row, customNode1);

    auto customNode2 = CreateCustomNode(nodeAPI, COLOR_YELLOW, 200, 200);
    colorItem.string = "customNode2";
    nodeAPI->setAttribute(customNode2, NODE_ID, &colorItem);
    nodeAPI->addChild(row, customNode2);

    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnEventReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_CUSTOM_EVENT_1_ID, nullptr);

    nodeAPI->registerNodeCustomEvent(customNode2, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_CUSTOM_EVENT_2_ID, nullptr);
    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
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
