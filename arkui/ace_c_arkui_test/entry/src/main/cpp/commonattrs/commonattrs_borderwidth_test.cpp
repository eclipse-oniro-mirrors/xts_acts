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

static napi_value TestCommonAttrsBorderWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_5);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_5}, {.f32 = PARAM_5}, {.f32 = PARAM_5}, {.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_5);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_1].f32, PARAM_5);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_2].f32, PARAM_5);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_3].f32, PARAM_5);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_NEGATIVE_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_NEGATIVE_10);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderWidth004(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_NEGATIVE_10}, {.f32 = PARAM_NEGATIVE_10}, {.f32 = PARAM_NEGATIVE_10}, {.f32 = PARAM_NEGATIVE_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_NEGATIVE_10);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_1].f32, PARAM_NEGATIVE_10);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_2].f32, PARAM_NEGATIVE_10);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_BORDER_WIDTH)->value[PARAM_3].f32, PARAM_NEGATIVE_10);
    NAPI_END;
}

} // namespace ArkUICapiTest
