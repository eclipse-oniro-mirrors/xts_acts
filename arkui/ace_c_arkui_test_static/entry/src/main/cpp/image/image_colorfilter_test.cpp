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

#define DEFAULT_VALUE (0.0)
#define FIRST_MIDDLE_VALUE (1.0)
#define SECOND_MIDDLE_VALUE (255.0)

namespace ArkUIAniTest {

static ani_double TestImageColorFilter001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float colorFilter[PARAM_20] = {FIRST_MIDDLE_VALUE, DEFAULT_VALUE, DEFAULT_VALUE,      DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, FIRST_MIDDLE_VALUE, DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, DEFAULT_VALUE,      DEFAULT_VALUE,
                                   FIRST_MIDDLE_VALUE, DEFAULT_VALUE, DEFAULT_VALUE,      DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, FIRST_MIDDLE_VALUE, DEFAULT_VALUE};

    ArkUI_NumberValue value[PARAM_20] = {
        {.f32 = colorFilter[PARAM_0]},  {.f32 = colorFilter[PARAM_1]},  {.f32 = colorFilter[PARAM_2]},
        {.f32 = colorFilter[PARAM_3]},  {.f32 = colorFilter[PARAM_4]},  {.f32 = colorFilter[PARAM_5]},
        {.f32 = colorFilter[PARAM_6]},  {.f32 = colorFilter[PARAM_7]},  {.f32 = colorFilter[PARAM_8]},
        {.f32 = colorFilter[PARAM_9]},  {.f32 = colorFilter[PARAM_10]}, {.f32 = colorFilter[PARAM_11]},
        {.f32 = colorFilter[PARAM_12]}, {.f32 = colorFilter[PARAM_13]}, {.f32 = colorFilter[PARAM_14]},
        {.f32 = colorFilter[PARAM_15]}, {.f32 = colorFilter[PARAM_16]}, {.f32 = colorFilter[PARAM_17]},
        {.f32 = colorFilter[PARAM_18]}, {.f32 = colorFilter[PARAM_19]}};

    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COLOR_FILTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_0].f32, colorFilter[PARAM_0]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_1].f32, colorFilter[PARAM_1]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_2].f32, colorFilter[PARAM_2]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_3].f32, colorFilter[PARAM_3]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_4].f32, colorFilter[PARAM_4]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_5].f32, colorFilter[PARAM_5]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_6].f32, colorFilter[PARAM_6]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_7].f32, colorFilter[PARAM_7]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_8].f32, colorFilter[PARAM_8]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_9].f32, colorFilter[PARAM_9]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_10].f32, colorFilter[PARAM_10]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_11].f32, colorFilter[PARAM_11]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_12].f32, colorFilter[PARAM_12]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_13].f32, colorFilter[PARAM_13]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_14].f32, colorFilter[PARAM_14]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_15].f32, colorFilter[PARAM_15]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_16].f32, colorFilter[PARAM_16]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_17].f32, colorFilter[PARAM_17]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_18].f32, colorFilter[PARAM_18]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_19].f32, colorFilter[PARAM_19]);
    NAPI_END;
}

static ani_double TestImageColorFilter002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float colorFilter[PARAM_20] = {FIRST_MIDDLE_VALUE, DEFAULT_VALUE, DEFAULT_VALUE,      DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, DEFAULT_VALUE,      FIRST_MIDDLE_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, DEFAULT_VALUE,      DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, FIRST_MIDDLE_VALUE, DEFAULT_VALUE,
                                   DEFAULT_VALUE,      DEFAULT_VALUE, DEFAULT_VALUE,      SECOND_MIDDLE_VALUE};

    ArkUI_NumberValue value[PARAM_20] = {
        {.f32 = colorFilter[PARAM_0]},  {.f32 = colorFilter[PARAM_1]},  {.f32 = colorFilter[PARAM_2]},
        {.f32 = colorFilter[PARAM_3]},  {.f32 = colorFilter[PARAM_4]},  {.f32 = colorFilter[PARAM_5]},
        {.f32 = colorFilter[PARAM_6]},  {.f32 = colorFilter[PARAM_7]},  {.f32 = colorFilter[PARAM_8]},
        {.f32 = colorFilter[PARAM_9]},  {.f32 = colorFilter[PARAM_10]}, {.f32 = colorFilter[PARAM_11]},
        {.f32 = colorFilter[PARAM_12]}, {.f32 = colorFilter[PARAM_13]}, {.f32 = colorFilter[PARAM_14]},
        {.f32 = colorFilter[PARAM_15]}, {.f32 = colorFilter[PARAM_16]}, {.f32 = colorFilter[PARAM_17]},
        {.f32 = colorFilter[PARAM_18]}, {.f32 = colorFilter[PARAM_19]}};

    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COLOR_FILTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_0].f32, colorFilter[PARAM_0]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_1].f32, colorFilter[PARAM_1]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_2].f32, colorFilter[PARAM_2]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_3].f32, colorFilter[PARAM_3]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_4].f32, colorFilter[PARAM_4]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_5].f32, colorFilter[PARAM_5]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_6].f32, colorFilter[PARAM_6]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_7].f32, colorFilter[PARAM_7]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_8].f32, colorFilter[PARAM_8]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_9].f32, colorFilter[PARAM_9]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_10].f32, colorFilter[PARAM_10]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_11].f32, colorFilter[PARAM_11]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_12].f32, colorFilter[PARAM_12]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_13].f32, colorFilter[PARAM_13]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_14].f32, colorFilter[PARAM_14]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_15].f32, colorFilter[PARAM_15]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_16].f32, colorFilter[PARAM_16]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_17].f32, colorFilter[PARAM_17]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_18].f32, colorFilter[PARAM_18]);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_COLOR_FILTER)->value[PARAM_19].f32, colorFilter[PARAM_19]);
    NAPI_END;
}

} // namespace ArkUIAniTest
