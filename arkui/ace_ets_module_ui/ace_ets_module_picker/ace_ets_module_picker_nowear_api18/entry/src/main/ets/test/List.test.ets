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
import calendarPickerDialogStartEndTest from './calendarPickerDialogTest/calendarPickerDialogStartEndTest.test';
import calendarPickerStartEndTest from './calendarPickerTest/calendarPickerStartEndTest.test';
import datePickerDialogMode from './datePickerDialogTest/DatePickerDialogMode.test';
import timePickerDialogEnableHapticFeedback from './timePickerDialog/timePickerDialogEnableHapticFeedback.test'
import textPickerDialogEnableHapticFeedback from './textPickerDialog/textPickerDialogEnableHapticFeedback.test'
import EnableHapticFeedback from './datePickerDialogTest/datePickerDialogEnableHapticFeedback.test'
import textPickerDialogSelectedAreaTest from './textPickerDialog/textPickerDialogSelectedArea.test';
import timePickerDialogSelectedAreaTest from './timePickerDialog/timePickerDialogSelectedArea.test';
import SliderEnableHapticFeedbackTest from './slider/SliderEnableHapticFeedbackTest.test'
import textPickerDialogDefaultTextStyleTest from './textPickerDialog/textPickerDialogDefaultTextStyle.test';
import textPickerDialogDisableTextStyleAnimationTest from './textPickerDialog/textPickerDialogDisableTextStyleAnimation.test';
import calendarPickerDialogBackgroundBlurStyleTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundBlurStyle.test';
import calendarPickerDialogBackgroundColorTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundColor.test';
import calendarPickerDialogBackgroundShadowTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundShadow.test';
import datePickerDialogBGBlurStyleTest from './datePickerDialogTest/datePickerDialogBGBlurStyle.test';
import datePickerDialogBGColorTest from './datePickerDialogTest/datePickerDialogBGColor.test';
import datePickerDialogShadowTest from './datePickerDialogTest/datePickerDialogShadow.test';
import textPickerDialogBGBlurStyleTest from './textPickerDialog/textPickerDialogBGBlurStyle.test';
import textPickerDialogBGColorTest from './textPickerDialog/textPickerDialogBGColor.test';
import textPickerDialogShadowTest from './textPickerDialog/textPickerDialogShadow.test';
import timePickerDialogBGBlurStyleTest from './timePickerDialog/timePickerDialogBGBlurStyle.test';
import timePickerDialogBGColorTest from './timePickerDialog/timePickerDialogBGColor.test';
import timePickerDialogShadowTest from './timePickerDialog/timePickerDialogShadow.test';
import enableCascadeTest from './timePickerDialog/addEnableCascadeApi.test'
import columnWidths from './textPicker/columnWidths.test';

export default function testsuite() {
    calendarPickerDialogStartEndTest()
    calendarPickerStartEndTest()
    datePickerDialogMode()
    timePickerDialogEnableHapticFeedback();
    EnableHapticFeedback();
    textPickerDialogSelectedAreaTest();
    timePickerDialogSelectedAreaTest();
    textPickerDialogEnableHapticFeedback();
    SliderEnableHapticFeedbackTest();
    textPickerDialogDefaultTextStyleTest();
    textPickerDialogDisableTextStyleAnimationTest();
    calendarPickerDialogBackgroundBlurStyleTest();
    calendarPickerDialogBackgroundColorTest();
    calendarPickerDialogBackgroundShadowTest();
    datePickerDialogBGBlurStyleTest();
    datePickerDialogBGColorTest();
    datePickerDialogShadowTest();
    textPickerDialogBGBlurStyleTest();
    textPickerDialogBGColorTest();
    textPickerDialogShadowTest();
    timePickerDialogBGBlurStyleTest();
    timePickerDialogBGColorTest();
    timePickerDialogShadowTest();
    enableCascadeTest();
    columnWidths();
}