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
namespace ArkUICapiTest {

static napi_value TestTextAreaContentType001(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_USER_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType002(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PASSWORD } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType003(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_NEW_PASSWORD } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType004(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_STREET_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType005(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_HOUSE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType006(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_DISTRICT_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType007(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_CITY_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType008(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PROVINCE_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType009(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_COUNTRY_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType010(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FULL_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType011(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_LAST_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType012(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PERSON_FIRST_NAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType013(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType014(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_PHONE_COUNTRY_CODE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType015(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FULL_PHONE_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType016(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_EMAIL_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType017(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_BANK_CARD_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType018(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_ID_CARD_NUMBER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType019(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_NICKNAME } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType020(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_DETAIL_INFO_WITHOUT_STREET } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType021(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FORMAT_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType022(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = 21 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType023(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = -1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestTextAreaContentType024(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_FORMAT_ADDRESS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ret = nodeAPI->resetAttribute(textarea, NODE_TEXT_INPUT_CONTENT_TYPE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextAreaContentType024 ", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest