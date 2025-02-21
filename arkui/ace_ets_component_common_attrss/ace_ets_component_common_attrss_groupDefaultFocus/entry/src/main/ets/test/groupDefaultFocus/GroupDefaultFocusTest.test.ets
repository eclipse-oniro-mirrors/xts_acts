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

export default function GroupDefaultFocusTest() {
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
    'MenuItem',
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
  let pageConfig = {
    testName: 'testGroupDefaultFocus',
    pageName: 'GroupDefaultFocusPage',
    pageUrl: 'MainAbility/pages/groupDefaultFocus/GroupDefaultFocusPage',
    textComponentKey: 'textComponentKey',
    referenceOneComponentKey: 'referenceOneComponentKey',
    referenceTwoComponentKey: 'referenceTwoComponentKey',
    sharePage: false
  }
  //Test values, looped to create cases, this param is required.
  let testValues = [{
    describe: 'SetTrue',
    setValue: true,
  }, {
    describe: 'SetFalse',
    setValue: false,
  }]

  /**
   * Create test suite.
   */

  describe('GroupDefaultFocusTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {

      //Place Focus
      let requestFocusText = focusControl.requestFocus(data.pageConfig.referenceOneComponentKey);
      expect(requestFocusText).assertEqual(true);
      await Utils.sleep(1000);

      //Pressing the Tab key for the first time
      let tab = Utils.performKeyEventDownUp(2049, 'Tab');
      expect(tab).assertEqual(true);
      await Utils.sleep(1000);

      if ('SetTrue' == data.testValue.describe) {
        //First confirmation of target component focus
        let textComponent = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] textComponent.$attrs.content is ' + textComponent.$attrs.content);
        expect(textComponent.$attrs.content).assertContain('onFocus');

        //Confirm target component properties
        let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] groupDefaultFocus is ' + viewObj.$attrs.groupDefaultFocus);
        expect(viewObj.$attrs.groupDefaultFocus).assertEqual(true);

        //Focus the reference component
        let secondFocus = focusControl.requestFocus(data.pageConfig.referenceOneComponentKey);
        await Utils.sleep(1000);
        expect(secondFocus).assertEqual(true);

        //Pressing the Tab key for the second time
        let secondTab = Utils.performKeyEventDownUp(2049, 'Tab');
        expect(secondTab).assertEqual(true);
        await Utils.sleep(1000);

        //Second confirmation of target component focus
        let textComponentTwo = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] textComponentTwo.$attrs.content: ' + textComponentTwo.$attrs.content);
        expect(textComponentTwo.$attrs.content).assertEqual('onFocus');

      } else if ('SetFalse' == data.testValue.describe) {
        //Confirmation of target component focus
        let textComponent = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] textComponent.$attrs.content: ' + textComponent.$attrs.content);
        expect(textComponent.$attrs.content).assertEqual('');

        //Confirm target component properties
        let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.groupDefaultFocus:' + viewObj.$attrs.groupDefaultFocus);
        expect(viewObj.$attrs.groupDefaultFocus).assertEqual(false);

      }
    })
  })
}