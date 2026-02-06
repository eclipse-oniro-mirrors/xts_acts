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

export default function AlignCenter_NoSpace() {
  describe('AlignCenter_NoSpace', () => {

    beforeAll(() => {
      console.info("AlignCenter_NoSpace beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("AlignCenter_NoSpace beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_NoSpace'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignCenter_NoSpace state pages:" + JSON.stringify(pages));
        if (!("AlignCenter_NoSpace" == pages.name)) {
          console.info("get AlignCenter_NoSpace pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignCenter_NoSpace page error:" + err);
      }
      console.info("AlignCenter_NoSpace beforeEach end");
    });


    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_NoSpace after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignCenterFlexWidthOverflow_static
     * @tc.name     testFlexAlignCenterFlexWidthOverflow_static
     * @tc.desc     testFlexAlignCenterFlexWidthOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterFlexWidthOverflow_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignCenterFlexWidthOverflow] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadWidth', value: 400
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_NoSpace_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_NoSpace_011: RectValue = CommonFunc.getComponentRect('Center_NoSpace_011');
      let Center_NoSpace_012: RectValue = CommonFunc.getComponentRect('Center_NoSpace_012');
      let Center_NoSpace_013: RectValue = CommonFunc.getComponentRect('Center_NoSpace_013');
      let Center_NoSpace_01: RectValue = CommonFunc.getComponentRect('Center_NoSpace_01');
      expect(Math.abs(Center_NoSpace_011.top - Center_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_012.top - Center_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.top - Center_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_012.left - Center_NoSpace_011.right) <= 2).assertTrue();
      expect(Math.abs(Center_NoSpace_013.left - Center_NoSpace_012.right) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.left - Center_NoSpace_01.left) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_013.right - Center_NoSpace_01.right) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.bottom - Center_NoSpace_011.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_012.bottom - Center_NoSpace_012.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_013.bottom - Center_NoSpace_013.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.right - Center_NoSpace_011.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_NoSpace_012.right - Center_NoSpace_012.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs(Center_NoSpace_013.right - Center_NoSpace_013.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400 / 3)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterFlexWidthOverflow] END');

    });
    
    
/**
     * @tc.number   testFlexAlignCenterFlexWidthMeet_static
     * @tc.name     testFlexAlignCenterFlexWidthMeet_static
     * @tc.desc     testFlexAlignCenterFlexWidthMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignCenterFlexWidthMeet_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignCenterFlexWidthMeet] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadWidth', value: 500
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_NoSpace_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_NoSpace_011: RectValue = CommonFunc.getComponentRect('Center_NoSpace_011');
      let Center_NoSpace_012: RectValue = CommonFunc.getComponentRect('Center_NoSpace_012');
      let Center_NoSpace_013: RectValue = CommonFunc.getComponentRect('Center_NoSpace_013');
      let Center_NoSpace_01: RectValue = CommonFunc.getComponentRect('Center_NoSpace_01');
      expect(Math.abs(Center_NoSpace_011.top - Center_NoSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_012.top - Center_NoSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.top - Center_NoSpace_01.top) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_011.right - Center_NoSpace_012.left) <= 1).assertTrue();
      expect(Math.abs(Center_NoSpace_013.left - Center_NoSpace_012.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(Center_NoSpace_011.left - Center_NoSpace_01.left) - Math.round(Center_NoSpace_01.right - Center_NoSpace_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_NoSpace_011.left - Center_NoSpace_01.left) * 10) / 10) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_011.right - Center_NoSpace_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_012.right - Center_NoSpace_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_013.right - Center_NoSpace_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_011.bottom - Center_NoSpace_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_012.bottom - Center_NoSpace_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_NoSpace_013.bottom - Center_NoSpace_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterFlexWidthMeet] END');

    });
  })
}
