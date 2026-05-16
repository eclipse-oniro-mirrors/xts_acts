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
 * Test of common attribute: focusOnTouch
 */
export default function focusOnTouchTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWfocusOnTouchth = 200;
  let targetComponentHeight = 200;
  let parentWfocusOnTouchth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:ESObject = {
    testName: 'testFocusOnTouch',
    pageName: 'FocusOnTouchPage',
    pageUrl: 'MainAbility/pages/focusOnTouch/FocusOnTouchPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWfocusOnTouchth: targetComponentWfocusOnTouchth,
    parentHeight: parentHeight,
    parentWfocusOnTouchth: parentWfocusOnTouchth,
    referenceComponentfocusOnTouch: 'referenceComponentfocusOnTouch',
    parentComponentfocusOnTouch: 'parentComponentfocusOnTouch',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues:ESObject[]= [{
    describe: 'SetFocusOnTouch',
    setValue: {
      focusOnTouch: true
    } as ESObject,
    expectValue: {
      focusOnTouch: true
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('focusOnTouchTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      console.info('[' + data.caseTag + ']' + 'focusOnTouch is:' + data.viewObj.$attrs.focusOnTouch);
      expect(data.viewObj.$attrs.focusOnTouch)
        .assertEqual(data.testValue.expectValue.focusOnTouch);
    });
  })
}