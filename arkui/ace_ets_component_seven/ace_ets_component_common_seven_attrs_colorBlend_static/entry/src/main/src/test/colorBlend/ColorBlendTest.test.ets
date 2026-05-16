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
import { RepeatMode, GradientDirection,Color } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function ColorBlendTest() {
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
    testName: 'testColorBlend',
    pageName: 'colorBlendPage',
    pageUrl: 'MainAbility/pages/colorBlend/ColorBlendPage',
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
    describe: 'SetColorBlend',
    setValue: {
      colorBlend: '#FF123456'
    },
    expectValue: {
      colorBlend: '#FF123456'
    }
  }]

  /**
   * Create test suite.
   */
  describe('colorBlendTest', () => {

    beforeAll(() => {
      console.info("beforeAll start");

      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });

    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.

      console.error('[' + data.caseTag + '] check colorBlend.' + ` ${data.testValue.setValue.colorBlend}`);
      console.error('[' + data.testValue.expectValue.colorBlend + '] expectValue');
      console.error('[' + data.viewObj!.getElement('$attrs').getString('colorBlend') + '] viewObj.$attrs.colorBlend');
      let strJson = inspector.getInspectorByKey(data.pageConfig.componentKey);
      console.info('strJsonstrJsonstrJson2' + strJson);
      await Utils.sleep(2000);
      let colorBlendStrJson = JSON.parseJsonElement(strJson);
      expect(colorBlendStrJson.getElement('$attrs').getString('colorBlend')).assertEqual(data.testValue.expectValue.colorBlend);

    });
  })
}