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

static napi_value TestCommonAttrsTransitionMove001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = ARKUI_TRANSITION_EDGE_TOP;
    int32_t duration = PARAM_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, parameterType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_2].i32, curveType);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = ARKUI_TRANSITION_EDGE_BOTTOM;
    int32_t duration = PARAM_0;
    int32_t curveType = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = ARKUI_TRANSITION_EDGE_START;
    int32_t duration = PARAM_2000;
    int32_t curveType = PARAM_13;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = ARKUI_TRANSITION_EDGE_END;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, parameterType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_MOVE_TRANSITION)->value[PARAM_2].i32, curveType);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = PARAM_NEGATIVE_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = PARAM_4;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionMove007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t parameterType = ARKUI_TRANSITION_EDGE_END;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    ArkUI_NumberValue value[] = {{.i32 = parameterType}, {.i32 = duration}, {.i32 = curveType}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_MOVE_TRANSITION, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_MOVE_TRANSITION);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest
