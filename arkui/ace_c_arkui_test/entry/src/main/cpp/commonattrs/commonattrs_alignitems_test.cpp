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

static napi_value TestCommonAttrsAlignItems001(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_VERTICAL_ALIGNMENT_TOP}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_ALIGN_ITEMS)->value[PARAM_0].i32, ARKUI_VERTICAL_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestCommonAttrsAlignItems002(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_VERTICAL_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_ALIGN_ITEMS)->value[PARAM_0].i32, ARKUI_VERTICAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestCommonAttrsAlignItems003(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_VERTICAL_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ROW_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ROW_ALIGN_ITEMS)->value[PARAM_0].i32, ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestCommonAttrsAlignItems004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_HORIZONTAL_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_ALIGN_ITEMS)->value[PARAM_0].i32,
              ARKUI_HORIZONTAL_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestCommonAttrsAlignItems005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_HORIZONTAL_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_ALIGN_ITEMS)->value[PARAM_0].i32,
              ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestCommonAttrsAlignItems006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_HORIZONTAL_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_COLUMN_ALIGN_ITEMS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_COLUMN_ALIGN_ITEMS)->value[PARAM_0].i32,
              ARKUI_HORIZONTAL_ALIGNMENT_END);
    NAPI_END;
}

} // namespace ArkUICapiTest
