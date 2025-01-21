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

export default function TranslateTest() {
  //A list of components that support the position attribute, which is required.
  let supportView = [
    'DataPanel',
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testTranslate',
    pageName: 'translatePage',
    pageUrl: 'MainAbility/pages/translate/TranslatePage',
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
    describe: 'SetTranslate',
    setValue: {
      translate: ({ 
        x: 60, 
        y: 70,
        z: 80
      })
    },
    expectValue: {
      translate: ({ 
        x: '60.00vp', 
        y: '70.00vp',
        z: '80.00vp'
      })
    }
  }]

  /**
   * Create test suite.
   */
  describe('translateTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] translateTest');
      console.error('[' + data.caseTag + '] check translate.' + ` ${data.testValue.setValue.translate.x} 
      ${data.testValue.setValue.translate.y} ${data.testValue.setValue.translate.z}`);
      console.error('[' + data.testValue.expectValue.translate + '] expectValue');
      console.error('[' + data.viewObj.$attrs.translate + '] viewObj.$attrs.translate');
      expect(data.viewObj.$attrs.translate.x).assertEqual(data.testValue.expectValue.translate.x);
      expect(data.viewObj.$attrs.translate.y).assertEqual(data.testValue.expectValue.translate.y);
      expect(data.viewObj.$attrs.translate.z).assertEqual(data.testValue.expectValue.translate.z);
    });
  })
}