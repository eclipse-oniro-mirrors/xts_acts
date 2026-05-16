'use static';
/*
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
import TimePickerTest from './TimePickerTest/TimePicker.test';
import radioTest from './RadioTest/radio.test.test';
import CheckboxTest2 from './CheckboxTest/CheckboxTest2.test';
import textpicker from './TextPicker/TextPicker.test';
import TextPickerSec from './TextPicker/TextPickerSec.test';
import textpickermultiTest from './TextPicker/TextPickerMulti.test';
import sliderTest from './SliderTest/SliderTest.test';
import SliderTestSec from './SliderTest/SliderTestSec.test';
import buttonJsunit from './ButtonTest/ButtonJsunit.test';
import ratingJsunit from './RatingTest/RatingJsunit.test';
import sliderJsunit from './SliderTest/SliderJsunit.test';
import TimePicker1Test from './TimePickerTest/TimePicker1.test';
import stageTimePickerDialog from './TimePickerTest/stageTimePickerDialog.test';
import stageTextPickerDialog from './TextPicker/stageTextPickerDialog.test';
import stageDatePickerDialog from './StageDatePickerDialog.test';
import toggleJsunit from './Toggle/ToggleJsunit.test';
import checkboxJsunit from './CheckboxTest/CheckboxJsunit.test';
import checkboxGroupJsunit from './checkboxGroup/CheckboxGroupJsunit.test';
import sliderJsunit1 from './slider/SliderJsunit1.test';
import RadioJsunit from './RadioTest/RadioJsunit.test';
import radioJsunit2 from './RadioTest/RadioJsunit2.test';
import RatingUIJsunit from './RatingTest/RatingUIJsunit.test';
import datepicker from './DatePickerTest/DatePicker.test';
import ActsDatePickerTest from './DatePickerTest/DatePicker.test';
import checkBoxTest1 from './CheckboxTest/checkBox.test';
import checkBoxGroupTest from './checkboxGroup/checkBoxGroup.test';
import Toggle3Jsunit from './Toggle/Toggle3Jsunit.test';
import rating3Jsunit from './RatingTest/Rating3Jsunit.test';
import checkBoxGroupJsunit2 from './CheckboxTest/checkBoxFirst.test';
import checkBoxGroupPartJsunit from './CheckboxTest/checkBoxGroup.test';
import radioGroupJsunit from './RadioTest/radioFirst.test';
import sliderMovingJsunit from './SliderTest/slider.test';
import datePickerLunarJsunit from './DatePickerTest/datePicker3.test';
import checkBoxGroupSelectAllJsunit from './checkboxGroup/checkBoxGroup.test';
import textPickerDefaultPickerItemHeightJsunit from './TextPicker/TextPicker.test';
import datePickerJsunit from './DatePickerTest/DatePickerJsunit.test';
import systempromptJsunit from './SystempromptJsunit.test';
import TextPickerJsunit from './TextPicker/TextPickerJsunit.test';
import TimePickerJsunit from './TimePickerTest/TimePickerJsunit.test';
import timeStampJsunit from './TimePickerTest/TimeStampJsunit.test';
import datePickerUIJsunit from './DatePickerTest/datePickerUIJsunit.test';
import RatingAdvancedTest from './RatingTest/RatingAdvanced.test'
import SliderInterfaceTest from './slider/sliderInterfaceTest.test'
import sliderJsunitSliderTest from './SliderTestC/sliderJsunit.test';

export default function testsuite() {

  toggleJsunit()  
  
  checkBoxTest1()
  checkBoxGroupTest()
  Toggle3Jsunit(); 
  sliderJsunitSliderTest()
  sliderTest()
  TimePicker1Test()
  textpicker();
  datepicker()
  TextPickerJsunit();
  sliderMovingJsunit()
  CheckboxTest2();
  textpickermultiTest()
  TextPickerSec()
  rating3Jsunit();
  SliderTestSec()
  RatingUIJsunit();
  RatingAdvancedTest()
  datePickerUIJsunit();
  SliderInterfaceTest()
  stageTimePickerDialog();
  stageTextPickerDialog();
  TimePickerTest()
  ActsDatePickerTest()
  checkboxJsunit()
  checkboxGroupJsunit()
  sliderJsunit1()
  buttonJsunit()
  ratingJsunit()
  sliderJsunit()
  checkBoxGroupPartJsunit()
  checkBoxGroupJsunit2()
  radioGroupJsunit()
  datePickerLunarJsunit()
  checkBoxGroupSelectAllJsunit()
  datePickerJsunit();
  systempromptJsunit();
  stageDatePickerDialog();
  radioTest();
  radioJsunit2();
  timeStampJsunit();
  textPickerDefaultPickerItemHeightJsunit()
  TimePickerJsunit();
  RadioJsunit();
}