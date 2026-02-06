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

#define GRID_ROW_TEMPLATE "1fr 1fr 1fr 1fr 1fr"
namespace ArkUIAniTest {

static ani_double TestGridRowsTemplate001(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = GRID_ROW_TEMPLATE;
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE)->string, GRID_ROW_TEMPLATE);
    NAPI_END;
}

static ani_double TestGridRowsTemplate002(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestGridRowsTemplate003(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = GRID_ROW_TEMPLATE;
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_STRNE(nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE)->string, GRID_ROW_TEMPLATE);
    NAPI_END;
}
}