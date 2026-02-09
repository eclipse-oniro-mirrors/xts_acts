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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Tabs_itemPadMar() {
  describe('Tabs_itemPadMar', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_itemPadMar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ItemsChange/Tabs_itemPadMar",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_itemPadMar state pages:" + JSON.stringify(pages));
        if (!("Tabs_itemPadMar" == pages.name)) {
          console.info("get Tabs_itemPadMar pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_itemPadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_itemPadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_itemPadMar beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_itemPadMar after each called")
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'currentIndex', value: 0
      });
    });


    
    /**
     * @tc.number   testTabsItemPad_static_01
     * @tc.name     testTabsItemPad_static_01
     * @tc.desc     testTabsItemPad_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsItemPad_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsItemPad_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'dadPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_itemPadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsItemPad_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsItemPad_static_01] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsItemPad_static_01] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsItemPad_static_01] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsItemPad_static_01] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_itemPadMar_011.right -
        ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe((Math.round(Tabs_itemPadMar_012.right -
        ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPad_static_01] Tabs_itemPadMar_011.left equal Tabs_itemPadMar_01.left=
        ${Tabs_itemPadMar_011.left} === ${Tabs_itemPadMar_01.left}`);


      expect(Math.abs(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsItemPad_static_01] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();


      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <= 1).assertTrue();


      console.info(`[testTabsItemPad_static_01] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();


      expect(Math.abs(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPad_static_01] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) -
      Math.round(uiContext.vp2px(204))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();


      expect(Math.abs(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) -
      Math.round(uiContext.vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsItemPad_static_01] subGreen.bottom - subGreen.top=${Math.round(subGreen.bottom -
      subGreen.top)}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsItemPad_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsItemMar_static_02
     * @tc.name     testTabsItemMar_static_02
     * @tc.desc     testTabsItemMar_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsItemMar_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsItemMar_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'dadPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'dadMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_itemPadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsItemMar_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsItemMar_static_02] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsItemMar_static_02] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsItemMar_static_02] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsItemMar_static_02] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_itemPadMar_011.right -
        ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe((Math.round(Tabs_itemPadMar_012.right -
        ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemMar_static_02] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);


      expect(Math.abs(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsItemMar_static_02] Tabs_itemPadMar_001.left equal Tabs_itemPadMar_011.left=
        ${Tabs_itemPadMar_001.left} === ${Tabs_itemPadMar_011.left}`);

      expect(Math.abs(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <= 1).assertTrue();


      console.info(`[testTabsItemMar_static_02] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);


      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) -
      Math.round(uiContext.vp2px(204))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();


      expect(Math.abs(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) -
      Math.round(uiContext.vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar_static_02] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) -
      Math.round(uiContext.vp2px(204))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();


      expect(Math.abs(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) -
      Math.round(uiContext.vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar_static_02] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsItemMar_static_02] END');
      done();
    });


    
    /**
     * @tc.number   testTabsItemPadMar_static_03
     * @tc.name     testTabsItemPadMar_static_03
     * @tc.desc     testTabsItemPadMar_static_03
     * @tc.level    Level.LEVEL0
     */
it('testTabsItemPadMar_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsItemPadMar_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'dadPadding', value: 20
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'dadMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_itemPadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsItemPadMar_static_03] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsItemPadMar_static_03] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsItemPadMar_static_03] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsItemPadMar_static_03] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsItemPadMar_static_03] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_itemPadMar_011.right -
        ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe((Math.round(Tabs_itemPadMar_012.right -
        ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPadMar_static_03] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar_static_03] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) -
      Math.round(uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar_static_03] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) -
      Math.round(uiContext.vp2px(204))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) -
      Math.round(uiContext.vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar_static_03] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      let padMar: number = Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top
      console.info(`[testTabsItemPadMar_static_03] Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top=
        ${(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top)}`);

      expect(Math.abs(Math.floor((Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) -
        (uiContext.vp2px(300 - 56) - 4 * padMar))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();


      expect(Math.abs(Math.floor((Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) -
        (uiContext.vp2px(330) - 4 * padMar))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar_static_03] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsItemPadMar_static_03] END');
      done();
    });
  })
}