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

#define FIRST_COLOR_VALUE 0xFFFF0000
#define SECOND_COLOR_VALUE 0xFF0000FF
#define FIRST_MIDDLE_VALUE 0.5
#define SECOND_MIDDLE_VALUE 1.0
#define X_VALUE 50.0
#define Y_VALUE 50.0
#define DEFAULT_RADIAL_VALUE 0.0
#define FIRST_RADIAL_VALUE 60.0
#define SECOND_RADIAL_VALUE 80.0

namespace ArkUIAniTest {

static ani_double TestImageRadialGradient001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float radial = DEFAULT_RADIAL_VALUE;
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, radial);
    NAPI_END;
}

static ani_double TestImageRadialGradient002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {FIRST_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float x = X_VALUE;
    float y = Y_VALUE;
    float radial = FIRST_RADIAL_VALUE;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = radial}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, radial);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeating);
    NAPI_END;
}

static ani_double TestImageRadialGradient003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {FIRST_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float x = X_VALUE;
    float y = Y_VALUE;
    float radial = SECOND_RADIAL_VALUE;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = radial}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, radial);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeating);
    NAPI_END;
}

static ani_double TestImageRadialGradient004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {FIRST_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float x = X_VALUE;
    float y = Y_VALUE;
    float radial = FIRST_RADIAL_VALUE;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = radial}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, radial);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeating);
    NAPI_END;
}

static ani_double TestImageRadialGradient005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {FIRST_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float x = X_VALUE;
    float y = Y_VALUE;
    float radial = SECOND_RADIAL_VALUE;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = radial}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, radial);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeating);
    NAPI_END;
}

} // namespace ArkUIAniTest
