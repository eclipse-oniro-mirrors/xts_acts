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

export default function BlurTest() {
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
    testName: 'testBlur',
    pageName: 'blurPage',
    pageUrl: 'MainAbility/pages/blur/BlurPage',
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
    describe: 'SetBlur',
    setValue: {
     blur: 20
    },
    expectValue: {
     blur: 20
    }
  }]

  /**
   * Create test suite.
   */
  describe('blurTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] blurTest');
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      console.error('[' + data.caseTag + '] check blur.' + ` ${data.testValue.setValue.blur}`);
      // await Utils.sleep(1000);

      //Confirm that the position attribute value has been set successfully.
      // let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.error('[' + data.testValue.expectValue.blur + '] expectValue');
      console.error('[' + data.viewObj!.getElement('$attrs').getDouble('blur') + '] viewObj.$attrs.blur');
      expect(data.viewObj!.getElement('$attrs').getDouble('blur')).assertEqual(data.testValue.expectValue.blur);
    });
  })
}