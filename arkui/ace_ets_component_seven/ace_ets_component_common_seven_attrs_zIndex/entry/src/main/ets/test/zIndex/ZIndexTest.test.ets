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

export default function zIndexTest() {
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
    testName: 'testZIndex',
    pageName: 'zIndexPage',
    pageUrl: 'MainAbility/pages/zIndex/ZIndexPage',
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
    describe: 'SetUpperLayer',
    setValue: {
      zIndex: 2
    },
    expectValue: {
      zIndex: 2
    }
  }]

  /**
   * Create test suite.
   */
  describe('zIndexTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] zIndexTest');
      console.info('[' + data.caseTag + '] check zIndex.' + ` ${data.testValue.setValue.zIndex}`);
      console.info('[' + data.testValue.expectValue.zIndex + '] expectValue');
      console.info('[' + data.viewObj.$attrs.zIndex + '] viewObj.$attrs.zIndex');
      expect(data.viewObj.$attrs.zIndex).assertEqual(data.testValue.expectValue.zIndex);
    });
  })
}