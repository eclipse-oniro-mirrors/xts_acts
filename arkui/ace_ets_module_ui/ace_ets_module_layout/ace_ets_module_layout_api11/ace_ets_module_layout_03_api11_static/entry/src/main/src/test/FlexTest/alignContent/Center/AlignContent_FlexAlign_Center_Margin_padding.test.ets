'use static';
/**
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager'
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function AlignContent_FlexAlign_Center_Margin_padding() {

  describe('AlignContent_FlexAlign_Center_Margin_padding', () => {
    beforeAll(() => {
      console.info("AlignContent_FlexAlign_Center_Margin_padding beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_FlexAlign_Center_Margin_padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_FlexAlign_Center_Margin_padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_FlexAlign_Center_Margin_padding state pages:" + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Center_Margin_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Center_Margin_padding pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Center_Margin_padding page error:" + err);
      }
      console.info("AlignContent_FlexAlign_Center_Margin_padding beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)

      console.info("AlignContent_FlexAlign_Center_Margin_padding after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentCenterFlexMargin&PaddingNOSatisfy_static
     * @tc.name     testAlignContentCenterFlexMargin&PaddingNOSatisfy_static
     * @tc.desc     testAlignContentCenterFlexMargin&PaddingNOSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentCenterFlexMargin&PaddingNOSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentCenterFlexMargin&PaddingNOSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 40
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexCenterMargin&padding_flex001');

      let Center_Margin_Column_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_Column_1');
      let AlignContentFlexCenter_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenterMargin&padding_flex001_4');

      console.log('AlignContentFlexCenterMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));
      console.log('AlignContentFlexCenterMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenterMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenterMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenterMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex001.top - Center_Margin_Column_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - Center_Margin_Column_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.bottom) <= 1).assertTrue();
      expect(AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom).assertLess(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)));

      console.info('testAlignContentCenterFlexMargin&PaddingNOSatisfy END');

    });

    

    
    /**
     * @tc.number   testAlignContentCenterFlexMargin&PaddingSatisfy_static
     * @tc.name     testAlignContentCenterFlexMargin&PaddingSatisfy_static
     * @tc.desc     testAlignContentCenterFlexMargin&PaddingSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentCenterFlexMargin&PaddingSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentCenterFlexMargin&PaddingSatisfy START');
      
      
      
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 15
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexCenterMargin&padding_flex001');

      let Center_Margin_Column_2: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_Column_1');
      let AlignContentFlexCenter_flex002: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc
        .getComponentRect('AlignContentFlexCenterMargin&padding_flex001_4');

      console.log('AlignContentFlexCenterMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002));
      console.log('AlignContentFlexCenterMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenterMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenterMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenterMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex002.top - Center_Margin_Column_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - Center_Margin_Column_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40))) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_flex002.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.bottom) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))) <= 1)
        .assertTrue();

      console.info('testAlignContentCenterFlexMargin&PaddingSatisfy END')

    });

  })
}
