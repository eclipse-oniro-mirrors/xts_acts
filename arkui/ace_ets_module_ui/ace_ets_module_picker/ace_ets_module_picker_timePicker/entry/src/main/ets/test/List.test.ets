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
import TimePickerTest from './timePickerTest/TimePicker.test';
import TimePicker1Test from './timePickerTest/TimePicker1.test';
import stageTimePickerDialog from './timePickerTest/stageTimePickerDialog.test';
import TimePickerJsunit from './timePickerTest/TimePickerJsunit.test';
import timeStampJsunit from './timePickerTest/TimeStampJsunit.test';
import timePickerPropertiesModifierTest from './timePickerTest/timePickerPropertiesModifier.test';
import timePickerLoopTest from './timePickerTest/timePickerLoop.test';
import timePickerSelectedAreaTest from './timePickerTest/timePickerSelectedArea.test';
import timePickerStartAndEndTest from './timePickerTest/timePickerStartAndEnd.test';
import timePickerEnableCascadeTest from './timePickerTest/timePickerEnableCascade.test';
import timePickerOnChangeModifierTest from './timePickerTest/timePickerOnChangeModifier.test';
import timePickerAddApiTest from './timePickerTest/TimePickerAddApi.test';
import timePickerDateTimeOptionsTest from './timePickerTest/timePickerDateTimeOptions.test';
import timePickerEnableHapticFeedbackTest from './timePickerTest/timePickerEnableHapticFeedbackTest.test';

export default function testsuite() {
  stageTimePickerDialog();
  TimePicker1Test();
  TimePickerTest();
  TimePickerJsunit();
  timeStampJsunit();
  timePickerPropertiesModifierTest();
  timePickerLoopTest();
  timePickerSelectedAreaTest();
  timePickerStartAndEndTest();
  timePickerEnableCascadeTest();
  timePickerOnChangeModifierTest();
  timePickerAddApiTest();
  timePickerDateTimeOptionsTest();
  timePickerEnableHapticFeedbackTest();
}