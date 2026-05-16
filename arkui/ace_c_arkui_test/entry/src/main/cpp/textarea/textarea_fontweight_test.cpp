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
#define ABNROMAL_PARAM (-100)

namespace ArkUICapiTest {

static napi_value TestTextAreaFontWeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W100);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W200);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W300);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight004(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W400);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight005(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W500);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight006(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W600);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight007(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W700);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight008(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W800);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight009(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W900);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight010(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLD);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight011(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight012(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLDER);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight013(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_LIGHTER);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight014(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight015(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_REGULAR);
    NAPI_END;
}

static napi_value TestTextAreaFontWeight016(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ABNROMAL_PARAM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_WEIGHT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textArea, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ABNROMAL_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
