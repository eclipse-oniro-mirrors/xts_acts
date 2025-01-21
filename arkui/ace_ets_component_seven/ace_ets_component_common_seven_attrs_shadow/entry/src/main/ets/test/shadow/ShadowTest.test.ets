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
 * Test of common attribute: shadow
 */
export default function shadowTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Blank',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testShadow',
    pageName: 'shadowPage',
    pageUrl: 'MainAbility/pages/shadow/ShadowPage',
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
    describe: 'SetShadow',
    setValue: {
      shadow: ({ radius: 20, color: '#FF0000FF', offsetX: 30, offsetY: 40, type: ShadowType.BLUR, fill: true }),
    },
    expectValue: {
      shadow: ({ radius: '20.000000', color: '#FF0000FF', offsetX: '30.000000', offsetY: '40.000000', type: '1', fill: '1' }),
    }
  }]

  /**
   * Create test suite.
   */
  describe('shadowTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] shadowTest');
      console.info('[' + data.caseTag + '] check shadow.' + ` ${data.testValue.setValue.shadow.radius} 
      ${data.testValue.setValue.shadow.offsetX} ${data.testValue.setValue.shadow.color}  ${data.testValue.setValue.shadow.offsetY} `);
      console.info('[' + data.testValue.expectValue.shadow + '] expectValue');
      console.info('[' + data.viewObj.$attrs.shadow + '] viewObj.$attrs.shadow');
      expect(data.viewObj.$attrs.shadow.radius).assertEqual(data.testValue.expectValue.shadow.radius);
      expect(data.viewObj.$attrs.shadow.color).assertEqual(data.testValue.expectValue.shadow.color);
      expect(data.viewObj.$attrs.shadow.offsetX).assertEqual(data.testValue.expectValue.shadow.offsetX);
      expect(data.viewObj.$attrs.shadow.offsetY).assertEqual(data.testValue.expectValue.shadow.offsetY);
      expect(data.viewObj.$attrs.shadow.type).assertEqual(data.testValue.expectValue.shadow.type);
      expect(data.viewObj.$attrs.shadow.fill).assertEqual(data.testValue.expectValue.shadow.fill);
    });
  })
}