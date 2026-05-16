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
#define MAX_LINES 1
namespace ArkUICapiTest {

static napi_value TestTextInputMaxLines001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMaxLine[] = { { .i32 = 1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, MAX_LINES);
    NAPI_END;
}
static napi_value TestTextInputMaxLines002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMaxLine[] = { { .i32 = -1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, MAX_LINES);
    NAPI_END;
}
static napi_value TestTextInputMaxLines003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue valueMaxLine[] = { { .i32 = 1 } };
    ArkUI_AttributeItem maxLineItem = { valueMaxLine, sizeof(valueMaxLine) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_MAX_LINES, &maxLineItem);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->resetAttribute(textInput, NODE_TEXT_MAX_LINES);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputMaxLines003 ", "PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_MAX_LINES)->value[PARAM_0].i32, MAX_LINES);
    NAPI_END;
}
} // namespace ArkUICapiTest