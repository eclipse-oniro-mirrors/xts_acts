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
import TextPickerDialog from './TextPickerDialogTest/TextPickerDialog.test.ets';
import DatePickerDialog from './DatePickerDialogTest/DatePickerDialog.test.ets';
import TimePickerDialog from './TimePickerDialogTest/TimePickerDialog.test.ets';
import CalendarPickerDialog from './CalendarPickerDialogTest/CalendarPickerDialog.test.ets';
import CalendarDialogCallback from './CalendarPickerDialogTest/CalendarDialogCallback.test.ets';
import DatePickerDialogCallback from './DatePickerDialogTest/DatePickerDialogCallback.test.ets';
import TextPickerDialogCallback from './TextPickerDialogTest/TextPickerDialogCallback.test.ets';
import TimePickerDialogCallback from './TimePickerDialogTest/TimePickerDialogCallback.test.ets';
import TimePickerDialog_Accept_Test from './TimePickerDialogTest/ButtonStyleTest/TimePickerDialog_Accept_Test.test.ets';
import TimePickerDialog_Cancel_Test from './TimePickerDialogTest/ButtonStyleTest/TimePickerDialog_Cancel_Test.test.ets';
import TextPickerDialog_Accept_Test from './TextPickerDialogTest/ButtonStyleTest/TextPickerDialog_Accept_Test.test.ets';
import TextPickerDialog_Cancel_Test from './TextPickerDialogTest/ButtonStyleTest/TextPickerDialog_Cancel_Test.test.ets';
import ButtonStyle from './CalendarPickerDialogTest/ButtonStyle.test';
import DateButtonStyle from './DatePickerDialogTest/DateButtonStyle.test';
import PopupOptionsTest from './PopupTest/PopupApiTest/PopupApiTest.test';
import DismissReasonTest from './PopupTest/DismissReason.test';
import DateTimeOptions from './TimePickerDialogTest/DateTimeOptions.test';

export default function testsuite() {
  TextPickerDialog();
  DatePickerDialog();
  TimePickerDialog();
  CalendarPickerDialog();
  CalendarDialogCallback();
  DatePickerDialogCallback();
  TextPickerDialogCallback();
  TimePickerDialogCallback();
  TimePickerDialog_Accept_Test();
  TimePickerDialog_Cancel_Test();
  TextPickerDialog_Accept_Test();
  TextPickerDialog_Cancel_Test();
  PopupOptionsTest()
  ButtonStyle();
  DateButtonStyle();
  DismissReasonTest();
  DateTimeOptions();
}