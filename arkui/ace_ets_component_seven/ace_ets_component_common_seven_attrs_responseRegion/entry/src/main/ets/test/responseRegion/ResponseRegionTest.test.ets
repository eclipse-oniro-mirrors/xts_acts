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
 * Test of common attribute: responseRegion
 */
export default function responseRegionTest() {
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
    testName: 'testResponseRegion',
    pageName: 'ResponseRegionPage',
    pageUrl: 'MainAbility/pages/responseRegion/ResponseRegionPage',
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
    describe: 'SetResponseRegion',
    setValue: {
      responseRegion: [{ x: 1.0, y: 2.0, width: '70%', height: '30%' }]
    },
    expectValue: {
      responseRegion: [{ x: '1.00vp', y: '2.00vp', width: '70.00%', height: '30.00%' }]
    }
  }]

  /**
   * Create test suite.
   */
  describe('responseRegionTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.info('[' + data.caseTag + ']' + 'responseRegion is:' + data.viewObj.$attrs.responseRegion);
      expect(JSON.parse(data.viewObj.$attrs.responseRegion[0]).x)
        .assertEqual(data.testValue.expectValue.responseRegion[0].x);
      expect(JSON.parse(data.viewObj.$attrs.responseRegion[0]).y)
        .assertEqual(data.testValue.expectValue.responseRegion[0].y);
      expect(JSON.parse(data.viewObj.$attrs.responseRegion[0]).width)
        .assertEqual(data.testValue.expectValue.responseRegion[0].width);
      expect(JSON.parse(data.viewObj.$attrs.responseRegion[0]).height)
        .assertEqual(data.testValue.expectValue.responseRegion[0].height);
    });
  })
}