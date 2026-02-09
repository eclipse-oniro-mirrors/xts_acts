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
#define TEXT_MAX_LINES_1 4
#define TEXT_MAX_LINES_2 (-1)
#define TEXT_MAX_LINES_3 1000
#define TEXT_MAX_LINES_DEFAULT 3
namespace ArkUICapiTest {

static napi_value TestTextAreaMaxLines001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);

    ArkUI_AttributeItem value_item = {};
    value_item.string = "hello";
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &value_item);

    ArkUI_NumberValue valueMaxLine[] = { { .i32 = TEXT_MAX_LINES_1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, TEXT_MAX_LINES_1);
    NAPI_END;
}
static napi_value TestTextAreaMaxLines002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textArea, NODE_TEXT_INPUT_STYLE, &value_item);
    ArkUI_NumberValue valueMaxLine[] = { { .i32 = TEXT_MAX_LINES_2 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, TEXT_MAX_LINES_DEFAULT);
    NAPI_END;
}
static napi_value TestTextAreaMaxLines003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue valueMaxLine[] = { { .i32 = TEXT_MAX_LINES_3 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, TEXT_MAX_LINES_DEFAULT);
    NAPI_END;
}
static napi_value TestTextAreaMaxLines004(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue valueMaxLine[] = { { .i32 = TEXT_MAX_LINES_1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->resetAttribute(textArea, NODE_TEXT_MAX_LINES);
    auto tmp = nodeAPI->getAttribute(textArea, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextAreaMaxLines004 ", "PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, TEXT_MAX_LINES_DEFAULT);
    NAPI_END;
}
} // namespace ArkUICapiTest