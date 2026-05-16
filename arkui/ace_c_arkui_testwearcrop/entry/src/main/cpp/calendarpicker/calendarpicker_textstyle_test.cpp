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

static napi_value TestCalendarPickerTextStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W100);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W200}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W200);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W300);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W400);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W500);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W600);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle007(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W700);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle008(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W800);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle009(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_W900);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle010(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_BOLD);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle011(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle012(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_BOLDER);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle013(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_LIGHTER);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle014(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle015(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = SIZE_30}, {.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32, SIZE_30);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
              ARKUI_FONT_WEIGHT_REGULAR);
    NAPI_END;
}

static napi_value TestCalendarPickerTextStyle016(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.f32 = PARAM_NEGATIVE_1}, {.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_1].f32,
                  PARAM_NEGATIVE_1);
        ASSERT_NE(nodeAPI->getAttribute(calendarPicker, NODE_CALENDAR_PICKER_TEXT_STYLE)->value[PARAM_2].i32,
                  PARAM_NEGATIVE_1);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
