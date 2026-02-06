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

import DatePickerCanLoopTest from './datePickerTest/datePickerCanLoop.test';
import datePickerMode from './datePickerTest/DatePickerMode.test';
import EnableHapticFeedbackTest from './datePickerTest/datePickerEnableHapticFeedback.test';
import EnableHapticFeedbackModifierTest from './datePickerTest/datePickerEnableHapticFeedbackModifier.test';
import datePickerOnChangeModifierTest from './datePickerTest/datePickerOnChangeModifier.test';
import datePickerTextStyleTest from './datePickerTest/DatePickerTextStyle.test';
import datePickerLunarJsunit from './datePickerTest/datePicker3.test';
import datePickerJsunit from './datePickerTest/DatePickerJsunit.test';
import datePickerUIJsunit from './datePickerTest/datePickerUIJsunit.test';
import datePickerPropertiesModifierTest from './datePickerTest/datePickerPropertiesModifier.test';

export default function testsuite() {
  DatePickerCanLoopTest();
  datePickerMode();
  EnableHapticFeedbackTest();
  EnableHapticFeedbackModifierTest();
  datePickerOnChangeModifierTest();
  datePickerTextStyleTest();
  datePickerLunarJsunit();
  datePickerJsunit();
  datePickerUIJsunit();
  datePickerPropertiesModifierTest();
}