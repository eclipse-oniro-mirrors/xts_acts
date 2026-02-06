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

#define DEFAULT_TEXT_SELECTION "textinput"
#define CARET_OFFSET_0 0
#define CARET_OFFSET_3 3
#define CARET_OFFSET_9 9
namespace ArkUICapiTest {

static napi_value TestTextInputCaretOffset001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item_1 = {};
    value_item_1.string = DEFAULT_TEXT_SELECTION;
    auto ret1 = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item_1);
    ArkUI_NumberValue value[] = { { .i32 = 3 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET)->value[PARAM_0].i32, CARET_OFFSET_3);
    NAPI_END;
}
static napi_value TestTextInputCaretOffset002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item_1 = {};
    value_item_1.string = DEFAULT_TEXT_SELECTION;
    auto ret1 = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item_1);
    ArkUI_NumberValue value[] = { { .i32 = -1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET)->value[PARAM_0].i32, CARET_OFFSET_0);
    NAPI_END;
}
static napi_value TestTextInputCaretOffset003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item_1 = {};
    value_item_1.string = DEFAULT_TEXT_SELECTION;
    auto ret1 = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item_1);
    ArkUI_NumberValue value[] = { { .i32 = 1000 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET)->value[PARAM_0].i32, CARET_OFFSET_9);
    NAPI_END;
}
} // namespace ArkUICapiTest