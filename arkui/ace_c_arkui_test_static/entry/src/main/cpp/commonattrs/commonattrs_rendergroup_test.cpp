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

static ani_double TestCommonAttrsRenderGroup001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderGroup = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = renderGroup}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_GROUP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderGroup002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderGroup = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = renderGroup}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_GROUP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_GROUP)->value[PARAM_0].i32, renderGroup);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderGroup003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderGroup = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = renderGroup}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_RENDER_GROUP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_GROUP)->value[PARAM_0].i32, renderGroup);
    NAPI_END;
}

static ani_double TestCommonAttrsRenderGroup004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t renderGroup = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = renderGroup}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_RENDER_GROUP, &value_item);
    auto ret = nodeAPI->resetAttribute(column, NODE_RENDER_GROUP);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_RENDER_GROUP)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest
