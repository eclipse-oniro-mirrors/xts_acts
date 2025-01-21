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
 * Test of common attribute: radialGradient
 */
export default function radialGradientTest() {
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
  let pageConfig = {
    testName: 'testRadialGradient',
    pageName: 'radialGradientPage',
    pageUrl: 'MainAbility/pages/radialGradient/RadialGradientPage',
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
  let testValues = [{
    describe: 'SetRadialGradient',
    setValue: {
      radialGradient: ({
			center: [50, 50],
			radius: 60,
			repeating: true,
			colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 1.0]]
		})
    },
    expectValue: {
      radialGradient: ({
			center: ['50.00vp','50.00vp'],
			radius: '60.00vp',
			repeating: 'true',
			colors: []
		})
    }
  }]

  /**
   * Create test suite.
   */
  describe('radialGradientTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.error('[' + data.caseTag + '] radialGradientTest.');
      console.error('[' + data.caseTag + '] radialGradientTest. data.testValue.setValue.radialGradient : ' + data.testValue.setValue.radialGradient);
      console.info('[' + JSON.stringify(data.testValue.expectValue.radialGradient) + '] expectValue');
      console.info('[' + JSON.stringify(data.viewObj.$attrs.radialGradient) + '] viewObj.$attrs.radialGradient');
      expect(data.viewObj.$attrs.radialGradient.center[0]).assertEqual(data.testValue.expectValue.radialGradient.center[0]);
      expect(data.viewObj.$attrs.radialGradient.center[1]).assertEqual(data.testValue.expectValue.radialGradient.center[1]);
      expect(data.viewObj.$attrs.radialGradient.radius).assertEqual(data.testValue.expectValue.radialGradient.radius);
      //expect(data.viewObj.$attrs.radialGradient.colors).assertEqual(data.testValue.expectValue.radialGradient.colors);
      expect(data.viewObj.$attrs.radialGradient.repeating).assertEqual(data.testValue.expectValue.radialGradient.repeating);

    });
  })
}