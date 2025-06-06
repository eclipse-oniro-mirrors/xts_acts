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
import { describe, expect } from '@ohos/hypium'
import { AttrsManager } from '../../MainAbility/common/AttrsManager';

let flexGrow = 3;
let compareFlexGrow = 1;

class TestValue {
  describe: string = '';
  setValue: SetValue = {
    parentWidth: 0,
    parentHeight: 0,
    flexGrow: 0,
    compareFlexGrow: 0,
  };
  expectValue: ESObject;
}

class SetValue {
  parentWidth: number = 0;
  parentHeight: number = 0;
  flexGrow: number = 0;
  compareFlexGrow: number = 0;
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  compareWidth: number = 0;
  compareHeight: number = 0;
  standardWidth: number = 0;
  standardHeight: number = 0;
  standardComponentKey: string = '';
  compareComponentKey: string = '';
  targetWidth: number = 0;
  targetHeight: number = 0;
}

function expectForFlexGrow(space: number, countFlexGrow: number, realRect: number, targetSize: number, data: ESObject) {
  console.info('[' + data.caseTag + '] call the expectForFlexGrow function.');
  console.info('[' + data.caseTag + '] space : ' + space);
  console.info('[' + data.caseTag + '] countFlexGrow : ' + countFlexGrow);
  console.info('[' + data.caseTag + '] realRect : ' + realRect);
  console.info('[' + data.caseTag + '] targetSize : ' + targetSize);
  //Verify based on different parent container spindle directions
  let ratio = countFlexGrow / (flexGrow + compareFlexGrow);
  console.info('[' + data.caseTag + '] (space * ratio) + targetSize : ' + ((space * ratio) + targetSize));
  expect(Math.abs(Math.round(realRect) - Math.round(vp2px((space * ratio) + targetSize))) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] (space * ratio) + targetSize : ' + ((space * ratio) + targetSize));
}


export default function flexGrowTest() {

  let supportView = [
    'AlphabetIndexer',
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
    //    'Flex',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'Search'
  ]

  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']

  let parentWidth = 500;
  let parentHeight = 500;
  let compareWidth = 100;
  let compareHeight = 100;
  let standardWidth = 100;
  let standardHeight = 100;
  let targetWidth = 100;
  let targetHeight = 100;

  let pageConfig: PageConfig = {
    testName: 'testFlexGrow',
    pageName: 'FlexGrowPage',
    pageUrl: 'MainAbility/pages/flex/FlexGrowPage',
    compareWidth: compareWidth,
    compareHeight: compareHeight,
    standardWidth: standardWidth,
    standardHeight: standardHeight,
    standardComponentKey: 'standardComponentKey',
    compareComponentKey: 'compareComponentKey',
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetFlexGrow',
    setValue: {
      parentWidth: parentWidth,
      parentHeight: parentHeight,
      flexGrow: flexGrow,
      compareFlexGrow: compareFlexGrow
    },
    expectValue: {
      flexGrow: flexGrow
    }
  }, {
    describe: 'SpaceNotEnough',
    setValue: {
      parentWidth: 300,
      parentHeight: 300,
      flexGrow: flexGrow,
      compareFlexGrow: compareFlexGrow
    }, expectValue: {
      flexGrow: flexGrow
    }
  }]

  describe('FlexGrowTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, () => {}, async (data: ESObject) => {
      //Get standard component rect in order to judge the standard component size not be changed
      let standardRectBefore = Utils.getComponentRect(data.pageConfig.standardComponentKey);
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Get standard component rect in order to judge the standard component size not be changed
      let standardRectAfter = Utils.getComponentRect(data.pageConfig.standardComponentKey);

      //Get component rect in order to judge the flexGrow attribute take effect
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);

      //Get compare component rect in order to judge the flexGrow attribute take effect
      let compareRect = Utils.getComponentRect(data.pageConfig.compareComponentKey);

      //Verify the flexGrow attribute is set success
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(Math.abs(viewObj.$attrs.flexGrow - data.testValue.expectValue.flexGrow) <= 1).assertTrue();

      //Abnormal case
      if (data.testValue.describe == 'SpaceNotEnough') {
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {
          console.info('[SpaceNotEnough1] rect.right - rect.left : ' + Math.round(rect.right - rect.left));
          console.info('[SpaceNotEnough1] vp2px(targetWidth) : ' + Math.round(vp2px(targetWidth)));
          expect(Math.abs(Math.round(rect.right - rect.left) - Math.round(vp2px(targetWidth))) <= 3).assertTrue();
        } else {
          console.info('[SpaceNotEnough2] rect.bottom - rect.top : ' + Math.round(rect.bottom - rect.top));
          console.info('[SpaceNotEnough2] vp2px(targetHeight) : ' + Math.round(vp2px(targetHeight)));
          expect(Math.abs(Math.round(rect.bottom - rect.top) - Math.round(vp2px(targetHeight))) <= 3).assertTrue();
        }
      } else {
        //Verify the standard component not be changed
        console.info('[' + data.caseTag + '] check standard component rect not changed.');
        expect(Math.abs(standardRectBefore.left - standardRectAfter.left) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.top - standardRectAfter.top) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.bottom - standardRectAfter.bottom) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.right - standardRectAfter.right) <= 1).assertTrue();

        //Verify the target component and compare component, allocate remaining space in the correct proportion
        console.info('[' + data.caseTag + '] check the size of the component in the spindle ' +
          'direction has been changed by flexGrow ');

        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {

          let widthSpace = parentWidth - standardWidth - compareWidth - targetWidth;
          console.info('[' + data.caseTag + '] widthSpace : ' + widthSpace);

          expectForFlexGrow(widthSpace, flexGrow, rect.right - rect.left, targetWidth, data);
          expectForFlexGrow(widthSpace, compareFlexGrow, compareRect.right - compareRect.left, compareWidth, data);
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn'
          || data.pageConfig.containerView == 'FlexColumnReverse') {

          let heightSpace = parentHeight - standardHeight - compareHeight - targetHeight;
          console.info('[' + data.caseTag + '] heightSpace : ' + heightSpace);

          expectForFlexGrow(heightSpace, flexGrow, rect.bottom - rect.top, targetHeight, data);
          expectForFlexGrow(heightSpace, compareFlexGrow, compareRect.bottom - compareRect.top, compareHeight, data);
        }
      }
    })
  })
}