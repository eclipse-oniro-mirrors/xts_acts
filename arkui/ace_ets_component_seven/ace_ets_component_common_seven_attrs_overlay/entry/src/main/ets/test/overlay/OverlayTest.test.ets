/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

export default function OverlayTest() {
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
  let pageConfig = {
    testName: 'testOverlay',
    pageName: 'overlayPage',
    pageUrl: 'MainAbility/pages/overlay/OverlayPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }
  let testValues = [{
    describe: 'SetOverlay',
    setValue: {
      overlay: ({
        value:'Overlay test',
        options: { 
          align: Alignment.Top, 
          offset: { x: 2, y: -15 }
         }
      })
    },
    expectValue: {
      overlay: ({
        value:'Overlay test',
        options: { 
          align: 'Alignment.Top', 
          offset: { x: '2.00vp', y: '-15.00vp' }
         }
      })
    }
  }]

  /**
   * Create test suite.
   */
  describe('overlayTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] overlayTest');
      console.info('[' + data.caseTag + '] check overlay.' + ` ${data.testValue.setValue.overlay.options.align}
      ${data.testValue.setValue.overlay.options.offset.x} ${data.testValue.setValue.overlay.options.offset.y} ${data.testValue.setValue.overlay.value}`);
      console.info('[' + data.testValue.expectValue.overlay + '] expectValue');
      console.info('[' + data.viewObj.$attrs.overlay + '] viewObj.$attrs.overlay');
      expect(data.viewObj.$attrs.overlay.title).assertEqual(data.testValue.expectValue.overlay.value);
      expect(data.viewObj.$attrs.overlay.options.align).assertEqual(data.testValue.expectValue.overlay.options.align);
      expect(data.viewObj.$attrs.overlay.options.offset.x).assertEqual(data.testValue.expectValue.overlay.options.offset.x);
      expect(data.viewObj.$attrs.overlay.options.offset.y).assertEqual(data.testValue.expectValue.overlay.options.offset.y);
    });
  })
}