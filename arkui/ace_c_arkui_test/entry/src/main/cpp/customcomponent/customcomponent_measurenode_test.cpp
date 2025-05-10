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

#include "customcomponent_measurenode_test.h"

#include <string>

#include "../manager/plugin_manager.h"
#define ON_CUSTOM_EVENT_1_ID 1011
#define ON_CUSTOM_EVENT_6_ID 1013
#define ON_CUSTOM_EVENT_7_ID 1014
#define MAX_WIDTH 120
#define MIN_WIDTH 40
#define MAX_HEIGHT 150
#define MIN_HEIGHT 30
#define PERCENT_WIDTH 500
#define PERCENT_HEIGHT 130
#define PERCENT 0.9
namespace ArkUICapiTest {
static ArkUI_IntSize size1_1 = { 0, 0 };
static ArkUI_IntSize size1_2 = { 0, 0 };
static ArkUI_IntSize size1_3 = { 0, 0 };
static ArkUI_IntSize size1_4 = { 0, 0 };

ArkUI_LayoutConstraint* layoutConstraint = nullptr;
static ArkUI_NodeHandle parentColumn = nullptr;
std::vector<int32_t> CustomComponentMeasureNodeTest::measureNodeVector = {};
static napi_value SetArrayNapiDataWithMeasureNode(const std::vector<int32_t>& data, napi_env env)
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
static void setLayoutConstraint(ArkUI_LayoutConstraint* layoutConstraint)
{
    OH_ArkUI_LayoutConstraint_SetMaxWidth(layoutConstraint, MAX_WIDTH);
    OH_ArkUI_LayoutConstraint_SetMinWidth(layoutConstraint, MIN_WIDTH);
    OH_ArkUI_LayoutConstraint_SetMaxHeight(layoutConstraint, MAX_HEIGHT);
    OH_ArkUI_LayoutConstraint_SetMinHeight(layoutConstraint, MIN_HEIGHT);
    OH_ArkUI_LayoutConstraint_SetPercentReferenceWidth(layoutConstraint, PERCENT_WIDTH);
    OH_ArkUI_LayoutConstraint_SetPercentReferenceHeight(layoutConstraint, PERCENT_HEIGHT);
}
static ArkUI_LayoutConstraint* getChildLayoutContraint(ArkUI_NodeCustomEvent* event, int widthOffset, int heightOffset)
{
    auto layoutConstraint = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(event);
    auto childLayoutConstraint = OH_ArkUI_LayoutConstraint_Copy(layoutConstraint);
    auto layoutConstraintMaxWith = OH_ArkUI_LayoutConstraint_GetMaxWidth(layoutConstraint) - widthOffset;
    auto layoutConstraintMaxHeight = OH_ArkUI_LayoutConstraint_GetMaxHeight(layoutConstraint) - heightOffset;
    OH_ArkUI_LayoutConstraint_SetMaxWidth(childLayoutConstraint, layoutConstraintMaxWith);
    OH_ArkUI_LayoutConstraint_SetMaxHeight(childLayoutConstraint, layoutConstraintMaxHeight);
    return childLayoutConstraint;
}
static void measure(
    ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle nodeHandler, ArkUI_LayoutConstraint* layoutConstraint)
{
    auto totalSize = nodeAPI->getTotalChildCount(nodeHandler);
    for (uint32_t i = 0; i < totalSize; i++) {
        auto child = nodeAPI->getChildAt(nodeHandler, i);
        // 调用测算接口测算Native组件。
        nodeAPI->measureNode(child, layoutConstraint);
    }
}
static ArkUI_IntSize getChildChildSize(ArkUI_NodeCustomEvent* event)
{
    auto layoutConstraint = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(event);
    auto layoutConstrainMaxWith = OH_ArkUI_LayoutConstraint_GetMaxWidth(layoutConstraint);
    auto layoutConstrainMinWith = OH_ArkUI_LayoutConstraint_GetMinWidth(layoutConstraint);
    auto layoutConstrainMaxHeight = OH_ArkUI_LayoutConstraint_GetMaxHeight(layoutConstraint);
    auto layoutConstrainMinHeight = OH_ArkUI_LayoutConstraint_GetMinHeight(layoutConstraint);
    auto layoutConstraintPercentReferenceWidth = OH_ArkUI_LayoutConstraint_GetPercentReferenceWidth(layoutConstraint);
    auto layoutConstraintPercentReferenceHeight = OH_ArkUI_LayoutConstraint_GetPercentReferenceHeight(layoutConstraint);
    // 通过用户传入的大小与约束条件进行比较，设置测算大小
    auto dataIntTemp = OH_ArkUI_NodeCustomEvent_GetUserData(event);
    ArkUI_IntSize size = *static_cast<ArkUI_IntSize*>(dataIntTemp);
    if (size.width > layoutConstrainMaxWith || size.width > layoutConstraintPercentReferenceWidth * PERCENT) {
        size.width = layoutConstrainMaxWith;
    } else if (size.width < layoutConstrainMinWith) {
        size.width = layoutConstrainMinWith;
    }
    if (size.height > layoutConstrainMaxHeight || size.height > layoutConstraintPercentReferenceHeight * PERCENT) {
        size.height = layoutConstrainMaxHeight;
    } else if (size.height < layoutConstrainMinHeight) {
        size.height = layoutConstrainMinHeight;
    }
    return size;
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
    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        layoutConstraint = OH_ArkUI_LayoutConstraint_Create();
        setLayoutConstraint(layoutConstraint);
        measure(nodeAPI, nodeHandler, layoutConstraint);
        nodeAPI->setMeasuredSize(nodeHandler, MAX_WIDTH, MAX_HEIGHT);
        return;
    } else if (eventId == ON_MEASURE_EVENT_ID) {
        auto childLayoutConstraint = getChildLayoutContraint(event, 10, 10);
        auto totalSize = nodeAPI->getTotalChildCount(nodeHandler);
        int32_t maxWidth = 0;
        int32_t maxHeight = 0;
        for (uint32_t i = 0; i < totalSize; i++) {
            auto child = nodeAPI->getChildAt(nodeHandler, i);
            nodeAPI->measureNode(child, childLayoutConstraint);
            auto size = nodeAPI->getMeasuredSize(child);
            if (size.width > maxWidth) {
                maxWidth = size.width;
            }
            if (size.height > maxHeight) {
                maxHeight = size.height;
            }
        }
        nodeAPI->setMeasuredSize(nodeHandler, maxWidth, maxHeight);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, maxWidth);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, maxHeight);
        return;
    } else if (eventId == ON_CUSTOM_EVENT_6_ID) {
        auto size = getChildChildSize(event);
        nodeAPI->setMeasuredSize(nodeHandler, size.width, size.height);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, size.width);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, size.height);
        return;
    } else if (eventId == ON_CUSTOM_EVENT_7_ID) {
        auto size = getChildChildSize(event);
        nodeAPI->setMeasuredSize(nodeHandler, size.width, size.height);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, size.width);
        PushBackIntToData(CustomComponentMeasureNodeTest::measureNodeVector, size.height);
        return;
    }
}
static void OnLayoutReceive(ArkUI_NodeCustomEvent* event)
{
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
            "OnLayoutReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
        "OnLayoutReceive eventId: %{public}d", eventId);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_LAYOUT_EVENT_ID) {
        // 获取测算大小，将测算大小设置为布局大小
        auto size = nodeAPI->getMeasuredSize(nodeHandler);
        ArkUI_NumberValue with[] = { { .f32 = (float)size.width } };
        ArkUI_AttributeItem withItem = { with, 1 };
        ArkUI_NumberValue height[] = { { .f32 = (float)size.height } };
        ArkUI_AttributeItem heightItem = { height, 1 };
        nodeAPI->setAttribute(nodeHandler, NODE_WIDTH, &withItem);
        nodeAPI->setAttribute(nodeHandler, NODE_HEIGHT, &heightItem);
        // 触发子节点的布局
        auto totalSize = nodeAPI->getTotalChildCount(nodeHandler);
        for (uint32_t i = 0; i < totalSize; i++) {
            auto child = nodeAPI->getChildAt(nodeHandler, i);
            nodeAPI->layoutNode(child, 0, 0);
        }
        return;
    }
}
static void registerEvent(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle customNode1, ArkUI_NodeHandle customNode2,
    ArkUI_NodeHandle customNode3, ArkUI_NodeHandle customNode4)
{
    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);

    nodeAPI->addNodeCustomEventReceiver(customNode2, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode2, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_MEASURE_EVENT_ID, nullptr);
    nodeAPI->addNodeCustomEventReceiver(customNode2, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode2, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);
    size1_1 = { 5, 180 };
    nodeAPI->addNodeCustomEventReceiver(customNode3, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode3, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_CUSTOM_EVENT_6_ID, &size1_1);
    nodeAPI->addNodeCustomEventReceiver(customNode3, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode3, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);
    size1_2 = { 200, 10 };
    nodeAPI->addNodeCustomEventReceiver(customNode4, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode4, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_CUSTOM_EVENT_7_ID, &size1_2);
    nodeAPI->addNodeCustomEventReceiver(customNode4, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode4, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);
}
static auto addTestNodes(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle parentColumn)
{
    // 创建1个Row组件
    auto row = CreateRowNode(nodeAPI);
    nodeAPI->addChild(parentColumn, row);

    auto customNode1 = CreateCustomNode(nodeAPI, COLOR_RED);
    nodeAPI->addChild(row, customNode1);
    ArkUI_NumberValue customNodeWith[] = { { .f32 = 100 } };
    ArkUI_AttributeItem customNodeWithItem = { customNodeWith, sizeof(customNodeWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_WIDTH, &customNodeWithItem);
    ArkUI_NumberValue customNodeHeight[] = { { .f32 = 100 } };
    ArkUI_AttributeItem customNodeHeightItem = { customNodeHeight,
        sizeof(customNodeHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_HEIGHT, &customNodeHeightItem);
    // custom1_2 是 custom1_1 的孩子
    auto customNode2 = CreateCustomNode(nodeAPI, COLOR_YELLOW);
    nodeAPI->addChild(customNode1, customNode2);
    // custom1_3、custom1_4 是 custom1_2 的孩子
    auto customNode3 = CreateCustomNode(nodeAPI, COLOR_BLUE);
    nodeAPI->addChild(customNode2, customNode3);
    auto customNode4 = CreateCustomNode(nodeAPI, COLOR_PURPLE);
    nodeAPI->addChild(customNode2, customNode4);

    registerEvent(nodeAPI, customNode1, customNode2, customNode3, customNode4);
}
napi_value CustomComponentMeasureNodeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentMeasureNodeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentMeasureNodeTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // set parent node
    parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem item = {};
    item.string = "parentColumn";
    nodeAPI->setAttribute(parentColumn, NODE_ID, &item);
    addTestNodes(nodeAPI, parentColumn);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(parentColumn, button);

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
napi_value CustomComponentMeasureNodeTest::GetMeasureNodeData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentMeasureNodeTest", "GetMeasureNodeData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithMeasureNode(CustomComponentMeasureNodeTest::measureNodeVector, env));
    CustomComponentMeasureNodeTest::measureNodeVector.clear();
    return result;
}
} // namespace ArkUICapiTest
