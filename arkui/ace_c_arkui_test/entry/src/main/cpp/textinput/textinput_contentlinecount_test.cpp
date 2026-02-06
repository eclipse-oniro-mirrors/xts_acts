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

#define DEFAULT_TEXT_1 "textinput"
#define DEFAULT_TEXT_2 "textinput textinput \n textinput textinput textinput textinput textinput"
#define DEFAULT_TEXT_3 ""
#define CONTENT_LINE_COUNT_0 0

namespace ArkUICapiTest {

static napi_value TestTextInputContentLineCount001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_1;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount001 ",
        "TestTextInputContentLineCount001 ret = %{public}d", ret);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount001 ",
        " TestTextInputContentLineCount001 PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32, CONTENT_LINE_COUNT_0);
    NAPI_END;
}
static napi_value TestTextInputContentLineCount002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_2;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount002 ",
        "TestTextInputContentLineCount002 ret = %{public}d", ret);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount002 ",
        " TestTextInputContentLineCount002 PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32, CONTENT_LINE_COUNT_0);
    NAPI_END;
}
static napi_value TestTextInputContentLineCount003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_3;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount003 ",
        "TestTextInputContentLineCount003 ret = %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputContentLineCount003 ",
        " TestTextInputContentLineCount003 PARAM_0 = %{public}d",
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_LINE_COUNT)->value[PARAM_0].i32, CONTENT_LINE_COUNT_0);
    NAPI_END;
}
} // namespace ArkUICapiTest