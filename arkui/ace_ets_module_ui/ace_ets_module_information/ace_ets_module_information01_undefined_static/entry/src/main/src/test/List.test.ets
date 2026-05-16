/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
// text_timer
import fontColorUndefinedTest from './Text_TimerTest/fontColorUndefined.test'
import fontFamilyUndefinedTest from './Text_TimerTest/fontFamilyUndefined.test'
import fontSizeUndefinedTest from './Text_TimerTest/fontSizeUndefined.test'
import fontStyleUndefinedTest from './Text_TimerTest/fontStyleUndefined.test'
import fontWeightUndefinedTest from './Text_TimerTest/fontWeightUndefined.test'
import formatUndefinedTest from './Text_TimerTest/formatUndefined.test'
import textShadowUndefinedTest from './Text_TimerTest/textShadowUndefined.test'
import onTimerUndefinedTest from './Text_TimerTest/onTimerUndefined.test'

import fontColorModifierUndefinedTest from './Text_TimerTest/fontColorModifierUndefined.test'
import fontFamilyModifierUndefinedTest from './Text_TimerTest/fontFamilyModifierUndefined.test'
import fontSizeModifierUndefinedTest from './Text_TimerTest/fontSizeModifierUndefined.test'
import fontStyleModifierUndefinedTest from './Text_TimerTest/fontStyleModifierUndefined.test'
import fontWeightModifierUndefinedTest from './Text_TimerTest/fontWeightModifierUndefined.test'
import formatModifierUndefinedTest from './Text_TimerTest/formatModifierUndefined.test'
import textShadowModifierUndefinedTest from './Text_TimerTest/textShadowModifierUndefined.test'
import onTimerModifierUndefinedTest from './Text_TimerTest/onTimerModifierUndefined.test'

// text_clock
import textClockUndefined from './Text_ClockTest/textClockUndefined.test'
import textClockModifierUndefined from './Text_ClockTest/textClockModifierUndefined.test'

// text_picker
import textPickerUndefined from './Text_PickerTest/textPickerUndefined.test'
import textPickerModifierUndefined from './Text_PickerTest/textPickerModifierUndefined.test'

export default function testsuite() {
    // text_timer
    fontColorUndefinedTest();
    fontFamilyUndefinedTest();
    fontSizeUndefinedTest();
    fontStyleUndefinedTest();
    fontWeightUndefinedTest();
    formatUndefinedTest();
    textShadowUndefinedTest();
    onTimerUndefinedTest();

    // text_timer Modifier
    fontColorModifierUndefinedTest();
    fontFamilyModifierUndefinedTest();
    fontSizeModifierUndefinedTest();
    fontStyleModifierUndefinedTest();
    fontWeightModifierUndefinedTest();
    formatModifierUndefinedTest();
    textShadowModifierUndefinedTest();
    onTimerModifierUndefinedTest();

    // text_clock
    textClockUndefined();
    textClockModifierUndefined();

    // text_picker
    textPickerUndefined();
    textPickerModifierUndefined();
}