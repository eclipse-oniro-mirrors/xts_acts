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

export default function SepiaTest() {
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
    testName: 'testSepia',
    pageName: 'sepiaPage',
    pageUrl: 'MainAbility/pages/sepia/SepiaPage',
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
    describe: 'SetSepia',
    setValue: {
      sepia: 0.5
    } as ESObject,
    expectValue: {
      sepia: 0.5
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('sepiaTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] sepiaTest');
      console.error('[' + data.caseTag + '] check sepia.' + ` ${data.testValue.setValue.sepia}`);
      console.error('[' + data.testValue.expectValue.sepia + '] expectValue');
      console.error('[' + data.viewObj.$attrs.sepia + '] viewObj.$attrs.sepia');
      expect(data.viewObj.$attrs.sepia).assertEqual(data.testValue.expectValue.sepia);
    });
  })
}