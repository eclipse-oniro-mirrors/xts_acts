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

import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class TestValue {
  describe: string = '';
  setValue?: boolean
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  referenceComponentKey: string = '';
}

export default function FocusControlTest() {

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
    
    'Menu',
    'MenuItem',
    
    'Radio',
    'Rating',
   
    'Slider',
    
    'Toggle',
    
    'AlphabetIndexer',
    'Column',
    
    'Counter',
    'Flex',
    
    'GridItem',
    'ListItem',
    
    'Row',
    
    'Scroll',
    
    'Stack',
    'Swiper',
    'Tabs',
  
  ]

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testFocusControl',
    pageName: 'FocusControlPage',
    pageUrl: 'MainAbility/pages/focusControl/FocusControlPage',
    referenceComponentKey: 'referenceComponentKey',
  }
  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'SetFocusableTrue',
  }, {
    describe: 'SetFocusableFalse',
    setValue: false
  }, {
    describe: 'SetAbsentComponent',
  }]

  /**
   * Create test suite.
   */

  describe('FocusControlTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {

      if ('SetFocusableTrue' == data.testValue.describe) {
        //Confirm focus shift
        //Focus the target component
        let res = focusControl.requestFocus(data.pageConfig.componentKey);
        expect(res).assertEqual(true);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      } else if ('SetFocusableFalse' == data.testValue.describe) {
        //Confirm focus shift
        //Focus the target component
        let res = focusControl.requestFocus(data.pageConfig.componentKey);
        expect(res).assertEqual(false);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      } else if ('SetAbsentComponent' == data.testValue.describe) {
        //Confirm focus shift
        //Focus the target component
        let res = focusControl.requestFocus('nullKey');
        expect(res).assertEqual(false);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      }
    })
  })
}