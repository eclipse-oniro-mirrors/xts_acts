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
import { BorderStyle } from '@ohos.arkui.component'

export default function BorderTest() {
  
  let supportView = [
    'Blank',
  ]

  
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:PageConfig = {
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

  let testValues:TestValue[]= [{
    describe: 'SetBorder',
    setValue: {
      border: {
        width: { left: 7, right: 8, top: 14, bottom: 16 },
        color: { left: '#FFE3BBBB', right: '#FFE3BBBF', top: '#FFE3BBBA', bottom: '#FFE3BBBC' },
        radius: { topLeft: 17, topRight: 21, bottomLeft: 70, bottomRight: 20 },
        style: {
          left: BorderStyle.Solid,
          right: BorderStyle.Dashed,
          top: BorderStyle.Dashed,
          bottom: BorderStyle.Dotted
        }
      }
    },
    expectValue: {
      border: {
        width: { left: '7.00vp', right: '8.00vp', top: '14.00vp', bottom: '16.00vp' },
        color: { left: '#FFE3BBBB', right: '#FFE3BBBF', top: '#FFE3BBBA', bottom: '#FFE3BBBC' },
        radius: { topLeft: '17.00vp', topRight: '21.00vp', bottomLeft: '70.00vp', bottomRight: '20.00vp' },
        style: {
          left: 'BorderStyle.Solid',
          right: 'BorderStyle.Dashed',
          top: 'BorderStyle.Dashed',
          bottom: 'BorderStyle.Dotted'
        }
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      
      console.info('[' + data.caseTag + '] borderTest');
      console.info('[' + data.caseTag + '] check border.' + ` ${data.testValue.setValue.border}`);
      console.info('[' + data.testValue.expectValue.border + '] expectValue');
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('width').getString('left')).assertEqual(data.testValue.expectValue.border!.width.left);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('width').getString('right')).assertEqual(data.testValue.expectValue.border!.width.right);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('width').getString('top')).assertEqual(data.testValue.expectValue.border!.width.top);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('width').getString('bottom')).assertEqual(data.testValue.expectValue.border!.width.bottom);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('color').getString('bottom')).assertEqual(data.testValue.expectValue.border!.color.bottom);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('color').getString('top')).assertEqual(data.testValue.expectValue.border!.color.top);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('color').getString('left')).assertEqual(data.testValue.expectValue.border!.color.left);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('color').getString('right')).assertEqual(data.testValue.expectValue.border!.color.right);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('radius').getString('topLeft')).assertEqual(data.testValue.expectValue.border!.radius.topLeft);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('radius').getString('topRight')).assertEqual(data.testValue.expectValue.border!.radius.topRight);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('radius').getString('bottomLeft')).assertEqual(data.testValue.expectValue.border!.radius.bottomLeft);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('radius').getString('bottomRight')).assertEqual(data.testValue.expectValue.border!.radius.bottomRight);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('style').getString('right')).assertEqual(data.testValue.expectValue.border!.style.right);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('style').getString('top')).assertEqual(data.testValue.expectValue.border!.style.top);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('style').getString('left')).assertEqual(data.testValue.expectValue.border!.style.left);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('border')).getElement('style').getString('bottom')).assertEqual(data.testValue.expectValue.border!.style.bottom);
    });
  })
}