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

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  textComponentKey: string = '';
  referenceComponentKey: string = '';
  sharePage: boolean = false;
}

class TestValue {
  describe: string = '';
  setValue: boolean = false;
}

export default function DefaultFocusTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'Select',
    'Stepper',
    'StepperItem',
    'Web',
    'SideBarContainer'
  ]
  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testDefaultFocus',
    pageName: 'DefaultFocusPage',
    pageUrl: 'MainAbility/pages/defaultFocus/DefaultFocusPage',
    textComponentKey: 'textComponentKey',
    referenceComponentKey: 'referenceComponentKey',
    sharePage: false
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'SetTrue',
    setValue: true,
  }, {
    describe: 'SetFalse',
    setValue: false,
  }]

  /**
   * Create test suite.
   */

  describe('DefaultFocusTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Press the Tab key
//      expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertEqual(true);
//      await Utils.sleep(1000);
//      console.info('[' + data.caseTag + '] Press Tab.');

      if ('SetTrue' == data.testValue.describe) {
        //Confirm if the focus is on the target component
        let firstComponent: ESObject = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] firstComponent.$attrs.content: ' + firstComponent.$attrs.content);
        expect(firstComponent.$attrs.content).assertEqual('onFocus');
        //Confirm if the focus is on the reference component
        let firstReferenceComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] firstReferenceComponent.$attrs.label: ' +
        firstReferenceComponent.$attrs.label);
        expect(firstReferenceComponent.$attrs.label).assertEqual('');
        //Confirm target component attribute values
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] DefaultFocus is ' + viewObj.$attrs.defaultFocus + ' ');
        expect(viewObj.$attrs.defaultFocus).assertEqual(true);

        await Utils.backOnly();

        await Utils.pushPage(pageConfig);

        expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertEqual(true);
        await Utils.sleep(1000);
        console.info('[' + data.caseTag + '] Press Tab.');

        //Confirm if the focus is on the target component
        let secondComponent: ESObject = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] secondComponent.$attrs.content: ' + secondComponent.$attrs.content);
        expect(secondComponent.$attrs.content).assertEqual('onFocus')
        //Confirm if the focus is on the reference component
        let secondReferenceComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] secondReferenceComponent.$attrs.label: ' +
        secondReferenceComponent.$attrs.label);
        expect(secondReferenceComponent.$attrs.label).assertEqual('');
        //Confirm target component attribute values
        viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] DefaultFocus is ' + viewObj.$attrs.defaultFocus + ' ');
        expect(viewObj.$attrs.defaultFocus).assertEqual(true);

      } else if ('SetFalse' == data.testValue.describe) {
        //Confirm if the focus is on the target component
        let component: ESObject = Utils.getComponentByKey(data.pageConfig.textComponentKey);
        console.info('[' + data.caseTag + '] component.$attrs.content: ' + component.$attrs.content);
        expect(component.$attrs.content).assertEqual('onFocus');

        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] DefaultFocus is ' + viewObj.$attrs.defaultFocus + ' ');
        expect(viewObj.$attrs.defaultFocus).assertEqual(false);
      }
    })
  })
}