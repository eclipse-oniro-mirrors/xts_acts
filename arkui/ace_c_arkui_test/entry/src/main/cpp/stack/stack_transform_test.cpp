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

#define PARAM_05 0.5
#define PARAM_NEGATIVE_05 (-0.5)
#define PARAM_NEGATIVE_1 (-1)
#define PARAM_NEGATIVE_2 (-2)
#define PARAM_NEGATIVE_3 (-3)

static napi_value TestStackTransform001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue transform_value[] = {{.f32 = PARAM_1},  {.f32 = PARAM_05}, {.f32 = PARAM_05}, {.f32 = PARAM_05},
                                           {.f32 = PARAM_05}, {.f32 = PARAM_1},  {.f32 = PARAM_05}, {.f32 = PARAM_05},
                                           {.f32 = PARAM_05}, {.f32 = PARAM_05}, {.f32 = PARAM_1},  {.f32 = PARAM_05},
                                           {.f32 = PARAM_05}, {.f32 = PARAM_05}, {.f32 = PARAM_05}, {.f32 = PARAM_1}};
    ArkUI_AttributeItem transform_item = {transform_value, sizeof(transform_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSFORM, &transform_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_0].f32, PARAM_1);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_1].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_2].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_3].f32, PARAM_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_4].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_5].f32, PARAM_1);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_6].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_7].f32, PARAM_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_8].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_9].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_10].f32, PARAM_1);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_11].f32, PARAM_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_12].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_13].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_14].f32, PARAM_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_15].f32, PARAM_1);
    NAPI_END;
}

static napi_value TestStackTransform002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue transform_value[] = {
        {.f32 = PARAM_NEGATIVE_1},  {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05},
        {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_2},  {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05},
        {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_3},  {.f32 = PARAM_NEGATIVE_05},
        {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_05}, {.f32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem transform_item = {transform_value, sizeof(transform_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSFORM, &transform_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_0].f32, PARAM_NEGATIVE_1);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_1].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_2].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_3].f32, PARAM_NEGATIVE_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_4].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_5].f32, PARAM_NEGATIVE_2);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_6].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_7].f32, PARAM_NEGATIVE_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_8].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_9].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_10].f32, PARAM_NEGATIVE_3);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_11].f32, PARAM_NEGATIVE_05);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_12].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_13].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_14].f32, PARAM_NEGATIVE_05);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSFORM)->value[PARAM_15].f32, PARAM_NEGATIVE_1);
    NAPI_END;
}

} // namespace ArkUICapiTest
