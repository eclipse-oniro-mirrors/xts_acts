/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import calendarPickerDialogBackgroundBlurStyleTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundBlurStyle.test'
import calendarPickerDialogBackgroundColorTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundColor.test'
import calendarPickerDialogBackgroundShadowTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundShadow.test'
import calendarPickerDialogStartEndTest from './calendarPickerDialogTest/calendarPickerDialogStartEndTest.test'
import dialogDisableDateRangeAndMarkTodayTest from './calendarPickerDialogTest/dialogDisableDateRangeAndMarkToday.test'
import CalendarPickerDialogExitsTest from './calendarPickerDialogTest/CalendarPickerDialogExits.test'
import CalendarPickerDialogWindowPropertiesTest from './calendarPickerDialogTest/CalendarPickerDialogWindowProperties.test'
import CalendarDialogCallbackTest from './calendarPickerDialogTest/CalendarDialogCallback.test'
import CalendarPickerDialogTest from './calendarPickerDialogTest/CalendarPickerDialog.test'
import CalendarPickerDialogButtonStyleTest from './calendarPickerDialogTest/CalendarPickerDialogButtonStyle.test'
import calendarPickerDialogBackgroundEffectTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundEffect.test'
import calendarPickerDialogBlurStyleOptionsTest from './calendarPickerDialogTest/calendarPickerDialogBlurStyleOptions.test'

export default function testsuite() {
  calendarPickerDialogBackgroundBlurStyleTest();
  calendarPickerDialogBackgroundColorTest();
  calendarPickerDialogBackgroundShadowTest();
  calendarPickerDialogStartEndTest();
  dialogDisableDateRangeAndMarkTodayTest();
  CalendarPickerDialogExitsTest();
  CalendarPickerDialogWindowPropertiesTest();
  CalendarDialogCallbackTest();
  CalendarPickerDialogTest();
  CalendarPickerDialogButtonStyleTest();
  calendarPickerDialogBackgroundEffectTest();
  calendarPickerDialogBlurStyleOptionsTest();
}