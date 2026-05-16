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
import textPickerSelectedBackgroundStyleTest from './textPicker/textPickerSelectedBackgroundStyle.test';
import textPickerPropertiesModifierTest from './textPicker/textPickerPropertiesModifier.test';
import textPickerDefaultPickerItemHeightTest from './textPicker/textPickerDefaultPickerItemHeight.test';
import textPickerDefaultTextStyleTest from './textPicker/textPickerDefaultTextStyle.test';
import textPickerDefaultTextStyleModifierTest from './textPicker/textPickerDefaultTextStyleModifier.test';
import textPickerDisableTextStyleAnimationTest from './textPicker/textPickerDisableTextStyleAnimation.test';
import textPickerDividerJsunitTest from './textPicker/textPickerDividerJsunit.test';

import textPickerEnableHapticFeedbackTest from './textPicker/textPickerEnableHapticFeedback.test';
import textPickerGradientHeightTest from './textPicker/textPickerGradientHeight.test';
import textPickerJsunitTest from './textPicker/textPickerJsunit.test';
import textPickerMultiRangeTest from './textPicker/textPickerMultiRange.test';
import textPickerOnChangeModifierTest from './textPicker/textPickerOnChangeModifier.test';
import textPickerOnScrollStopTest from './textPicker/textPickerOnScrollStopTest.test';
import textPickerSecTest from './textPicker/textPickerSec.test';
import textPickerSelectedAreaTest from './textPicker/textPickerSelectedArea.test';
import textPickerTextStyleThreeTest from './textPicker/textPickerTextStyleThree.test';
import textPickerValueTest from './textPicker/textPickerValue.test';

export default function testsuite() {
    textPickerSelectedBackgroundStyleTest();
    textPickerPropertiesModifierTest();
    textPickerDefaultPickerItemHeightTest();
    textPickerDefaultTextStyleTest();
    textPickerDefaultTextStyleModifierTest();
    textPickerDisableTextStyleAnimationTest();
    textPickerDividerJsunitTest();
    textPickerEnableHapticFeedbackTest();
    textPickerGradientHeightTest();
    textPickerJsunitTest();
    textPickerMultiRangeTest();
    textPickerOnChangeModifierTest();
    textPickerOnScrollStopTest();
    textPickerSecTest();
    textPickerSelectedAreaTest();
    textPickerTextStyleThreeTest();
    textPickerValueTest();
}