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
#define NUMBER_OF_LINES_DEFAULT 3
#define NUMBER_OF_LINES_0 0
namespace ArkUICapiTest {

static napi_value TestTextInputNumberOfLines001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue styleValue[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem typeItem = { styleValue, sizeof(styleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_STYLE, &typeItem);
    ArkUI_NumberValue lineValue[] = { { .i32 = 3 } };
    ArkUI_AttributeItem lineItem = { lineValue, sizeof(lineValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES, &lineItem);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32;
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32, NUMBER_OF_LINES_DEFAULT);
    NAPI_END;
}
static napi_value TestTextInputNumberOfLines002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue styleValue[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem typeItem = { styleValue, sizeof(styleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_STYLE, &typeItem);
    ArkUI_NumberValue lineValue[] = { { .i32 = -1 } };
    ArkUI_AttributeItem lineItem = { lineValue, sizeof(lineValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES, &lineItem);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32,
        PARAM_NEGATIVE_1);
    NAPI_END;
}
static napi_value TestTextInputNumberOfLines003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue styleValue[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem typeItem = { styleValue, sizeof(styleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_STYLE, &typeItem);
    ArkUI_NumberValue lineValue[] = { { .i32 = 0 } };
    ArkUI_AttributeItem lineItem = { lineValue, sizeof(lineValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES, &lineItem);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32, NUMBER_OF_LINES_0);
    NAPI_END;
}
static napi_value TestTextInputNumberOfLines004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue styleValue[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem typeItem = { styleValue, sizeof(styleValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_STYLE, &typeItem);
    ArkUI_NumberValue lineValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem lineItem = { lineValue, sizeof(lineValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES, &lineItem);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->resetAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputNumberOfLines004 ", "PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_NUMBER_OF_LINES)->value[PARAM_0].i32, PARAM_NEGATIVE_1);
    NAPI_END;
}
} // namespace ArkUICapiTest