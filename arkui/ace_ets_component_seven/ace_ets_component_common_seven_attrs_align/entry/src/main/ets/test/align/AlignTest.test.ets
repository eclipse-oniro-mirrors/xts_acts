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
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import Utils from '../../MainAbility/common/Utils';

export default function AlignTest() {
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
    testName: 'testAlign',
    pageName: 'alignPage',
    pageUrl: 'MainAbility/pages/align/AlignPage',
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
    describe: 'SetAlign',
    setValue: {
      align: Alignment.TopStart
    },
    expectValue: {
      align: 'Alignment.TopStart'
    }
  }]

  /**
   * Create test suite.
   */
  describe('alignTest', () => {
      CommonTest.initTest(pageConfig, supportView, testValues, async data => {
        //Modify the target component properties.
      //Confirm that the align attribute value has been set successfully.
      console.error('[' + data.viewObj.$attrs.align + '] alignTest. viewObj.$attrs.align.');
      console.error('[' + data.testValue.expectValue.align + '] alignTest. data.testValue.expectValue.align.');
      expect(data.viewObj.$attrs.align).assertEqual(data.testValue.expectValue.align);

    });
  })
}