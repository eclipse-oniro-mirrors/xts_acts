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

export default function DefaultFocusTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'Button'
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testDefaultFocus',
    pageName: 'DefaultFocusPage',
    pageUrl: 'MainAbility/pages/defaultFocus/DefaultFocusPage',
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
    describe: 'SetDefaultFocus',
    setValue: {
      defaultFocus: false
    },
    expectValue: {
      defaultFocus: false
    }
  }]

  /**
   * Create test suite.
   */
  describe('defaultFocusTest', () => {
      CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.viewObj.$attrs.defaultFocus + '] defaultFocusTest. viewObj.$attrs.defaultFocus.');
      console.info('[' + data.testValue.expectValue.defaultFocus + '] defaultFocusTest. data.testValue.expectValue.defaultFocus.');
      expect(data.viewObj.$attrs.defaultFocus).assertEqual(data.testValue.expectValue.defaultFocus);
    });
  })
}