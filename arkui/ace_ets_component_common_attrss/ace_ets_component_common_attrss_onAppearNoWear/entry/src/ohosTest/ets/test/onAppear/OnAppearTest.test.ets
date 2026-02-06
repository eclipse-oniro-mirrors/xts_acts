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

import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium';

class TestValue {
  describe: string = '';
  expectValue: ESObject;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetGroupView: string = '';
  compareTextKey: string = '';
  targetWidth: number = 0;
  targetHeight: number = 0;
}

export default function onAppearTest() {

  //Component to be tested
  let supportView = [
    'Select',
    'StepperItem',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
   
  ]

  //Custom params.
  let compareTextKey = 'compareTextKey';
  let targetWidth = 60;
  let targetHeight = 60;

  let pageConfig: PageConfig = {
    testName: 'testOnAppear',
    pageName: 'OnAppearPage',
    pageUrl: 'MainAbility/pages/onAppear/OnAppearPage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: '',
    expectValue: {
      changeAppear: 'onAppear'
    }
  }]

  describe('OnAppearTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Get text content,check content is onAppear
      let compareTextObj: ESObject = Utils.getComponentByKey(data.pageConfig.compareTextKey);
      console.info('compareTextObj.$attrs.content: ' + compareTextObj.$attrs.content);
      expect(compareTextObj.$attrs.content).assertEqual(data.testValue.expectValue.changeAppear);
    });
  })
}