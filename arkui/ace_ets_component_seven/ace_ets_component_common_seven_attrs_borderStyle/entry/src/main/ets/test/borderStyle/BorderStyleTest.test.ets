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
 * Test of common attribute: borderStyle
 */
export default function borderStyleTest() {
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
  let pageConfig = {
    testName: 'testBorderStyle',
    pageName: 'borderStylePage',
    pageUrl: 'MainAbility/pages/borderStyle/BorderStylePage',
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
    describe: 'SetBorderStyle',
    setValue: {
      borderStyle: BorderStyle.Solid,
    },
    expectValue: {
      borderStyle: 'BorderStyle.Solid',
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderStyleTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async data => {
      console.info('[' + data.caseTag + '] borderStyleTest');
      console.info('[' + data.caseTag + '] check borderStyle.' + ` ${data.testValue.setValue.borderStyle}`);
      console.info('[' + data.testValue.expectValue.borderStyle + '] expectValue');
      console.info('[' + data.viewObj.$attrs.borderStyle + '] viewObj.$attrs.borderStyle');
      expect(data.viewObj.$attrs.borderStyle).assertEqual(data.testValue.expectValue.borderStyle);
    });
  })
}