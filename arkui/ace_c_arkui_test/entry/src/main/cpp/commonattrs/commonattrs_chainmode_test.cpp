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


#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestCommonAttrsChainMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_VERTICAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_SPREAD;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_0].i32, axis);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_1].i32, chainStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_VERTICAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_SPREAD_INSIDE;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_0].i32, axis);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_1].i32, chainStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_VERTICAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_PACKED;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_0].i32, axis);
    ASSERT_EQ(nodeAPI->getAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE)->value[PARAM_1].i32, chainStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_HORIZONTAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_SPREAD;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_HORIZONTAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_SPREAD_INSIDE;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_HORIZONTAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_PACKED;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = PARAM_2;
    int32_t chainStyle = PARAM_3;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsChainMode008(napi_env env, napi_callback_info info)
{
    NAPI_START(container, ARKUI_NODE_RELATIVE_CONTAINER);
    int32_t axis = ARKUI_AXIS_VERTICAL;
    int32_t chainStyle = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_SPREAD;
    ArkUI_NumberValue value[] = {{.i32 = axis}, {.i32 = chainStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &value_item);
    auto ret = nodeAPI->resetAttribute(container, NODE_RELATIVE_LAYOUT_CHAIN_MODE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
