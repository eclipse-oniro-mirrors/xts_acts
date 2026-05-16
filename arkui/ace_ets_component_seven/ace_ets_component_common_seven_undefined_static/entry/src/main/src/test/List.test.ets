'use static';
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

import backgroundColorUndefinedTest from './QrcodeTest/backgroundColorUndefined.test'
import colorUndefinedTest from './QrcodeTest/colorUndefined.test'
import backgroundColorModifierUndefinedTest from './QrcodeTest/backgroundColorModifierUndefined.test'
import colorModifierUndefinedTest from './QrcodeTest/colorModifierUndefined.test'

import colorUndefinedTest_LP from './Loading_progressTest/colorUndefined.test'
import enableLoadingUndefinedTest from './Loading_progressTest/enableLoadingUndefined.test'
import colorModifierUndefinedTest_LP from './Loading_progressTest/colorModifierUndefined.test'
import enableLoadingModifierUndefinedTest from './Loading_progressTest/enableLoadingModifierUndefined.test'

import edgeAlignUndefinedTest from './Calender_pickerTest/edgeAlignUndefined.test'
import textStyleUndefinedTest from './Calender_pickerTest/textStyleUndefined.test'
import markTodayUndefinedTest from './Calender_pickerTest/markTodayUndefined.test'
import edgeAlignModifierUndefinedTest from './Calender_pickerTest/edgeAlignModifierUndefined.test'
import textStyleModifierUndefinedTest from './Calender_pickerTest/textStyleModifierUndefined.test'
import markTodayModifierUndefinedTest from './Calender_pickerTest/markTodayModifierUndefined.test'

import textStyleUndefinedTest_DP from './Date_pickerTest/textStyleUndefined.test'
import selectedTextStyleUndefinedTest from './Date_pickerTest/selectedTextStyleUndefined.test'
import disappearTextStyleUndefinedTest from './Date_pickerTest/disappearTextStyleUndefined.test'
import enableHapticFeedbackUndefinedTest from './Date_pickerTest/enableHapticFeedbackUndefined.test'
import lunarUndefinedTest from './Date_pickerTest/lunarUndefined.test'
import textStyleModifierUndefinedTest_DP from './Date_pickerTest/textStyleModifierUndefined.test'
import selectedTextStyleModifierUndefinedTest from './Date_pickerTest/selectedTextStyleModifierUndefined.test'
import disappearTextStyleModifierUndefinedTest from './Date_pickerTest/disappearTextStyleModifierUndefined.test'
import enableHapticFeedbackModifierUndefinedTest from './Date_pickerTest/enableHapticFeedbackModifierUndefined.test'
import lunarModifierUndefinedTest from './Date_pickerTest/lunarModifierUndefined.test'

export default function testsuite() {
  backgroundColorUndefinedTest();
  colorUndefinedTest();
  backgroundColorModifierUndefinedTest();
  colorModifierUndefinedTest();
  colorUndefinedTest_LP();
  enableLoadingUndefinedTest();
  colorModifierUndefinedTest_LP();
  enableLoadingModifierUndefinedTest();
  textStyleUndefinedTest_DP();
  selectedTextStyleUndefinedTest();
  disappearTextStyleUndefinedTest();
  enableHapticFeedbackUndefinedTest();
  lunarUndefinedTest();
  textStyleModifierUndefinedTest_DP();
  selectedTextStyleModifierUndefinedTest();
  disappearTextStyleModifierUndefinedTest();
  lunarModifierUndefinedTest();
  enableHapticFeedbackModifierUndefinedTest();
  edgeAlignUndefinedTest();
  textStyleUndefinedTest();
  markTodayUndefinedTest();
  edgeAlignModifierUndefinedTest();
  textStyleModifierUndefinedTest();
  markTodayModifierUndefinedTest();
}