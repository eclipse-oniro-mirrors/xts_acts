'use static';
/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

export default function Tabs_barWidHei() {
  describe('Tabs_barWidHei', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_barWidHei beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barWidHei",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_barWidHei state pages:" + JSON.stringify(pages));
        if (!("Tabs_barWidHei" == pages.name)) {
          console.info("get Tabs_barWidHei pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_barWidHei page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barWidHei page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barWidHei beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barWidHei after each called")
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'currentIndex', value: 0
      });
    });

    
    /**
     * @tc.number   testTabsBarWidToNegative_static_01
     * @tc.name     testTabsBarWidToNegative_static_01
     * @tc.desc     testTabsBarWidToNegative_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarWidToNegative_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarWidToNegative_static_01] START');
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarWidToNegative_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarWidToNegative_static_01] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsBarWidToNegative_static_01] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarWidToNegative_static_01] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsBarWidToNegative_static_01] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round((Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6)))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidToNegative_static_01]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative_static_01]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative_static_01]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);


      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative_static_01]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative_static_01]subGreen.bottom - subGreen.top
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsBarWidToNegative_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsBarWidExceedTabsWid_static_02
     * @tc.name     testTabsBarWidExceedTabsWid_static_02
     * @tc.desc     testTabsBarWidExceedTabsWid_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarWidExceedTabsWid_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarWidExceedTabsWid_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarWidth', value: 400
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarWidExceedTabsWid_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarWidExceedTabsWid_static_02] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[testTabsBarWidExceedTabsWid_static_02] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarWidExceedTabsWid_static_02] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[testTabsBarWidExceedTabsWid_static_02] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidExceedTabsWid_static_02]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsBarWidExceedTabsWid_static_02]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsBarWidExceedTabsWid_static_02]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);

      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidExceedTabsWid_static_02]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidExceedTabsWid_static_02]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsBarWidExceedTabsWid_static_02] END');
      done();
    });


    
    /**
     * @tc.number   testTabsBarWidWithinTabsWid_static_03
     * @tc.name     testTabsBarWidWithinTabsWid_static_03
     * @tc.desc     testTabsBarWidWithinTabsWid_static_03
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarWidWithinTabsWid_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarWidWithinTabsWid_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarWidth', value: 300
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarWidWithinTabsWid_static_03] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarWidWithinTabsWid_static_03] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[testTabsBarWidWithinTabsWid_static_03] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarWidWithinTabsWid_static_03] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[testTabsBarWidWithinTabsWid_static_03] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidWithinTabsWid_static_03]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid_static_03]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsBarWidWithinTabsWid_static_03]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid_static_03]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
      ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`)

      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid_static_03]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();


      console.info('[testTabsBarWidWithinTabsWid_static_03] END');
      done();
    });


    
    /**
     * @tc.number   testTabsBarHeiExceedTabsHei_static_04
     * @tc.name     testTabsBarHeiExceedTabsHei_static_04
     * @tc.desc     testTabsBarHeiExceedTabsHei_static_04
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarHeiExceedTabsHei_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarHeiExceedTabsHei_static_04] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarWidth', value: 330
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarHeight', value: 320
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarHeiExceedTabsHei_static_04] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarHeiExceedTabsHei_static_04] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[testTabsBarHeiExceedTabsHei_static_04] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarHeiExceedTabsHei_static_04] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[testTabsBarHeiExceedTabsHei_static_04] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiExceedTabsHei_static_04]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsBarHeiExceedTabsHei_static_04]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsBarHeiExceedTabsHei_static_04]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiExceedTabsHei_static_04]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiExceedTabsHei_static_04]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsBarHeiExceedTabsHei_static_04] END');
      done();
    });


    
    /**
     * @tc.number   testTabsBarHeiWithinTabsHei_static_05
     * @tc.name     testTabsBarHeiWithinTabsHei_static_05
     * @tc.desc     testTabsBarHeiWithinTabsHei_static_05
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarHeiWithinTabsHei_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarHeiWithinTabsHei_static_05] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarHeight', value: 100
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarHeiWithinTabsHei_static_05] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarHeiWithinTabsHei_static_05] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[testTabsBarHeiWithinTabsHei_static_05] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarHeiWithinTabsHei_static_05] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[testTabsBarHeiWithinTabsHei_static_05] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiWithinTabsHei_static_05]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsBarHeiWithinTabsHei_static_05]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsBarHeiWithinTabsHei_static_05]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiWithinTabsHei_static_05]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiWithinTabsHei_static_05]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();

      console.info('[testTabsBarHeiWithinTabsHei_static_05] END');
      done();
    });


    
    /**
     * @tc.number   testTabsBarHeiToNegative_static_06
     * @tc.name     testTabsBarHeiToNegative_static_06
     * @tc.desc     testTabsBarHeiToNegative_static_06
     * @tc.level    Level.LEVEL0
     */
it('testTabsBarHeiToNegative_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsBarHeiToNegative_static_06] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarHeight', value: -10
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barWidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsBarHeiToNegative_static_06] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[testTabsBarHeiToNegative_static_06] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsBarHeiToNegative_static_06] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsBarHeiToNegative_static_06] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsBarHeiToNegative_static_06] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barWidHei_011.right -
        ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_011.left + ((Tabs_barWidHei_011.right - Tabs_barWidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe((Math.round(Tabs_barWidHei_012.right -
        ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_barWidHei_012.left + ((Tabs_barWidHei_012.right - Tabs_barWidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiToNegative_static_06]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsBarHeiToNegative_static_06]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsBarHeiToNegative_static_06]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiToNegative_static_06]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) -
      Math.round(uiContext.vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiToNegative_static_06]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();

      console.info('[testTabsBarHeiToNegative_static_06] END');
      done();
    });
  })
}
