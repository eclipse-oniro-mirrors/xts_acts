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
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import Utils from '../../MainAbility/common/Utils';

export default function BackdropBlurTest() {
  //A list of components that support the backdropBlur attribute, which is required.
  let supportView = [
    'Button',
  ]

  //Custom params.
  let pageConfig:ESObject = {
    testName: 'testBackdropBlur',
    pageName: 'backdropBlurPage',
    pageUrl: 'MainAbility/pages/backdropBlur/BackdropBlurPage',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }
  let testValues:ESObject[]= [{
    describe: 'SetBackdropBlur',
    setValue: {
      backdropBlur: 2
    } as ESObject,
    expectValue: {
      backdropBlur: 2
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('backdropBlurTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] backdropBlurTest.');
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      console.error('[' + data.caseTag + '] backdropBlurTest. data.testValue.setValue.backdropBlur : ' + data.testValue.setValue.backdropBlur);
      // await Utils.sleep(5000);

      //Confirm that the backdropBlur attribute value has been set successfully.
      // let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.error('[' + data.viewObj.$attrs.backdropBlur + '] backdropBlurTest. viewObj.$attrs.backdropBlur.');
      console.error('[' + data.testValue.expectValue.backdropBlur + '] backdropBlurTest. data.testValue.expectValue.backdropBlur.');
      expect(data.viewObj.$attrs.backdropBlur).assertEqual(data.testValue.expectValue.backdropBlur);

    })
  })
}