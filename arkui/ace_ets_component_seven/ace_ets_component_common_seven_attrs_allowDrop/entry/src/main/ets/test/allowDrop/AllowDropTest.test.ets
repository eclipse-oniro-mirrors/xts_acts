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
import udmfType from '@ohos.data.uniformTypeDescriptor';

export default function AllowDropTest() {
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
    testName: 'testAllowDrop',
    pageName: 'allowDropPage',
    pageUrl: 'MainAbility/pages/allowDrop/AllowDropPage',
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
    describe: 'SetAllowDrop',
    setValue: {
      allowDrop: [udmfType.UniformDataType.IMAGE]
    },
    expectValue: {
      allowDrop: ["general.image"]
    }
  }]

  /**
   * Create test suite.
   */
  describe('allowDropTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      //Modify the target component properties.
      console.error('[' + data.caseTag + '] allowDropTest');
      console.error('[' + data.caseTag + '] check allowDrop.' + ` ${data.testValue.setValue.allowDrop}`);
      console.error('[' + data.testValue.expectValue.allowDrop + '] expectValue');
      console.error('[' + data.viewObj.$attrs.allowDrop + '] viewObj.$attrs.allowDrop');
      expect(data.viewObj.$attrs.allowDrop).assertEqual(data.testValue.expectValue.allowDrop);

    });
  })
}