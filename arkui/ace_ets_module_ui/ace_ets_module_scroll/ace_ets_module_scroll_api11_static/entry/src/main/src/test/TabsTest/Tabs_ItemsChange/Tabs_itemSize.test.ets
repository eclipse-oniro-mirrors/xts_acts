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
let testAbilityContext:common.UIAbilityContext;

export default function Tabs_itemSize() {
  describe('Tabs_itemSize', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_itemSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ItemsChange/Tabs_itemSize",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_itemSize state pages:" + JSON.stringify(pages));
        if (!("Tabs_itemSize" == pages.name)) {
          console.info("get Tabs_itemSize pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_itemSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_itemSize page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_itemSize beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_itemSize after each called")
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'currentIndex', value: 0
      });
    });
    
      
  
/**
     * @tc.number   testTabsItemSize_static_01
     * @tc.name     testTabsItemSize_static_01
     * @tc.desc     testTabsItemSize_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsItemSize_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsItemSize_static_01] START');
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_itemSize_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[testTabsItemSize_static_01] type: ${JSON.stringify(JSON.parseJsonElement(strJson).getString('$type'))}`);
      console.info("[testTabsItemSize_static_01] barPosition: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsItemSize_static_01] index: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsItemSize_static_01] scrollable: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsItemSize_static_01] barMode: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')).assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_itemSize_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_001');
      let Tabs_itemSize_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_itemSize_011.right - ((Tabs_itemSize_011.right - Tabs_itemSize_011.left) / 6))).toInt(),
      (Math.round(Tabs_itemSize_011.top + ((Tabs_itemSize_011.bottom - Tabs_itemSize_011.top) / 2))).toInt(),
      (Math.round(Tabs_itemSize_011.left + ((Tabs_itemSize_011.right - Tabs_itemSize_011.left) / 6))).toInt(),
      (Math.round(Tabs_itemSize_011.top + ((Tabs_itemSize_011.bottom - Tabs_itemSize_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemSize_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_002');
      let Tabs_itemSize_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_012');
      await driver.swipe((Math.round(Tabs_itemSize_012.right - ((Tabs_itemSize_012.right - Tabs_itemSize_012.left) / 6))).toInt(),
      (Math.round(Tabs_itemSize_012.top + ((Tabs_itemSize_012.bottom - Tabs_itemSize_012.top) / 2))).toInt(),
      (Math.round(Tabs_itemSize_012.left + ((Tabs_itemSize_012.right - Tabs_itemSize_012.left) / 6))).toInt(),
      (Math.round(Tabs_itemSize_012.top + ((Tabs_itemSize_012.bottom - Tabs_itemSize_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_itemSize_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_003');
      let Tabs_itemSize_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_013');
      let Tabs_itemSize_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_yellow');

      console.info(`[testTabsItemSize_static_01]Tabs_itemSize_011.left equal Tabs_itemSize_001.left=
        ${Tabs_itemSize_011.left} === ${Tabs_itemSize_001.left}`);
      expect(Math.abs(Tabs_itemSize_011.left - Tabs_itemSize_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.left - Tabs_itemSize_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.left - Tabs_itemSize_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.top - Tabs_itemSize_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.top - Tabs_itemSize_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.top - Tabs_itemSize_003.top) <= 1).assertTrue();

      console.info(`[testTabsItemSize_static_01]Tabs_itemSize_011.left equal Tabs_itemSize_01.left=
        ${Tabs_itemSize_011.left} === ${Tabs_itemSize_01.left}`);
      expect(Math.abs(Tabs_itemSize_011.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsItemSize_static_01]Tabs_itemSize_011.bottom - Tabs_itemSize_011.top=
        ${Math.round(Tabs_itemSize_011.bottom - Tabs_itemSize_011.top)}`);
      
      expect(Math.abs(Math.round(Tabs_itemSize_011.bottom - Tabs_itemSize_011.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_012.bottom - Tabs_itemSize_012.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_013.bottom - Tabs_itemSize_013.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.right - Tabs_itemSize_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.right - Tabs_itemSize_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.right - Tabs_itemSize_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemSize_static_01]Tabs_itemSize_001.bottom - Tabs_itemSize_001.top=
        ${Math.round(Tabs_itemSize_001.bottom - Tabs_itemSize_001.top)}`);
     
      expect(Math.abs(Math.round(Tabs_itemSize_001.bottom - Tabs_itemSize_001.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_002.bottom - Tabs_itemSize_002.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_003.bottom - Tabs_itemSize_003.top)-Math.round(uiContext.vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Tabs_itemSize_001.right - Tabs_itemSize_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_002.right - Tabs_itemSize_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_003.right - Tabs_itemSize_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemSize_static_01]subGreen.bottom - subGreen.top = ${Math.round(subGreen.bottom - subGreen.top)}`);
  
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)-Math.round(uiContext.vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(uiContext.vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(uiContext.vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)-Math.round(uiContext.vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left)-Math.round(uiContext.vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)-Math.round(uiContext.vp2px(110)))<=1).assertTrue();

      console.info('[testTabsItemSize_static_01] END');
      done();
    });
  })
}
