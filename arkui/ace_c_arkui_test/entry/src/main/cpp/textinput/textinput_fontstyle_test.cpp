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

static napi_value TestTextInputFontStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontStyle = ArkUI_FontStyle::ARKUI_FONT_STYLE_NORMAL;
    ArkUI_NumberValue value[] = {{.i32 = fontStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_STYLE)->value[PARAM_0].i32, fontStyle);
    NAPI_END;
}

static napi_value TestTextInputFontStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontStyle = ArkUI_FontStyle::ARKUI_FONT_STYLE_ITALIC;
    ArkUI_NumberValue value[] = {{.i32 = fontStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_STYLE)->value[PARAM_0].i32, fontStyle);
    NAPI_END;
}

static napi_value TestTextInputFontStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t fontStyle = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.i32 = fontStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_STYLE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_FONT_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_FONT_STYLE)->value[PARAM_0].i32, fontStyle);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
