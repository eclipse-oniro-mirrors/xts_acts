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
import {MessageManager} from '../../../../../ets/MainAbility/common/MessageManager'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import {Visibility } from '@ohos.arkui.component'
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

export default function AlignStart_AddVisibility() {
  describe('AlignStart_AddVisibility', () => {

    beforeAll(() => {
      console.info("AlignStart_AddVisibility beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignStart_AddVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignStart_AddVisibility state pages:" + JSON.stringify(pages));
        if (!("AlignStart_AddVisibility" == pages.name)) {
          console.info("get AlignStart_AddVisibility pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignStart_AddVisibility page error:" + err);
      }
      console.info("AlignStart_AddVisibility beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddVisibility after each called");
    });
    
    
/**
     * @tc.number   testFlexAlignStartTextVisibilityNone_static
     * @tc.name     testFlexAlignStartTextVisibilityNone_static
     * @tc.desc     testFlexAlignStartTextVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignStartTextVisibilityNone_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityNone] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.None
          })
        }

        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_01.left) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.right - Start_AddVisibility_013.left) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_01.right - Start_AddVisibility_013.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityNone] END');

    });
    
    
/**
     * @tc.number   testFlexAlignStartTextVisibilityHidden_static
     * @tc.name     testFlexAlignStartTextVisibilityHidden_static
     * @tc.desc     testFlexAlignStartTextVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignStartTextVisibilityHidden_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityHidden] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Hidden
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityHidden] END');

    });
    
    
/**
     * @tc.number   testFlexAlignStartTextVisibilityVisible_static
     * @tc.name     testFlexAlignStartTextVisibilityVisible_static
     * @tc.desc     testFlexAlignStartTextVisibilityVisible_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignStartTextVisibilityVisible_static', Level.LEVEL0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityVisible] START');
      try {
        let result = AppStorage.get<MessageManager<Visibility>>("messageManager")
        if (result !== null) {
          result!.notify({
            name: 'OneVisibility', value: Visibility.Visible
          })
        }
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left) <= 1).assertTrue()
        expect(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityVisible] END');

    });
  })
}
