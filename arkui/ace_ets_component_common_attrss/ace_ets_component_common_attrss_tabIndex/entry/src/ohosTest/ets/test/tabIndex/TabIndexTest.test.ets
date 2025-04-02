/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

async function executeTab(data: ESObject, referenceOneValue: string, textValue: string, referenceTwoValue: string) {
  expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertEqual(true);
  await Utils.sleep(1000);
  console.info('[' + data.caseTag + '] Press Tab.');
  let referenceOneComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceOneComponentKey);
  let textComponent: ESObject = Utils.getComponentByKey(data.pageConfig.textComponentKey);
  let referenceTwoComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceTwoComponentKey);
  //Confirm reference component one text
  console.info('[' + data.caseTag + '] referenceOneComponent.$attrs.label:' + referenceOneComponent.$attrs.label);
  expect(referenceOneComponent.$attrs.label).assertEqual(referenceOneValue);
  //Confirm Text Content
  console.info('[' + data.caseTag + '] textComponent.$attrs.content:' + textComponent.$attrs.content);
  expect(textComponent.$attrs.content).assertEqual(textValue);
  //Confirm reference component two text
  console.info('[' + data.caseTag + '] referenceTwoComponent.$attrs.label:' + referenceTwoComponent.$attrs.label);
  expect(referenceTwoComponent.$attrs.label).assertEqual(referenceTwoValue);
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  textComponentKey: string = '';
  referenceOneComponentKey: string = '';
  referenceTwoComponentKey: string = '';
  sharePage: boolean = false;
}

class TestValues {
  describe: string = '';
  setValue: number = 0;
  expectValue: number = 0;
}

export default function TabIndexTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'Button',
    'TextInput',
    'TextArea',
    'Search',
    'Text',
    'Image',
    'Grid',
    'List',
    'Checkbox',
    'CheckboxGroup',
    'DatePicker',
    //    'ImageAnimator',
    'Menu',
    //    'MenuItem',
    //    'MenuItemGroup',
    'Radio',
    'Rating',
    'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Web',
    'AlphabetIndexer',
    'Column',
    //    'ColumnSplit',
    'Counter',
    'Flex',
    //    'GridCol',
    //    'GridRow',
    'GridItem',
    'ListItem',
    //    'ListItemGroup',
    'Row',
    //    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
  //    'TabContent'
  ]
  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testTabIndex',
    pageName: 'TabIndexPage',
    pageUrl: 'MainAbility/pages/tabIndex/TabIndexPage',
    textComponentKey: 'textComponentKey',
    referenceOneComponentKey: 'referenceOneComponentKey',
    referenceTwoComponentKey: 'referenceTwoComponentKey',
    sharePage: false
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValues[] = [{
    describe: 'SetLessThanZero',
    setValue: -1,
    expectValue: -1
  }, /* {
    describe: 'SetEqualZero',
    setValue: 0,
    expectValue: 0
  }, */{
    describe: 'SetEqualOne',
    setValue: 1,
    expectValue: 1
  }, {
    describe: 'SetEqualTwo',
    setValue: 2,
    expectValue: 2
  }]

  describe('TabIndexTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Place Focus
      let requestFocusText = focusControl.requestFocus(data.pageConfig.textComponentKey);
      expect(requestFocusText).assertEqual(true);
      await Utils.sleep(1000);

      if ('SetLessThanZero' == data.testValue.describe) {

        //Press the Tab key for the first time to reference the component (1) and capture the focus
        await executeTab(data, 'onFocus', '', '');
        ///Press the Tab key for the second time to reference the component (2) and capture the focus
        await executeTab(data, 'onBlur', '', 'onFocus');

        //Confirm target component attribute values
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);
      } else if ('SetEqualZero' == data.testValue.describe) {

        //Press the Tab key for the first time to reference the component (1) and capture the focus
        await executeTab(data, 'onFocus', '', '');
        //Press the Tab key for the second time to reference the component (2) and capture the focus
        await executeTab(data, 'onBlur', '', 'onFocus');
        //Press the Tab key for the third time to focus on the target component
        await executeTab(data, 'onBlur', 'onFocus', 'onBlur');

        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);

      } else if ('SetEqualOne' == data.testValue.describe) {

        //Press the Tab key for the first time to focus on the target component
        await executeTab(data, '', 'onFocus', '');
        //Press the Tab key for the second time to reference the component (1) and capture the focus
        await executeTab(data, 'onFocus', 'onBlur', '');
        //Press the Tab key for the third time to reference the component (2) and capture the focus
        await executeTab(data, 'onBlur', 'onBlur', 'onFocus');

        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);

      } else if ('SetEqualTwo' == data.testValue.describe) {

        //Press the Tab key for the first time to reference the component (1) and capture the focus
        await executeTab(data, 'onFocus', '', '');
        //Press the Tab key for the second time to focus on the target component
        await executeTab(data, 'onBlur', 'onFocus', '');
        //Press the Tab key for the third time to reference the component (2) and capture the focus
        await executeTab(data, 'onBlur', 'onBlur', 'onFocus');

        //Confirm target component attribute values
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);
      }
    })
  })


}