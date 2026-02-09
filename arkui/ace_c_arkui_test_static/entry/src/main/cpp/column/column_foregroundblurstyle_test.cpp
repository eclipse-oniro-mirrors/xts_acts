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

#define GRAY_SCALE_MAX 127
#define FOREGROUND_BLUR_STYLE_LEVEL_NORMAL 0.5

static ani_double TestColumnForegroundBlurStyle001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_BACKGROUND_ULTRA_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle008(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_NONE;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle009(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle010(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_THIN;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle011(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_REGULAR;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle012(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle013(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle014(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle015(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_COLOR_MODE_SYSTEM;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle016(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_COLOR_MODE_LIGHT;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle017(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_COLOR_MODE_DARK;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle018(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle019(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_ADAPTIVE_COLOR_DEFAULT;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle020(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = ARKUI_ADAPTIVE_COLOR_AVERAGE;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle021(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t value = PARAM_NEGATIVE_100;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {.i32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle022(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_NEGATIVE_1;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle023(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_0;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle024(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_20;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle025(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = GRAY_SCALE_MAX;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle026(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = SIZE_200;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle027(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_NEGATIVE_1;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle028(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_0;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle029(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_20;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle030(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = GRAY_SCALE_MAX;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle031(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = SIZE_200;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN}, {}, {}, {}, {}, {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

static ani_double TestColumnForegroundBlurStyle032(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float value = PARAM_20;
    float level = FOREGROUND_BLUR_STYLE_LEVEL_NORMAL;
    ArkUI_NumberValue values[] = {{.i32 = ARKUI_BLUR_STYLE_THIN},
                                  {.i32 = ARKUI_COLOR_MODE_SYSTEM},
                                  {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE},
                                  {.f32 = level},
                                  {.f32 = value},
                                  {.f32 = value}};
    ArkUI_AttributeItem item = {values, sizeof(values) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_FOREGROUND_BLUR_STYLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_0].i32, ARKUI_BLUR_STYLE_THIN);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_1].i32, ARKUI_COLOR_MODE_SYSTEM);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_2].i32,
              ARKUI_ADAPTIVE_COLOR_AVERAGE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_3].f32, level);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_4].f32, value);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_FOREGROUND_BLUR_STYLE)->value[PARAM_5].f32, value);
    NAPI_END;
}

} // namespace ArkUIAniTest