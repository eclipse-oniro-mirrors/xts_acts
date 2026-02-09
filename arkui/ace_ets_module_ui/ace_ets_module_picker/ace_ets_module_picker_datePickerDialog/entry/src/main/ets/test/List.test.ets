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

import datePickerDialogEventsTest from './datePickerDialogTest/datePickerDialogEvents.test';
import datePickerDialogBGBlurStyleTest from './datePickerDialogTest/datePickerDialogBGBlurStyle.test';
import datePickerDialogBGColorTest from './datePickerDialogTest/datePickerDialogBGColor.test';
import datePickerDialogCanLoopTest from './datePickerDialogTest/datePickerDialogCanLoop.test';
import datePickerDialogEnableHapticFeedbackTest from './datePickerDialogTest/datePickerDialogEnableHapticFeedback.test';
import datePickerDialogModeTest from './datePickerDialogTest/datePickerDialogMode.test';
import datePickerDialogShadowTest from './datePickerDialogTest/datePickerDialogShadow.test';
import stageDatePickerDialogTest from './datePickerDialogTest/stageDatePickerDialog.test';
import DatePickerDialogOptionsTest from './datePickerDialogTest/DatePickerDialogOptions.test';
import DatePickerDialogUITest from './datePickerDialogTest/DatePickerDialogUI.test';
import DatePickerDialogWindowPropertiesTest from './datePickerDialogTest/DatePickerDialogWindowProperties.test';
import DatePickerDialogAppearTextTest from './datePickerDialogTest/DatePickerDialogAppearText.test';
import DatePickerDialogButtonStyleTest from './datePickerDialogTest/DatePickerDialogButtonStyle.test';
import DatePickerDialogCallbackTest from './datePickerDialogTest/DatePickerDialogCallback.test';
import datePickerDialogBackgroundEffectTest from './datePickerDialogTest/datePickerDialogBackgroundEffect.test';
import datePickerDialogBlurStyleOptionsTest from './datePickerDialogTest/datePickerDialogBlurStyleOptions.test';
import showDatePickerDialogBackgroundEffectTest from './datePickerDialogTest/showDatePickerDialogBackgroundEffect.test';
import showDatePickerDialogBlurStyleOptionsTest from './datePickerDialogTest/showDatePickerDialogBlurStyleOptions.test';

export default function testsuite() {
  datePickerDialogEventsTest();
  datePickerDialogBGBlurStyleTest();
  datePickerDialogBGColorTest();
  datePickerDialogCanLoopTest();
  datePickerDialogEnableHapticFeedbackTest();
  datePickerDialogModeTest();
  datePickerDialogShadowTest();
  stageDatePickerDialogTest();
  DatePickerDialogOptionsTest();
  DatePickerDialogUITest();
  DatePickerDialogWindowPropertiesTest();
  DatePickerDialogAppearTextTest();
  DatePickerDialogButtonStyleTest();
  DatePickerDialogCallbackTest();
  datePickerDialogBackgroundEffectTest();
  datePickerDialogBlurStyleOptionsTest();
  showDatePickerDialogBackgroundEffectTest();
  showDatePickerDialogBlurStyleOptionsTest();
}