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
#define CONTENT_TYPE_21 21
#define CONTENT_TYPE_23 23
#define CONTENT_TYPE_24 24
#define CONTENT_TYPE_25 25
namespace ArkUICapiTest {

static napi_value TestTextInputContentType001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_USER_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_USER_NAME);
    NAPI_END;
}
static napi_value TestTextInputContentType002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PASSWORD } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PASSWORD);
    NAPI_END;
}
static napi_value TestTextInputContentType003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_NEW_PASSWORD } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_NEW_PASSWORD);
    NAPI_END;
}
static napi_value TestTextInputContentType004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_STREET_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_STREET_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_HOUSE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_HOUSE_NUMBER);
    NAPI_END;
}
static napi_value TestTextInputContentType006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_DISTRICT_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_DISTRICT_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType007(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_CITY_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_CITY_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType008(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PROVINCE_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PROVINCE_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType009(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_COUNTRY_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_COUNTRY_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType010(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FULL_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FULL_NAME);
    NAPI_END;
}
static napi_value TestTextInputContentType011(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_LAST_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_LAST_NAME);
    NAPI_END;
}
static napi_value TestTextInputContentType012(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FIRST_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FIRST_NAME);
    NAPI_END;
}
static napi_value TestTextInputContentType013(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_NUMBER);
    NAPI_END;
}
static napi_value TestTextInputContentType014(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_COUNTRY_CODE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_COUNTRY_CODE);
    NAPI_END;
}
static napi_value TestTextInputContentType015(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_PHONE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_PHONE_NUMBER);
    NAPI_END;
}
static napi_value TestTextInputContentType016(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_EMAIL_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_EMAIL_ADDRESS);
    NAPI_END;
}
static napi_value TestTextInputContentType017(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_BANK_CARD_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_BANK_CARD_NUMBER);
    NAPI_END;
}
static napi_value TestTextInputContentType018(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ID_CARD_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32,
        ARKUI_TEXTINPUT_CONTENT_TYPE_ID_CARD_NUMBER);
    NAPI_END;
}
static napi_value TestTextInputContentType019(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_NICKNAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32, CONTENT_TYPE_23);
    NAPI_END;
}
static napi_value TestTextInputContentType020(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_DETAIL_INFO_WITHOUT_STREET } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32, CONTENT_TYPE_24);
    NAPI_END;
}
static napi_value TestTextInputContentType021(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FORMAT_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32, CONTENT_TYPE_25);
    NAPI_END;
}
static napi_value TestTextInputContentType022(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = 21 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32, CONTENT_TYPE_21);
    NAPI_END;
}
static napi_value TestTextInputContentType023(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = -1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CONTENT_TYPE)->value[PARAM_0].i32, PARAM_NEGATIVE_1);
    NAPI_END;
}
} // namespace ArkUICapiTest