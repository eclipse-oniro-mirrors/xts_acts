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

static napi_value TestTextInputTextAlign001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t textAlign = ArkUI_TextAlignment::ARKUI_TEXT_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = textAlign}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_ALIGN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN)->value[PARAM_0].i32, textAlign);
    NAPI_END;
}

static napi_value TestTextInputTextAlign002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t textAlign = ArkUI_TextAlignment::ARKUI_TEXT_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = textAlign}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_ALIGN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN)->value[PARAM_0].i32, textAlign);
    NAPI_END;
}
static napi_value TestTextInputTextAlign003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t textAlign = ArkUI_TextAlignment::ARKUI_TEXT_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = textAlign}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_ALIGN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN)->value[PARAM_0].i32, textAlign);
    NAPI_END;
}
static napi_value TestTextInputTextAlign004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t textAlign = ArkUI_TextAlignment::ARKUI_TEXT_ALIGNMENT_JUSTIFY;
    ArkUI_NumberValue value[] = {{.i32 = textAlign}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_ALIGN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN)->value[PARAM_0].i32, ARKUI_TEXT_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestTextInputTextAlign005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t textAlign = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.i32 = textAlign}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_ALIGN, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_ALIGN)->value[PARAM_0].i32, textAlign);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
