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

export default function BackdropBlurTest() {
  //A list of components that support the backdropBlur attribute, which is required.
  let supportView = [
    'Button',
  ]

  //Custom params.
  let pageConfig: PageConfig = {
    testName: 'testBackdropBlur',
    pageName: 'backdropBlurPage',
    pageUrl: 'MainAbility/pages/backdropBlur/BackdropBlurPage',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }
  let testValues: TestValue[]= [{
    describe: 'SetBackdropBlur',
    setValue: {
      backdropBlur: 2
    },
    expectValue: {
      backdropBlur: 2
    }
  }]

  /**
   * Create test suite.
   */
  describe('backdropBlurTest', () => {
    beforeAll(() => {
      console.info("backdropBlurTest beforeAll start");
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      console.error('[' + data.caseTag + '] backdropBlurTest.');
      console.error('[' + data.caseTag + '] backdropBlurTest. data.testValue.setValue.backdropBlur : ' + data.testValue.setValue.backdropBlur);
      console.error('viewObj.$attrs : ' + data.viewObj!.getElement('$attrs'));
      console.error('[' + data.viewObj!.getElement('$attrs').getDouble('backdropBlur') + '] backdropBlurTest. viewObj.$attrs.backdropBlur.');
      console.error('[' + data.testValue.expectValue.backdropBlur + '] backdropBlurTest. data.testValue.expectValue.backdropBlur.');
      expect(data.viewObj!.getElement('$attrs').getDouble('backdropBlur')).assertEqual(data.testValue.expectValue.backdropBlur);

    })
  })
}