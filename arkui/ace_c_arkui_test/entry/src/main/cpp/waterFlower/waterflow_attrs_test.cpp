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
#include "waterflow_attrs_test.h"

namespace ArkUICapiTest {

#define PARAM_0_POINT_6 0.6f
#define PARAM_0_POINT_9 0.9f

WaterFlowSection DEFAULT_SECTION = { PARAM_10, PARAM_4, PARAM_5, PARAM_5, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 },
    nullptr, nullptr };
WaterFlowSection SECTION1 = { PARAM_20, PARAM_3, PARAM_NEGATIVE_20, PARAM_5, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 },
    nullptr, nullptr };
WaterFlowSection SECTION2 = { PARAM_20, PARAM_3, PARAM_0, PARAM_5, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };
WaterFlowSection SECTION3 = { PARAM_20, PARAM_3, PARAM_20, PARAM_5, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };
WaterFlowSection SECTION4 = { PARAM_20, PARAM_3, PARAM_5, PARAM_NEGATIVE_20, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 },
    nullptr, nullptr };
WaterFlowSection SECTION5 = { PARAM_20, PARAM_3, PARAM_5, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };
WaterFlowSection SECTION6 = { PARAM_20, PARAM_3, PARAM_5, PARAM_20, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };
WaterFlowSection SECTION7 = { PARAM_20, PARAM_3, PARAM_0, PARAM_0,
    { PARAM_NEGATIVE_10, PARAM_NEGATIVE_10, PARAM_NEGATIVE_10, PARAM_NEGATIVE_10 }, nullptr, nullptr };
WaterFlowSection SECTION8 = { PARAM_20, PARAM_3, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };
WaterFlowSection SECTION9 = { PARAM_20, PARAM_3, PARAM_0, PARAM_0, { PARAM_10, PARAM_10, PARAM_10, PARAM_10 }, nullptr,
    nullptr };
WaterFlowSection SECTION10 = { PARAM_20, PARAM_2, PARAM_5, PARAM_5, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr,
    nullptr };

napi_value TestLayoutDirection001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = ARKUI_FLEX_DIRECTION_ROW } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_ROW);
    NAPI_END;
}

napi_value TestLayoutDirection002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = ARKUI_FLEX_DIRECTION_COLUMN } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_COLUMN);
    NAPI_END;
}

napi_value TestLayoutDirection003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = ARKUI_FLEX_DIRECTION_ROW_REVERSE } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_ROW_REVERSE);
    NAPI_END;
}

napi_value TestLayoutDirection004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = ARKUI_FLEX_DIRECTION_COLUMN_REVERSE } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_COLUMN_REVERSE);
    NAPI_END;
}

napi_value TestLayoutDirection005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_COLUMN);
    NAPI_END;
}

napi_value TestLayoutDirection006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = PARAM_4 } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_COLUMN);
    NAPI_END;
}

napi_value TestLayoutDirection007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = ARKUI_FLEX_DIRECTION_COLUMN_REVERSE } };
    ArkUI_AttributeItem layoutDirectionItem = { layoutDirectionValue,
        sizeof(layoutDirectionValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_FLEX_DIRECTION_COLUMN);
    NAPI_END;
}

napi_value TestColumnsTemplate001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem columnsTemplateItem = {};
    columnsTemplateItem.string = "1fr 1fr 1fr";
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE, &columnsTemplateItem);
    const char* ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE)->string;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(strcmp(ret1, "1fr 1fr 1fr"), SUCCESS);
    NAPI_END;
}

napi_value TestColumnsTemplate002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem columnsTemplateItem = {};
    columnsTemplateItem.string = "1 fr abc";
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE, &columnsTemplateItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE)->string;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(strcmp(ret1, "1 fr abc"), SUCCESS);
    NAPI_END;
}

napi_value TestColumnsTemplate003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem columnsTemplateItem = {};
    columnsTemplateItem.string = "1fr 1fr 1fr";
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE, &columnsTemplateItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE)->string;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(strcmp(ret1, "1fr"), SUCCESS);
    NAPI_END;
}

napi_value TestRowsTemplate001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem rowsTemplateItem = {};
    rowsTemplateItem.string = "1fr 1fr 1fr";
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE, &rowsTemplateItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE)->string;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(strcmp(ret1, "1fr 1fr 1fr"), SUCCESS);
    NAPI_END;
}

napi_value TestRowsTemplate002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem rowsTemplateItem = {};
    rowsTemplateItem.string = "1 fr abc";
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE, &rowsTemplateItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE)->string;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(strcmp(ret1, "1 fr abc"), SUCCESS);
    NAPI_END;
}

napi_value TestRowsTemplate003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_AttributeItem rowsTemplateItem = {};
    rowsTemplateItem.string = "1fr 1fr 1fr";
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE, &rowsTemplateItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE)->string;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(strcmp(ret1, "1fr"), SUCCESS);
    NAPI_END;
}

napi_value TestColumnsGap001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue columnsGapValue[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem columnsGapItem = { columnsGapValue, sizeof(columnsGapValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &columnsGapItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_10);
    NAPI_END;
}

napi_value TestColumnsGap002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue columnsGapValue[] = { { .i32 = PARAM_NEGATIVE_10 } };
    ArkUI_AttributeItem columnsGapItem = { columnsGapValue, sizeof(columnsGapValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &columnsGapItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}

napi_value TestColumnsGap003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue columnsGapValue[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem columnsGapItem = { columnsGapValue, sizeof(columnsGapValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &columnsGapItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}

napi_value TestRowsGap001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue rowsGapValue[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem rowsGapItem = { rowsGapValue, sizeof(rowsGapValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP, &rowsGapItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_10);
    NAPI_END;
}

napi_value TestRowsGap002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue rowsGapValue[] = { { .i32 = PARAM_NEGATIVE_10 } };
    ArkUI_AttributeItem rowsGapItem = { rowsGapValue, sizeof(rowsGapValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP, &rowsGapItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}

napi_value TestRowsGap003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue rowsGapValue[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem rowsGapItem = { rowsGapValue, sizeof(rowsGapValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &rowsGapItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP)->value[PARAM_0].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}

napi_value TestNestedScroll001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY },
        { .i32 = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}

napi_value TestNestedScroll002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST },
        { .i32 = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_SELF_FIRST);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_SELF_FIRST);
    NAPI_END;
}

napi_value TestNestedScroll003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST },
        { .i32 = ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST);
    NAPI_END;
}

napi_value TestNestedScroll004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = ARKUI_SCROLL_NESTED_MODE_PARALLEL },
        { .i32 = ARKUI_SCROLL_NESTED_MODE_PARALLEL } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_PARALLEL);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_PARALLEL);
    NAPI_END;
}

napi_value TestNestedScroll005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = PARAM_5 }, { .i32 = PARAM_5 } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}

napi_value TestNestedScroll006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue nestedScrollValue[] = { { .i32 = ARKUI_SCROLL_NESTED_MODE_PARALLEL },
        { .i32 = ARKUI_SCROLL_NESTED_MODE_PARALLEL } };
    ArkUI_AttributeItem nestedScrollItem = { nestedScrollValue, sizeof(nestedScrollValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL, &nestedScrollItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(ret2, ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}

napi_value TestCachedCount001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue cachedCountValue[] = { { .i32 = PARAM_2 } };
    ArkUI_AttributeItem cachedCountItem = { cachedCountValue, sizeof(cachedCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_2);
    NAPI_END;
}

napi_value TestCachedCount002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue cachedCountValue[] = { { .i32 = PARAM_NEGATIVE_2 } };
    ArkUI_AttributeItem cachedCountItem = { cachedCountValue, sizeof(cachedCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, PARAM_1);
    NAPI_END;
}

napi_value TestCachedCount003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue cachedCountValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem cachedCountItem = { cachedCountValue, sizeof(cachedCountValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0);
    NAPI_END;
}

napi_value TestCachedCount004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue cachedCountValue[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem cachedCountItem = { cachedCountValue, sizeof(cachedCountValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, PARAM_1);
    NAPI_END;
}

napi_value TestScrollBar001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarValue[] = { { .i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF } };
    ArkUI_AttributeItem scrollBarItem = { scrollBarValue, sizeof(scrollBarValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBarItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
    NAPI_END;
}

napi_value TestScrollBar002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarValue[] = { { .i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO } };
    ArkUI_AttributeItem scrollBarItem = { scrollBarValue, sizeof(scrollBarValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBarItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO);
    NAPI_END;
}

napi_value TestScrollBar003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarValue[] = { { .i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON } };
    ArkUI_AttributeItem scrollBarItem = { scrollBarValue, sizeof(scrollBarValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBarItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    NAPI_END;
}

napi_value TestScrollBar004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarValue[] = { { .i32 = PARAM_3 } };
    ArkUI_AttributeItem scrollBarItem = { scrollBarValue, sizeof(scrollBarValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBarItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
    NAPI_END;
}

napi_value TestScrollBar005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarValue[] = { { .i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON } };
    ArkUI_AttributeItem scrollBarItem = { scrollBarValue, sizeof(scrollBarValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &scrollBarItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO);
    NAPI_END;
}

napi_value TestWaterFlowScrollBarWidth001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarWidthValue[] = { { .f32 = PARAM_10 } };
    ArkUI_AttributeItem scrollBarWidthItem = { scrollBarWidthValue,
        sizeof(scrollBarWidthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH, &scrollBarWidthItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_10);
    NAPI_END;
}

napi_value TestWaterFlowScrollBarWidth002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarWidthValue[] = { { .f32 = PARAM_1 } };
    ArkUI_AttributeItem scrollBarWidthItem = { scrollBarWidthValue,
        sizeof(scrollBarWidthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH, &scrollBarWidthItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_1);
    NAPI_END;
}

napi_value TestWaterFlowScrollBarWidth003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarWidthValue[] = { { .f32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem scrollBarWidthItem = { scrollBarWidthValue,
        sizeof(scrollBarWidthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH, &scrollBarWidthItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, PARAM_4);
    NAPI_END;
}

napi_value TestWaterFlowScrollBarWidth004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarWidthValue[] = { { .f32 = PARAM_10 } };
    ArkUI_AttributeItem scrollBarWidthItem = { scrollBarWidthValue,
        sizeof(scrollBarWidthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH, &scrollBarWidthItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, PARAM_4);
    NAPI_END;
}

napi_value TestScrollBarColor001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarColorValue[] = { { .u32 = COLOR_RED } };
    ArkUI_AttributeItem scrollBarColorItem = { scrollBarColorValue,
        sizeof(scrollBarColorValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_COLOR, &scrollBarColorItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, COLOR_RED);
    NAPI_END;
}

napi_value TestScrollBarColor002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarColorValue[] = { { .u32 = PARAM_20 } };
    ArkUI_AttributeItem scrollBarColorItem = { scrollBarColorValue,
        sizeof(scrollBarColorValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_COLOR, &scrollBarColorItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_20);
    NAPI_END;
}

napi_value TestScrollBarColor003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto waterFlow1 = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollBarColorValue[] = { {.u32 = COLOR_RED} };
    ArkUI_AttributeItem scrollBarColorItem = { scrollBarColorValue,
        sizeof(scrollBarColorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_COLOR, &scrollBarColorItem);
    ArkUI_AttributeItem scrollBarColorItem1 = { nullptr, 0 };
    nodeAPI->setAttribute(waterFlow1, NODE_SCROLL_BAR_COLOR, &scrollBarColorItem1);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_BAR_COLOR);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32;
    auto ret2 = nodeAPI->getAttribute(waterFlow1, NODE_SCROLL_BAR_COLOR)->value[PARAM_0].u32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ret2);
    NAPI_END;
}

napi_value TestItemConstraintSize001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue itemConstraintSizeValue[] = { { .f32 = SIZE_30 }, { .f32 = SIZE_30 }, { .f32 = SIZE_30 },
        { .f32 = SIZE_30 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { itemConstraintSizeValue,
        sizeof(itemConstraintSizeValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_0].f32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_1].f32;
    auto ret3 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_2].f32;
    auto ret4 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_3].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SIZE_30);
    ASSERT_EQ(ret2, SIZE_30);
    ASSERT_EQ(ret3, SIZE_30);
    ASSERT_EQ(ret4, SIZE_30);
    NAPI_END;
}

napi_value TestItemConstraintSize002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue itemConstraintSizeValue[] = { { .f32 = PARAM_NEGATIVE_1 }, { .f32 = PARAM_NEGATIVE_1 },
        { .f32 = PARAM_NEGATIVE_1 }, { .f32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { itemConstraintSizeValue,
        sizeof(itemConstraintSizeValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_0].f32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_1].f32;
    auto ret3 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_2].f32;
    auto ret4 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_3].f32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(ret2, PARAM_0);
    ASSERT_EQ(ret3, PARAM_0);
    ASSERT_EQ(ret4, PARAM_0);
    NAPI_END;
}

napi_value TestItemConstraintSize003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue itemConstraintSizeValue[] = { { .f32 = PARAM_NEGATIVE_2 }, { .f32 = PARAM_NEGATIVE_2 },
        { .f32 = PARAM_NEGATIVE_2 }, { .f32 = PARAM_NEGATIVE_2 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { itemConstraintSizeValue,
        sizeof(itemConstraintSizeValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_0].f32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_1].f32;
    auto ret3 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_2].f32;
    auto ret4 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_3].f32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(ret2, PARAM_0);
    ASSERT_EQ(ret3, PARAM_0);
    ASSERT_EQ(ret4, PARAM_0);
    NAPI_END;
}

napi_value TestItemConstraintSize004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue itemConstraintSizeValue[] = { { .f32 = SIZE_30 }, { .f32 = SIZE_30 }, { .f32 = SIZE_30 },
        { .f32 = SIZE_30 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { itemConstraintSizeValue,
        sizeof(itemConstraintSizeValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_0].f32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_1].f32;
    auto ret3 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_2].f32;
    auto ret4 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE)->value[PARAM_3].f32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, SIZE_30);
    ASSERT_EQ(ret2, SIZE_30);
    ASSERT_EQ(ret3, SIZE_30);
    ASSERT_EQ(ret4, SIZE_30);
    NAPI_END;
}

napi_value TestEnableScrollInteraction001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = true } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}

napi_value TestEnableScrollInteraction002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = false } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}

napi_value TestEnableScrollInteraction003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_ENABLE_SCROLL_INTERACTION)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}

napi_value TestEdgeEffect001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue edgeEffectValue[] = { { .i32 = ARKUI_EDGE_EFFECT_SPRING }, { .i32 = PARAM_1 } };
    ArkUI_AttributeItem edgeEffectItem = { edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_EDGE_EFFECT_SPRING);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

napi_value TestEdgeEffect002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue edgeEffectValue[] = { { .i32 = ARKUI_EDGE_EFFECT_FADE }, { .i32 = PARAM_1 } };
    ArkUI_AttributeItem edgeEffectItem = { edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_EDGE_EFFECT_FADE);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

napi_value TestEdgeEffect003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue edgeEffectValue[] = { { .i32 = ARKUI_EDGE_EFFECT_NONE }, { .i32 = PARAM_1 } };
    ArkUI_AttributeItem edgeEffectItem = { edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_EDGE_EFFECT_NONE);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

napi_value TestEdgeEffect004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue edgeEffectValue[] = { { .i32 = PARAM_3 }, { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem edgeEffectItem = { edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, ARKUI_EDGE_EFFECT_NONE);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

napi_value TestEdgeEffect005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue edgeEffectValue[] = { { .i32 = ARKUI_EDGE_EFFECT_SPRING }, { .i32 = PARAM_1 } };
    ArkUI_AttributeItem edgeEffectItem = { edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32;
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32;
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_EDGE_EFFECT_NONE);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

napi_value TestScrollOffset001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_LINEAR }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_200 }, { .f32 = PARAM_0 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_EASE }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_EASE_IN }, { .i32 = false }, { .i32 = false }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_EASE_OUT }, { .i32 = false }, { .i32 = false }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_EASE_IN_OUT }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_FAST_OUT_SLOW_IN }, { .i32 = true }, { .i32 = true }, { .i32 = false } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_LINEAR_OUT_SLOW_IN }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset008(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_FAST_OUT_LINEAR_IN }, { .i32 = true }, { .i32 = true }, { .i32 = false } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset009(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_EXTREME_DECELERATION }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0010(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_SHARP }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0011(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_RHYTHM }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0012(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_SMOOTH }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0013(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_FRICTION }, { .i32 = true }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0014(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_NEGATIVE_1 }, { .f32 = PARAM_NEGATIVE_1 },
        { .i32 = PARAM_NEGATIVE_1 }, { .i32 = PARAM_14 }, { .i32 = PARAM_NEGATIVE_1 }, { .i32 = PARAM_NEGATIVE_1 },
        { .i32 = PARAM_NEGATIVE_1 }, { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0015(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_1000 }, { .f32 = PARAM_1000 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_FRICTION }, { .i32 = PARAM_10 }, { .i32 = PARAM_10 }, { .i32 = PARAM_10 } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_OFFSET);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TestScrollOffset0016(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0017(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_LINEAR } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0018(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_LINEAR }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollOffset0019(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue scrollToValue[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_200 }, { .i32 = PARAM_1000 },
        { .i32 = ARKUI_CURVE_LINEAR }, { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem scrollToItem = { scrollToValue, sizeof(scrollToValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_OFFSET, &scrollToItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollEdge001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = ARKUI_SCROLL_EDGE_TOP } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestScrollEdge002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = ARKUI_SCROLL_EDGE_BOTTOM } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestScrollEdge003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = ARKUI_SCROLL_EDGE_START } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestScrollEdge004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = ARKUI_SCROLL_EDGE_END } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestScrollEdge005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_4 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &enableScrollInteractionItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_EDGE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_NEGATIVE_1);
    NAPI_END;
}

napi_value TestScrollPage001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_0 }, { .i32 = PARAM_1 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_PAGE, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollPage002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_1 }, { .i32 = PARAM_0 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_PAGE, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollPage003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_NEGATIVE_1 }, { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_PAGE, &enableScrollInteractionItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

napi_value TestScrollBy001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_200 }, { .i32 = PARAM_0 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BY, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollBy002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_0 }, { .i32 = PARAM_200 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BY, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollBy003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_200 }, { .i32 = PARAM_200 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BY, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestScrollBy004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue enableScrollInteractionValue[] = { { .i32 = PARAM_NEGATIVE_1 }, { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem enableScrollInteractionItem = { enableScrollInteractionValue,
        sizeof(enableScrollInteractionValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BY, &enableScrollInteractionItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestSectionOption001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, DEFAULT_SECTION);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, DEFAULT_SECTION.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, DEFAULT_SECTION.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, DEFAULT_SECTION.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, DEFAULT_SECTION.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, DEFAULT_SECTION.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, DEFAULT_SECTION.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, DEFAULT_SECTION.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, DEFAULT_SECTION.margin.left);
    NAPI_END;
}

napi_value TestSectionOption002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION1);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION1.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION1.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, PARAM_0);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION1.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION1.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION1.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION1.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION1.margin.left);
    NAPI_END;
}

napi_value TestSectionOption003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION2);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION2.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION2.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION2.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION2.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION2.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION2.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION2.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION2.margin.left);
    NAPI_END;
}

napi_value TestSectionOption004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION3);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION3.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION3.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION3.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION3.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION3.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION3.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION3.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION3.margin.left);
    NAPI_END;
}

napi_value TestSectionOption005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION4);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION4.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION4.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION4.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, PARAM_0);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION4.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION4.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION4.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION4.margin.left);
    NAPI_END;
}

napi_value TestSectionOption006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION5);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION5.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION5.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION5.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION5.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION5.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION5.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION5.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION5.margin.left);
    NAPI_END;
}

napi_value TestSectionOption007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION6);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION6.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION6.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION6.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION6.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION6.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION6.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION6.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION6.margin.left);
    NAPI_END;
}

napi_value TestSectionOption008(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION7);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION7.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION7.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION7.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION7.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION7.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION7.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION7.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION7.margin.left);
    NAPI_END;
}

napi_value TestSectionOption009(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION8);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION8.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION8.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION8.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION8.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION8.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION8.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION8.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION8.margin.left);
    NAPI_END;
}

napi_value TestSectionOption010(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION9);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION9.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION9.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION9.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION9.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION9.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION9.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION9.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION9.margin.left);
    NAPI_END;
}

napi_value TestSectionOption011(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION10);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION10.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION10.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION10.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION10.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION10.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION10.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION10.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION10.margin.left);
    NAPI_END;
}

napi_value TestSectionOption012(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSection(PARAM_0, SECTION6);
    ArkUI_NumberValue sectionOptionValue[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem sectionOptionItem = { sectionOptionValue, PARAM_1, nullptr, options->GetOption() };
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_EDGE, &sectionOptionItem);
    auto ret = nodeAPI->resetAttribute(waterFlow, NODE_SCROLL_EDGE);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(options->GetSection(PARAM_0).itemsCount, SECTION6.itemsCount);
    ASSERT_EQ(options->GetSection(PARAM_0).crossCount, SECTION6.crossCount);
    ASSERT_EQ(options->GetSection(PARAM_0).columnsGap, SECTION6.columnsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).rowsGap, SECTION6.rowsGap);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.bottom, SECTION6.margin.bottom);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.top, SECTION6.margin.top);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.right, SECTION6.margin.right);
    ASSERT_EQ(options->GetSection(PARAM_0).margin.left, SECTION6.margin.left);
    NAPI_END;
}

napi_value TestWaterFlowNodeAdapter001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto input = std::vector<std::shared_ptr<Component>>();
    auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);
    ArkUI_AttributeItem sectionOptionItem = { nullptr, PARAM_0, nullptr, adapter->GetAdapter() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_NODE_ADAPTER, &sectionOptionItem);
    auto ret1 = nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_NODE_ADAPTER);
    auto ret2 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_NODE_ADAPTER);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ((ret2 == &sectionOptionItem), SUCCESS);
    NAPI_END;
}

napi_value TestWaterFlowFooter001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto node = std::make_shared<ColumnComponent>();
    ArkUI_AttributeItem item = { .object = node->GetComponent() };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestWaterFlowScrollFriction001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .f32 = PARAM_0_POINT_6 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_FRICTION, &value_item);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_FRICTION)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0_POINT_6);
    NAPI_END;
}

napi_value TestWaterFlowScrollFriction002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .f32 = PARAM_0_POINT_9 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_SCROLL_FRICTION, &value_item);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_SCROLL_FRICTION)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, PARAM_0_POINT_9);
    NAPI_END;
}
} // namespace ArkUICapiTest