/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,P
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions andP
 * limitations under the License.
 */

#include "customcomponent_eventondraw_test.h"

#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"
#define ON_CUSTOM_EVENT_1_ID 1021
namespace ArkUICapiTest {
static auto createChildNode(ArkUI_NativeNodeAPI_1* nodeAPI, uint32_t backgroundColor)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    // set width
    ArkUI_NumberValue widthValue[] = { { .f32 = 50 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &widthItem);
    // set height
    ArkUI_NumberValue heightValue[] = { { .f32 = 50 } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue marginValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem marginItem = { marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &marginItem);

    // set background color
    ArkUI_NumberValue colorValue[] = { { .u32 = backgroundColor } };
    ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &colorItem);
    return nodeHandle;
}

static auto createColumnNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // set background color
    ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_GRAY } };
    ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &colorItem);
    // set width
    ArkUI_NumberValue widthValue[] = { { .f32 = 200 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &widthItem);
    // set height
    ArkUI_NumberValue heightValue[] = { { .f32 = 200 } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &heightItem);
    return nodeHandle;
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
    // if event is called, set background color to green
    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        ArkUI_NumberValue colorValue[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem colorItem = { colorValue, sizeof(colorValue) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &colorItem);
        return;
    }
}
napi_value CustomComponentEventOnDrawTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentEventOnDrawTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentGetContextDrawCanvasTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column1 = createColumnNode(nodeAPI);
    // set children
    auto button1 = createChildNode(nodeAPI, COLOR_RED);
    nodeAPI->addChild(column, column1);
    nodeAPI->addChild(column1, button1);
    ArkUI_AttributeItem item = {};
    item.string = "button1";
    nodeAPI->setAttribute(button1, NODE_ID, &item);
    nodeAPI->registerNodeCustomEvent(button1, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentGetContextDrawCanvasTest",
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
