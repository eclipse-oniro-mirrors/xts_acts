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
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue, SetValue} from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

/**
 * Test of common attribute: width
 */
export default function widthTest() {
  //A list of components that support width attributes is required.
  console.info('WidthTest  ======= list+start')
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testWidth',
    pageName: 'WidthPage',
    pageUrl: 'MainAbility/pages/width/WidthPage',
  }

  //The data type to be tested, this parameter is required.
  let testValues:TestValue[]= [{
    describe: 'SetWidth',
    setValue: {
      width: 100
    },
    expectValue: {
      width: "100.00vp"
    }
  }]

  /**
   * Create test suite.
   */
  describe('WidthTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    beforeAll(() => {
      
      console.info('WidthTest  ======= start')
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] widthTest');
      console.info('[' + data.caseTag + '] check width_value' + ` ${data.testValue.expectValue.width}`);
      console.info('[' + data.caseTag + '] check width.' + data.viewObj!.getElement('$attrs').getString('width'));
      expect(data.viewObj!.getElement('$attrs').getString('width')).assertEqual(data.testValue.expectValue.width);
    })
  })
}