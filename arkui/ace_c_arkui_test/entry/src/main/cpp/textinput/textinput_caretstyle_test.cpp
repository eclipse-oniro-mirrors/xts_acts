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

static napi_value TestTextInputCaretStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float caretStyle = 10;

    ArkUI_NumberValue value[] = {{.f32 = caretStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE)->value[PARAM_0].f32, caretStyle);
    NAPI_END;
}

static napi_value TestTextInputCaretStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float caretStyle = 1;

    ArkUI_NumberValue value[] = {{.f32 = caretStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE)->value[PARAM_0].f32, caretStyle);
    NAPI_END;
}

static napi_value TestTextInputCaretStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float caretStyle = -1;

    ArkUI_NumberValue value[] = {{.f32 = caretStyle}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_STYLE)->value[PARAM_0].f32, caretStyle);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
