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

class TestValue {
  describe: string = '';
  setValue: number = 0;
  expectValue: ESObject;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetComponentHeight: number = 0;
  targetComponentWidth: number = 0;
  parentHeight: number = 0;
  parentWidth: number = 0;
  referenceComponentKey: string = '';
  parentComponentKey: string = '';
  gutter: number = 0;
  columns: number = 0;
}

export default function gridOffsetTest() {
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
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testGridOffset',
    pageName: 'GridOffsetPage',
    pageUrl: 'MainAbility/pages/gridOffset/GridOffsetPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: 2,
    expectValue: {
      gridOffset: 2
    }
  }]

  describe('GridOffsetTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      console.info('[' + data.caseTag + ']' + 'gridOffset is:' + data.viewObj.$attrs.gridOffset);
      expect(data.viewObj.$attrs.gridOffset)
        .assertEqual(data.testValue.expectValue.gridOffset);
    });
  })
}