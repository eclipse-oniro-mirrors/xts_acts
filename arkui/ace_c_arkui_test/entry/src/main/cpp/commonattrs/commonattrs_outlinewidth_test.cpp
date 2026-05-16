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

static napi_value TestCommonAttrsOutlineWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float left = PARAM_5;
    float top = PARAM_10;
    float right = PARAM_5;
    float bottom = PARAM_20;
    ArkUI_NumberValue value[] = {{.f32 = left}, {.f32 = top}, {.f32 = right}, {.f32 = bottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OUTLINE_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_0].f32, left);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_1].f32, top);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_2].f32, right);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_3].f32, bottom);
    NAPI_END;
}

static napi_value TestCommonAttrsOutlineWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float left = PARAM_0;
    float top = PARAM_0;
    float right = PARAM_0;
    float bottom = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = left}, {.f32 = top}, {.f32 = right}, {.f32 = bottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OUTLINE_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_0].f32, left);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_1].f32, top);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_2].f32, right);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_3].f32, bottom);
    NAPI_END;
}

static napi_value TestCommonAttrsOutlineWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float left = PARAM_NEGATIVE_1;
    float top = PARAM_NEGATIVE_1;
    float right = PARAM_NEGATIVE_1;
    float bottom = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = left}, {.f32 = top}, {.f32 = right}, {.f32 = bottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OUTLINE_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_0].f32, left);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_1].f32, top);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_2].f32, right);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OUTLINE_WIDTH)->value[PARAM_3].f32, bottom);
    NAPI_END;
}

} // namespace ArkUICapiTest
