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
import CheckboxgroupContentModifier from './checkboxGroup/CheckboxgroupContentModifier.test'

import checkBoxGroupUIJsunit from './CheckboxTest/checkBoxGroupUIJsunit.test';
import CheckBoxJsunit from './CheckboxTest/CheckBoxJsunit.test';

import CheckboxTest from './CheckboxTest/Checkbox.test';
import CheckBoxJsunit2 from './CheckboxTest/CheckBoxJsunit2.test';
import checkboxGroupJsunit from './checkboxGroup/CheckboxGroupJsunit.test';
import checkBoxTest1 from './CheckboxTest/checkBox';
import checkBoxGroupTest from './checkboxGroup/checkBoxGroup';
import checkBoxGroupJsunit2 from './CheckboxTest/checkBoxFirst.test';
import checkBoxGroupPartJsunit from './CheckboxTest/checkBoxGroup.test';
import checkBoxGroupSelectAllJsunit from './checkboxGroup/checkBoxGroup2.test';

import contentModifier from './CheckboxTest/contentModifier.test';
import triggerChange from './CheckboxTest/triggerChange.test';
import CheckBoxShape from './checkboxGroup/CheckBoxShape.test';
import indicatorBuilderTest from './CheckboxTest/indicatorBuilderTest.test';

import checkboxNode from './checkbox/checkboxNode.test';
import checkboxGroupNode from './checkboxGroup/checkboxGroupNode.test';
import checkBoxOnChangeModifierTest from './checkbox/checkboxOnChangeModifier.test';
import checkBoxGroupOnChangeModifierTest from './checkboxGroup/checkboxGroupOnChangeModifier.test';

export default function testsuite() {
  CheckboxgroupContentModifier()

  checkBoxGroupUIJsunit();
  CheckBoxJsunit();

  CheckboxTest();
  CheckBoxJsunit2();
  checkboxGroupJsunit();
  checkBoxTest1();
  checkBoxGroupTest();
  checkBoxGroupJsunit2();
  checkBoxGroupPartJsunit();
  checkBoxGroupSelectAllJsunit();

  contentModifier();
  triggerChange();
  CheckBoxShape();
  indicatorBuilderTest();

  checkboxNode();
  checkboxGroupNode();
  checkBoxOnChangeModifierTest();
  checkBoxGroupOnChangeModifierTest();
}