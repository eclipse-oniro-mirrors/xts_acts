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

#define STR_PATH "./resource://media/icon.png"
#define SIZE 40
#define ABNORMAL_PARAM (-100)

namespace ArkUICapiTest {

static napi_value TestTextInputClearButtonMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CANCELBUTTON_STYLE_INPUT}, {.f32 = SIZE}, {.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_PATH;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
              ARKUI_CANCELBUTTON_STYLE_INPUT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, SIZE);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->string, STR_PATH);
    NAPI_END;
}

static napi_value TestTextInputClearButtonMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CANCELBUTTON_STYLE_INVISIBLE}, {.f32 = SIZE}, {.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_PATH;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
              ARKUI_CANCELBUTTON_STYLE_INVISIBLE);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, SIZE);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->string, STR_PATH);
    NAPI_END;
}

static napi_value TestTextInputClearButtonMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CANCELBUTTON_STYLE_CONSTANT}, {.f32 = SIZE}, {.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_PATH;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
              ARKUI_CANCELBUTTON_STYLE_CONSTANT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, SIZE);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->string, STR_PATH);
    NAPI_END;
}

static napi_value TestTextInputClearButtonMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.i32 = ABNORMAL_PARAM}, {.f32 = SIZE}, {.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = STR_PATH;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32, ABNORMAL_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, SIZE);
    ASSERT_STRNE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->string, STR_PATH);
    NAPI_END;
}
} // namespace ArkUICapiTest
