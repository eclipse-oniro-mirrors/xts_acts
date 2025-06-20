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

#define ENUM_ABNORMAL_VALUE 500

static napi_value TestCommonAttrsDirection001(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    int32_t direction = ARKUI_DIRECTION_LTR;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static napi_value TestCommonAttrsDirection002(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    int32_t direction = ARKUI_DIRECTION_RTL;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static napi_value TestCommonAttrsDirection003(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    int32_t direction = ARKUI_DIRECTION_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static napi_value TestCommonAttrsDirection004(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    int32_t direction = ARKUI_DIRECTION_AUTO;
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static napi_value TestCommonAttrsDirection005(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    int32_t direction = ENUM_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(row, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

} // namespace ArkUICapiTest
