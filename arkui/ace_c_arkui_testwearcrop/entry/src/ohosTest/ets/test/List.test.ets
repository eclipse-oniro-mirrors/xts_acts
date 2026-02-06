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
import calendarPickerOnChangeTest from './calendarpicker/CalendarPickerOnChangeTest.test'
import calendarPickerEdgeAlignTest from './calendarpicker/CalendarPickerEdgeAlignTest.test'
import calendarPickerTextStyleTest from './calendarpicker/CalendarPickerTextStyleTest.test'
import calendarPickerWidthTest from './calendarpicker/CalendarPickerWidthTest.test'
import calendarPickerEnabledTest from './calendarpicker/CalendarPickerEnabledTest.test'
import calendarPickerHintRadiusTest from './calendarpicker/CalendarPickerHintRadiusTest.test'
import textAreaOnPasteTest from './textarea/TextAreaOnPasteTest.test'
import textInputOnCutTest from './textinput/TextInputOnCutTest.test'
import textInputOnPasteTest from './textinput/TextInputOnPasteTest.test'
import calendarPickerSelectedDateTest from './calendarpicker/CalendarPickerSelectedDateTest.test'
import textInputMethodTest from './textinput/TextInputMethodTest.test'

export default function testsuite() {
  textInputMethodTest()
  calendarPickerOnChangeTest()
  calendarPickerEdgeAlignTest()
  calendarPickerTextStyleTest()
  calendarPickerWidthTest()
  calendarPickerEnabledTest()
  calendarPickerHintRadiusTest()
  calendarPickerSelectedDateTest()
  textAreaOnPasteTest()
  textInputOnCutTest()
  textInputOnPasteTest()
}
