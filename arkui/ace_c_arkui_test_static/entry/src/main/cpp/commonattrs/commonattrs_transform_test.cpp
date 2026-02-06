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

#define MATRIX4_0 (0.00)
#define MATRIX4_1 (1.00)
#define MATRIX4_2 (2.00)

static ani_double TestCommonAttrsTransform001(ani_env* env, ani_object info)
{
    NAPI_START(transform, ARKUI_NODE_CHECKBOX);
    int rate = 45;
    float largeValue = 20.00;
    float matrix400 = MATRIX4_2;
    float matrix401 = MATRIX4_0;
    float matrix402 = MATRIX4_0;
    float matrix403 = MATRIX4_0;
    float matrix410 = MATRIX4_0;
    float matrix411 = MATRIX4_2;
    float matrix412 = MATRIX4_0;
    float matrix413 = MATRIX4_0;
    float matrix420 = MATRIX4_0;
    float matrix421 = MATRIX4_0;
    float matrix422 = MATRIX4_2;
    float matrix423 = MATRIX4_0;
    float matrix430 = MATRIX4_0;
    float matrix431 = MATRIX4_0;
    float matrix432 = MATRIX4_0;
    float matrix433 = MATRIX4_1;

    ArkUI_NumberValue value[] = {{.f32 = matrix400}, {.f32 = matrix401}, {.f32 = matrix402}, {.f32 = matrix403},
                                 {.f32 = matrix410}, {.f32 = matrix411}, {.f32 = matrix412}, {.f32 = matrix413},
                                 {.f32 = matrix420}, {.f32 = matrix421}, {.f32 = matrix422}, {.f32 = matrix423},
                                 {.f32 = matrix430}, {.f32 = matrix431}, {.f32 = matrix432}, {.f32 = matrix433}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(transform, NODE_TRANSFORM, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_0].f32, matrix400);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_1].f32, matrix401);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_2].f32, matrix402);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_3].f32, matrix403);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_4].f32, matrix410);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_5].f32, matrix411);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_6].f32, matrix412);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_7].f32, matrix413);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_8].f32, matrix420);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_9].f32, matrix421);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_10].f32, matrix422);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_11].f32, matrix423);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_12].f32, matrix430);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_13].f32, matrix431);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_14].f32, matrix432);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_15].f32, matrix433);

    matrix400 = static_cast<float>(cos(rate));
    matrix401 = static_cast<float>(-sin(rate));
    matrix402 = MATRIX4_0;
    matrix403 = MATRIX4_0;
    matrix410 = static_cast<float>(sin(rate));
    matrix411 = static_cast<float>(cos(rate));
    matrix412 = MATRIX4_0;
    matrix413 = MATRIX4_0;
    matrix420 = MATRIX4_0;
    matrix421 = MATRIX4_0;
    matrix422 = MATRIX4_1;
    matrix423 = MATRIX4_0;
    matrix430 = MATRIX4_0;
    matrix431 = MATRIX4_0;
    matrix432 = MATRIX4_0;
    matrix433 = MATRIX4_1;

    ArkUI_NumberValue value_second[] = {{.f32 = matrix400}, {.f32 = matrix401}, {.f32 = matrix402}, {.f32 = matrix403},
                                        {.f32 = matrix410}, {.f32 = matrix411}, {.f32 = matrix412}, {.f32 = matrix413},
                                        {.f32 = matrix420}, {.f32 = matrix421}, {.f32 = matrix422}, {.f32 = matrix423},
                                        {.f32 = matrix430}, {.f32 = matrix431}, {.f32 = matrix432}, {.f32 = matrix433}};
    ArkUI_AttributeItem value_second_item = {value_second, sizeof(value_second) / sizeof(ArkUI_NumberValue)};
    ret = nodeAPI->setAttribute(transform, NODE_TRANSFORM, &value_second_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_0].f32, matrix400);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_1].f32, matrix401);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_2].f32, matrix402);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_3].f32, matrix403);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_4].f32, matrix410);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_5].f32, matrix411);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_6].f32, matrix412);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_7].f32, matrix413);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_8].f32, matrix420);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_9].f32, matrix421);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_10].f32, matrix422);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_11].f32, matrix423);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_12].f32, matrix430);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_13].f32, matrix431);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_14].f32, matrix432);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_15].f32, matrix433);

    matrix400 = MATRIX4_1;
    matrix401 = MATRIX4_0;
    matrix402 = MATRIX4_0;
    matrix403 = MATRIX4_0;
    matrix410 = MATRIX4_0;
    matrix411 = MATRIX4_1;
    matrix412 = MATRIX4_0;
    matrix413 = MATRIX4_0;
    matrix420 = MATRIX4_0;
    matrix421 = MATRIX4_0;
    matrix422 = MATRIX4_1;
    matrix423 = MATRIX4_0;
    matrix430 = largeValue;
    matrix431 = MATRIX4_0;
    matrix432 = MATRIX4_0;
    matrix433 = MATRIX4_1;

    ArkUI_NumberValue value_third[] = {{.f32 = matrix400}, {.f32 = matrix401}, {.f32 = matrix402}, {.f32 = matrix403},
                                       {.f32 = matrix410}, {.f32 = matrix411}, {.f32 = matrix412}, {.f32 = matrix413},
                                       {.f32 = matrix420}, {.f32 = matrix421}, {.f32 = matrix422}, {.f32 = matrix423},
                                       {.f32 = matrix430}, {.f32 = matrix431}, {.f32 = matrix432}, {.f32 = matrix433}};
    ArkUI_AttributeItem value_third_item = {value_third, sizeof(value_third) / sizeof(ArkUI_NumberValue)};
    ret = nodeAPI->setAttribute(transform, NODE_TRANSFORM, &value_third_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_0].f32, matrix400);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_1].f32, matrix401);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_2].f32, matrix402);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_3].f32, matrix403);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_4].f32, matrix410);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_5].f32, matrix411);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_6].f32, matrix412);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_7].f32, matrix413);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_8].f32, matrix420);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_9].f32, matrix421);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_10].f32, matrix422);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_11].f32, matrix423);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_12].f32, matrix430);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_13].f32, matrix431);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_14].f32, matrix432);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_15].f32, matrix433);
    NAPI_END;
}

static ani_double TestCommonAttrsTransform002(ani_env* env, ani_object info)
{
    NAPI_START(transform, ARKUI_NODE_CHECKBOX);
    float matrix400 = MATRIX4_0;
    float matrix401 = MATRIX4_0;
    float matrix402 = MATRIX4_0;
    float matrix403 = MATRIX4_0;
    float matrix410 = MATRIX4_0;
    float matrix411 = MATRIX4_0;
    float matrix412 = MATRIX4_0;
    float matrix413 = MATRIX4_0;
    float matrix420 = MATRIX4_0;
    float matrix421 = MATRIX4_0;
    float matrix422 = MATRIX4_0;
    float matrix423 = MATRIX4_0;
    float matrix430 = MATRIX4_0;
    float matrix431 = MATRIX4_0;
    float matrix432 = MATRIX4_0;
    float matrix433 = MATRIX4_0;

    ArkUI_NumberValue value[] = {{.f32 = matrix400}, {.f32 = matrix401}, {.f32 = matrix402}, {.f32 = matrix403},
                                 {.f32 = matrix410}, {.f32 = matrix411}, {.f32 = matrix412}, {.f32 = matrix413},
                                 {.f32 = matrix420}, {.f32 = matrix421}, {.f32 = matrix422}, {.f32 = matrix423},
                                 {.f32 = matrix430}, {.f32 = matrix431}, {.f32 = matrix432}, {.f32 = matrix433}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(transform, NODE_TRANSFORM, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_0].f32, matrix400);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_5].f32, matrix411);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_10].f32, matrix422);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_15].f32, matrix433);
    NAPI_END;
}

static ani_double TestCommonAttrsTransform003(ani_env* env, ani_object info)
{
    NAPI_START(transform, ARKUI_NODE_CHECKBOX);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(transform, NODE_TRANSFORM, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransform004(ani_env* env, ani_object info)
{
    NAPI_START(transform, ARKUI_NODE_CHECKBOX);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_0].f32, 1);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_1].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_2].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_3].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_4].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_5].f32, 1);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_6].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_7].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_8].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_9].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_10].f32, 1);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_11].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_12].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_13].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_14].f32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(transform, NODE_TRANSFORM)->value[PARAM_15].f32, 1);
    NAPI_END;
}
} // namespace ArkUIAniTest
