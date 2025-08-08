/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestDatePickerTextStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;normal;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;normal;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "abnormal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string, "abnormal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;bold;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;bold;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;bolder;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;bolder;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;lighter;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;lighter;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;medium;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;medium;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle007(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;regular;Arial,HarmonyOS Sans;normal";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;regular;Arial,HarmonyOS Sans;normal");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle008(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;bold;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;bold;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle009(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;normal;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;normal;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle010(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;bolder;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;bolder;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle011(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;lighter;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;lighter;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle012(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;medium;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;medium;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}

static napi_value TestDatePickerTextStyle013(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "#FF182431;14;regular;Arial,HarmonyOS Sans;italic";
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_TEXT_STYLE)->string,
                 "#FF182431;14;regular;Arial,HarmonyOS Sans;italic");
    NAPI_END;
}
} // namespace ArkUICapiTest
