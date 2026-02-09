'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ShadowType } from '@ohos.arkui.component'

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
  let pageConfig:PageConfig = {
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
  let testValues:TestValue[]= [{
    describe: 'SetShadow',
    setValue: {
      shadow: { radius: 20, color: '#FF0000FF', offsetX: 30, offsetY: 40, type: ShadowType.BLUR, fill: true },
    },
    expectValue: {
      shadow: { radius: '20.000000', color: '#FF0000FF', offsetX: '30.000000', offsetY: '40.000000', type: '1', fill: '1' },
    }
  }]

  /**
   * Create test suite.
   */
  describe('shadowTest', () => {
    beforeAll(() => {
      
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] shadowTest');
      console.info('[' + data.caseTag + '] check shadow.' + ` ${data.testValue.setValue.shadow.radius} 
      ${data.testValue.setValue.shadow.offsetX} ${data.testValue.setValue.shadow.color}  ${data.testValue.setValue.shadow.offsetY} `);
      console.info('[' + data.testValue.expectValue.shadow + '] expectValue');
      console.info('[' + data.viewObj!.getElement('$attrs').getElement('shadow') + '] viewObj.$attrs.shadow');
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('radius')).assertEqual(data.testValue.expectValue.shadow.radius);
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('color')).assertEqual(data.testValue.expectValue.shadow.color);
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('offsetX')).assertEqual(data.testValue.expectValue.shadow.offsetX);
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('offsetY')).assertEqual(data.testValue.expectValue.shadow.offsetY);
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('type')).assertEqual(data.testValue.expectValue.shadow.type);
      expect(data.viewObj!.getElement('$attrs').getElement('shadow').getString('fill')).assertEqual(data.testValue.expectValue.shadow.fill);
    });
  })
}