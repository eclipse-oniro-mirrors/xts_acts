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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

export default function ScaleTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'Button',
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testScale',
    pageName: 'scalePage',
    pageUrl: 'MainAbility/pages/scale/ScalePage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues = [{
    describe: 'SetScale',
    setValue: {
      scale: ({
         x: 2, 
         y: 0.5,
         centerX: 18,
         centerY: 23
        })
    },
    expectValue: {
      scale: ({
         x: '2.000000', 
         y: '0.500000',
         centerX: '18.00vp',
         centerY: '23.00vp'
        })
    }
  }]

  /**
   * Create test suite.
   */
  describe('scaleTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] scaleTest');
      console.info('[' + data.caseTag + '] check scale.' + ` ${data.testValue.setValue.scale.x}  ${data.testValue.setValue.scale.y}`);
      expect(data.viewObj.$attrs.scale.x).assertEqual(data.testValue.expectValue.scale.x);
      expect(data.viewObj.$attrs.scale.y).assertEqual(data.testValue.expectValue.scale.y);
      expect(data.viewObj.$attrs.scale.centerY).assertEqual(data.testValue.expectValue.scale.centerY);
      expect(data.viewObj.$attrs.scale.centerX).assertEqual(data.testValue.expectValue.scale.centerX);
    });
  })
}