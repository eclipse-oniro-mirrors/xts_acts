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

export default function tabs_PadMarTest() {
  describe('Tabs_PadMarTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_PadMar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_PadMar",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_PadMar state pages:" + JSON.stringify(pages));
        if (!("Tabs_PadMar" == pages.name)) {
          console.info("get Tabs_PadMar pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_PadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_PadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_PadMar beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'padding', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'margin', value: 0
      });
      console.info("Tabs_PadMarTest after each called")
    });


    
    /**
     * @tc.number   testTabsPad_static_01
     * @tc.name     testTabsPad_static_01
     * @tc.desc     testTabsPad_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsPad_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsPad_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'padding', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_PadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsPad_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsPad_static_01] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsPad_static_01] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsPad_static_01] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsPad_static_01] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsPad_static_01] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_PadMar_011.right -
        ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe((Math.round(Tabs_PadMar_012.right -
        ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      console.info(`[testTabsPad_static_01] Tabs_PadMar_011.left -
      Tabs_PadMar_01.left = ${Tabs_PadMar_011.left - Tabs_PadMar_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.top - Tabs_PadMar_01.top) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();

      console.info(`[testTabsPad_static_01] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsPad_static_01] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsPad_static_01] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);

      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsPad_static_01] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsPad_static_01] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsPad_static_01] Tabs_PadMar_011.bottom -
        Tabs_PadMar_011.top = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      console.info(`[testTabsPad_static_01] Tabs_PadMar_011.right -
        Tabs_PadMar_011.left = ${Tabs_PadMar_011.right - Tabs_PadMar_011.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_011.right - Tabs_PadMar_011.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.right - Tabs_PadMar_012.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.right - Tabs_PadMar_013.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPad_static_01] Tabs_PadMar_001.bottom -
        Tabs_PadMar_001.top = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_001.right - Tabs_PadMar_001.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.right - Tabs_PadMar_002.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.right - Tabs_PadMar_003.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPad_static_01] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs(subGreen.bottom - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsPad_static_01]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsPad_static_01]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();

      console.info('[testTabsPad_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsMar_static_02
     * @tc.name     testTabsMar_static_02
     * @tc.desc     testTabsMar_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsMar_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsMar_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_PadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_Column_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Column_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsMar_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsMar_static_02] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsMar_static_02] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsMar_static_02] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsMar_static_02] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsMar_static_02] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_PadMar_011.right -
        ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe((Math.round(Tabs_PadMar_012.right -
        ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      console.info(`[testTabsMar_static_02] Tabs_PadMar_01.left -
        Tabs_PadMar_Column_01.left = ${Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left}`);

      expect(Math.abs(Math.round(Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left) - Math.round(uiContext.vp2px(20))) <=
        1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_01.top - Tabs_PadMar_Column_01.top) - Math.round(uiContext.vp2px(20))) <=
        1)
        .assertTrue();

      console.info(`[testTabsMar_static_02] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsMar_static_02] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsMar_static_02] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);

      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsMar_static_02] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsMar_static_02] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsMar_static_02] Tabs_PadMar_011.bottom -
        Tabs_PadMar_011.top = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_PadMar_011.right - Tabs_PadMar_011.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.right - Tabs_PadMar_012.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.right - Tabs_PadMar_013.left - Tabs_PadMar_01_width) <= 1).assertTrue();

      console.info(`[testTabsMar_static_02] Tabs_PadMar_001.bottom -
        Tabs_PadMar_001.top = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_PadMar_001.right - Tabs_PadMar_001.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_002.right - Tabs_PadMar_002.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_003.right - Tabs_PadMar_003.left - Tabs_PadMar_01_width) <= 1).assertTrue();

      console.info(`[testTabsMar_static_02] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs(subGreen.bottom - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsMar_static_02]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsMar_static_02]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      console.info('[testTabsMar_static_02] END');
      done();
    });


    
    /**
     * @tc.number   testTabsPadMar_static_03
     * @tc.name     testTabsPadMar_static_03
     * @tc.desc     testTabsPadMar_static_03
     * @tc.level    Level.LEVEL0
     */
it('testTabsPadMar_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsPadMar_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'padding', value: 20
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_PadMar_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_Column_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Column_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsPadMar_static_03] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsPadMar_static_03] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsPadMar_static_03] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsPadMar_static_03] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsPadMar_static_03] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsPadMar_static_03] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_PadMar_011.right -
        ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe((Math.round(Tabs_PadMar_012.right -
        ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt(),
        (Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6))).toInt(),
        (Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      console.info(`[testTabsPadMar_static_03] Tabs_PadMar_01.left -
        Tabs_PadMar_Column_01.left = ${Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left) - Math.round(uiContext.vp2px(20))) <=
        1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_01.top - Tabs_PadMar_Column_01.top) - Math.round(uiContext.vp2px(20))) <=
        1)
        .assertTrue();

      console.info(`[testTabsPadMar_static_03] Tabs_PadMar_011.left -
        Tabs_PadMar_01.left = ${Tabs_PadMar_011.left - Tabs_PadMar_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.left - Tabs_PadMar_01.left) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.top - Tabs_PadMar_01.top) - Math.round(uiContext.vp2px(20))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar_static_03] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsPadMar_static_03] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsPadMar_static_03] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);

      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsPadMar_static_03] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsPadMar_static_03] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsPadMar_static_03] Tabs_PadMar_011.bottom -
        Tabs_PadMar_011.top = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      console.info(`[testTabsPadMar_static_03] Tabs_PadMar_011.right -
        Tabs_PadMar_011.left = ${Tabs_PadMar_011.right - Tabs_PadMar_011.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_011.right - Tabs_PadMar_011.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.right - Tabs_PadMar_012.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.right - Tabs_PadMar_013.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar_static_03] Tabs_PadMar_001.bottom -
      Tabs_PadMar_001.top = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) -
      Math.round(Tabs_PadMar_01_height - uiContext.vp2px(56 + 40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_001.right - Tabs_PadMar_001.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.right - Tabs_PadMar_002.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.right - Tabs_PadMar_003.left) -
      Math.round(Tabs_PadMar_01_width - uiContext.vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar_static_03] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs(subGreen.bottom - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsPadMar_static_03]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsPadMar_static_03]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.floor(Tabs_PadMar_001_width / 3)) <= 1)
        .assertTrue();

      console.info('[testTabsPadMar_static_03] END');
      done();
    });
  })
}
