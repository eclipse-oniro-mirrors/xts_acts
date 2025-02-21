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
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

/**
 * Test of common attribute: touchable
 */
export default function touchableTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWtouchableth = 200;
  let targetComponentHeight = 200;
  let parentWtouchableth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testTouchable',
    pageName: 'TouchablePage',
    pageUrl: 'MainAbility/pages/touchable/TouchablePage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWtouchableth: targetComponentWtouchableth,
    parentHeight: parentHeight,
    parentWtouchableth: parentWtouchableth,
    referenceComponenttouchable: 'referenceComponenttouchable',
    parentComponenttouchable: 'parentComponenttouchable',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues = [{
    describe: 'SetTouchable',
    setValue: {
      touchable: true
    },
    expectValue: {
      touchable: true
    }
  }]

  /**
   * Create test suite.
   */
  describe('touchableTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'touchable is:' + data.viewObj.$attrs.touchable);
      expect(data.viewObj.$attrs.touchable)
        .assertEqual(data.testValue.expectValue.touchable);
    });
  })
}