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

static napi_value TestSpanFontWeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W100);
    NAPI_END;
}

static napi_value TestSpanFontWeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W200);
    NAPI_END;
}

static napi_value TestSpanFontWeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W300);
    NAPI_END;
}

static napi_value TestSpanFontWeight004(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W400);
    NAPI_END;
}

static napi_value TestSpanFontWeight005(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W500);
    NAPI_END;
}

static napi_value TestSpanFontWeight006(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W600);
    NAPI_END;
}

static napi_value TestSpanFontWeight007(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W700);
    NAPI_END;
}

static napi_value TestSpanFontWeight008(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W800);
    NAPI_END;
}

static napi_value TestSpanFontWeight009(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W900);
    NAPI_END;
}

static napi_value TestSpanFontWeight010(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLD);
    NAPI_END;
}

static napi_value TestSpanFontWeight011(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestSpanFontWeight012(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLDER);
    NAPI_END;
}

static napi_value TestSpanFontWeight013(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_LIGHTER);
    NAPI_END;
}

static napi_value TestSpanFontWeight014(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

static napi_value TestSpanFontWeight015(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_REGULAR);
    NAPI_END;
}

static napi_value TestSpanFontWeight016(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    int32_t fontWeight = -1;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_FONT_WEIGHT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
