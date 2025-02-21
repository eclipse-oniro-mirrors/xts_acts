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

export default function RenderFitTest() {
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
    testName: 'testRenderFit',
    pageName: 'renderFitPage',
    pageUrl: 'MainAbility/pages/renderFit/RenderFitPage',
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
    describe: 'SetRenderFit',
    setValue: {
      renderFit: RenderFit.BOTTOM
    },
    expectValue: {
      renderFit: 'RenderFit.BOTTOM'
    }
  }]

  /**
   * Create test suite.
   */
  describe('renderFitTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.info('[' + data.caseTag + '] renderFitTest');
      console.info('[' + data.caseTag + '] check renderFit.' + ` ${data.testValue.setValue.renderFit}`);
      console.info('[' + data.testValue.expectValue.renderFit + '] expectValue');
      console.info('[' + data.viewObj.$attrs.renderFit + '] viewObj.$attrs.renderFit');
      expect(data.viewObj.$attrs.renderFit).assertEqual(data.testValue.expectValue.renderFit);
    });
  })
}