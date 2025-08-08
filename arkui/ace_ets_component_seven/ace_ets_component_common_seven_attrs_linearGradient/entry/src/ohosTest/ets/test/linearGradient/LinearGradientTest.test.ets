/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import Utils from '../../MainAbility/common/Utils';

/**
 * Test of common attribute: linearGradient
 */
export default function linearGradientTest() {
  let supportView = [
    'Button'
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:ESObject = {
    testName: 'testLinearGradient',
    pageName: 'linearGradientPage',
    pageUrl: 'MainAbility/pages/linearGradient/LinearGradientPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues:ESObject[]= [{
    describe: 'SetLinearGradient',
    setValue: {
      linearGradient: ({
        direction: GradientDirection.Right,
        repeating: true,
        colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
        angle: 10
        } as ESObject)
    } as ESObject,
    expectValue: {
      linearGradient: ({
        direction: 'GradientDirection.Right',
        repeating: 'true',
        colors: [['#FF0000FF','0.300000'],['#FFFFFF00','0.500000']],
        angle: '10.00px'
        } as ESObject)
    } as ESObject
  } as ESObject]

  /**
   * Create test suite.
   */
  describe('linearGradientTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      console.info('[' + data.caseTag + '] linearGradientTest.');
      console.info('[' + data.caseTag + '] linearGradientTest. : ' + ` ${data.testValue.setValue.linearGradient.direction}`);
      console.info('[' + data.caseTag + '] linearGradientTest. : ' + ` ${data.testValue.setValue.linearGradient.repeating}`);
      console.info('[' + data.caseTag + '] linearGradientTest. : ' + ` ${data.testValue.setValue.linearGradient.colors}`);
      console.info('[' + data.caseTag + '] linearGradientTest. : ' + ` ${data.testValue.setValue.linearGradient.angle}`);
      console.info('[' + JSON.stringify(data.testValue.expectValue.linearGradient) + '] expectValue');
      console.info('[' + JSON.stringify(data.viewObj.$attrs.linearGradient) + '] viewObj.$attrs.linearGradient');
      expect(data.viewObj.$attrs.linearGradient.direction).assertEqual(data.testValue.expectValue.linearGradient.direction);
      expect(data.viewObj.$attrs.linearGradient.repeating).assertEqual(data.testValue.expectValue.linearGradient.repeating);
      //expect(JSON.stringify(data.viewObj.$attrs.linearGradient.colors)).assertEqual(JSON.stringify(data.testValue.expectValue.linearGradient.colors));
      expect(data.viewObj.$attrs.linearGradient.angle).assertEqual(data.testValue.expectValue.linearGradient.angle);
    });
  })
}
