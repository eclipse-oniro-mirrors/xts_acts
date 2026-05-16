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

/**
 * Test of common attribute: position
 */
export default function positionTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'Blank',
  ]

  //Page related configuration, this parameter is required.
  let pageConfig:ESObject = {
    testName: 'testPosition',
    pageName: 'PositionPage',
    pageUrl: 'MainAbility/pages/position/PositionPage',
  }

  //The data type to be tested, this parameter is required.
  let testValues:ESObject[]= [{
      describe: 'SetPosition',
      setValue: {
        x: 200,
        y: 100
      } as ESObject,
      expectValue: {
        x: '200.00vp',
        y: '100.00vp'
      } as ESObject
    }
  ]

  /**
   * Create test suite.
   */
  describe('positionTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] PositionTest.');
      console.error('[' + data.caseTag + '] check position.' + ` ${data.testValue.setValue.x} ${data.testValue.setValue.y}`);
      expect(data.viewObj.$attrs.position.x).assertEqual(data.testValue.expectValue.x);
      expect(data.viewObj.$attrs.position.y).assertEqual(data.testValue.expectValue.y);
    })
  })
}