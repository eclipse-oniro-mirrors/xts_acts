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
 * Test of common attribute: focusable
 */
export default function focusableTest() {
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
    testName: 'testFocusable',
    pageName: 'focusablePage',
    pageUrl: 'MainAbility/pages/focusable/FocusablePage',
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
    describe: 'SetFocusable',
    setValue: {
      focusable: false
    },
    expectValue: {
      focusable: false
    }
  }]

  /**
   * Create test suite.
   */
  describe('focusableTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.error('[' + data.caseTag + '] focusableTest.');
      console.error('[' + data.caseTag + '] focusableTest. data.testValue.setValue.focusable : ' + data.testValue.setValue.focusable);
      console.error('[' + data.viewObj.$attrs.focusable + '] focusableTest. viewObj.$attrs.focusable.');
      console.error('[' + data.testValue.expectValue.focusable + '] focusableTest. data.testValue.expectValue.focusable.');
      expect(data.viewObj.$attrs.focusable).assertEqual(data.testValue.expectValue.focusable);

    });
  })
}