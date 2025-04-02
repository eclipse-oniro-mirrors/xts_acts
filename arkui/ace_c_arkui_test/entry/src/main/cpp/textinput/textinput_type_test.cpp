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

static napi_value TestTextInputType001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32, ARKUI_TEXTINPUT_TYPE_NORMAL);
    NAPI_END;
}

static napi_value TestTextInputType002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_NUMBER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32, ARKUI_TEXTINPUT_TYPE_NUMBER);
    NAPI_END;
}

static napi_value TestTextInputType003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_PHONE_NUMBER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_PHONE_NUMBER);
    NAPI_END;
}

static napi_value TestTextInputType004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_EMAIL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32, ARKUI_TEXTINPUT_TYPE_EMAIL);
    NAPI_END;
}

static napi_value TestTextInputType005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_PASSWORD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_PASSWORD);
    NAPI_END;
}

static napi_value TestTextInputType006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_NUMBER_PASSWORD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_NUMBER_PASSWORD);
    NAPI_END;
}

static napi_value TestTextInputType007(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_SCREEN_LOCK_PASSWORD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_SCREEN_LOCK_PASSWORD);
    NAPI_END;
}

static napi_value TestTextInputType008(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_USER_NAME}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_USER_NAME);
    NAPI_END;
}

static napi_value TestTextInputType009(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_NEW_PASSWORD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_NEW_PASSWORD);
    NAPI_END;
}

static napi_value TestTextInputType010(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXTINPUT_TYPE_NUMBER_DECIMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32,
              ARKUI_TEXTINPUT_TYPE_NUMBER_DECIMAL);
    NAPI_END;
}

static napi_value TestTextInputType011(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TYPE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TYPE)->value[PARAM_0].i32, PARAM_NEGATIVE_100);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
