/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUICapiTest {

static ani_int TestCalendarPickerHintRadius001(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_0;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              hintRadius);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius002(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_1;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              hintRadius);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius003(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_16;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              hintRadius);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius004(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_100;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              hintRadius);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius005(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_NEGATIVE_1;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              PARAM_16);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius006(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_AttributeItem calendarPicker_item = {};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              PARAM_16);
    NAPI_END;
}

static ani_int TestCalendarPickerHintRadius007(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float hintRadius = PARAM_0;

    ArkUI_NumberValue calendarPicker_value[] = {{.f32 = hintRadius}};
    ArkUI_AttributeItem calendarPicker_item = {
        calendarPicker_value,
        sizeof(calendarPicker_value) / sizeof(ArkUI_NumberValue)
    };
    nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS, &calendarPicker_item);
    auto ret = nodeAPI->resetAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_HINT_RADIUS)->value[PARAM_0].f32,
              PARAM_16);
    NAPI_END;
}

} // namespace ArkUICapiTest