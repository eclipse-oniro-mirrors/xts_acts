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
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import { jsonx } from "std/core";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;


function expectForFlexGrow(space: number, countFlexGrow: number, realRect: number, targetSize: number, data: BasePageConfig) {
  console.info('[' + data.caseTag + '] call the expectForFlexGrow function.');
  console.info('[' + data.caseTag + '] space : ' + space);
  console.info('[' + data.caseTag + '] countFlexGrow : ' + countFlexGrow);
  console.info('[' + data.caseTag + '] realRect : ' + realRect);
  console.info('[' + data.caseTag + '] targetSize : ' + targetSize);
  //Verify based on different parent container spindle directions
  let ratio = countFlexGrow / (flexGrow + compareFlexGrow);
  console.info('[' + data.caseTag + '] (space * ratio) + targetSize : ' + ((space * ratio) + targetSize));
  expect(Math.abs(Math.round(realRect) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px((space * ratio) + targetSize))) <= 2).assertTrue();
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
    'TextTimer',
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
    beforeAll(() => {
      console.info("flexGrowTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.two.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Get standard component rect in order to judge the standard component size not be changed
      let standardRectBefore = Utils.getComponentRect(data.pageConfig.standardComponentKey);
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      if( data.testValue.setValue.flexShrink){
        AppStorage.setOrCreate<number>('_flexShrink',  data.testValue.setValue.flexShrink!)
      }
      AppStorage.setOrCreate<number>('_parentWidth',  data.testValue.setValue.parentWidth!)
      AppStorage.setOrCreate<number>('_parentHeight', data.testValue.setValue.parentHeight!)
      if(data.testValue.setValue.compareFlexShrink){
        AppStorage.setOrCreate<number>('_compareFlexShrink', data.testValue.setValue.compareFlexShrink!)
      }
      if(data.testValue.setValue.standardFlexShrink){
        AppStorage.setOrCreate<number>('_standardFlexShrink',  data.testValue.setValue.standardFlexShrink!)
      }
      if(data.testValue.setValue.flexGrow){
        AppStorage.setOrCreate<number>('_flexGrow',  data.testValue.setValue.flexGrow!)
      }
      AppStorage.setOrCreate<number>('_parentWidth',  data.testValue.setValue.parentWidth!)
      AppStorage.setOrCreate<number>('_parentHeight',  data.testValue.setValue.parentHeight!)
      if(data.testValue.setValue.flexGrow){
        AppStorage.setOrCreate<number>('_compareFlexGrow', data.testValue.setValue.compareFlexGrow!)
      }
      await Utils.sleep(1000);

      //Get standard component rect in order to judge the standard component size not be changed
      let standardRectAfter = Utils.getComponentRect(data.pageConfig.standardComponentKey);

      //Get component rect in order to judge the flexGrow attribute take effect
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);

      //Get compare component rect in order to judge the flexGrow attribute take effect
      let compareRect = Utils.getComponentRect(data.pageConfig.compareComponentKey);

      //Verify the flexGrow attribute is set success
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(Math.abs(viewObj.getElement('$attrs').getDouble('flexGrow') - data.testValue.expectValue.flexGrow) <= 1).assertTrue();

      //Abnormal case
      if (data.testValue.describe == 'SpaceNotEnough') {
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {
          console.info('[SpaceNotEnough1] rect.right - rect.left : ' + Math.round(rect.right - rect.left));
          console.info('[SpaceNotEnough1] vp2px(targetWidth) : ' + Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetWidth)));
          expect(Math.abs(Math.round(rect.right - rect.left) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetWidth))) <= 3).assertTrue();
        } else {
          console.info('[SpaceNotEnough2] rect.bottom - rect.top : ' + Math.round(rect.bottom - rect.top));
          console.info('[SpaceNotEnough2] vp2px(targetHeight) : ' + Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetHeight)));
          expect(Math.abs(Math.round(rect.bottom - rect.top) - Math.round(AppStorage.get<UIContext>("uiContext")!.vp2px(targetHeight))) <= 3).assertTrue();
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