'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue, SetValue} from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RepeatMode, GradientDirection, LinearGradientOptions, BorderImageOption, ResourceColor, Color } from '@ohos.arkui.component'

export default function BorderImageTest() {
  console.log('fkljsdnfkjsdhfjen vgfkl')
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
  let pageConfig:PageConfig = {
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

  let testValues:TestValue[]= [{
    describe: 'SetBorderImage',
    setValue: {
      borderImage: {
        source: {
          angle: 90,
          direction: GradientDirection.Right,
          colors: [[0xAEE1E1, 0.5], [0xD3E0DC, 0.7], [0xFCD1D1, 1.0]]
        },
        slice: 12,
        width: 21,
        repeat: RepeatMode.Repeat,
        outset: 3,
        fill: false
      }
    },
    expectValue: {
      borderImage: {
        slice: "12.00vp",
        width: "21.00vp",
        repeat:'RepeatMode.Repeat',
        outset: '3.00vp',
        fill: 'false'
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderImageTest', () => {
    beforeAll(() => {
      console.log('1111111111')
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] borderImageTest');
      console.info('[' + data.testValue.expectValue.borderImage + '] expectValue');
      console.info('[' + data.viewObj!.getElement('$attrs').getString('borderImage') + '] viewObj.$attrs.borderImage');
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('borderImage')).getString('slice')).assertEqual(data.testValue.expectValue.borderImage!.slice);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('borderImage')).getString('width')).assertEqual(data.testValue.expectValue.borderImage!.width);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('borderImage')).getString('repeat')).assertEqual(data.testValue.expectValue.borderImage!.repeat);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('borderImage')).getString('outset')).assertEqual(data.testValue.expectValue.borderImage!.outset);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('borderImage')).getString('fill')).assertEqual(data.testValue.expectValue.borderImage!.fill);
    });
  })
}