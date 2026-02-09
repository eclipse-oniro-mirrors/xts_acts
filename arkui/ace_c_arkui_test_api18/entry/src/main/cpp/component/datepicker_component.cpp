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

#include "datepicker_component.h"


namespace ArkUICapiTest {

void DatePickerComponent::SetDatePickerMode(int32_t mode)
{
    ArkUI_NumberValue mode_value_0[] = {{.i32 = mode}};
    ArkUI_AttributeItem mode_value_item_0 = {mode_value_0, 1};
    _nodeAPI->setAttribute(_component, NODE_DATE_PICKER_MODE, &mode_value_item_0);
}

void DatePickerComponent::SetDatePickerSelected(const std::string& selectedTime)
{
    ArkUI_AttributeItem selected_value_0 = {.string = selectedTime.c_str()};
    _nodeAPI->setAttribute(_component, NODE_DATE_PICKER_SELECTED, &selected_value_0);
}

void DatePickerComponent::SetDatePickerStart(const std::string& startTime)
{
    ArkUI_AttributeItem start_value_item_0 = {.string = startTime.c_str()};
    _nodeAPI->setAttribute(_component, NODE_DATE_PICKER_START, &start_value_item_0);
}

void DatePickerComponent::SetDatePickerEnd(const std::string& endTime)
{
    ArkUI_AttributeItem end_value_item_0 = {.string = endTime.c_str()};
    _nodeAPI->setAttribute(_component, NODE_DATE_PICKER_END, &end_value_item_0);
}

} // ArkUICapiTest