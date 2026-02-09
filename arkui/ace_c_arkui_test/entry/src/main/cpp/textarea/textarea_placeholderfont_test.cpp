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

#define COLOR_RED 0xFFFF0000
#define FONT_SIZE 16
#define STR_TEXT "TEXT; TEXT1, TEXT2"
#define ABNORMAL_PARAM (-100)
#define DEFAULT_SIZE 16.0

namespace ArkUICapiTest {

static napi_value TestTextAreaPlaceHolderFont001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {
        {.f32 = FONT_SIZE}, {.i32 = ARKUI_FONT_STYLE_NORMAL}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, FONT_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_NORMAL);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_NORMAL}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_NORMAL);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = FONT_SIZE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont004(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = FONT_SIZE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont005(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, DEFAULT_SIZE);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont006(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W100);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont007(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W200);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont008(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W300);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont009(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W400);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont010(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W500);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont011(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W600);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont012(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W700);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont013(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W800);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont014(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W900);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont015(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_BOLD);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont016(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont017(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_BOLDER);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont018(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_LIGHTER);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont019(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderFont020(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_0}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_1].i32,
              ARKUI_FONT_STYLE_ITALIC);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_REGULAR);
    NAPI_END;
}
} // namespace ArkUICapiTest
