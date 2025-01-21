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

/**
 * Test of common attribute: backgroundImageSize
 */
export default function backgroundImageSizeTest() {
  let supportView = [
    'Button'
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testBackgroundImageSize',
    pageName: 'backgroundImageSizePage',
    pageUrl: 'MainAbility/pages/backgroundImageSize/BackgroundImageSizePage',
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
    describe: 'SetBackgroundImageSize',
    setValue: {
      backgroundImageSize: ({ width: '18px', height: '25.5px' })
    },
    expectValue: {
      backgroundImageSize: '{\"width\":\"18.00px\",\"height\":\"25.50px\"}'
    }
  }]

  /**
   * Create test suite.
   */
  describe('backgroundImageSizeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.error('[' + data.caseTag + '] backgroundImageSizeTest.');
      console.error('[' + data.caseTag + '] backgroundImageSizeTest. data.testValue.setValue.backgroundImageSize : ' + data.testValue.setValue.backgroundImageSize);
      console.error('[' + data.viewObj.$attrs.backgroundImageSize + '] backgroundImageSizeTest. viewObj.$attrs.backgroundImageSize.');
      console.error('[' + data.testValue.expectValue.backgroundImageSize + '] backgroundImageSizeTest. data.testValue.expectValue.backgroundImageSize.');
      expect(data.viewObj.$attrs.backgroundImageSize).assertEqual(data.testValue.expectValue.backgroundImageSize);
    });
  })
}