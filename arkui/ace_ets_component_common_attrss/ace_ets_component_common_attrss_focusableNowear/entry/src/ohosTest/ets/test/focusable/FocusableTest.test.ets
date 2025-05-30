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

class TestValue {
  describe: string = '';
  setValue: boolean = false;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  referenceComponentKey: string = '';
}

export default function FocusableTest() {

  //A list of components that support the position attribute, which is required.
  let supportView = [
    
    
     'Select',
    
    'Stepper',
    'StepperItem',
    'TextPicker',
     'TimePicker',
    
     'Web',
   
    
    'SideBarContainer',
    
  
  ]

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testFocusable',
    pageName: 'FocusablePage',
    pageUrl: 'MainAbility/pages/focusable/FocusablePage',
    referenceComponentKey: 'referenceComponentKey'
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'SetTrue',
    setValue: true
  }, {
    describe: 'SetFalse',
    setValue: false
  }]

  /**
   * Create test suite.
   */

  describe('FocusableTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      //Focus the target component
      let res = focusControl.requestFocus(data.pageConfig.componentKey);
      await Utils.sleep(1000);
      console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);

      if ('SetTrue' == data.testValue.describe) {
        //Confirm focus shift
        expect(res).assertEqual(true);
        //Confirm reference component text
        let referenceComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] referenceComponent.$attrs.label: ' + referenceComponent.$attrs.label);
        expect(referenceComponent.$attrs.label).assertContain('onFocus');
        //Confirm target component properties
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] Focusable is ' + viewObj.$attrs.focusable);
        expect(viewObj.$attrs.focusable).assertEqual(true);
      } else if ('SetFalse' == data.testValue.describe) {
        //Confirm focus shift
        expect(res).assertEqual(false);
        //Confirm reference component text
        let referenceComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
        console.info('[' + data.caseTag + '] referenceComponent.$attrs.label: ' + referenceComponent.$attrs.label);
        expect(referenceComponent.$attrs.label).assertEqual('');
        //Confirm target component properties
        let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] Focusable is ' + viewObj.$attrs.focusable);
        expect(viewObj.$attrs.focusable).assertEqual(false);
      }
    })
  })
}