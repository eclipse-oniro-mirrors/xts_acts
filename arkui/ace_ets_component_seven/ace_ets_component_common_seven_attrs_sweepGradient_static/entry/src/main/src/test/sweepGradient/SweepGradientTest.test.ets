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
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';

/**
 * Test of common attribute: sweepGradient
 */
export default function sweepGradientTest() {
  let supportView = [
    'Button'
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testSweepGradient',
    pageName: 'sweepGradientPage',
    pageUrl: 'MainAbility/pages/sweepGradient/SweepGradientPage',
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
  let testValues: TestValue[] = [{
    describe: 'SetSweepGradient',
    setValue: {
      sweepGradient: {
        center: [20, 30],
        start: 25,
        end: 35,
        colors: [['#FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
        repeating: true
      }
    },
    expectValue: {
      sweepGradient: {
        center: ['20.00vp', '30.00vp'],
        start: '25.00px',
        end: '35.00px',
        colors: [['#FFFF0000', '0.000000'], ['#FF0000FF', '0.300000'], ['#FFFFFF00', '0.500000']],
        repeating: 'true'
      }
    }
  }]

  /**
   * Create test suite.
   */
  describe('sweepGradientTest', () => {
    beforeAll(() => {
      
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.error('[' + data.caseTag + '] sweepGradientTest.');
      console.info('[' + JSON.stringify(data.testValue.expectValue.sweepGradient) + '] expectValue');

      console.info(JSON.stringify(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getArray('center')) +
        ' viewObj.$attrs.sweepGradient123');

      expect(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getArray('center')[0].asString())
        .assertEqual(data.testValue.expectValue.sweepGradient.center[0]);
      expect(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getArray('center')[1].asString())
        .assertEqual(data.testValue.expectValue.sweepGradient.center[1]);
      expect(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getString('start'))
        .assertEqual(data.testValue.expectValue.sweepGradient.start);
      expect(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getString('end'))
        .assertEqual(data.testValue.expectValue.sweepGradient.end);
      const colors1 = data.viewObj!.getElement('$attrs').getElement('sweepGradient').getArray('colors')[0].asArray()
      const color = colors1[0].asString()
      const Transparency = colors1[1].asString()
      expect(color)
        .assertEqual(data.testValue.expectValue.sweepGradient.colors[0][0]);
      expect(data.viewObj!.getElement('$attrs').getElement('sweepGradient').getString('repeating'))
        .assertEqual(data.testValue.expectValue.sweepGradient.repeating);
    });
  })
}