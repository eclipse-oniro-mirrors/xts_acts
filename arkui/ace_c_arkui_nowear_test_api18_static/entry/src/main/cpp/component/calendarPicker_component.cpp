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

#include "calendarPicker_component.h"


namespace ArkUICapiTest {

void CalendarPickerComponent::SetCalendarPickerStart(const std::string& StartDate)
{
    ArkUI_AttributeItem start_value_0 = {.string = StartDate.c_str()};
    _nodeAPI->setAttribute(_component, NODE_CALENDAR_PICKER_START, &start_value_0);
}

void CalendarPickerComponent::SetCalendarPickerEnd(const std::string& EndDate)
{
    ArkUI_AttributeItem End_value_0 = {.string = EndDate.c_str()};
    _nodeAPI->setAttribute(_component, NODE_CALENDAR_PICKER_END, &End_value_0);
}

} // ArkUICapiTest