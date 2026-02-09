'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Visibility } from '@ohos.arkui.component'
import {MessageManager} from '../../../../../ets/MainAbility/common/MessageManager'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignEnd_AddVisibility() {
  describe('AlignEnd_AddVisibility', () => {

    beforeAll(() => {
      console.info("AlignEnd_AddVisibility beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignEnd_AddVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignEnd_AddVisibility state pages:" + JSON.stringify(pages));
        if (!("AlignEnd_AddVisibility" == pages.name)) {
          console.info("get AlignEnd_AddVisibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignEnd_AddVisibility page error:" + err);
      }
      console.info("AlignEnd_AddVisibility beforeEach end");
    });


    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddVisibility after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignEndVisibilityNone_static
     * @tc.name     testFlexAlignEndVisibilityNone_static
     * @tc.desc     testFlexAlignEndVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignEndVisibilityNone_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignEndVisibilityNone] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.None
          });
        }

        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('End_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.right) - (End_AddVisibility_013.left)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.right) - (End_AddVisibility_01.right)) <= 1).assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.left - End_AddVisibility_01.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityNone] END');

    });
    
    
/**
     * @tc.number   testFlexAlignEndVisibilityHidden_static
     * @tc.name     testFlexAlignEndVisibilityHidden_static
     * @tc.desc     testFlexAlignEndVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignEndVisibilityHidden_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignEndVisibilityHidden] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Hidden
          });
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('End_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let End_AddVisibility_011: RectValue = CommonFunc.getComponentRect('End_AddVisibility_011');
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((Math.round(End_AddVisibility_011.top)) - (Math.round(End_AddVisibility_012.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.top)) - (Math.round(End_AddVisibility_013.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.top)) - (Math.round(End_AddVisibility_01.top))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right)) - (Math.round(End_AddVisibility_012.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right)) - (Math.round(End_AddVisibility_01.right))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.left)) - (Math.round(End_AddVisibility_012.right))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.left - End_AddVisibility_01.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right - End_AddVisibility_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.bottom - End_AddVisibility_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityHidden] END');

    });
    
    
/**
     * @tc.number   testFlexAlignEndVisibilityVisible_static
     * @tc.name     testFlexAlignEndVisibilityVisible_static
     * @tc.desc     testFlexAlignEndVisibilityVisible_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignEndVisibilityVisible_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignEndVisibilityVisible] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Visible
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('End_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('End_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.End');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let End_AddVisibility_011: RectValue = CommonFunc.getComponentRect('End_AddVisibility_011');
        let End_AddVisibility_012: RectValue = CommonFunc.getComponentRect('End_AddVisibility_012');
        let End_AddVisibility_013: RectValue = CommonFunc.getComponentRect('End_AddVisibility_013');
        let End_AddVisibility_01: RectValue = CommonFunc.getComponentRect('End_AddVisibility_01');
        expect(Math.abs((End_AddVisibility_011.top) - (End_AddVisibility_012.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_012.top) - (End_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_011.right) - (End_AddVisibility_012.left)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.right) - (End_AddVisibility_01.right)) <= 1).assertTrue();
        expect(Math.abs((End_AddVisibility_013.left) - (End_AddVisibility_012.right)) <= 1).assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.left - End_AddVisibility_01.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.right - End_AddVisibility_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.right - End_AddVisibility_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.right - End_AddVisibility_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_011.bottom - End_AddVisibility_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_012.bottom - End_AddVisibility_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(End_AddVisibility_013.bottom - End_AddVisibility_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignEndVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignEndVisibilityVisible] END');

    });
  })
}
