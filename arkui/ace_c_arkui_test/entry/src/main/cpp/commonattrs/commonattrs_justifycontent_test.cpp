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

static napi_value TestCommonAttrsJustifyContent001(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32, ARKUI_FLEX_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent002(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32, ARKUI_FLEX_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent003(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32, ARKUI_FLEX_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent004(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent005(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_AROUND);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent006(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent009(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32, ARKUI_FLEX_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent010(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent011(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_AROUND);
    NAPI_END;
}

static napi_value TestCommonAttrsJustifyContent012(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT)->value[PARAM_0].i32,
              ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY);
    NAPI_END;
}
} // namespace ArkUICapiTest