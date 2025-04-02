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
 * Test of common attribute: borderRadius
 */
export default function BorderRadiusTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Blank',
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testBorderRadius',
    pageName: 'BorderRadiusPage',
    pageUrl: 'MainAbility/pages/borderRadius/BorderRadiusPage',
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
    describe: 'SetBorderRadius',
    setValue: {
      borderRadius: '30.00vp'
    },
    expectValue: {
      borderRadius: '30.00vp',
    }
    }]

  /**
   * Create test suite.
   */
  describe('borderRadiusTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + '] borderRadiusTest.');
      console.info('[' + data.caseTag + '] borderRadiusTest. data.testValue.setValue.borderRadius : ' + data.testValue.setValue.borderRadius);
      console.info('[' + data.viewObj.$attrs.borderRadius + '] borderRadiusTest. viewObj.$attrs.borderRadius.');
      console.info('[' + data.testValue.expectValue.borderRadius + '] borderRadiusTest. data.testValue.expectValue.borderRadius.');
      expect(data.viewObj.$attrs.borderRadius.topLeft).assertEqual(data.testValue.expectValue.borderRadius);
      expect(data.viewObj.$attrs.borderRadius.topRight).assertEqual(data.testValue.expectValue.borderRadius);
      expect(data.viewObj.$attrs.borderRadius.bottomLeft).assertEqual(data.testValue.expectValue.borderRadius);
      expect(data.viewObj.$attrs.borderRadius.bottomRight).assertEqual(data.testValue.expectValue.borderRadius);
    });
  })
}