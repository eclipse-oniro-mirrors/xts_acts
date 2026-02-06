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
#define PARAM_21 21
#define PARAM_22 22
#define PARAM_23 23

static ani_double TestSliderBlockStyle001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32,
              ARKUI_SLIDER_BLOCK_STYLE_DEFAULT);
    NAPI_END;
}

static ani_double TestSliderBlockStyle002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SLIDER_BLOCK_STYLE_DEFAULT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32,
              ARKUI_SLIDER_BLOCK_STYLE_DEFAULT);
    NAPI_END;
}

static ani_double TestSliderBlockStyle003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_IMAGE;
    const char *imageUrl = "./resources/base/media/icon.png";
    ArkUI_NumberValue value[] = {{.i32 = blockStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    ASSERT_STREQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->string, imageUrl);
    NAPI_END;
}

static ani_double TestSliderBlockStyle004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_RECTANGLE;
    float rectangleWidth = PARAM_20;
    float rectangleHeight = PARAM_20;
    float rectangularRoundedWidth = PARAM_5;
    float rectangularRoundedHeight = PARAM_5;

    ArkUI_NumberValue value[] = {{.i32 = blockStyle},
                                 {.i32 = shapeType},
                                 {.f32 = rectangleWidth},
                                 {.f32 = rectangleHeight},
                                 {.f32 = rectangularRoundedWidth},
                                 {.f32 = rectangularRoundedHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_1].i32, shapeType);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, rectangleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, rectangleHeight);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_4].f32, rectangularRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_5].f32, rectangularRoundedHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_CIRCLE;
    float circleWidth = PARAM_21;
    float circleHeight = PARAM_21;

    ArkUI_NumberValue value[] = {{.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = circleWidth}, {.f32 = circleHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_1].i32, shapeType);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, circleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, circleHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle006(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_ELLIPSE;
    float ellipseWidth = PARAM_22;
    float ellipseHeight = PARAM_22;

    ArkUI_NumberValue value[] = {
        {.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = ellipseWidth}, {.f32 = ellipseHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_1].i32, shapeType);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, ellipseWidth);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, ellipseHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle007(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_PATH;
    float pathWidth = PARAM_23;
    float pathHeight = PARAM_23;
    const char *path = "M0 0 H20 V20 H0 Z";

    ArkUI_NumberValue value[] = {{.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = pathWidth}, {.f32 = pathHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_1].i32, shapeType);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, pathWidth);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, pathHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle008(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_IMAGE;
    const char *imageUrl = nullptr;
    ArkUI_NumberValue value[] = {{.i32 = blockStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_0].i32, blockStyle);
    NAPI_END;
}

static ani_double TestSliderBlockStyle009(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_RECTANGLE;
    float rectangleWidth = -PARAM_20;
    float rectangleHeight = -PARAM_20;
    float rectangularRoundedWidth = -PARAM_5;
    float rectangularRoundedHeight = -PARAM_5;

    ArkUI_NumberValue value[] = {{.i32 = blockStyle},
                                 {.i32 = shapeType},
                                 {.f32 = rectangleWidth},
                                 {.f32 = rectangleHeight},
                                 {.f32 = rectangularRoundedWidth},
                                 {.f32 = rectangularRoundedHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, rectangleWidth);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, rectangleHeight);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_4].f32, rectangularRoundedWidth);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_5].f32, rectangularRoundedHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle010(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_CIRCLE;
    float circleWidth = -PARAM_21;
    float circleHeight = -PARAM_21;

    ArkUI_NumberValue value[] = {{.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = circleWidth}, {.f32 = circleHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, circleWidth);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, circleHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle011(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_ELLIPSE;
    float ellipseWidth = -PARAM_22;
    float ellipseHeight = -PARAM_22;

    ArkUI_NumberValue value[] = {
        {.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = ellipseWidth}, {.f32 = ellipseHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, ellipseWidth);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, ellipseHeight);
    NAPI_END;
}

static ani_double TestSliderBlockStyle012(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t blockStyle = ARKUI_SLIDER_BLOCK_STYLE_SHAPE;
    int32_t shapeType = ARKUI_SHAPE_TYPE_PATH;
    float pathWidth = -PARAM_23;
    float pathHeight = -PARAM_23;

    ArkUI_NumberValue value[] = {{.i32 = blockStyle}, {.i32 = shapeType}, {.f32 = pathWidth}, {.f32 = pathHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_2].f32, pathWidth);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_STYLE)->value[PARAM_3].f32, pathHeight);
    NAPI_END;
}
} // namespace ArkUIAniTest
