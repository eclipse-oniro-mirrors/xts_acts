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

/**
 * Test of common attribute: hoverEffect
 */
export default function hoverEffectTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testHoverEffect',
    pageName: 'HoverEffectPage',
    pageUrl: 'MainAbility/pages/hoverEffect/HoverEffectPage',
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
  let testValues = [{
    describe: 'SetHoverEffect',
    setValue: {
      hoverEffect: HoverEffect.Scale
    },
    expectValue: {
      hoverEffect: 'HoverEffect.Scale'
    }
  }]

  /**
   * Create test suite.
   */
  describe('hoverEffectTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'hoverEffect is:' + data.viewObj.$attrs.hoverEffect);
      expect(data.viewObj.$attrs.hoverEffect)
        .assertEqual(data.testValue.expectValue.hoverEffect);
    });
  })
}