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

static napi_value TestTextInputFontSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float fontSize = 0.0;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    NAPI_END;
}

static napi_value TestTextInputFontSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float fontSize = 10.0;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    NAPI_END;
}

static napi_value TestTextInputFontSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float fontSize = 12.5;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    NAPI_END;
}

static napi_value TestTextInputFontSize004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float fontSize = -1.0;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_FONT_SIZE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
