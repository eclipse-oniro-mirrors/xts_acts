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
import Utils from '../../MainAbility/common/Utils';

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetGroupView: string = '';
  childWidth: number = 0;
  childHeight: number = 0;
  parentWidth: number = 0;
  parentHeight: number = 0;
}

class TestValue {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

export default function layoutWeightTest() {
  let supportView = [
    'Select',
    'Stepper',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  ]
  let childWidth = 100;
  let childHeight = 100;
  let parentWidth = 400;
  let parentHeight = 600;
  let pageConfig: PageConfig = {
    testName: 'testLayoutWeight',
    pageName: 'LayoutWeightPage',
    pageUrl: 'MainAbility/pages/layoutWeight/LayoutWeightPage',
    targetGroupView: 'targetGroupView',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      layoutWeight: 2
    },
    expectValue: {
      layoutWeight: 2,
      height: vp2px(400)
    }
  }, {
    describe: 'SetNumberDecimal',
    setValue: {
      layoutWeight: 2.5
    },
    expectValue: {
      layoutWeight: 2,
      height: vp2px(400)
    }
  }, {
    describe: 'SetString',
    setValue: {
      layoutWeight: '2'
    },
    expectValue: {
      layoutWeight: 2,
      height: vp2px(400)
    }
  }]

  describe('LayoutWeightTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //Component width and height calculation
      let height = rect.bottom - rect.top;
      console.info('[' + data.caseTag + ']' + 'rect.bottom is:' + JSON.stringify(rect.bottom));
      console.info('[' + data.caseTag + ']' + 'rect.top is:' + JSON.stringify(rect.top));
      console.info('[' + data.caseTag + ']' + 'getComponentRect is height:' + JSON.stringify(height));
      console.info('[' + data.caseTag + ']' + 'layoutWeight is:' + data.viewObj.$attrs.layoutWeight);
      expect(data.viewObj.$attrs.layoutWeight).assertEqual(data.testValue.expectValue.layoutWeight);
      expect(Math.abs(height - data.testValue.expectValue.height) <= 1).assertTrue();
    });
  })
}