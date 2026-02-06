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

static napi_value TestStackBackgroundBlurStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_THIN},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0.5;
    float grayScaleStart = 0;
    float grayScaleEnd = 50;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_REGULAR},
                                            {.i32 = ARKUI_COLOR_MODE_LIGHT},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_REGULAR);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_LIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_AVERAGE);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 1;
    float grayScaleStart = 0;
    float grayScaleEnd = 127;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_THICK},
                                            {.i32 = ARKUI_COLOR_MODE_DARK},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_THICK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_DARK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_BACKGROUND_THIN},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_BACKGROUND_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_BACKGROUND_REGULAR},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_BACKGROUND_REGULAR);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_BACKGROUND_THICK},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_BACKGROUND_THICK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle008(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_NONE},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle009(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle010(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_COMPONENT_THIN},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_COMPONENT_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle011(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_COMPONENT_REGULAR},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_COMPONENT_REGULAR);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle012(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_COMPONENT_THICK},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_COMPONENT_THICK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle013(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float scale = 0;
    float grayScaleStart = 0;
    float grayScaleEnd = 0;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK},
                                            {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                            {.i32 = ARKUI_ADAPTIVE_COLOR_DEFAULT},
                                            {.f32 = scale},
                                            {.f32 = grayScaleStart},
                                            {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32,
              ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    NAPI_END;
}

static napi_value TestStackBackgroundBlurStyle014(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t blurStyle = -1;
    int32_t colorMode = -1;
    int32_t adaptiveColor = -1;
    float scale = -1;
    float grayScaleStart = -1;
    float grayScaleEnd = 128;

    ArkUI_NumberValue blur_style_value[] = {{.i32 = blurStyle}, {.i32 = colorMode},      {.i32 = adaptiveColor},
                                            {.f32 = scale},     {.f32 = grayScaleStart}, {.f32 = grayScaleEnd}};
    ArkUI_AttributeItem blur_style_item = {blur_style_value, sizeof(blur_style_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_BLUR_STYLE, &blur_style_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_0].i32, blurStyle);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_1].i32, colorMode);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_2].i32, adaptiveColor);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_3].f32, scale);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_4].f32, grayScaleStart);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_BLUR_STYLE)->value[PARAM_5].f32, grayScaleEnd);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
