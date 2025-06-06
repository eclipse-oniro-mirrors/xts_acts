/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"

namespace ArkUICapiTest {

#define GRAY_SCALE_MAX 127
#define FOREGROUND_BLUR_STYLE_LEVEL_NORMAL 0.5

static napi_value TestCustomComponentForegroundBlurStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle007(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle008(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_NONE;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle009(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle010(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle011(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle012(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle013(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle014(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle015(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_COLOR_MODE_SYSTEM;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle016(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_COLOR_MODE_LIGHT;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle017(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_COLOR_MODE_DARK;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle018(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle019(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_ADAPTIVE_COLOR_DEFAULT;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle020(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = ARKUI_ADAPTIVE_COLOR_AVERAGE;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle021(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle022(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_NEGATIVE_1;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle023(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_0;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle024(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_20;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle025(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = GRAY_SCALE_MAX;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle026(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = SIZE_200;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle027(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_NEGATIVE_1;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle028(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_0;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle029(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_20;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle030(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = GRAY_SCALE_MAX;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle031(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = SIZE_200;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static napi_value TestCustomComponentForegroundBlurStyle032(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float value = PARAM_20;
    float level = FOREGROUND_BLUR_STYLE_LEVEL_NORMAL;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN},
                                  {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                  {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE},
                                  {.f32 = level},
                                  {.f32 = value},
                                  {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_AVERAGE);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_3].f32, level);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

} // namespace ArkUICapiTest