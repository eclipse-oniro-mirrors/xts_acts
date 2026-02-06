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
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import {GlobalContext} from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
export default function AlignContent_Start_FlexP_Fixed_Margin() {

  describe('AlignContent_Start_FlexP_Fixed_Margin', () => {
    beforeAll(() => {
      console.info("AlignContent_Start_FlexP_Fixed_Margin beforeEach start");
      
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_Start_FlexP_Fixed_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_Start_FlexP_Fixed_Margin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_Start_FlexP_Fixed_Margin state pages:" + JSON.stringify(pages));
        if (!("AlignContent_Start_FlexP_Fixed_Margin" == pages.name)) {
          console.info("get AlignContent_Start_FlexP_Fixed_Margin pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContent_Start_FlexP_Fixed_Margin page error:" + err);
      }
      console.info("AlignContent_Start_FlexP_Fixed_Margin beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Start_FlexP_Fixed_Margin after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentStartFlexFixedMarginSatisfy_static
     * @tc.name     testAlignContentStartFlexFixedMarginSatisfy_static
     * @tc.desc     testAlignContentStartFlexFixedMarginSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentStartFlexFixedMarginSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexFixedMarginSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 10
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Margin_flex001');
  console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
  console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexStart_flex001: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_4');

      console.log('AlignContent_Start_FlexP_Fixed_Margin_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");

      expect(Math.floor(Math.abs((AlignContentFlexStart_1.top - AlignContentFlexStart_flex001.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.left - AlignContentFlexStart_flex001.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexStart_2.top - AlignContentFlexStart_flex001.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_2.left - AlignContentFlexStart_flex001.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(170)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexStart_2.top - AlignContentFlexStart_3.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_3.bottom)) <= 1).assertTrue();


      console.info('testAlignContentStartFlexFixedMarginSatisfy END');

    });

    

    
    /**
     * @tc.number   testAlignContentStartFlexFixedMarginNoSatisfy_static
     * @tc.name     testAlignContentStartFlexFixedMarginNoSatisfy_static
     * @tc.desc     testAlignContentStartFlexFixedMarginNoSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentStartFlexFixedMarginNoSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexFixedMarginNoSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 100
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Margin_flex001');

      let AlignContentFlexStart_flex002: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Margin_4');

      console.log('AlignContentFlexStartP_fixed_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.floor(Math.abs((AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");

      expect(AlignContentFlexStart_4.bottom).assertLarger(AlignContentFlexStart_flex002.bottom);
      expect(Math.floor(Math.abs((AlignContentFlexStart_3.top - AlignContentFlexStart_1.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.top - AlignContentFlexStart_flex002.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((AlignContentFlexStart_1.left - AlignContentFlexStart_flex002.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1)
        .assertTrue();


      console.info('testAlignContentStartFlexFixedMarginNoSatisfy END');

    });
  })
}
