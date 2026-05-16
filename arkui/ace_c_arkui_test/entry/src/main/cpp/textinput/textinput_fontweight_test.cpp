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

static napi_value TestTextInputFontWeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W100;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W200;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W300;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W400;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W500;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W600;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight007(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W700;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight008(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W800;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight009(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_W900;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight010(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_BOLD;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight011(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_NORMAL;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight012(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_BOLDER;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight013(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_LIGHTER;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight014(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_MEDIUM;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight015(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = ArkUI_FontWeight::ARKUI_FONT_WEIGHT_REGULAR;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    NAPI_END;
}

static napi_value TestTextInputFontWeight016(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontWeight = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.i32 = fontWeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_WEIGHT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_FONT_WEIGHT)->value[PARAM_0].i32, fontWeight);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
