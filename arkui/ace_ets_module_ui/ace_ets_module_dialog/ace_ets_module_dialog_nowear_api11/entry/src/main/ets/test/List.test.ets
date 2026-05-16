/**
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
import CalendarPickerDialog from './calendarPickerDialogTest/CalendarPickerDialog.test'
import DatePickerDialog from './datePickerDialogTest/DatePickerDialog.test'
import TextPickerDialog from './textPickerDialogTest/TextPickerDialog.test'
import TimePickerDialog from './timePickerDialogTest/TimePickerDialog.test'
import calendarJsunit from './calendarPickerDialogTest/CalendarJsunit.test';
import textPickerJsunit from './textPickerDialogTest/TextPickerJsunit.test';
import CalendarDialogAJsunit from './Dialog/CalendarDialogJsunit.test.ets';
import DatePickerDialogAJsunit from './Dialog/DatePickerDialogJsunit.test.ets';
import TextPickerDialogAJsunit from './Dialog/TextPickerDialogJsunit.test.ets';
import TimePickerDialogAJsunit from './Dialog/TimePickerDialogJsunit.test.ets';
import DatePickerDialogJsunit from './datePickerDialogTest/DatePickerDialogJsunit.test.ets';
import TextPickerDialogJsunit from './textPickerDialogTest/TextPickerDialogJsunit.test.ets';
import TimePickerDialogJsunit from './timePickerDialogTest/TimePickerDialogJsunit.test.ets';

export default function testsuite() {
  CalendarPickerDialog();
  DatePickerDialog();
  TextPickerDialog();
  TimePickerDialog();
  calendarJsunit()
  textPickerJsunit()
  CalendarDialogAJsunit();
  DatePickerDialogAJsunit();
  TextPickerDialogAJsunit();
  TimePickerDialogAJsunit();
  DatePickerDialogJsunit();
  TextPickerDialogJsunit();
  TimePickerDialogJsunit();
}