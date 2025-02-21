/*
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
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

/**
 * Test of common attribute: height
 */
export default function backgroundColorTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let pageConfig = {
    testName: 'testBackgroudColor',
    pageName: 'backgroundColorPage',
    pageUrl: 'MainAbility/pages/backgroundColor/BackgroundColorPage',
  }

  //The data type to be tested, this parameter is required.
  let testValues = [{
    describe: 'SetBackgroudcolor',
    setValue: {
      backgroundColor: "green"
    },
    expectValue: {
      backgroundColor: "#FF00FF00"
    }
  }]

  /**
   * Create test suite.
   */
  describe('backgroundColorTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'backgroundColor is:' + data.viewObj.$attrs.backgroundColor);
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] backgroundColorTest.');
      console.info('[' + data.caseTag + '] check backgroundColor.' + ` ${data.testValue.setValue.backgroundColor}`);
      console.info('[' + data.testValue.expectValue.backgroundColor + '] expectValue');
      expect(data.viewObj.$attrs.backgroundColor).assertEqual(data.testValue.expectValue.backgroundColor);
    })
  })
}