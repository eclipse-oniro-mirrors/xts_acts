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
import matrix4 from '@ohos.matrix4'

let matrix1 = matrix4.identity()
/**
 * Test of common attribute: transform
 */
export default function transformTest() {
  //A list of components that support padding attributes is required.
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
    testName: 'testTransform',
    pageName: 'transformPage',
    pageUrl: 'MainAbility/pages/transform/TransformPage',
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
    describe: 'SetTransform',
    setValue: {
     transform: matrix1
    } as ESObject,
    expectValue: {
      transform: {
        type: "matrix",
        matrix: "1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,"
      } as ESObject
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('transformTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      console.info('[' + data.caseTag + '] transformTest.');
      console.info('[' + data.caseTag + '] transformTest. data.testValue.setValue.transform : ' + data.testValue.setValue.transform);
      console.info('[' + data.viewObj.$attrs.transform + '] transformTest. viewObj.$attrs.transform.');
      console.info('[' + data.testValue.expectValue.transform + '] transformTest. data.testValue.expectValue.transform.');
      expect(data.viewObj.$attrs.transform.type).assertEqual(data.testValue.expectValue.transform.type);
      expect(data.viewObj.$attrs.transform.matrix).assertEqual(data.testValue.expectValue.transform.matrix);
    });
  })
}