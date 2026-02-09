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
export default function AlignContent_FlexAlign_Start_padding() {

  describe('AlignContent_FlexAlign_Start_padding', () => {
    beforeAll(() => {
      console.info("AlignContent_FlexAlign_Start_padding beforeEach start");
      
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_FlexAlign_Start_padding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_FlexAlign_Start_padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_FlexAlign_Start_padding state pages:" + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Start_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Start_padding pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Start_padding page error:" + err);
      }
      console.info("AlignContent_FlexAlign_Start_padding beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_Start_padding after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentStartFlexPaddingNoSatisfy_static
     * @tc.name     testAlignContentStartFlexPaddingNoSatisfy_static
     * @tc.desc     testAlignContentStartFlexPaddingNoSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentStartFlexPaddingNoSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexPaddingNoSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 40
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexStartPadding_flex001');

      let AlignContentFlexStart_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_4');

      console.log('AlignContentFlexStartPadding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));

      console.log('AlignContentFlexStartPadding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStartPadding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStartPadding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStartPadding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");

      expect(Math.abs(AlignContentFlexStart_1.top - AlignContentFlexStart_flex001.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_2.bottom) <= 1).assertTrue();

      console.info('testAlignContentStartFlexPaddingNoSatisfy END');

    });

    

    
    /**
     * @tc.number   testAlignContentStartFlexPaddingSatisfy_static
     * @tc.name     testAlignContentStartFlexPaddingSatisfy_static
     * @tc.desc     testAlignContentStartFlexPaddingSatisfy_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentStartFlexPaddingSatisfy_static', Level.LEVEL0, async () => {
      console.info('testAlignContentStartFlexPaddingSatisfy START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 15
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexStartPadding_flex001');

      let AlignContentFlexStartPadding_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001');
      let AlignContentFlexStart_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_1');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexStartPadding_flex001_4');

      console.log('AlignContentFlexStartPadding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStartPadding_flex002))
      console.log('AlignContentFlexStart_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.abs(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");

      expect(Math.abs(AlignContentFlexStart_4.top - AlignContentFlexStart_2.bottom) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexStart_1.top - AlignContentFlexStartPadding_flex002.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexStartPadding_flex002.bottom - AlignContentFlexStart_4.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(45)) <= 1)
        .assertTrue();

      console.info('testAlignContentStartFlexPaddingSatisfy END');

    });
  })
}
