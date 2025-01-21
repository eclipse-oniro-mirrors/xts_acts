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
 * Test of common attribute: tabIndex
 */
export default function tabIndexTest() {
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
    testName: 'testTabIndex',
    pageName: 'tabIndexPage',
    pageUrl: 'MainAbility/pages/tabIndex/TabIndexPage',
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
    describe: 'SetTabIndex',
    setValue: {
      tabIndex: 1
    },
    expectValue: {
      tabIndex: 1
    }
  }]

  /**
   * Create test suite.
   */
  describe('tabIndexTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.error('[' + data.caseTag + '] tabIndexTest.');
      console.error('[' + data.caseTag + '] tabIndexTest. data.testValue.setValue.tabIndex : ' + data.testValue.setValue.tabIndex);
      console.error('[' + data.viewObj.$attrs.tabIndex + '] tabIndexTest. viewObj.$attrs.tabIndex.');
      console.error('[' + data.testValue.expectValue.tabIndex + '] tabIndexTest. data.testValue.expectValue.tabIndex.');
      expect(data.viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue.tabIndex);

    });
  })
}