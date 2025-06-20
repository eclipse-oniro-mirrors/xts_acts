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

import Utils, { RectValue } from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium';

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetGroupView: string = '';
  parentWidth: number = 0;
  parentHeight: number = 0;
}

class TestValue {
  describe: string = '';
  setValue: ESObject;
  expectValue: ESObject;
}

export default function aspectRatioHeightTest() {

  //Component to be tested
  let supportView = [
    'Select',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'testAspectRatioHeight',
    pageName: 'AspectRatioHeightPage',
    pageUrl: 'MainAbility/pages/aspectRatio/AspectRatioHeightPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      height: 100,
      aspectRatio: 2.0
    },
    expectValue: {
      height: '100.00vp',
      heightValue: vp2px(100),
      aspectRatio: 2.0
    }
  }, {
    describe: 'SetDecimal',
    setValue: {
      height: 100,
      aspectRatio: 0.5
    },
    expectValue: {
      height: '100.00vp',
      heightValue: vp2px(100),
      aspectRatio: 0.5
    }
  }]

  describe('AspectRatioHeightTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      //Gets Rect information for the target component
      let targetRect = Utils.getComponentRect(data.pageConfig.componentKey);
      let targetRectWidth = targetRect.right - targetRect.left;
      let targetRectHeight = targetRect.bottom - targetRect.top;
      let targetRectAspectRatio = targetRectWidth / targetRectHeight;
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.height is:' + data.viewObj.$attrs.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.aspectRatio is:' + data.viewObj.$attrs.aspectRatio);

      //Check height and aspectRatio are set successfully
      expect(data.viewObj.$attrs.height).assertEqual(data.testValue.expectValue.height);
      expect(data.viewObj.$attrs.aspectRatio).assertEqual(data.testValue.expectValue.aspectRatio);
      console.info('[' + data.caseTag + '] targetRectWidth is:' + targetRectWidth);
      console.info('[' + data.caseTag + '] targetRectHeight is:' + targetRectHeight);
      console.info('[' + data.caseTag + '] targetRectAspectRatio:' + targetRectAspectRatio);

      //Check the width, height, and aspectRatio are correct
      expect(Math.floor(Math.abs(targetRectHeight - Math.floor(data.testValue.expectValue.heightValue))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Number(targetRectAspectRatio) - Number(data.testValue.expectValue.aspectRatio))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(targetRectWidth - Math.floor(data.testValue.expectValue.heightValue * data.testValue.expectValue.aspectRatio))) <= 1).assertTrue();
    });
  })
}
