/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestGridColumnsGap001(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestGridColumnsGap002(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP)->value[PARAM_0].f32, PARAM_10);
    NAPI_END;
}

static ani_double TestGridColumnsGap003(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestGridColumnsGap004(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(grid, NODE_GRID_COLUMN_GAP);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_NE(nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP)->value[PARAM_0].f32, PARAM_10);
    NAPI_END;
}
}