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

static napi_value TestCommonAttrsBackgroundBlurStyle001(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_THIN;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle002(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_REGULAR;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle003(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_THICK;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle004(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle005(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_REGULAR;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle006(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THICK;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle007(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle008(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_NONE;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle009(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle010(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_COMPONENT_THIN;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle011(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_COMPONENT_REGULAR;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle012(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_COMPONENT_THICK;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle013(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle014(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_SYSTEM;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_DEFAULT;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle015(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_LIGHT;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_DEFAULT;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle016(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_DARK;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_DEFAULT;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle017(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_SYSTEM;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_AVERAGE;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle018(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_LIGHT;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_AVERAGE;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle019(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    int32_t colorMode = ARKUI_COLOR_MODE_DARK;
    int32_t adaptiveColor = ARKUI_ADAPTIVE_COLOR_AVERAGE;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {.i32 = colorMode}, {.i32 = adaptiveColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle020(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float blurDegree = PARAM_NEGATIVE_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {.f32 = blurDegree}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle021(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float blurDegree = PARAM_0;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {.f32 = blurDegree}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, blurDegree);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle022(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float blurDegree = PARAM_0_POINT_5;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {.f32 = blurDegree}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, blurDegree);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle023(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float blurDegree = PARAM_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {.f32 = blurDegree}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, blurDegree);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle024(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float blurDegree = PARAM_2;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {.f32 = blurDegree}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle025(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_0;
    float endboundary = PARAM_127;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, startboundary);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, endboundary);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle026(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_0;
    float endboundary = PARAM_64;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, startboundary);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, endboundary);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle027(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_64;
    float endboundary = PARAM_0;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle028(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_64;
    float endboundary = PARAM_127;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, startboundary);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, endboundary);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle029(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_NEGATIVE_1;
    float endboundary = PARAM_127;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle030(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_127;
    float endboundary = PARAM_NEGATIVE_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle031(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_NEGATIVE_1;
    float endboundary = PARAM_NEGATIVE_1;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle032(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_0;
    float endboundary = PARAM_150;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundBlurStyle033(napi_env env, napi_callback_info info)
{
    int32_t blurStyle = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    float startboundary = PARAM_64;
    float endboundary = PARAM_127;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = blurStyle}, {}, {}, {}, {.f32 = startboundary}, {.f32 = endboundary}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_BLUR_STYLE, &item);
    auto ret = nodeAPI->resetAttribute(column, NODE_BACKGROUND_BLUR_STYLE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest
