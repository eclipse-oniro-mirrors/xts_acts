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

import { describe, beforeEach, it, expect, Level, afterEach, beforeAll,Level } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
import {Alignment } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function AlignCenter_AddAlign() {
  describe('AlignCenter_AddAlign', () => {

    beforeAll(() => {
      console.info("AlignCenter_AddAlign beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignCenter_AddAlign beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddAlign'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignCenter_AddAlign state pages:" + JSON.stringify(pages));
        if (!("AlignCenter_AddAlign" == pages.name)) {
          console.info("get AlignCenter_AddAlign pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignCenter_AddAlign page error:" + err);
      }
      console.info("AlignCenter_AddAlign beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddAlign after each called")
    });

    
    
/**
     * @tc.number   testFlexAlignCenterAlignBottomEnd_static
     * @tc.name     testFlexAlignCenterAlignBottomEnd_static
     * @tc.desc     testFlexAlignCenterAlignBottomEnd_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterAlignBottomEnd_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterAlignBottomEnd] START');
      let result = AppStorage.get<MessageManager<Alignment>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadAddAlign', value: Alignment.BottomEnd
        });

      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_AddAlign_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_AddAlign_011: RectValue = CommonFunc.getComponentRect('Center_AddAlign_011');
      let Center_AddAlign_012: RectValue = CommonFunc.getComponentRect('Center_AddAlign_012');
      let Center_AddAlign_013: RectValue = CommonFunc.getComponentRect('Center_AddAlign_013');
      let Center_AddAlign_01: RectValue = CommonFunc.getComponentRect('Center_AddAlign_01');
      expect(Math.abs((Center_AddAlign_011.top) - (Center_AddAlign_012.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddAlign_012.top) - (Center_AddAlign_013.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddAlign_011.top) - (Center_AddAlign_01.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddAlign_012.left) - (Center_AddAlign_011.right)) <= 1).assertTrue();
      expect(Math.abs((Center_AddAlign_013.left) - (Center_AddAlign_012.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round((Center_AddAlign_011.left - Center_AddAlign_01.left) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddAlign_01.right - Center_AddAlign_013.right) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_011.right - Center_AddAlign_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_012.right - Center_AddAlign_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_013.right - Center_AddAlign_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_011.bottom - Center_AddAlign_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_012.bottom - Center_AddAlign_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddAlign_013.bottom - Center_AddAlign_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterAlignBottomEnd] END');

    });
  })
}
