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

export default function DefaultFocusTest() {
  
  let supportView = [
    'Button'
  ]

  
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testDefaultFocus',
    pageName: 'DefaultFocusPage',
    pageUrl: 'MainAbility/pages/defaultFocus/DefaultFocusPage',
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
    describe: 'SetDefaultFocus',
    setValue: {
      defaultFocus: false
    },
    expectValue: {
      defaultFocus: false
    }
  }]

  /**
   * Create test suite.
   */
  describe('defaultFocusTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.viewObj!.getElement('$attrs').getBoolean('defaultFocus') + '] defaultFocusTest. viewObj.$attrs.defaultFocus.');
      console.info('[' + data.testValue.expectValue.defaultFocus + '] defaultFocusTest. data.testValue.expectValue.defaultFocus.');
      expect(data.viewObj!.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(data.testValue.expectValue.defaultFocus);
    });
  })
}