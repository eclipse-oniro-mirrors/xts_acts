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
import udmfType from '@ohos.data.uniformTypeDescriptor';

export default function MouseResponseRegionTest() {
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
    testName: 'testMouseResponseRegion',
    pageName: 'mouseResponseRegionPage',
    pageUrl: 'MainAbility/pages/mouseResponseRegion/MouseResponseRegionPage',
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
    describe: 'SetMouseResponseRegion',
    setValue: {
      mouseResponseRegion: [{ x: 1, y: 1, width: '50%', height: '50%' }]
    },
    expectValue: {
      mouseResponseRegion: [{ x: '1.00vp', y: '1.00vp', width: '50.00%', height: '50.00%' }]
    }
  }]

  /**
   * Create test suite.
   */
  describe('mouseResponseRegionTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'mouseResponseRegion is:' + data.viewObj.$attrs.mouseResponseRegion);
      expect(JSON.parse(data.viewObj.$attrs.mouseResponseRegion[0]).x)
        .assertEqual(data.testValue.expectValue.mouseResponseRegion[0].x);
      expect(JSON.parse(data.viewObj.$attrs.mouseResponseRegion[0]).y)
        .assertEqual(data.testValue.expectValue.mouseResponseRegion[0].y);
      expect(JSON.parse(data.viewObj.$attrs.mouseResponseRegion[0]).width)
        .assertEqual(data.testValue.expectValue.mouseResponseRegion[0].width);
      expect(JSON.parse(data.viewObj.$attrs.mouseResponseRegion[0]).height)
        .assertEqual(data.testValue.expectValue.mouseResponseRegion[0].height);
    });
  })
}