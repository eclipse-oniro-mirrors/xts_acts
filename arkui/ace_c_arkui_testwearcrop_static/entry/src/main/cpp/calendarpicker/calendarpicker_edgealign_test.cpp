/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUICapiTest {

static ani_int TestCalendarPickerEdgeAlign001(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CALENDAR_ALIGNMENT_START}, {.f32 = -SIZE_50}, {.f32 = SIZE_50}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_CALENDAR_ALIGNMENT_START);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_1].f32, -SIZE_50);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_2].f32, SIZE_50);
    NAPI_END;
}

static ani_int TestCalendarPickerEdgeAlign002(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CALENDAR_ALIGNMENT_CENTER}, {.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_CALENDAR_ALIGNMENT_CENTER);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_2].f32, PARAM_0);
    NAPI_END;
}

static ani_int TestCalendarPickerEdgeAlign003(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CALENDAR_ALIGNMENT_END}, {.f32 = SIZE_50}, {.f32 = -SIZE_500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_CALENDAR_ALIGNMENT_END);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_1].f32, SIZE_50);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_2].f32,
              -SIZE_500);
    NAPI_END;
}

static ani_int TestCalendarPickerEdgeAlign004(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if ((nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT) != nullptr)) {
        ASSERT_NE(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[0].i32,
                  PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static ani_int TestCalendarPickerEdgeAlign005(ani_env* env, ani_object info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CALENDAR_ALIGNMENT_END}, {.f32 = SIZE_500}, {.f32 = SIZE_500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_CALENDAR_ALIGNMENT_END);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_1].f32, SIZE_500);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT)->value[PARAM_2].f32, SIZE_500);
    NAPI_END;
}

} // namespace ArkUICapiTest
