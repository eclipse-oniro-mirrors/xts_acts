'use static'
/*
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
  Point
} from '@ohos.UiTest';
import { DateTimeOptions} from '@ohos.arkui.component';
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

export default function textClockUndefined() {
  describe('textClockUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("textClockUndefined beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information01.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textClockUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text_Clock/textClockUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get textClockUndefined state pages:" + JSON.stringify(pages));
        if (!("textClockUndefined" == pages.name)) {
          console.info("get textClockUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textClockUndefined page error:" + err);
      }
      console.info("textClockUndefined beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.number   textClockUndefined_static_0001
     * @tc.name     textClockUndefined_static_0001
     * @tc.desc     test textClockUndefined dateTimeOptions undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      console.info("[textClockUndefined_static_0001] dateTimeOptions : " + res);
      expect(res).assertEqual(JSON.stringify('{"hour":"numeric"}'));

      let changeBtn = await driver.findComponent(ON.id('dateTimeOptions_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      console.info("[textClockUndefined_static_0001] dateTimeOptions2 : " + res);
      expect(res).assertEqual(JSON.stringify('{"hour":"2-digit"}'));

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('dateTimeOptions'));
      console.info("[textClockUndefined_static_0001] dateTimeOptions : " + res);
      expect(res).assertEqual(JSON.stringify('{"hour":"numeric"}'));
      console.info('[textClockUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0003
     * @tc.name     textClockUndefined_static_0003
     * @tc.desc     test textClockUndefined fontFamily undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0003] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily');
      console.info("[textClockUndefined_static_0003] fontFamily : " + res);
      expect(res).assertEqual('HarmonyOS Sans');

      let changeBtn = await driver.findComponent(ON.id('fontFamily_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily');
      console.info("[textClockUndefined_static_0003] fontFamily : " + res);
      expect(res).assertEqual('sans-serif');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily');
      console.info("[textClockUndefined_static_0003] fontFamily : " + res);
      expect(res).assertEqual('HarmonyOS Sans');
      console.info('[textClockUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0004
     * @tc.name     textClockUndefined_static_0004
     * @tc.desc     test textClockUndefined fontWeight undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0004] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight');
      console.info("[textClockUndefined_static_0004] fontWeight : " + res);
      expect(res).assertEqual('FontWeight.Normal');

      let changeBtn = await driver.findComponent(ON.id('fontWeight_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight');
      console.info("[textClockUndefined_static_0004] fontWeight : " + res);
      expect(res).assertEqual('FontWeight.Bold');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight');
      console.info("[textClockUndefined_static_0004] fontWeight : " + res);
      expect(res).assertEqual('FontWeight.Normal');
      console.info('[textClockUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0005
     * @tc.name     textClockUndefined_static_0005
     * @tc.desc     test textClockUndefined fontSize undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0005] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize');
      console.info("[textClockUndefined_static_0005] fontSize : " + res);
      expect(res).assertEqual('16.00fp');

      let changeBtn = await driver.findComponent(ON.id('fontSize_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0005] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize');
      console.info("[textClockUndefined_static_0005] fontSize : " + res);
      expect(res).assertEqual('50.00fp');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0005] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize');
      console.info("[textClockUndefined_static_0005] fontSize : " + res);
      expect(res).assertEqual('16.00fp');
      console.info('[textClockUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0006
     * @tc.name     textClockUndefined_static_0006
     * @tc.desc     test textClockUndefined fontColor undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0006] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');

      let originJson = inspector.getInspectorByKey('textClock_origin');
      let originFontColor = JSON.parseJsonElement(originJson).getElement('$attrs').getString('fontColor');

      console.info("[textClockUndefined_static_0006] fontColor : " + res);
      expect(res).assertEqual(originFontColor);

      let changeBtn = await driver.findComponent(ON.id('fontColor_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');
      console.info("[textClockUndefined_static_0006] fontColor : " + res);
      expect(res).assertEqual('#FFFF0000');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');
      console.info("[textClockUndefined_static_0006] fontColor : " + res);
      expect(res).assertEqual(originFontColor);
      console.info('[textClockUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0007
     * @tc.name     textClockUndefined_static_0007
     * @tc.desc     test textClockUndefined fontStyle undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0007] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');

      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle');
      console.info("[textClockUndefined_static_0007] fontStyle : " + res);
      expect(res).assertEqual('FontStyle.Normal');

      let changeBtn = await driver.findComponent(ON.id('fontStyle_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0007] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle');
      console.info("[textClockUndefined_static_0007] fontStyle : " + res);
      expect(res).assertEqual('FontStyle.Italic');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0007] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontStyle');
      console.info("[textClockUndefined_static_0007] fontStyle : " + res);
      expect(res).assertEqual('FontStyle.Normal');
      console.info('[textClockUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0008
     * @tc.name     textClockUndefined_static_0008
     * @tc.desc     test textClockUndefined textShadow undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0008] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textClock_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('textShadow');
      console.info("[textClockUndefined_static_0008] textShadow : " + res);
      expect(res).assertEqual("");

      let changeBtn = await driver.findComponent(ON.id('textShadow_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textClockUndefined_static_0008] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textShadow'));
      console.info("[textClockUndefined_static_0008] textShadow : " + res);
      expect(res).assertEqual(JSON.stringify('radius10.000000color#FFFF0000offsetX0.000000offsetY0.000000type0'));

      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0008] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textClock_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('textShadow');
      console.info("[textClockUndefined_static_0008] textShadow : " + res);
      expect(res).assertEqual("");
      console.info('[textClockUndefined_static_0008] END');
      done();
    });

    /**
     * @tc.number   textClockUndefined_static_0009
     * @tc.name     textClockUndefined_static_0009
     * @tc.desc     test textClockUndefined onDateChange undefined
     * @tc.level    Level.LEVEL1
     */
    it('textClockUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textClockUndefined_static_0009] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('onDateChange_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0009] click changeBtn");
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('onDateChange_Text'));
      let textClock = await driver.findComponent(ON.id('textClock_1'));
      await (textClock?.scrollToBottom() as Promise<void>);
      await CommonFunc.sleep(2000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('Current milliseconds is 1');
      await (changeBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0009] click changeBtn");
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('text_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[textClockUndefined_static_0009] click resetBtn");
      await CommonFunc.sleep(1000);
      await (textClock?.scrollToTop() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('Current milliseconds is 0');
      console.info('[textClockUndefined_static_0009] END');
      done();
    });
  })
}