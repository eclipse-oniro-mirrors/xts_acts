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

static napi_value TestSpanTextBackgroundStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue backgroundStyle[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_10}};
    ArkUI_AttributeItem backgroundStyleItem = {backgroundStyle, sizeof(backgroundStyle) / sizeof(ArkUI_NumberValue)};

    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &backgroundStyleItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_1].f32, PARAM_10);

    NAPI_END;
}

static napi_value TestSpanTextBackgroundStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue backgroundStyle[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_50_POINT_5}, {.f32 = PARAM_50_POINT_5},
        {.f32 = PARAM_50_POINT_5}, {.f32 = PARAM_50_POINT_5}};
    ArkUI_AttributeItem backgroundStyleItem = {backgroundStyle, sizeof(backgroundStyle) / sizeof(ArkUI_NumberValue)};

    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &backgroundStyleItem);
    ASSERT_EQ(ret, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_1].f32, PARAM_50_POINT_5);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_2].f32, PARAM_50_POINT_5);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_3].f32, PARAM_50_POINT_5);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_4].f32, PARAM_50_POINT_5);

    NAPI_END;
}

static napi_value TestSpanTextBackgroundStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static napi_value TestSpanTextBackgroundStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue backgroundStyle[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_NEGATIVE_10}};
    ArkUI_AttributeItem backgroundStyleItem = {backgroundStyle, sizeof(backgroundStyle) / sizeof(ArkUI_NumberValue)};

    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &backgroundStyleItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_0].u32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_1].f32, PARAM_0);

    NAPI_END;
}

static napi_value TestSpanTextBackgroundStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue backgroundStyle[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_NEGATIVE_10}, {.f32 = PARAM_10},
        {.f32 = PARAM_10}, {.f32 = PARAM_10}};
    ArkUI_AttributeItem backgroundStyleItem = {backgroundStyle, sizeof(backgroundStyle) / sizeof(ArkUI_NumberValue)};

    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &backgroundStyleItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_0].u32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_3].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_4].f32, PARAM_0);

    NAPI_END;
}

static napi_value TestSpanTextBackgroundStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue backgroundStyle[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_10}, {.f32 = PARAM_10}, {.f32 = PARAM_10},
        {.f32 = PARAM_10}};
    ArkUI_AttributeItem backgroundStyleItem = {backgroundStyle, sizeof(backgroundStyle) / sizeof(ArkUI_NumberValue)};

    auto ret = nodeAPI->setAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE, &backgroundStyleItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_0].u32, COLOR_ILLEGAL);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_3].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_SPAN_TEXT_BACKGROUND_STYLE)->value[PARAM_4].f32, PARAM_0);

    NAPI_END;
}
} // namespace ArkUICapiTest
