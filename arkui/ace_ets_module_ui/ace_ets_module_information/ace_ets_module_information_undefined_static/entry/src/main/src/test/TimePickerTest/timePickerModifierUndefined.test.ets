/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';


export default function timePickerModifierUndefined() {
  describe('timePickerModifierUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("timePickerModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("timePickerModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/timePickerModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get timePickerModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("timePickerModifierUndefined" == pages.name)) {
          console.info("get timePickerModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push timePickerModifierUndefined page error:" + err);
      }
      console.info("timePickerModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0001
     * @tc.name     timePickerModifierUndefined_static_0001
     * @tc.desc     test dateTimeOptions
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create()

      let strJson = inspector.getInspectorByKey('TimePickerM_2');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      expect(res).assertEqual('{"hour":"2-digit","minute":"2-digit","second":"2-digit"}');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_2');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      expect(res).assertEqual('{"hour":"numeric","minute":"numeric"}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TimePickerM_2');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      expect(res).assertEqual('{"hour":"2-digit","minute":"2-digit","second":"2-digit"}');
      console.info('[timePickerModifierUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0002
     * @tc.name     timePickerModifierUndefined_static_0002
     * @tc.desc     test useMilitaryTime
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('useMilitaryTime');
      expect(res).assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('useMilitaryTime');
      expect(res).assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('useMilitaryTime');
      expect(res).assertEqual('false');
      console.info('[timePickerModifierUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0003
     * @tc.name     timePickerModifierUndefined_static_0003
     * @tc.desc     test loop
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create()

      let strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop');
      expect(res).assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop');
      expect(res).assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop');
      expect(res).assertEqual('true');
      console.info('[timePickerModifierUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0004
     * @tc.name     timePickerModifierUndefined_static_0004
     * @tc.desc     test digitalCrownSensitivity
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create()

      let strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      expect(res).assertEqual('1');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      expect(res).assertEqual('0');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      expect(res).assertEqual('1');
      console.info('[timePickerModifierUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0005
     * @tc.name     timePickerModifierUndefined_static_0005
     * @tc.desc     test disappearTextStyle
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0005] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('TimePickerM_0');
      let defaultStyle =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle'));
      
      strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle'));
      expect(res).assertEqual(defaultStyle);

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle'));
      expect(res).assertEqual('{"color":"#FFFFFF00","font":{"size":"24.00fp","weight":"FontWeight.Regular"}}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle'));
      expect(res).assertEqual(defaultStyle);
      console.info('[timePickerModifierUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0006
     * @tc.name     timePickerModifierUndefined_static_0006
     * @tc.desc     test enableCascade
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0006] START');
      let driver: Driver = Driver.create()

      let strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableCascade'));
      expect(res).assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn6'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableCascade'));
      expect(res).assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enableCascade'));
      expect(res).assertEqual('false');
      console.info('[timePickerModifierUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0007
     * @tc.name     timePickerModifierUndefined_static_0007
     * @tc.desc     test enableHapticFeedback
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0007] START');
      let driver: Driver = Driver.create()

      let strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableHapticFeedback'));
      expect(res).assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn7'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableHapticFeedback'));
      expect(res).assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('enableHapticFeedback'));
      expect(res).assertEqual('true');
      console.info('[timePickerModifierUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0008
     * @tc.name     timePickerModifierUndefined_static_0008
     * @tc.desc     test selectedTextStyle
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0008] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('TimePickerM_0');
      let defaultStyle =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle'));

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle'));
      expect(res).assertEqual(defaultStyle);


      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn8'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle'));
      expect(res).assertEqual('{"color":"#FFFFFF00","font":{"size":"30.00fp","weight":"FontWeight.Medium"}}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle'));
      expect(res).assertEqual(defaultStyle);
      console.info('[timePickerModifierUndefined_static_0008] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0009
     * @tc.name     timePickerModifierUndefined_static_0009
     * @tc.desc     test textStyle
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0009] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('TimePickerM_0');
      let defaultStyle =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle'));

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle'));
      expect(res).assertEqual(defaultStyle);;

      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn9'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle'));
      expect(res).assertEqual('{"color":"#FFFFFF00","font":{"size":"26.00fp","weight":"FontWeight.Regular"}}');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TimePickerM_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle'));
      expect(res).assertEqual(defaultStyle);
      console.info('[timePickerModifierUndefined_static_0009] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0010
     * @tc.name     timePickerModifierUndefined_static_0010
     * @tc.desc     test onChange
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0010] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn10'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('TimePickerM_Text'));
      let timePicker = await driver.findComponent(ON.id('TimePickerM_2'));
      await (timePicker?.scrollToBottom() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onChange');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('TimePickerM_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (timePicker?.scrollToTop() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');
      console.info('[timePickerModifierUndefined_static_0010] END');
      done();
    });

    /**
     * @tc.number   timePickerModifierUndefined_static_0011
     * @tc.name     timePickerModifierUndefined_static_0011
     * @tc.desc     test onEnterSelectedArea
     * @tc.level    Level.LEVEL1
     */
    it('timePickerModifierUndefined_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[timePickerModifierUndefined_static_0011] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('TimePickerM_Btn11'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('TimePickerM_Text'));
      let timePicker = await driver.findComponent(ON.id('TimePickerM_2'));
      await (timePicker?.scrollToBottom() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onEnterSelectedArea');
      
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('TimePickerM_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (timePicker?.scrollToTop() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');
      console.info('[timePickerModifierUndefined_static_0011] END');
      done();
    });
  })
}