/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetComponentHeight: number = 0;
  targetComponentWidth: number = 0;
  referenceComponentKey: string = '';
  referenceText: string = '';
}

class TestValues {
  describe: string = '';
  setValue: number = 0;
  expectValue: ESObject;
}

export default function zIndexTest() {
  let supportView = [
    'Select',
    'Stepper',
    'StepperItem',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;

  let pageConfig: PageConfig = {
    testName: 'testZIndex',
    pageName: 'ZIndexPage',
    pageUrl: 'MainAbility/pages/zIndex/ZIndexPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    referenceComponentKey: 'referenceComponentKey',
    referenceText: 'referenceText'
  }


  let testValues: TestValues[] = [{
    describe: 'SetUpperLayer',
    setValue: 3,
    expectValue: {
      zIndex: 3
    }
  }]

  describe('ZIndexTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      console.info('[' + data.caseTag + ']' + 'zIndex is:' + data.viewObj.$attrs.zIndex);
      expect(data.viewObj.$attrs.zIndex).assertEqual(data.testValue.expectValue.zIndex);
    });
  })
}