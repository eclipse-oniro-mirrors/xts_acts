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

export default function BorderTest() {
  //A list of components that support the position attribute, which is required.
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
    testName: 'testBorder',
    pageName: 'borderPage',
    pageUrl: 'MainAbility/pages/border/BorderPage',
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
    describe: 'SetBorder',
    setValue: {
      border: ({
        width: { left: 7, right: 8, top: 14, bottom: 16 },
        color: { left: '#FFE3BBBB', right: '#FFE3BBBF', top: '#FFE3BBBA', bottom: '#FFE3BBBC' },
        radius: { topLeft: 17, topRight: 21, bottomLeft: 70, bottomRight: 20 },
        style: {
          left: BorderStyle.Solid,
          right: BorderStyle.Dashed,
          top: BorderStyle.Dashed,
          bottom: BorderStyle.Dotted
        }
      })
    },
    expectValue: {
      border: ({
        width: { left: '7.00vp', right: '8.00vp', top: '14.00vp', bottom: '16.00vp' },
        color: { left: '#FFE3BBBB', right: '#FFE3BBBF', top: '#FFE3BBBA', bottom: '#FFE3BBBC' },
        radius: { topLeft: '17.00vp', topRight: '21.00vp', bottomLeft: '70.00vp', bottomRight: '20.00vp' },
        style: {
          left: 'BorderStyle.Solid',
          right: 'BorderStyle.Dashed',
          top: 'BorderStyle.Dashed',
          bottom: 'BorderStyle.Dotted'
        }
      })
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] borderTest');
      console.info('[' + data.caseTag + '] check border.' + ` ${data.testValue.setValue.border}`);
      console.info('[' + data.testValue.expectValue.border + '] expectValue');
      expect(JSON.parse(data.viewObj.$attrs.border).width.left).assertEqual(data.testValue.expectValue.border.width.left);
      expect(JSON.parse(data.viewObj.$attrs.border).width.right).assertEqual(data.testValue.expectValue.border.width.right);
      expect(JSON.parse(data.viewObj.$attrs.border).width.top).assertEqual(data.testValue.expectValue.border.width.top);
      expect(JSON.parse(data.viewObj.$attrs.border).width.bottom).assertEqual(data.testValue.expectValue.border.width.bottom);
      expect(JSON.parse(data.viewObj.$attrs.border).color.bottom).assertEqual(data.testValue.expectValue.border.color.bottom);
      expect(JSON.parse(data.viewObj.$attrs.border).color.top).assertEqual(data.testValue.expectValue.border.color.top);
      expect(JSON.parse(data.viewObj.$attrs.border).color.left).assertEqual(data.testValue.expectValue.border.color.left);
      expect(JSON.parse(data.viewObj.$attrs.border).color.right).assertEqual(data.testValue.expectValue.border.color.right);
      expect(JSON.parse(data.viewObj.$attrs.border).radius.topLeft).assertEqual(data.testValue.expectValue.border.radius.topLeft);
      expect(JSON.parse(data.viewObj.$attrs.border).radius.topRight).assertEqual(data.testValue.expectValue.border.radius.topRight);
      expect(JSON.parse(data.viewObj.$attrs.border).radius.bottomLeft).assertEqual(data.testValue.expectValue.border.radius.bottomLeft);
      expect(JSON.parse(data.viewObj.$attrs.border).radius.bottomRight).assertEqual(data.testValue.expectValue.border.radius.bottomRight);
      expect(JSON.parse(data.viewObj.$attrs.border).style.right).assertEqual(data.testValue.expectValue.border.style.right);
      expect(JSON.parse(data.viewObj.$attrs.border).style.top).assertEqual(data.testValue.expectValue.border.style.top);
      expect(JSON.parse(data.viewObj.$attrs.border).style.left).assertEqual(data.testValue.expectValue.border.style.left);
      expect(JSON.parse(data.viewObj.$attrs.border).style.bottom).assertEqual(data.testValue.expectValue.border.style.bottom);
    });
  })
}