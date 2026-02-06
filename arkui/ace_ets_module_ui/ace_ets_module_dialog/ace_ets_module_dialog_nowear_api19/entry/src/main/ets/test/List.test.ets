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

import actionSheetBackgroundEffectTest from './actionSheetTest/actionSheetBackgroundEffect.test'
import actionSheetBlurStyleOptionsTest from './actionSheetTest/actionSheetBlurStyleOptions.test'
import calendarPickerDialogBackgroundEffectTest from './calendarPickerDialogTest/calendarPickerDialogBackgroundEffect.test'
import calendarPickerDialogBlurStyleOptionsTest from './calendarPickerDialogTest/calendarPickerDialogBlurStyleOptions.test'
import datePickerDialogBackgroundEffectTest from './datePickerDialogTest/datePickerDialogBackgroundEffect.test'
import datePickerDialogBlurStyleOptionsTest from './datePickerDialogTest/datePickerDialogBlurStyleOptions.test'
import showActionSheetBackgroundEffectTest from './UIContextTest/showActionSheetBackgroundEffect.test'
import showActionSheetBlurStyleOptionsTest from './UIContextTest/showActionSheetBlurStyleOptions.test'
import showDatePickerDialogBackgroundEffectTest from './UIContextTest/showDatePickerDialogBackgroundEffect.test'
import showDatePickerDialogBlurStyleOptionsTest from './UIContextTest/showDatePickerDialogBlurStyleOptions.test'
import showTextPickerDialogBackgroundEffectTest from './UIContextTest/showTextPickerDialogBackgroundEffect.test'
import showTextPickerDialogBlurStyleOptionsTest from './UIContextTest/showTextPickerDialogBlurStyleOptions.test'
import showTimePickerDialogBackgroundEffectTest from './UIContextTest/showTimePickerDialogBackgroundEffect.test'
import showTimePickerDialogBlurStyleOptionsTest from './UIContextTest/showTimePickerDialogBlurStyleOptions.test'
import textPickerDialogBackgroundEffectTest from './textPickerDialogTest/textPickerDialogBackgroundEffect.test'
import textPickerDialogBlurStyleOptionsTest from './textPickerDialogTest/textPickerDialogBlurStyleOptions.test'
import timePickerDialogBackgroundEffectTest from './timePickerDialogTest/timePickerDialogBackgroundEffect.test'
import timePickerDialogBlurStyleOptionsTest from './timePickerDialogTest/timePickerDialogBlurStyleOptions.test'
import openMenuAnchorPositionTest from './promptActionTest/openMenuAnchorPosition.test'
import updateMenuAnchorPositionTest from './promptActionTest/updateMenuAnchorPosition.test'
import subwindowDialog from './promptActionTest/subwindowDialog.test'
import maxWidth from './PopupTest/Maxwidth.test'

export default function testsuite() {
  actionSheetBackgroundEffectTest()
  actionSheetBlurStyleOptionsTest()
  calendarPickerDialogBackgroundEffectTest()
  calendarPickerDialogBlurStyleOptionsTest()
  datePickerDialogBackgroundEffectTest()
  datePickerDialogBlurStyleOptionsTest()
  showActionSheetBackgroundEffectTest()
  showActionSheetBlurStyleOptionsTest()
  showDatePickerDialogBackgroundEffectTest()
  showDatePickerDialogBlurStyleOptionsTest()
  showTextPickerDialogBackgroundEffectTest()
  showTextPickerDialogBlurStyleOptionsTest()
  showTimePickerDialogBackgroundEffectTest()
  showTimePickerDialogBlurStyleOptionsTest()
  textPickerDialogBackgroundEffectTest()
  textPickerDialogBlurStyleOptionsTest()
  timePickerDialogBackgroundEffectTest()
  timePickerDialogBlurStyleOptionsTest()
  openMenuAnchorPositionTest()
  updateMenuAnchorPositionTest()  
  subwindowDialog();
  maxWidth();
}