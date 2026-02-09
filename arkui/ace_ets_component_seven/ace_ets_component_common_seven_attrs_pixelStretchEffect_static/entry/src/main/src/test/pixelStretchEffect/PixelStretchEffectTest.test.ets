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
import { beforeAll, describe, expect } from '../../../../hypium/index'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, SetValue, TestValue } from '../../../ets/MainAbility/common/Utils';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { PixelStretchEffectOptions } from '@ohos.arkui.component'

export default function PixelStretchEffectTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'AlphabetIndexer',
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testPixelStretchEffect',
    pageName: 'pixelStretchEffectPage',
    pageUrl: 'MainAbility/pages/pixelStretchEffect/PixelStretchEffectPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues: TestValue[] = [{
    describe: 'SetPixelStretchEffect',
    setValue: {
      pixelStretchEffect: {
        top: 20,
        left: 20,
        right: 20,
        bottom: 20
      }
    },
    expectValue: {
      pixelStretchEffect: {
        top: '20.00vp',
        left: '20.00vp',
        right: '20.00vp',
        bottom: '20.00vp'
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('pixelStretchEffectTest', () => {
    beforeAll(() => {
      
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      AppStorage.setOrCreate<PixelStretchEffectOptions>('_pixelStretchEffect',
        data.testValue.setValue.pixelStretchEffect)
      console.info('[' + data.caseTag + '] PixelStretchEffect');
      console.info('[' + data.caseTag + '] check PixelStretchEffect.' +
        ` ${data.testValue.setValue.pixelStretchEffect}`);
      console.info('[' + data.testValue.expectValue.pixelStretchEffect + '] expectValue');
      console.info('[' + data.viewObj!.getElement('$attrs').getElement('pixelStretchEffect') +
        '] viewObj.$attrs.PixelStretchEffect');
      expect(data.viewObj!.getElement('$attrs').getElement('pixelStretchEffect').getString('top'))
        .assertEqual(data.testValue.expectValue.pixelStretchEffect.top);
      expect(data.viewObj!.getElement('$attrs').getElement('pixelStretchEffect').getString('left'))
        .assertEqual(data.testValue.expectValue.pixelStretchEffect.left);
      expect(data.viewObj!.getElement('$attrs').getElement('pixelStretchEffect').getString('right'))
        .assertEqual(data.testValue.expectValue.pixelStretchEffect.right);
      expect(data.viewObj!.getElement('$attrs').getElement('pixelStretchEffect').getString('bottom'))
        .assertEqual(data.testValue.expectValue.pixelStretchEffect.bottom);
    });
  })
}