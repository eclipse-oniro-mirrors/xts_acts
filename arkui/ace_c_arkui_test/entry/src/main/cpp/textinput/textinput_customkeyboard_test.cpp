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

static napi_value TestTextInputCustomKeyboard001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = true } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.object = textInput;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD)->value[PARAM_0].i32, true);
    NAPI_END;
}
static napi_value TestTextInputCustomKeyboard002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = false } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.object = textInput;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD)->value[PARAM_0].i32;

    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD)->value[PARAM_0].i32, false);
    NAPI_END;
}
static napi_value TestTextInputCustomKeyboard003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD)->value[PARAM_0].i32, false);
    NAPI_END;
}
} // namespace ArkUICapiTest