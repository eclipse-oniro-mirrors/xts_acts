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
#define FIRST_MIDDLE_VALUE 0.0
#define SECOND_MIDDLE_VALUE 0.5
#define ANGLE_VALUE 0
#define DEFAULT_ANGLE_VALUE 180

namespace ArkUIAniTest {

static ani_double TestImageLinearGradient001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_TOP;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient006(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient007(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient008(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient009(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_NONE;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient010(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM;
    int32_t repeating = false;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient011(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient012(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_TOP;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient013(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient014(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient015(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient016(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient017(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient018(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient019(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_NONE;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, DEFAULT_ANGLE_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient020(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t colors[] = {SECOND_COLOR_VALUE, SECOND_COLOR_VALUE};
    float stops[] = {FIRST_MIDDLE_VALUE, SECOND_MIDDLE_VALUE};
    float angle = ANGLE_VALUE;
    int32_t direction = ArkUI_LinearGradientDirection::ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM;
    int32_t repeating = true;
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(image, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestImageLinearGradient021(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float angle = DEFAULT_ANGLE_VALUE;
    int32_t repeating = false;
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

} // namespace ArkUIAniTest
