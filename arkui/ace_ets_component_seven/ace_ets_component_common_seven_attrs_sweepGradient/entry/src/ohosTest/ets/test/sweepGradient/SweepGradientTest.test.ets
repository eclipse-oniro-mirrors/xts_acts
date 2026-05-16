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

/**
 * Test of common attribute: sweepGradient
 */
export default function sweepGradientTest() {
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
    testName: 'testSweepGradient',
    pageName: 'sweepGradientPage',
    pageUrl: 'MainAbility/pages/sweepGradient/SweepGradientPage',
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
    describe: 'SetSweepGradient',
    setValue: {
      sweepGradient: ({
          center: [20, 30],
          start: 25,
          end: 35,
          colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
          repeating: true
        } as ESObject)
    } as ESObject,
    expectValue: {
      sweepGradient: ({
          center: ['20.00vp','30.00vp'],
          start: '25.00px',
          end: '35.00px',
          colors: [['#FFFF0000', '0.000000'], ['#FF0000FF', '0.300000'], ['#FFFFFF00', '0.500000']],
          repeating: 'true'
        } as ESObject)
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('sweepGradientTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      console.error('[' + data.caseTag + '] sweepGradientTest.');
      console.error('[' + data.caseTag + '] sweepGradientTest. data.testValue.setValue.sweepGradient : ' + `${data.testValue.setValue.sweepGradient}`);
      console.info('[' + JSON.stringify(data.testValue.expectValue.sweepGradient) + '] expectValue');
      console.info('[' + JSON.stringify(data.viewObj.$attrs.sweepGradient) + '] viewObj.$attrs.sweepGradient');
      expect(data.viewObj.$attrs.sweepGradient.center[0]).assertEqual(data.testValue.expectValue.sweepGradient.center[0]);
      expect(data.viewObj.$attrs.sweepGradient.center[1]).assertEqual(data.testValue.expectValue.sweepGradient.center[1]);
      expect(data.viewObj.$attrs.sweepGradient.start).assertEqual(data.testValue.expectValue.sweepGradient.start);
      expect(data.viewObj.$attrs.sweepGradient.end).assertEqual(data.testValue.expectValue.sweepGradient.end);
      //expect(data.viewObj.$attrs.sweepGradient.colors).assertEqual(data.testValue.expectValue.sweepGradient.colors);
      expect(data.viewObj.$attrs.sweepGradient.repeating).assertEqual(data.testValue.expectValue.sweepGradient.repeating);
    });
  })
}