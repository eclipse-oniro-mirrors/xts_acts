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

static ani_double TestScrollLinearGradient001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT;
    int32_t repeating = true;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM;
    int32_t repeating = true;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient005(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient006(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient007(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient008(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient009(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_NONE;
    int32_t repeating = false;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.0, 0.5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static ani_double TestScrollLinearGradient010(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(scroll, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(scroll, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUIAniTest
