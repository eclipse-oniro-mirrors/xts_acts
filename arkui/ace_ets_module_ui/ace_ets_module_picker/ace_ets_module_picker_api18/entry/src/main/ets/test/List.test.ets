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
import datePickerMode from './datePicker/DatePickerMode.test';
import TimePickerStartAndEnd from './timePicker/timePickerStartAndEnd.test';
import enableHapticFeedback from './textPicker/enableHapticFeedback.test';
import EnableHapticFeedbackTest from './datePicker/datePickerEnableHapticFeedback.test';
import EnableHapticFeedbackModifierTest from './datePicker/datePickerEnableHapticFeedbackModifier.test';
import textPickerSelectedAreaTest from './textPicker/textPickerSelectedArea.test';
import timePickerSelectedAreaTest from './timePicker/timePickerSelectedArea.test';
import timePickerLoopTest from './timePicker/timePickerLoop.test';

export default function testsuite() {
    datePickerMode();
    TimePickerStartAndEnd();
    EnableHapticFeedbackTest();
    EnableHapticFeedbackModifierTest();
    textPickerSelectedAreaTest();
    timePickerSelectedAreaTest();
    enableHapticFeedback();
    timePickerLoopTest();
}