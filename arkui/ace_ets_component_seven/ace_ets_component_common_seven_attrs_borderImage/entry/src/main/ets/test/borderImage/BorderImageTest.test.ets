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

export default function BorderImageTest() {
  //A list of components that support the position attribute, which is required.
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
    testName: 'testBorderImage',
    pageName: 'borderImagePage',
    pageUrl: 'MainAbility/pages/borderImage/BorderImagePage',
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
    describe: 'SetBorderImage',
    setValue: {
      borderImage: ({
        source: { angle: 90,
          direction: GradientDirection.Right,
          colors: [[0xAEE1E1, 0.5], [0xD3E0DC, 0.7], [0xFCD1D1, 1.0]]
        },
        slice: 12,
        width: 21,
        repeat: RepeatMode.Repeat,
        outset: 3,
        fill: false
      })
    },
    expectValue: {
      borderImage: ({
        slice: "12.00vp",
        width: "21.00vp",
        repeat:'RepeatMode.Repeat',
        outset: '3.00vp',
        fill: 'false'
      })
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderImageTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] borderImageTest');
      console.info('[' + data.testValue.expectValue.borderImage + '] expectValue');
      console.info('[' + data.viewObj.$attrs.borderImage + '] viewObj.$attrs.borderImage');
      expect(JSON.parse(data.viewObj.$attrs.borderImage).slice).assertEqual(data.testValue.expectValue.borderImage.slice);
      expect(JSON.parse(data.viewObj.$attrs.borderImage).width).assertEqual(data.testValue.expectValue.borderImage.width);
      expect(JSON.parse(data.viewObj.$attrs.borderImage).repeat).assertEqual(data.testValue.expectValue.borderImage.repeat);
      expect(JSON.parse(data.viewObj.$attrs.borderImage).outset).assertEqual(data.testValue.expectValue.borderImage.outset);
      expect(JSON.parse(data.viewObj.$attrs.borderImage).fill).assertEqual(data.testValue.expectValue.borderImage.fill);
    });
  })
}