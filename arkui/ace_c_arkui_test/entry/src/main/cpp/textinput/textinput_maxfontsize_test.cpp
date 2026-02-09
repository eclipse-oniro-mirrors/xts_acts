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
#define MAX_FONT_SIZE_20 20
#define MAX_FONT_SIZE_1000 1000
namespace ArkUICapiTest {

static napi_value TestTextInputMaxFontSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMin[] = { { .f32 = 4 } };
    ArkUI_AttributeItem minItem = { valueMin, sizeof(valueMin) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MIN_FONT_SIZE, &minItem);
    ASSERT_EQ(ret, SUCCESS);

    ArkUI_NumberValue valueMax[] = { { .f32 = 20 } };
    ArkUI_AttributeItem maxItem = { valueMax, sizeof(valueMax) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE, &maxItem);

    ArkUI_NumberValue valueFont[] = { { .f32 = 21 } };
    ArkUI_AttributeItem fontItem = { valueFont, sizeof(valueFont) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &fontItem);
    
    ArkUI_NumberValue valueMaxLine[] = { { .i32 = 1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE)->value[PARAM_0].f32, MAX_FONT_SIZE_20);
    NAPI_END;
}
static napi_value TestTextInputMaxFontSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMin[] = { { .f32 = 6 } };
    ArkUI_AttributeItem minItem = { valueMin, sizeof(valueMin) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MIN_FONT_SIZE, &minItem);
    ASSERT_EQ(ret, SUCCESS);

    ArkUI_NumberValue valueMax[] = { { .f32 = -1 } };
    ArkUI_AttributeItem maxItem = { valueMax, sizeof(valueMax) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE, &maxItem);

    ArkUI_NumberValue valueMaxLine[] = { { .i32 = 1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE)->value[PARAM_0].f32, PARAM_NEGATIVE_1);
    NAPI_END;
}
static napi_value TestTextInputMaxFontSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMax[] = { { .f32 = 1000 } };
    ArkUI_AttributeItem maxItem = { valueMax, sizeof(valueMax) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE, &maxItem);
    ASSERT_EQ(ret, SUCCESS);

    ArkUI_NumberValue valueMaxLine[] = { { .i32 = 1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_FONT_SIZE)->value[PARAM_0].f32, MAX_FONT_SIZE_1000);
    NAPI_END;
}
} // namespace ArkUICapiTest