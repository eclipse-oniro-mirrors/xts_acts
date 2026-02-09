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

static napi_value TestGridCachedCount001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t cachedCount = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = cachedCount}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT)->value[PARAM_0].i32, cachedCount);
    NAPI_END;
}

static napi_value TestGridCachedCount002(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t cachedCount = PARAM_5;
    ArkUI_NumberValue value[] = {{.i32 = cachedCount}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT)->value[PARAM_0].i32, cachedCount);
    NAPI_END;
}

static napi_value TestGridCachedCount003(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t cachedCount = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = cachedCount}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT)->value[PARAM_0].i32, PARAM_1);
    NAPI_END;
}

static napi_value TestGridCachedCount004(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT)->value[PARAM_0].i32, PARAM_1);
    NAPI_END;
}

static napi_value TestGridCachedCount005(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t cachedCount = PARAM_5;
    ArkUI_NumberValue value[] = {{.i32 = cachedCount}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(grid, NODE_GRID_CACHED_COUNT);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_NE(nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT)->value[PARAM_0].i32, cachedCount);
    NAPI_END;
}
} // namespace ArkUICapiTest
