'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign} from '@ohos.arkui.component';
import { jsonx } from "std/core";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let compareFlexShrink = 1;
let targetFlexShrink = 9;


function expectForFlexShrink(targetSize: number, space: number, countFlexShrink: number, realRect: number, data: BasePageConfig) {
  console.info('[' + data.caseTag + '] call the expectForFlexShrink function.');
  console.info('[' + data.caseTag + '] space : ' + space);
  console.info('[' + data.caseTag + '] countFlexShrink : ' + countFlexShrink);
  console.info('[' + data.caseTag + '] realRect : ' + realRect);
  console.info('[' + data.caseTag + '] targetSize : ' + targetSize);
  //Verify based on different parent container spindle directions
  let ratio = countFlexShrink / (compareFlexShrink + targetFlexShrink);
  console.info('[' + data.caseTag + '] targetSize - space * ratio : ' + AppStorage.get<UIContext>("uiContext")!.vp2px(targetSize - space * ratio));
  expect(Math.abs(Math.round(realRect) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetSize - space * ratio))) <= 2).assertTrue();
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
    'TextTimer',
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
    beforeAll(() => {
      console.info("FlexShrinkTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.three.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      //Get standard component rect in order to judge the standard component size not be changed
      console.info('[' + data.caseTag + '] get standard component rect ' +
        'in order to judge the standard component size not be changed ');
      let standardRectBefore = Utils.getComponentRect(data.pageConfig.standardComponentKey);
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      if( data.testValue.setValue.flexShrink){
        AppStorage.setOrCreate<number>('_flexShrink',  data.testValue.setValue.flexShrink!)
      }
      AppStorage.setOrCreate<number>('_parentWidth',  data.testValue.setValue.parentWidth)
      AppStorage.setOrCreate<number>('_parentHeight', data.testValue.setValue.parentHeight)
      if(data.testValue.setValue.compareFlexShrink){
        AppStorage.setOrCreate<number>('_compareFlexShrink', data.testValue.setValue.compareFlexShrink!)
      }
      if(data.testValue.setValue.standardFlexShrink){
        AppStorage.setOrCreate<number>('_standardFlexShrink',  data.testValue.setValue.standardFlexShrink!)
      }
      if(data.testValue.setValue.flexGrow){
        AppStorage.setOrCreate<number>('_flexGrow',  data.testValue.setValue.flexGrow!)
      }
      AppStorage.setOrCreate<number>('_parentWidth',  data.testValue.setValue.parentWidth)
      AppStorage.setOrCreate<number>('_parentHeight',  data.testValue.setValue.parentHeight)
      if(data.testValue.setValue.flexGrow){
        AppStorage.setOrCreate<number>('_compareFlexGrow', data.testValue.setValue.compareFlexGrow!)
      }

      await Utils.sleep(1000);

      //Verify the flexGrow attribute is set success
      console.info('[' + data.caseTag + '] judge the flexGrow attribute is set success ');
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(Math.abs(viewObj.getElement('$attrs').getDouble('flexShrink') - data.testValue.expectValue.flexShrink) <= 1).assertTrue();

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
          expect(Math.abs(Math.round((rect.right - rect.left)) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetWidth))) <= 2).assertTrue();
        } else {
          expect(Math.abs(Math.round((rect.bottom - rect.top)) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetHeight))) <= 2).assertTrue();
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