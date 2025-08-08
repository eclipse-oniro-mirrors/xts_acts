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

#include "customcomponent_secondarylayout_test.h"

#include <string>

#include "../manager/plugin_manager.h"
#define ON_CUSTOM_EVENT_1_ID 1011
#define MAX_WIDTH 120
#define MAX_HEIGHT 150
namespace ArkUICapiTest {

std::vector<int32_t> CustomComponentSecondaryLayoutTest::secondaryLayoutVector = {};
static napi_value SetArrayNapiDataWithSecondaryLayoutNode(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};
static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}
static auto CreateCustomNode(ArkUI_NativeNodeAPI_1* nodeAPI, uint32_t color)
{
    auto customNode = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue customNodeColor[] = { { .u32 = color } };
    ArkUI_AttributeItem customNodeColorItem = { customNodeColor, sizeof(customNodeColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_BACKGROUND_COLOR, &customNodeColorItem);
    return customNode;
}
static auto CreateRowNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NumberValue rowPercentWith[] = { { .f32 = 0.8 } };
    ArkUI_AttributeItem rowPercentWithItem = { rowPercentWith, sizeof(rowPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_WIDTH_PERCENT, &rowPercentWithItem);
    ArkUI_NumberValue rowPercentHeight[] = { { .f32 = 0.5 } };
    ArkUI_AttributeItem rowPercentHeightItem = { rowPercentHeight,
        sizeof(rowPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_HEIGHT_PERCENT, &rowPercentHeightItem);
    ArkUI_NumberValue rowColor[] = { { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem rowColorItem = { rowColor, sizeof(rowColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_BACKGROUND_COLOR, &rowColorItem);
    ArkUI_NumberValue rowMargin[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowMarginItem = { rowMargin, sizeof(rowMargin) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_MARGIN, &rowMarginItem);
    return row;
}

static void OnMeasureReceive(ArkUI_NodeCustomEvent* event)
{
    if (event == nullptr) {
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "JTA OnMeasureReceive eventId :%{public}d", eventId);
    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        nodeAPI->setMeasuredSize(nodeHandler, MAX_WIDTH, MAX_HEIGHT);
        return;
    }
}
static void OnLayoutReceive(ArkUI_NodeCustomEvent* event)
{
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
            "JTA OnLayoutReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
        "JTA OnLayoutReceive eventId: %{public}d", eventId);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_LAYOUT_EVENT_ID) {
        // 获取测算大小，将测算大小设置为布局大小
        auto size = nodeAPI->getMeasuredSize(nodeHandler);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
            "JTA OnLayoutReceive width: %{public}d height: %{public}d", size.width, size.height);
        ArkUI_NumberValue with[] = { { .f32 = (float)size.width } };
        ArkUI_AttributeItem withItem = { with, PARAM_1 };
        ArkUI_NumberValue height[] = { { .f32 = (float)size.height } };
        ArkUI_AttributeItem heightItem = { height, PARAM_1 };
        nodeAPI->setAttribute(nodeHandler, NODE_WIDTH, &withItem);
        nodeAPI->setAttribute(nodeHandler, NODE_HEIGHT, &heightItem);
        PushBackIntToData(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, size.width);
        PushBackIntToData(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, size.height);
        return;
    }
}
static auto addTestNodes(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    // 创建1个Row组件
    auto row = CreateRowNode(nodeAPI);

    auto customNode1 = CreateCustomNode(nodeAPI, COLOR_RED);
    nodeAPI->addChild(row, customNode1);
    ArkUI_NumberValue customNodeWith[] = { { .f32 = SIZE_200 } };
    ArkUI_AttributeItem customNodeWithItem = { customNodeWith, sizeof(customNodeWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_WIDTH, &customNodeWithItem);
    ArkUI_NumberValue customNodeHeight[] = { { .f32 = SIZE_200 } };
    ArkUI_AttributeItem customNodeHeightItem = { customNodeHeight,
        sizeof(customNodeHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_HEIGHT, &customNodeHeightItem);

    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);
    return row;
}
napi_value CustomComponentSecondaryLayoutTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentSecondaryLayoutTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentSecondaryLayoutTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto row = addTestNodes(nodeAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentSecondaryLayoutTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value CustomComponentSecondaryLayoutTest::GetSecondaryLayoutData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentSecondaryLayoutTest", "GetSecondaryLayoutData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0,
        SetArrayNapiDataWithSecondaryLayoutNode(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, env));
    CustomComponentSecondaryLayoutTest::secondaryLayoutVector.clear();
    return result;
}
} // namespace ArkUICapiTest
