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
import { RenderFit } from '@ohos.arkui.component'

/**
 * Test of common attribute: height
 */
export default function backgroundColorTest() {
  
  let supportView = [
    'Button',
  ]

  
  let pageConfig:PageConfig = {
    testName: 'testBackgroudColor',
    pageName: 'backgroundColorPage',
    pageUrl: 'MainAbility/pages/backgroundColor/BackgroundColorPage',
  }

  
  let testValues:TestValue[]= [{
    describe: 'SetBackgroudcolor',
    setValue: {
      backgroundColor: "green"
    },
    expectValue: {
      backgroundColor: "#FF00FF00"
    }
  }]

  /**
   * Create test suite.
   */
  describe('backgroundColorTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.caseTag + ']' + 'backgroundColor is:' + data.viewObj!.getElement('$attrs').getString('backgroundColor'));
      
      console.info('[' + data.caseTag + '] backgroundColorTest.');
      console.info('[' + data.caseTag + '] check backgroundColor.' + ` ${data.testValue.setValue.backgroundColor}`);
      console.info('[' + data.testValue.expectValue.backgroundColor + '] expectValue');
      expect(data.viewObj!.getElement('$attrs').getString('backgroundColor')).assertEqual(data.testValue.expectValue.backgroundColor);
    })
  })
}