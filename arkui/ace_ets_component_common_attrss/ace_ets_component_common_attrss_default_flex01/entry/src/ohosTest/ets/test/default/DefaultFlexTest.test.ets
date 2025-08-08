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
  exceptView?: string[];
  expectValue: ESObject;
}

export default function defaultFlexTest() {

  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']

  //Component to be tested
  let supportView = [
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'Navigation',
    'NavRouter',
    'ScrollBar',
    'Row',
    'RelativeContainer',
    'Navigator',
    'TextTimer',
    'Flex',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'Search',
    'Slider'
  ]

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'test',
    pageName: 'DefaultFlexPage',
    pageUrl: 'MainAbility/pages/default/DefaultFlexPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'FlexBasis',
    exceptView: ['Blank'],
    expectValue: {
      flexBasis: 'auto'
    }
  }, {
    describe: 'FlexGrow',
    exceptView: ['Blank'],
    expectValue: {
      flexGrow: 0
    }
  },
    //    {
    //    describe: 'FlexShrink',
    //    exceptView: ['Blank'],
    //    expectValue: {
    //      flexShrinkRowColumn: 0,
    //      flexShrinkFlex: 1
    //    }
    //  },
    {
      describe: 'AlignSelf',
      expectValue: {
        alignSelf: 'ItemAlign.Auto',
        alignSelfBlank: 'ItemAlign.Stretch'
      }
    }]

  describe('DefaultFlexTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: ESObject) => {
      if (data.testValue.describe == 'FlexBasis') {
        // Test flexBasis defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.flexBasis:' + data.viewObj.$attrs.flexBasis);
        expect(data.viewObj.$attrs.flexBasis).assertEqual(data.testValue.expectValue.flexBasis);
      } else if (data.testValue.describe == 'FlexGrow') {
        // Test flexGrow defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.flexGrow:' + data.viewObj.$attrs.flexGrow);
        expect(data.viewObj.$attrs.flexGrow).assertEqual(data.testValue.expectValue.flexGrow);
      } else if (data.testValue.describe == 'FlexShrink') {
        // Test flexShrink defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.flexShrink:' + data.viewObj.$attrs.flexShrink);
        if ((data.pageConfig.containerView == 'Row') || (data.pageConfig.containerView == 'Column')) {
          console.info('[' + data.caseTag + ']data.pageConfig.containerView:' + data.pageConfig.containerView);
          expect(data.viewObj.$attrs.flexShrink).assertEqual(data.testValue.expectValue.flexShrinkRowColumn);
        } else if ((data.pageConfig.containerView == 'FlexRow') || (data.pageConfig.containerView == 'FlexRowReverse')
          || (data.pageConfig.containerView == 'FlexColumn') || (data.pageConfig.containerView == 'FlexColumnReverse')) {
          console.info('[' + data.caseTag + ']data.pageConfig.containerView:' + data.pageConfig.containerView);
          expect(data.viewObj.$attrs.flexShrink).assertEqual(data.testValue.expectValue.flexShrinkFlex);
        }
      } else if (data.testValue.describe == 'AlignSelf') {
        // Test alignSelf defaults
        if (data.pageConfig.componentKey == 'Blank') {
          console.info('[' + data.caseTag + ']data.viewObj.$attrs.alignSelf:' + data.viewObj.$attrs.alignSelf);
          expect(data.viewObj.$attrs.alignSelf).assertEqual(data.testValue.expectValue.alignSelfBlank);
        } else {
          console.info('[' + data.caseTag + ']data.viewObj.$attrs.alignSelf:' + data.viewObj.$attrs.alignSelf);
          expect(data.viewObj.$attrs.alignSelf).assertEqual(data.testValue.expectValue.alignSelf);
        }
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
          + data.pageConfig.componentKey);
      }
    });
  })
}