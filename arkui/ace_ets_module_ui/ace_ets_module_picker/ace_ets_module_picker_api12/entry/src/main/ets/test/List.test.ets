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
import gradientHeight from './TextPickerTest/gradientHeight.test';
import dividerJsunit from './TextPickerTest/dividerJsunit.test';
import contentModifier from './CheckboxTest/contentModifier.test';
import triggerChange from './CheckboxTest/triggerChange.test';
import CheckBoxShape from './CheckboxGroupTest/CheckBoxShape.test';
import dateTimeOptions from './TimePickerTest/dateTimeOptions.test';
import indicatorBuilderTest from './CheckboxTest/indicatorBuilderTest.test';
import ButtonApi1 from './Button/ButtonApi1.test';
import ButtonApi2 from './Button/ButtonApi2.test';

import RadioContentModifier from './RadioTest/RadioContentModifier.test';
import RadioIndicatorType from './RadioTest/RadioIndicatorType.test';
import RatingContentModifier from './RatingTest/RatingContentModifier.test';
import SliderAttrs from './SliderTest/SliderAttrs.test';
import SliderContentModifier from './SliderTest/SliderContentModifier.test';
import ToggleContentModifier from './ToggleTest/ToggleContentModifier.test';
import ToggleSwitchStyle from './ToggleTest/ToggleSwitchStyle.test';
import ToggleContentIsOn from './ToggleTest/ToggleIsOn.test';
import ToggleContentEnabled from './ToggleTest/ToggleEnabled.test';
import slideRange from './SliderTest/slideRange.test';

import SliderAttrs2 from './SliderTest/SliderAttrs2.test';
import TimePickerAddApi from './TimePickerTest/TimePickerAddApi.test';
import enableHapticFeedbackTest from './TimePickerTest/enableHapticFeedbackTest.test';
import RatingAdvancedTest from './RatingTest/RatingAdvanced.test';
import XComponentSliderTest from './SliderTest/XcomponentSlider.test';
import textPickerDefaultPickerItemHeightJsunit from './TextPickerTest/textPicker.test';

export default function testsuite() {
    gradientHeight();
    dividerJsunit();
    contentModifier();
    triggerChange();
    CheckBoxShape();
    dateTimeOptions();
    indicatorBuilderTest();
    ButtonApi1();
    ButtonApi2();
    RadioContentModifier();
    RadioIndicatorType();
    RatingContentModifier();
    SliderAttrs();
    SliderContentModifier();
    ToggleContentModifier();
    ToggleSwitchStyle();
    TimePickerAddApi();
    ToggleContentIsOn();
    ToggleContentEnabled();
    slideRange();
    SliderAttrs2();
    enableHapticFeedbackTest();
    RatingAdvancedTest();
    XComponentSliderTest();
    textPickerDefaultPickerItemHeightJsunit()
}