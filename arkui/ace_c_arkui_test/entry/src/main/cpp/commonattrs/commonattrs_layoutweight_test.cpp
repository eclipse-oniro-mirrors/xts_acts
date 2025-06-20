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

static napi_value TestCommonAttrsLayoutWeight001(napi_env env, napi_callback_info info)
{
    uint32_t layoutWeight = PARAM_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.u32 = layoutWeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_LAYOUT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_LAYOUT_WEIGHT)->value[PARAM_0].u32, layoutWeight);
    NAPI_END;
}

static napi_value TestCommonAttrsLayoutWeight002(napi_env env, napi_callback_info info)
{
    uint32_t layoutWeight = PARAM_0;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.u32 = layoutWeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_LAYOUT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_LAYOUT_WEIGHT)->value[PARAM_0].u32, layoutWeight);
    NAPI_END;
}

static napi_value TestCommonAttrsLayoutWeight003(napi_env env, napi_callback_info info)
{
    uint32_t layoutWeight = PARAM_2;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.u32 = layoutWeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_LAYOUT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_LAYOUT_WEIGHT)->value[PARAM_0].u32, layoutWeight);
    NAPI_END;
}

static napi_value TestCommonAttrsLayoutWeight004(napi_env env, napi_callback_info info)
{
    uint32_t layoutWeight = PARAM_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.u32 = layoutWeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_LAYOUT_WEIGHT, &value_item);
    auto ret = nodeAPI->resetAttribute(column, NODE_LAYOUT_WEIGHT);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_LAYOUT_WEIGHT)->value[PARAM_0].u32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest