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
 * Test of common attribute: BorderColor
 */
export default function borderColorTest() {
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
  let pageConfig:ESObject = {
    testName: 'testBorderColor',
    pageName: 'borderColorPage',
    pageUrl: 'MainAbility/pages/borderColor/BorderColorPage',
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
    describe: 'SetBorderColor',
    setValue: {
      borderColor: '#FFFF0012'
    } as ESObject,
    expectValue: {
      borderColor: '#FFFF0012'
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('borderColorTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      console.info('[' + data.caseTag + '] borderColorTest.');
      console.info('[' + data.caseTag + '] borderColorTest. data.testValue.setValue.borderColor : ' + data.testValue.setValue.borderColor);
      console.info('[' + data.viewObj.$attrs.borderColor + '] borderColorTest. viewObj.$attrs.borderColor.');
      console.info('[' + data.testValue.expectValue.borderColor + '] borderColorTest. data.testValue.expectValue.borderColor.');
      expect(data.viewObj.$attrs.borderColor.left).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj.$attrs.borderColor.right).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj.$attrs.borderColor.top).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj.$attrs.borderColor.bottom).assertEqual(data.testValue.expectValue.borderColor);
    });
  })
}