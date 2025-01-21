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
import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

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
  let pageConfig = {
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

  let testValues = [{
    describe: 'SetPixelStretchEffect',
    setValue: {
      pixelStretchEffect: {top:20,left:20,right:20,bottom:20 }
    },
    expectValue: {
      pixelStretchEffect: {top:'20.00vp',left:'20.00vp',right:'20.00vp',bottom:'20.00vp' }
    }
  }]

  /**
   * Create test suite.
   */
  describe('pixelStretchEffectTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] PixelStretchEffect');
      console.info('[' + data.caseTag + '] check PixelStretchEffect.' + ` ${data.testValue.setValue.PixelStretchEffect}`);
      console.info('[' + data.testValue.expectValue.PixelStretchEffect + '] expectValue');
      console.info('[' + data.viewObj.$attrs.PixelStretchEffect + '] viewObj.$attrs.PixelStretchEffect');
      expect(data.viewObj.$attrs.pixelStretchEffect.top).assertEqual(data.testValue.expectValue.pixelStretchEffect.top);
      expect(data.viewObj.$attrs.pixelStretchEffect.left).assertEqual(data.testValue.expectValue.pixelStretchEffect.left);
      expect(data.viewObj.$attrs.pixelStretchEffect.right).assertEqual(data.testValue.expectValue.pixelStretchEffect.right);
      expect(data.viewObj.$attrs.pixelStretchEffect.bottom).assertEqual(data.testValue.expectValue.pixelStretchEffect.bottom);
    });
  })
}