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

export default function RotateTest() {
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
  let pageConfig:ESObject = {
    testName: 'testRotate',
    pageName: 'rotatePage',
    pageUrl: 'MainAbility/pages/rotate/RotatePage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues:ESObject[]= [{
    describe: 'SetRotate',
    setValue: {
      rotate: ({
        x: 10,
        y: 11,
        z: 12,
        centerX: '50.00vp',
        centerY: '50.00vp',
        angle: 10,
        perspective: 13
      } as ESObject)
    } as ESObject,
    expectValue: {
      rotate: ({
        x: "10.000000",
        y: "11.000000",
        z: "12.000000",
        centerX: '50.00vp',
        centerY: '50.00vp',
        angle: "10.000000",
        perspective:'13.000000'
      } as ESObject)
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('rotateTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] rotateTest');
      console.info('[' + data.caseTag + '] check rotate.' + ` ${data.testValue.setValue.rotate.x} 
      ${data.testValue.setValue.rotate.y} ${data.testValue.setValue.rotate.z} 
      ${data.testValue.setValue.rotate.centerX} ${data.testValue.setValue.rotate.centerY} 
      ${data.testValue.setValue.rotate.angle}`);
      expect(data.viewObj.$attrs.rotate.x).assertEqual(data.testValue.expectValue.rotate.x);
      expect(data.viewObj.$attrs.rotate.y).assertEqual(data.testValue.expectValue.rotate.y);
      expect(data.viewObj.$attrs.rotate.z).assertEqual(data.testValue.expectValue.rotate.z);
      expect(data.viewObj.$attrs.rotate.centerX).assertEqual(data.testValue.expectValue.rotate.centerX);
      expect(data.viewObj.$attrs.rotate.centerY).assertEqual(data.testValue.expectValue.rotate.centerY);
      expect(data.viewObj.$attrs.rotate.angle).assertEqual(data.testValue.expectValue.rotate.angle);
      expect(data.viewObj.$attrs.rotate.perspective).assertEqual(data.testValue.expectValue.rotate.perspective);
    });
  })
}