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

export default function GrayscaleTest() {
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
  let pageConfig: ESObject = {
    testName: 'testGrayscale',
    pageName: 'grayscalePage',
    pageUrl: 'MainAbility/pages/grayscale/GrayscalePage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  } as ESObject

  let testValues: ESObject[] = [{
    describe: 'SetGrayscale',
    setValue: {
      grayscale: 0.9
    } as ESObject,
    expectValue: {
      grayscale: 0.9
    } as ESObject
  } as ESObject]

  /**
   * Create test suite.
   */
  describe('grayscaleTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] grayscaleTest');
      console.error('[' + data.caseTag + '] check grayscale.' + ` ${data.testValue.setValue.grayscale}`);
      console.error('[' + data.testValue.expectValue.grayscale + '] expectValue');
      console.error('[' + data.viewObj.$attrs.grayscale + '] viewObj.$attrs.grayscale');
      expect(data.viewObj.$attrs.grayscale).assertEqual(data.testValue.expectValue.grayscale);
    });
  })
}