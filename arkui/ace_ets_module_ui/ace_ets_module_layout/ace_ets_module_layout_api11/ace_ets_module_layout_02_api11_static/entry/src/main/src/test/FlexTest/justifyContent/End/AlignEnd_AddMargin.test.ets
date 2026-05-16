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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Alignment } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignEnd_AddMargin() {
  describe('AlignEnd_AddMargin', () => {

    beforeAll(() => {
      console.info("AlignEnd_AddMargin beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("AlignEnd_AddMargin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignEnd_AddMargin state pages:" + JSON.stringify(pages));
        if (!("AlignEnd_AddMargin" == pages.name)) {
          console.info("get AlignEnd_AddMargin pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignEnd_AddMargin page error:" + err);
      }
      console.info("AlignEnd_AddMargin beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddMargin after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignEndFlexMargin_static
     * @tc.name     testFlexAlignEndFlexMargin_static
     * @tc.desc     testFlexAlignEndFlexMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignEndFlexMargin_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignEndFlexMargin] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadMargin', value: 20
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('End_AddMargin_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
      let End_AddMargin_011: RectValue = CommonFunc.getComponentRect('End_AddMargin_011');
      let End_AddMargin_012: RectValue = CommonFunc.getComponentRect('End_AddMargin_012');
      let End_AddMargin_013: RectValue = CommonFunc.getComponentRect('End_AddMargin_013');
      let End_AddMargin_01: RectValue = CommonFunc.getComponentRect('End_AddMargin_01');
      let End_AddMargin_01_Box: RectValue = CommonFunc.getComponentRect('End_AddMargin_01_Box');
      expect(Math.abs((End_AddMargin_011.top) - (End_AddMargin_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddMargin_013.top) - (End_AddMargin_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddMargin_012.left) - (End_AddMargin_011.right)) <= 1).assertTrue();
      expect(Math.abs((End_AddMargin_013.left) - (End_AddMargin_012.right)) <= 1).assertTrue();
      expect(Math.abs((End_AddMargin_013.right) - (End_AddMargin_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_01.left - End_AddMargin_01_Box.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_01.top - End_AddMargin_01_Box.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_011.left - End_AddMargin_01.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_011.bottom - End_AddMargin_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_012.bottom - End_AddMargin_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_013.bottom - End_AddMargin_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_011.right - End_AddMargin_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_012.right - End_AddMargin_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddMargin_013.right - End_AddMargin_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      console.info('[testFlexAlignEndFlexMargin] END');

    });
  })
}
