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

import CheckboxNodeTest from './checkbox/checkboxNode.test';
import checkboxGroupNodeTest from './checkboxGroup/checkboxGroupNode.test';
import enableCascadeTest from './timePicker/enableCascadeTest.test';
import radioNodeTest from './radio/radioNode.test';
import ratingNodeTest from './rating/ratingNode.test';
import sliderNodeTest  from './slider/sliderNode.test';
import toggleNodeTest from './toggle/toggleNode.test';
import Picker from './crownSensitivity/Picker.test';
import TimePicker from './crownSensitivity/TimePicker.test';
import TextPicker from './crownSensitivity/TextPicker.test';
import CheckboxOnChangeModifierTest from './checkbox/checkboxOnChangeModifier.test';
import CheckboxGroupOnChangeModifierTest from './checkboxGroup/checkboxGroupOnChangeModifier.test';
import radioOnChangeModifierTest from './radio/radioOnChangeModifier.test';
import ratingOnChangeModifierTest from './rating/ratingOnChangeModifier.test';
import sliderOnChangeModifierTest from './slider/sliderOnChangeModifier.test';
import toggleOnChangeModifierTest from './toggle/toggleOnChangeModifier.test';
import textPickerOnChangeModifierTest from './textPicker/textPickerOnChangeModifier.test';
import timePickerOnChangeModifierTest from './timePicker/timePickerOnChangeModifier.test';
import datePickerOnChangeModifierTest from './datePicker/datePickerOnChangeModifier.test';
import selectNodeTest from './select/selectNode.test'

export default function testsuite() {
  enableCascadeTest();
  CheckboxNodeTest();
  checkboxGroupNodeTest();
  radioNodeTest();
  ratingNodeTest();
  sliderNodeTest();
  toggleNodeTest();
  Picker();
  TimePicker();
  TextPicker();
  CheckboxOnChangeModifierTest();
  radioOnChangeModifierTest();
  CheckboxGroupOnChangeModifierTest();
  ratingOnChangeModifierTest();
  // sliderOnChangeModifierTest();
  // toggleOnChangeModifierTest();
  // textPickerOnChangeModifierTest();
  // timePickerOnChangeModifierTest();
  // datePickerOnChangeModifierTest();
}