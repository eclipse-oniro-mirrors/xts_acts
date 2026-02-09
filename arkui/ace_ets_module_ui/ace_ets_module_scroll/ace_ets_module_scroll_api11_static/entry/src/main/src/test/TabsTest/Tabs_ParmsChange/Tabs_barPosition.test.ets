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
import { BarPosition } from '@ohos.arkui.component'
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

export default function Tabs_barPosition() {
  describe('Tabs_barPosition', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_barPosition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barPosition",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_barPosition state pages:" + JSON.stringify(pages));
        if (!("Tabs_barPosition" == pages.name)) {
          console.info("get Tabs_barPosition pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_barPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barPosition page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barPosition beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barPosition after each called");
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'currentIndex', value: 0
      });
    });


    
    /**
     * @tc.number   TabsBarPositionStartWithVerticalFalse_static_01
     * @tc.name     TabsBarPositionStartWithVerticalFalse_static_01
     * @tc.desc     TabsBarPositionStartWithVerticalFalse_static_01
     * @tc.level    Level.LEVEL0
     */
it('TabsBarPositionStartWithVerticalFalse_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TabsBarPositionStartWithVerticalFalse_static_01] START');
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barPosition_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] type: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('index')));
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical')));
      console.info("[TabsBarPositionStartWithVerticalFalse_static_01] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("false");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barPosition_011.right -
        ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.left +
          ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.top +
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe((Math.round(Tabs_barPosition_012.right -
        ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.left +
          ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.top +
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_003.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]Tabs_barPosition_01.top equal subGreen.top
        ${Tabs_barPosition_01.top} === ${subGreen.top}`);

      expect(Math.abs(Tabs_barPosition_01.top - subGreen.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_01.top - subBlue.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_01.top - subYellow.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]Tabs_barPosition_011.left equal Tabs_barPosition_011.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_011.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_011.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);

      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);

      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse_static_01]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`)

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();

      console.info('[TabsBarPositionStartWithVerticalFalse_static_01] END');
      done();
    });


    
    /**
     * @tc.number   TabsBarPositionEndWithVerticalFalse_static_02
     * @tc.name     TabsBarPositionEndWithVerticalFalse_static_02
     * @tc.desc     TabsBarPositionEndWithVerticalFalse_static_02
     * @tc.level    Level.LEVEL0
     */
it('TabsBarPositionEndWithVerticalFalse_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TabsBarPositionEndWithVerticalFalse_static_02] START');
      AppStorage.get<MessageManager<BarPosition>>('messageManager')?.notify({
        name: 'changeBarPosition', value: BarPosition.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barPosition_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02] type: ${JSON.stringify(JSON.parseJsonElement(strJson)
        .getString('$type'))}`);
      console.info("[TabsBarPositionEndWithVerticalFalse_static_02] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[TabsBarPositionEndWithVerticalFalse_static_02] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[TabsBarPositionEndWithVerticalFalse_static_02] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[TabsBarPositionEndWithVerticalFalse_static_02] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical')));
      console.info("[TabsBarPositionEndWithVerticalFalse_static_02] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.End");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("false");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barPosition_011.right -
        ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.left +
          ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.top +
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe((Math.round(Tabs_barPosition_012.right -
        ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.left +
          ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.top +
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_003.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);

      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_01.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]Tabs_barPosition_011.left equal Tabs_barPosition_01.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_01.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.bottom - subGreen.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.bottom - subBlue.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.bottom - subYellow.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);

      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - uiContext.vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);

      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - uiContext.vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top) -
      Math.round(uiContext.vp2px(244))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse_static_02]subGreen.bottom - subGreen.bottom=
        ${Math.round(subGreen.bottom - subGreen.bottom)}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(110))) <= 1)
        .assertTrue();
      console.info('[TabsBarPositionEndWithVerticalFalse_static_02] END');
      done();
    });


    
    /**
     * @tc.number   TabsBarPositionStartWithVerticalTrue_static_03
     * @tc.name     TabsBarPositionStartWithVerticalTrue_static_03
     * @tc.desc     TabsBarPositionStartWithVerticalTrue_static_03
     * @tc.level    Level.LEVEL0
     */
it('TabsBarPositionStartWithVerticalTrue_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TabsBarPositionStartWithVerticalTrue_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarWidth', value: 56
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarHeight', value: 300
      });
      AppStorage.get<MessageManager<boolean>>('messageManager')?.notify({
        name: 'changeVertical', value: true
      });
      AppStorage.get<MessageManager<BarPosition>>('messageManager')?.notify({
        name: 'changeBarPosition', value: BarPosition.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barPosition_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] type: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical')));
      console.info("[TabsBarPositionStartWithVerticalTrue_static_03] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("true");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barPosition_011.left +
        ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.bottom -
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.left +
          ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.top +
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 6))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe((Math.round(Tabs_barPosition_012.left +
        ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.bottom -
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.left +
          ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.top +
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 6))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_003.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);

      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_01.top) <= 1).assertTrue()
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_01.top) <= 1).assertTrue()

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]Tabs_barPosition_011.left equal subGreen.right=
        ${Tabs_barPosition_011.left} === ${subGreen.right}`);

      expect(Math.abs(Tabs_barPosition_011.left - subGreen.right) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - subBlue.right) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - subYellow.right) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - subGreen.top) <= 1).assertTrue();
      expect(Math.abs(subBlue.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(subYellow.top - subBlue.bottom) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      ;

      expect(Math.abs(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue_static_03]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);

      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      console.info('[TabsBarPositionStartWithVerticalTrue_static_03] END');
      done();
    });


    
    /**
     * @tc.number   TabsBarPositionEndWithVerticalTrue_static_04
     * @tc.name     TabsBarPositionEndWithVerticalTrue_static_04
     * @tc.desc     TabsBarPositionEndWithVerticalTrue_static_04
     * @tc.level    Level.LEVEL0
     */
it('TabsBarPositionEndWithVerticalTrue_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TabsBarPositionEndWithVerticalTrue_static_04] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarWidth', value: 56
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'setBarHeight', value: 300
      });
      AppStorage.get<MessageManager<boolean>>('messageManager')?.notify({
        name: 'changeVertical', value: true
      });
      AppStorage.get<MessageManager<BarPosition>>('messageManager')?.notify({
        name: 'changeBarPosition', value: BarPosition.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Tabs_barPosition_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] type: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getBoolean('scrollable')));
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('vertical')));
      console.info("[TabsBarPositionEndWithVerticalTrue_static_04] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.End");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("true");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_barPosition_011.left +
        ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.bottom -
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 6))).toInt(),
        (Math.round(Tabs_barPosition_011.left +
          ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_011.top +
          ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 6))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe((Math.round(Tabs_barPosition_012.left +
        ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.bottom -
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 6))).toInt(),
        (Math.round(Tabs_barPosition_012.left +
          ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2))).toInt(),
        (Math.round(Tabs_barPosition_012.top +
          ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 6))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);

      expect(Math.abs(Tabs_barPosition_011.left - Tabs_barPosition_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left - Tabs_barPosition_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left - Tabs_barPosition_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_003.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);

      expect(Math.abs(Tabs_barPosition_011.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top - Tabs_barPosition_01.top) <= 1).assertTrue();
      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]Tabs_barPosition_011.right equal subGreen.left
        ${Tabs_barPosition_011.right} === ${subGreen.left}`);
      expect(Math.abs(Tabs_barPosition_011.right - subGreen.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - subBlue.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - subYellow.left) <= 1).assertTrue();

      expect(Math.abs(Tabs_barPosition_01.top - subGreen.top) <= 1).assertTrue();
      expect(Math.abs(subBlue.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(subYellow.top - subBlue.bottom) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);


      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();


      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top) -
      Math.round(uiContext.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left) -
      Math.round(uiContext.vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue_static_04]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      console.info('[TabsBarPositionEndWithVerticalTrue_static_04] END');
      done();
    });
  })
}
