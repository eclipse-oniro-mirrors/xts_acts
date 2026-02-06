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
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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

export default function AlignSpaceEvenly_AddOneMargin() {
  describe('AlignSpaceEvenly_AddOneMargin', () => {

    beforeAll(() => {
      console.info("AlignSpaceEvenly_AddOneMargin beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignSpaceEvenly_AddOneMargin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddOneMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignSpaceEvenly_AddOneMargin state pages:" + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddOneMargin" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddOneMargin pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddOneMargin page error:" + err);
      }
      console.info("AlignSpaceEvenly_AddOneMargin beforeEach end");
    });


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddOneMargin after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignSpaceEvenlyTextMarginMeet_static
     * @tc.name     testFlexAlignSpaceEvenlyTextMarginMeet_static
     * @tc.desc     testFlexAlignSpaceEvenlyTextMarginMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignSpaceEvenlyTextMarginMeet_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignSpaceEvenlyTextMarginMeet] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'OneMargin', value: 20
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('SpaceEvenly_AddOneMargin_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_011');
      let SpaceEvenly_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_012');
      let SpaceEvenly_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_013');
      let SpaceEvenly_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_01');
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_011.top - SpaceEvenly_AddOneMargin_01.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left) * 100) / 100)) - (Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(22.5)) * 100) / 100))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((SpaceEvenly_AddOneMargin_013.left - SpaceEvenly_AddOneMargin_012.right) * 100) / 100)) - (Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(2.5)) * 100) / 100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddOneMargin_012.left - SpaceEvenly_AddOneMargin_011.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))) - Math.round(SpaceEvenly_AddOneMargin_013.left - SpaceEvenly_AddOneMargin_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_013.top - SpaceEvenly_AddOneMargin_012.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_012.top - SpaceEvenly_AddOneMargin_01.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(Math.round((SpaceEvenly_AddOneMargin_01.right - SpaceEvenly_AddOneMargin_013.right) * 100) / 100) - Math.round(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(2.5)) * 100) / 100)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_011.bottom - SpaceEvenly_AddOneMargin_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_012.bottom - SpaceEvenly_AddOneMargin_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_013.bottom - SpaceEvenly_AddOneMargin_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_011.right - SpaceEvenly_AddOneMargin_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_012.right - SpaceEvenly_AddOneMargin_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_013.right - SpaceEvenly_AddOneMargin_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignSpaceEvenlyTextMarginMeet] END');

    })
    
    
/**
     * @tc.number   testFlexAlignSpaceEvenlyTextMarginOverflow_static
     * @tc.name     testFlexAlignSpaceEvenlyTextMarginOverflow_static
     * @tc.desc     testFlexAlignSpaceEvenlyTextMarginOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignSpaceEvenlyTextMarginOverflow_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignSpaceEvenlyTextMarginOverflow] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'OneMargin', value: 30
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('SpaceEvenly_AddOneMargin_01');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOneMargin_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_011');
      let SpaceEvenly_AddOneMargin_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_012');
      let SpaceEvenly_AddOneMargin_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_013');
      let SpaceEvenly_AddOneMargin_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_01');
      expect(Math.abs(Math.round(SpaceEvenly_AddOneMargin_011.top - SpaceEvenly_AddOneMargin_01.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddOneMargin_012.left - SpaceEvenly_AddOneMargin_011.right) - Math.round(SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left)) <= 1)
        .assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_013.right - SpaceEvenly_AddOneMargin_01.right) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_013.top - SpaceEvenly_AddOneMargin_012.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_012.top - SpaceEvenly_AddOneMargin_01.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddOneMargin_012.right - SpaceEvenly_AddOneMargin_013.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_011.bottom - SpaceEvenly_AddOneMargin_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_012.bottom - SpaceEvenly_AddOneMargin_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_013.bottom - SpaceEvenly_AddOneMargin_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_011.right - SpaceEvenly_AddOneMargin_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_012.right - SpaceEvenly_AddOneMargin_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddOneMargin_013.right - SpaceEvenly_AddOneMargin_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3))))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignSpaceEvenlyTextMarginOverflow] END');

    })
  })
}
