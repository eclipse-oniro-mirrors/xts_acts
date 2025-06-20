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

let compareFlexShrink = 1;
let targetFlexShrink = 9;

class TestValue {
  describe: string = '';
  setValue: SetValue = {
    parentWidth: 0,
    parentHeight: 0,
    flexShrink: 0,
    standardFlexShrink: 0,
    compareFlexShrink: 0,
  };
  expectValue: ESObject;
}

class SetValue {
  parentWidth: number = 0;
  parentHeight: number = 0;
  flexShrink: number = 0;
  standardFlexShrink: number = 0;
  compareFlexShrink: number = 0;
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

function expectForFlexShrink(targetSize: number, space: number, countFlexShrink: number, realRect: number, data: ESObject) {
  console.info('[' + data.caseTag + '] call the expectForFlexShrink function.');
  console.info('[' + data.caseTag + '] space : ' + space);
  console.info('[' + data.caseTag + '] countFlexShrink : ' + countFlexShrink);
  console.info('[' + data.caseTag + '] realRect : ' + realRect);
  console.info('[' + data.caseTag + '] targetSize : ' + targetSize);
  //Verify based on different parent container spindle directions
  let ratio = countFlexShrink / (compareFlexShrink + targetFlexShrink);
  console.info('[' + data.caseTag + '] targetSize - space * ratio : ' + vp2px(targetSize - space * ratio));
  expect(Math.abs(Math.round(realRect) - Math.round(vp2px(targetSize - space * ratio))) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] targetSize - space * ratio : ' + (targetSize - space * ratio));
}

export default function flexShrinkTest() {

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

  let parentWidth = 400;
  let parentHeight = 400;
  let compareWidth = 200;
  let compareHeight = 200;
  let standardWidth = 100;
  let standardHeight = 100;
  let targetWidth = 200;
  let targetHeight = 200;
  let standardFlexShrink = 0;

  let pageConfig: PageConfig = {
    testName: 'testFlexShrink',
    pageName: 'FlexShrinkPage',
    pageUrl: 'MainAbility/pages/flex/FlexShrinkPage',
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
    describe: 'SetFlexShrink',
    setValue: {
      parentWidth: parentWidth,
      parentHeight: parentHeight,
      flexShrink: targetFlexShrink,
      standardFlexShrink: standardFlexShrink,
      compareFlexShrink: compareFlexShrink
    },
    expectValue: {
      flexShrink: targetFlexShrink
    }
  }, {
    describe: 'NoCompressedSize',
    setValue: {
      parentWidth: 500,
      parentHeight: 500,
      flexShrink: targetFlexShrink,
      standardFlexShrink: standardFlexShrink,
      compareFlexShrink: compareFlexShrink
    },
    expectValue: {
      flexShrink: targetFlexShrink
    }
  }]

  describe('FlexShrinkTest', () => {
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, () => {}, async (data: ESObject) => {

      //Get standard component rect in order to judge the standard component size not be changed
      console.info('[' + data.caseTag + '] get standard component rect ' +
        'in order to judge the standard component size not be changed ');
      let standardRectBefore = Utils.getComponentRect(data.pageConfig.standardComponentKey);
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Verify the flexGrow attribute is set success
      console.info('[' + data.caseTag + '] judge the flexGrow attribute is set success ');
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(Math.abs(viewObj.$attrs.flexShrink - data.testValue.expectValue.flexShrink) <= 1).assertTrue();

      //Get compare component rect in order to judge the flexShrink attribute take effect
      console.info('[' + data.caseTag + '] get compare component rect ' +
        'in order to judge the flexShrink attribute take effect ');
      let compareRect = Utils.getComponentRect(data.pageConfig.compareComponentKey);

      //Get standard component rect in order to judge the standard component size not be changed
      console.info('[' + data.caseTag + '] get standard component rect ' +
        'in order to judge the standard component size not be changed ');
      let standardRectAfter = Utils.getComponentRect(data.pageConfig.standardComponentKey);

      //Get component rect in order to judge the flexShrink attribute take effect
      console.info('[' + data.caseTag + '] get component rect ' +
        'in order to judge the flexShrink attribute take effect ');
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);

      //Abnormal case, only judge the flexShrink attribute not take effect
      if (data.testValue.describe == 'NoCompressedSize') {
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {
          expect(Math.abs(Math.round((rect.right - rect.left)) - Math.round(vp2px(targetWidth))) <= 2).assertTrue();
        } else {
          expect(Math.abs(Math.round((rect.bottom - rect.top)) - Math.round(vp2px(targetHeight))) <= 2).assertTrue();
        }
      } else {
        //Verify the standard component not be changed
        console.info('[' + data.caseTag + '] check standard component rect not changed.');
        expect(Math.abs(standardRectBefore.left - standardRectAfter.left) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.top - standardRectAfter.top) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.bottom - standardRectAfter.bottom) <= 1).assertTrue();
        expect(Math.abs(standardRectBefore.right - standardRectAfter.right) <= 1).assertTrue();

        //Verify the target component and the compare component is allocate compressed space in the correct proportion
        console.info('[' + data.caseTag + '] check the size of the component in the spindle ' +
          'direction has been changed by flexShrink ');

        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {

          let widthSpace = standardWidth + compareWidth + targetWidth - parentWidth;
          console.info('[' + data.caseTag + '] widthSpace : ' + widthSpace);

          expectForFlexShrink(targetWidth, widthSpace, targetFlexShrink, rect.right - rect.left, data);
          expectForFlexShrink(compareWidth, widthSpace, compareFlexShrink, compareRect.right - compareRect.left, data);
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn'
          || data.pageConfig.containerView == 'FlexColumnReverse') {

          let heightSpace = standardHeight + compareHeight + targetHeight - parentHeight;
          console.info('[' + data.caseTag + '] heightSpace : ' + heightSpace);

          expectForFlexShrink(targetHeight, heightSpace, targetFlexShrink, rect.bottom - rect.top, data);
          expectForFlexShrink(compareHeight, heightSpace, compareFlexShrink,
            compareRect.bottom - compareRect.top, data);
        }
      }
    })
  })

}