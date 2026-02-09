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

export default function tabs_WidHeiTest() {
  describe('tabs_WidHeiTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_WidHei beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_WidHei",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_WidHei state pages:" + JSON.stringify(pages));
        if (!("Tabs_WidHei" == pages.name)) {
          console.info("get Tabs_WidHei pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_WidHei page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_WidHei page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_WidHei beforeEach end");
    });
    afterEach(async () => {
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: 0
      });
      await CommonFunc.sleep(2000);
      console.info("tabs_WidHeiTest after each called")
    });


    
    /**
     * @tc.number   testTabsWidHei01_static_01
     * @tc.name     testTabsWidHei01_static_01
     * @tc.desc     testTabsWidHei01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsWidHei01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsWidHei01_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 330
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 350
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_WidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_WidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_01');
      let Tabs_WidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_001');
      let Tabs_WidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_011');
      console.info(`[testTabsWidHei01_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsWidHei01_static_01] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsWidHei01_static_01] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsWidHei01_static_01] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsWidHei01_static_01] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsWidHei01_static_01] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_WidHei_011.right -
        ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_WidHei_011.left + ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_002');
      let Tabs_WidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_012');
      await driver.swipe((Math.round(Tabs_WidHei_012.right -
        ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_WidHei_012.left + ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_003');
      let Tabs_WidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Yellow');

      console.info(`[testTabsWidHei01_static_01] Tabs_WidHei_01.right -
       Tabs_WidHei_01.left = ${Tabs_WidHei_01.right - Tabs_WidHei_01.left}`);
      expect(Math.abs(Math.round(Tabs_WidHei_01.right - Tabs_WidHei_01.left) - Math.round(uiContext.vp2px(330))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_01.bottom - Tabs_WidHei_01.top) - Math.round(uiContext.vp2px(350))) <= 1)
        .assertTrue();

      console.info(`[testTabsWidHei01_static_01] Tabs_WidHei_01.left = ${Tabs_WidHei_01.left}`);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_011.left);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_012.left);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_013.left);

      console.info(`[testTabsWidHei01_static_01] Tabs_index_011.left = ${Tabs_WidHei_011.left}`);
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.left - Tabs_WidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.top - Tabs_WidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.top - Tabs_WidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.top - Tabs_WidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsWidHei01_static_01] Tabs_WidHei_011.bottom -
      Tabs_WidHei_011.top = ${Tabs_WidHei_011.bottom - Tabs_WidHei_011.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.bottom - Tabs_WidHei_013.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();


      expect(Math.abs(Tabs_WidHei_011.right - Tabs_WidHei_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.right - Tabs_WidHei_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.right - Tabs_WidHei_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsWidHei01_static_01] Tabs_WidHei_001.bottom -
      Tabs_WidHei_001.top = ${Tabs_WidHei_001.bottom - Tabs_WidHei_001.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_001.bottom - Tabs_WidHei_001.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.bottom - Tabs_WidHei_002.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.bottom - Tabs_WidHei_003.top) - Math.round(uiContext.vp2px(294))) <= 1)
        .assertTrue();


      expect(Math.abs(Tabs_WidHei_001.right - Tabs_WidHei_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_002.right - Tabs_WidHei_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_003.right - Tabs_WidHei_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsWidHei01_static_01] subGreen.bottom = ${subGreen.bottom}`);

      expect(Math.abs(subGreen.bottom - Tabs_WidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsWidHei01_static_01]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();

      console.info('[testTabsWidHei01_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsWidHei02_static_02
     * @tc.name     testTabsWidHei02_static_02
     * @tc.desc     testTabsWidHei02_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsWidHei02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsWidHei02_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 300
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 400
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_WidHei_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_WidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_01');
      let Tabs_WidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_001');
      let Tabs_WidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_011');
      console.info(`[testTabsWidHei02_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsWidHei02_static_02] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsWidHei02_static_02] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsWidHei02_static_02] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsWidHei02_static_02] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsWidHei02_static_02] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_WidHei_011.right -
        ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2))).toInt(),
        (Math.round(Tabs_WidHei_011.left + ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_002');
      let Tabs_WidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_012');
      await driver.swipe((Math.round(Tabs_WidHei_012.right -
        ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2))).toInt(),
        (Math.round(Tabs_WidHei_012.left + ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6))).toInt(),
        (Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_003');
      let Tabs_WidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Yellow');

      console.info(`[testTabsWidHei02_static_02] Tabs_WidHei_01.right -
      Tabs_WidHei_01.left = ${Tabs_WidHei_01.right - Tabs_WidHei_01.left}`);


      expect(Math.abs(Math.round(Tabs_WidHei_01.right - Tabs_WidHei_01.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_01.bottom - Tabs_WidHei_01.top) - Math.round(uiContext.vp2px(400))) <= 1)
        .assertTrue();


      console.info(`[testTabsWidHei02_static_02] Tabs_WidHei_01.left = ${Tabs_WidHei_01.left}`);
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_013.left) <= 1).assertTrue();


      console.info(`[testTabsWidHei02_static_02] Tabs_index_011.left = ${Tabs_WidHei_011.left}`);
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.left - Tabs_WidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.left - Tabs_WidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.top - Tabs_WidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.top - Tabs_WidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.top - Tabs_WidHei_003.top) <= 1).assertTrue();


      console.info(`[testTabsWidHei02_static_02] Tabs_WidHei_011.bottom -
      Tabs_WidHei_011.top = ${Tabs_WidHei_011.bottom - Tabs_WidHei_011.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.bottom - Tabs_WidHei_013.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_011.right - Tabs_WidHei_011.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.right - Tabs_WidHei_012.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.right - Tabs_WidHei_013.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();


      console.info(`[testTabsWidHei02_static_02] Tabs_WidHei_001.bottom -
      Tabs_WidHei_001.top = ${Tabs_WidHei_001.bottom - Tabs_WidHei_001.top}`);

      expect(Math.abs(Math.round(Tabs_WidHei_001.bottom - Tabs_WidHei_001.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.bottom - Tabs_WidHei_002.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.bottom - Tabs_WidHei_003.top) - Math.round(uiContext.vp2px(344))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_001.right - Tabs_WidHei_001.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.right - Tabs_WidHei_002.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.right - Tabs_WidHei_003.left) - Math.round(uiContext.vp2px(300))) <= 1)
        .assertTrue();


      console.info(`[testTabsWidHei02_static_02] subGreen.bottom = ${subGreen.bottom}`);

      expect(Math.abs(subGreen.bottom - Tabs_WidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsWidHei02_static_02]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();


      console.info('[testTabsWidHei02_static_02] END');
      done();
    });
  })
}
