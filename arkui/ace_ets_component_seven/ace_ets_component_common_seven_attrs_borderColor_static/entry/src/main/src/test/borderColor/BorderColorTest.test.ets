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

/**
 * Test of common attribute: BorderColor
 */
export default function borderColorTest() {
  
  let supportView = [
    'Button',
  ]

  
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
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

  let testValues:TestValue[]= [{
    describe: 'SetBorderColor',
    setValue: {
      borderColor: '#FFFF0012'
    },
    expectValue: {
      borderColor: '#FFFF0012'
    }
  }]

  /**
   * Create test suite.
   */
  describe('borderColorTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.caseTag + '] borderColorTest.');
      console.info('[' + data.caseTag + '] borderColorTest. data.testValue.setValue.borderColor : ' + data.testValue.setValue.borderColor);
      console.info('[' + data.viewObj!.getElement('$attrs').getString('borderColor') + '] borderColorTest. viewObj.$attrs.borderColor.');
      console.info('[' + data.testValue.expectValue.borderColor + '] borderColorTest. data.testValue.expectValue.borderColor.');
      expect(data.viewObj!.getElement('$attrs').getString('borderColor')).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj!.getElement('$attrs').getString('borderColor')).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj!.getElement('$attrs').getString('borderColor')).assertEqual(data.testValue.expectValue.borderColor);
      expect(data.viewObj!.getElement('$attrs').getString('borderColor')).assertEqual(data.testValue.expectValue.borderColor);
    });
  })
}