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
#define PARAM_2024 2024
#define PARAM_1990 1990
#define PARAM_2030 2030
#define PARAM_35 35

namespace ArkUICapiTest {

static napi_value TestCalendarPickerSelectedDate001(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = PARAM_2024}, {.u32 = PARAM_3}, {.u32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_0].i32,
              PARAM_2024);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_1].i32, PARAM_3);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_2].i32, PARAM_5);
    NAPI_END;
}

static napi_value TestCalendarPickerSelectedDate002(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = PARAM_2030}, {.u32 = PARAM_3}, {.u32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_0].i32,
              PARAM_2030);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_1].i32, PARAM_3);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE)->value[PARAM_2].i32, PARAM_5);
    NAPI_END;
}

static napi_value TestCalendarPickerSelectedDate003(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = PARAM_2024}, {.u32 = PARAM_13}, {.u32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCalendarPickerSelectedDate004(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = PARAM_2024}, {.u32 = PARAM_3}, {.u32 = PARAM_35}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCalendarPickerSelectedDate005(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = PARAM_1990}, {.u32 = PARAM_3}, {.u32 = PARAM_5}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE, &value_item);
    auto ret = nodeAPI->resetAttribute(calendarPicker, NODE_CALENDAR_PICKER_SELECTED_DATE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest