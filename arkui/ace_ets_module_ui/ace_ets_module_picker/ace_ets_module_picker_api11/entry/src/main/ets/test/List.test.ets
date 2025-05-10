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
import TimePickerTest from './TimePickerTest/TimePicker.test';
import radioTest from './RadioTest/radio.test';
import CheckboxTest from './CheckboxTest/Checkbox.test';
import textpicker from './TextPicker/TextPicker';
import TextPickerSec from './TextPicker/TextPickerSec';
import textpickermultiTest from './TextPicker/TextPickerMulti';
import sliderTest from './SliderTest/SliderTest';
import SliderTestSec from './SliderTest/SliderTestSec';
import buttonJsunit from './ButtonTest/ButtonJsunit.test';
import ratingJsunit from './RatingTest/RatingJsunit.test';
import sliderJsunit from './SliderTest/SliderJsunit.test';
import TimePicker1Test from './TimePickerTest/TimePicker1.test';
import stageTimePickerDialog from './TimePickerTest/stageTimePickerDialog.test';
import stageTextPickerDialog from './TextPicker/stageTextPickerDialog.test';
import stageDatePickerDialog from './stageDatePickerDialog.test';
import toggleJsunit from './Toggle/ToggleJsunit.test';
import checkboxJsunit from './CheckboxTest/CheckboxJsunit.test';
import checkboxGroupJsunit from './checkboxGroup/CheckboxGroupJsunit.test';
import sliderJsunit1 from './slider/SliderJsunit1.test';
import RadioJsunit from './RadioTest/RadioJsunit.test';
import radioJsunit2 from './RadioTest/RadioJsunit2.test';
import RatingUIJsunit from './RatingTest/RatingUIJsunit.test';
import datepicker from './DatePickerTest/DatePicker';
import ActsDatePickerTest from './DatePickerTest/DatePicker.test';
import checkBoxTest1 from './CheckboxTest/checkBox';
import checkBoxGroupTest from './checkboxGroup/checkBoxGroup';
import toggle3Jsunit from './Toggle/Toggle3Jsunit.test';
import rating3Jsunit from './RatingTest/Rating3Jsunit.test';
import checkBoxGroupJsunit2 from './CheckboxTest/checkBoxFirst.test';
import checkBoxGroupPartJsunit from './CheckboxTest/checkBoxGroup.test';
import radioGroupJsunit from './RadioTest/radioFirst.test';
import sliderMovingJsunit from './SliderTest/slider.test';
import datePickerLunarJsunit from './DatePickerTest/datePicker3.test';
import checkBoxGroupSelectAllJsunit from './checkboxGroup/checkBoxGroup.test';
import textPickerDefaultPickerItemHeightJsunit from './TextPicker/textPicker.test';
import datePickerJsunit from './DatePickerTest/DatePickerJsunit.test';
import systempromptJsunit from './SystempromptJsunit.test';
import TextPickerJsunit from './TextPicker/TextPickerJsunit.test';
import TimePickerJsunit from './TimePickerTest/TimePickerJsunit.test';
import timeStampJsunit from './TimePickerTest/TimeStampJsunit.test';
import datePickerUIJsunit from './DatePickerTest/datePickerUIJsunit.test';
import RatingAdvancedTest from './RatingTest/RatingAdvanced.test'
import SliderInterfaceTest from './slider/sliderInterfaceTest.test'

export default function testsuite() {
  RatingAdvancedTest()
  SliderInterfaceTest()
  stageTimePickerDialog();
  stageTextPickerDialog();
  stageDatePickerDialog();
  TimePicker1Test()
  TimePickerTest()
  radioTest()
  CheckboxTest();
  textpicker()
  TextPickerSec()
  textpickermultiTest()

  toggleJsunit()
  checkboxJsunit()
  checkboxGroupJsunit()
  sliderJsunit1()

  sliderTest()
  SliderTestSec()
  buttonJsunit()
  ratingJsunit()
  sliderJsunit()

  ActsDatePickerTest()
  datepicker()
  checkBoxTest1()
  checkBoxGroupTest()
  RadioJsunit();
  radioJsunit2();
  RatingUIJsunit();
  toggle3Jsunit();
  rating3Jsunit();

  checkBoxGroupJsunit2()
  checkBoxGroupPartJsunit()
  radioGroupJsunit()
  sliderMovingJsunit()
  datePickerLunarJsunit()

  checkBoxGroupSelectAllJsunit()
  textPickerDefaultPickerItemHeightJsunit()
  datePickerJsunit();
  systempromptJsunit();
  TextPickerJsunit();
  TimePickerJsunit();
  timeStampJsunit();
  datePickerUIJsunit();
}