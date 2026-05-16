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

export default function tabs_IndexTest() {
  describe('Tabs_IndexTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_IndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabs_index/Tabs_index",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_index state pages:" + JSON.stringify(pages));
        if (!("Tabs_index" == pages.name)) {
          console.info("get Tabs_index pages.name:" + JSON.stringify(pages.name));
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_index page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_index page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_IndexTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_IndexTest after each called")
    });


    
    /**
     * @tc.number   testTabsIndexLessThanMin_static_01
     * @tc.name     testTabsIndexLessThanMin_static_01
     * @tc.desc     testTabsIndexLessThanMin_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsIndexLessThanMin_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsIndexLessThanMin_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: -1
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_Index_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexLessThanMin_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsIndexLessThanMin_static_01] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsIndexLessThanMin_static_01] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsIndexLessThanMin_static_01] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsIndexLessThanMin_static_01] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsIndexLessThanMin_static_01] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');
      let driver = Driver.create();
      await driver.swipe((Math.round((Tabs_index_011.right -
        ((Tabs_index_011.right - Tabs_index_011.left) / 6)))).toInt(),
        (Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2))).toInt(),
        (Math.round(Tabs_index_011.left + ((Tabs_index_011.right - Tabs_index_011.left) / 6))).toInt(),
        (Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe((Math.round(Tabs_index_012.right -
        ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt(),
        (Math.round(Tabs_index_012.left + ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');

      console.info(`[testTabsIndexLessThanMin_static_01] Tabs_index_01.left = ${Tabs_index_01.left}`);


      expect(Math.abs(Tabs_index_01.left - Tabs_index_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_013.left) <= 1).assertTrue();


      console.info(`[testTabsIndexLessThanMin_static_01] Tabs_index_011.left = ${Tabs_index_011.left}`);

      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <= 1).assertTrue();


      console.info(`[testTabsIndexLessThanMin_static_01] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);


      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();

      //expect(Math.round(Tabs_index_011.bottom - Tabs_index_011.top)).assertEqual(Math.round(uiContext.vp2px(244)));
      // expect(Math.round(Tabs_index_012.bottom - Tabs_index_012.top)).assertEqual(Math.round(uiContext.vp2px(244)));
      //expect(Math.round(Tabs_index_013.bottom - Tabs_index_013.top)).assertEqual(Math.round(uiContext.vp2px(244)));
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin_static_01] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);

      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();

      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin_static_01] subGreen.bottom = ${subGreen.bottom}`);


      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsIndexLessThanMin_static_01] subGreen.bottom - subGreen.top = ${subGreen.bottom -
      subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsIndexLessThanMin_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsIndexNormal_static_02
     * @tc.name     testTabsIndexNormal_static_02
     * @tc.desc     testTabsIndexNormal_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsIndexNormal_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsIndexNormal_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: 1
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_Index_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("1");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexNormal_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsIndexNormal_static_02] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsIndexNormal_static_02] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsIndexNormal_static_02] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsIndexNormal_static_02] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsIndexNormal_static_02] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);
      let driver = Driver.create();
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe((Math.round(Tabs_index_012.right -
        ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt(),
        (Math.round(Tabs_index_012.left + ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: 0
      });
      await CommonFunc.sleep(1000);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');

      console.info(`[testTabsIndexNormal_static_02] Tabs_index_01.left = ${Tabs_index_01.left}`);


      expect(Math.abs(Tabs_index_01.left - Tabs_index_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_013.left) <= 1).assertTrue();


      console.info(`[testTabsIndexNormal_static_02] Tabs_index_011.left = ${Tabs_index_011.left}`);
      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <= 1).assertTrue();


      console.info(`[testTabsIndexNormal_static_02] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);

      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();


      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal_static_02] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);
      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();

      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal_static_02] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsIndexNormal_static_02] subGreen.bottom - subGreen.top = ${subGreen.bottom -
      subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();

      done();
    });


    
    /**
     * @tc.number   testTabsIndexMoreThanMax_static_03
     * @tc.name     testTabsIndexMoreThanMax_static_03
     * @tc.desc     testTabsIndexMoreThanMax_static_03
     * @tc.level    Level.LEVEL0
     */
it('testTabsIndexMoreThanMax_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsIndexMoreThanMax_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'index', value: 3
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Tabs_Index_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexMoreThanMax_static_03] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info(`[testTabsIndexMoreThanMax_static_03] barPosition: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition'))}`);
      console.info(`[testTabsIndexMoreThanMax_static_03] index: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index'))}`);
      console.info(`[testTabsIndexMoreThanMax_static_03] scrollable: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable'))}`);
      console.info(`[testTabsIndexMoreThanMax_static_03] vertical: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical'))}`);
      console.info(`[testTabsIndexMoreThanMax_static_03] barMode: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode'))}`);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_index_011.right -
        ((Tabs_index_011.right - Tabs_index_011.left) / 6))).toInt(),
        (Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2))).toInt(),
        (Math.round(Tabs_index_011.left + ((Tabs_index_011.right - Tabs_index_011.left) / 6))).toInt(),
        (Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe((Math.round(Tabs_index_012.right -
        ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt(),
        (Math.round(Tabs_index_012.left + ((Tabs_index_012.right - Tabs_index_012.left) / 6))).toInt(),
        (Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');

      console.info(`[testTabsIndexMoreThanMax_static_03] Tabs_index_01.left = ${Tabs_index_01.left}`);

      expect(Math.abs(Tabs_index_01.left - Tabs_index_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_012.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_013.left) <= 1).assertTrue();


      console.info(`[testTabsIndexMoreThanMax_static_03] Tabs_index_011.left = ${Tabs_index_011.left}`);

      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <= 1).assertTrue();


      console.info(`[testTabsIndexMoreThanMax_static_03] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);

      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();


      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax_static_03] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);

      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(uiContext.vp2px(244))) <= 1)
        .assertTrue();


      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax_static_03] subGreen.bottom = ${subGreen.bottom}`);

      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsIndexMoreThanMax_static_03] subGreen.bottom - subGreen.top = ${subGreen.bottom -
      subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();

      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();


      console.info('[testTabsIndexMoreThanMax_static_03] END');
      done();
    });
  })
}
