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

static napi_value TestTextFontWeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextFontWeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W100);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W200);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W300);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W400);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W500);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W600);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W700);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W800);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_W900);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLD);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_BOLDER);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_LIGHTER);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_MEDIUM);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, ARKUI_FONT_WEIGHT_REGULAR);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontWeight016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exceptionValue = -10;
    ArkUI_NumberValue value[] = {{.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_WEIGHT, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_FONT_WEIGHT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_FONT_WEIGHT)->value[PARAM_0].i32, exceptionValue);
    };

    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
