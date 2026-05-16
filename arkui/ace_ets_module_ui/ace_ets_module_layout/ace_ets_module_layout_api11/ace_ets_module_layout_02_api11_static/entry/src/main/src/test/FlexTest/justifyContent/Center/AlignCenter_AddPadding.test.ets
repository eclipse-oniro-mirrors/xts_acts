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

export default function AlignCenter_AddPadding() {
  describe('AlignCenter_AddPadding', () => {

    beforeAll(async (): Promise<void> => {
      console.info("AlignCenter_AddPadding beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("AlignCenter_AddPadding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignCenter_AddPadding state pages:" + JSON.stringify(pages));
        if (!("AlignCenter_AddPadding" == pages.name)) {
          console.info("get AlignCenter_AddPadding pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignCenter_AddPadding page error:" + err);
      }
      console.info("AlignCenter_AddPadding beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddPadding after each called");
    });



    /**
     * @tc.number   testFlexAlignCenterFlexPadOverflow_static
     * @tc.name     testFlexAlignCenterFlexPadOverflow_static
     * @tc.desc     testFlexAlignCenterFlexPadOverflow_static
     * @tc.level    Level.LEVEL0
     */
    it('testFlexAlignCenterFlexPadOverflow_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterFlexPadOverflow] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadPadding', value: 30
        });
      }

      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_AddPadding_01');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011: RectValue = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012: RectValue = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013: RectValue = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01: RectValue = CommonFunc.getComponentRect('Center_AddPadding_01');

      console.info('testFlexAlignCenterFlexPadOverflow_static_01 :'+ Math.floor(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top)));
      console.info('testFlexAlignCenterFlexPadOverflow_static_02 :'+ Math.floor(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top)));
      console.info('testFlexAlignCenterFlexPadOverflow_static_03 :'+ Math.floor(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right)));
      console.info('testFlexAlignCenterFlexPadOverflow_static_04 :'+ Math.floor(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right)));
      console.info('testFlexAlignCenterFlexPadOverflow_static_05 :'+ Math.floor(Math.abs((Center_AddPadding_011.left - Center_AddPadding_01.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_06 :'+ Math.floor(Math.abs((Center_AddPadding_01.right - Center_AddPadding_013.right) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_07 :'+ Math.floor(Math.abs((Center_AddPadding_011.top - Center_AddPadding_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_08 :'+ Math.floor(Math.abs((Center_AddPadding_011.bottom - Center_AddPadding_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_09 :'+ Math.floor(Math.abs((Center_AddPadding_012.bottom - Center_AddPadding_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_010:'+ Math.floor(Math.abs((Center_AddPadding_013.bottom - Center_AddPadding_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_011:'+ Math.floor(Math.abs((Center_AddPadding_011.right - Center_AddPadding_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_012:'+ Math.floor(Math.abs((Center_AddPadding_012.right - Center_AddPadding_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));
      console.info('testFlexAlignCenterFlexPadOverflow_static_013:'+ Math.floor(Math.abs((Center_AddPadding_013.right - Center_AddPadding_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))));

      expect(Math.floor(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.left - Center_AddPadding_01.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_01.right - Center_AddPadding_013.right) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.top - Center_AddPadding_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.bottom - Center_AddPadding_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_012.bottom - Center_AddPadding_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_013.bottom - Center_AddPadding_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.right - Center_AddPadding_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_012.right - Center_AddPadding_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 3).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_013.right - Center_AddPadding_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 2).assertTrue();
      console.info('[testFlexAlignCenterFlexPadOverflow] END');

    });


    /**
     * @tc.number   testFlexAlignCenterFlexPadMeet_static
     * @tc.name     testFlexAlignCenterFlexPadMeet_static
     * @tc.desc     testFlexAlignCenterFlexPadMeet_static
     * @tc.level    Level.LEVEL0
     */
    it('testFlexAlignCenterFlexPadMeet_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterFlexPadMeet] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'DadPadding', value: 20
        });
      }

      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_AddPadding_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011: RectValue = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012: RectValue = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013: RectValue = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01: RectValue = CommonFunc.getComponentRect('Center_AddPadding_01');

      console.info('testFlexAlignCenterFlexPadMeet_static_01 :'+ Math.floor(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top)));
      console.info('testFlexAlignCenterFlexPadMeet_static_02 :'+ Math.floor(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top)));
      console.info('testFlexAlignCenterFlexPadMeet_static_03 :'+ Math.floor(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right)));
      console.info('testFlexAlignCenterFlexPadMeet_static_04 :'+ Math.floor(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right)));
      console.info('testFlexAlignCenterFlexPadMeet_static_05 :'+ Math.floor(Math.abs((Center_AddPadding_011.top - Center_AddPadding_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_06 :'+ Math.floor(Math.abs((((Center_AddPadding_011.left - Center_AddPadding_01.left) * 10) / 10) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)));
      console.info('testFlexAlignCenterFlexPadMeet_static_07 :'+ Math.floor(Math.abs((((Center_AddPadding_01.right - Center_AddPadding_013.right) * 10) / 10) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)));
      console.info('testFlexAlignCenterFlexPadMeet_static_08 :'+ Math.floor(Math.abs((Center_AddPadding_011.right - Center_AddPadding_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_09 :'+ Math.floor(Math.abs((Center_AddPadding_012.right - Center_AddPadding_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_10 :'+ Math.floor(Math.abs((Center_AddPadding_013.right - Center_AddPadding_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_11 :'+ Math.floor(Math.abs((Center_AddPadding_011.bottom - Center_AddPadding_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_12 :'+ Math.floor(Math.abs((Center_AddPadding_012.bottom - Center_AddPadding_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))));
      console.info('testFlexAlignCenterFlexPadMeet_static_13 :'+ Math.floor(Math.abs((Center_AddPadding_013.bottom - Center_AddPadding_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))));

      expect(Math.floor(Math.abs(Center_AddPadding_011.top - Center_AddPadding_012.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_012.top - Center_AddPadding_013.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_012.left - Center_AddPadding_011.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Center_AddPadding_013.left - Center_AddPadding_012.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.top - Center_AddPadding_01.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((((Center_AddPadding_011.left - Center_AddPadding_01.left) * 10) / 10) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((((Center_AddPadding_01.right - Center_AddPadding_013.right) * 10) / 10) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.right - Center_AddPadding_011.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_012.right - Center_AddPadding_012.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_013.right - Center_AddPadding_013.left) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_011.bottom - Center_AddPadding_011.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_012.bottom - Center_AddPadding_012.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Center_AddPadding_013.bottom - Center_AddPadding_013.top) - (Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      console.info('[testFlexAlignCenterFlexPadMeet] END');

    });
  })
}
