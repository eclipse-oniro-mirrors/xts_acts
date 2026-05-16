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
import { DateTimeOptions } from '@ohos.arkui.component';
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

export default function textPickerUndefined() {
  describe('textPickerUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("textPickerUndefined beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information01.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textPickerUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text_Picker/textPickerUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get textPickerUndefined state pages:" + JSON.stringify(pages));
        if (!("textPickerUndefined" == pages.name)) {
          console.info("get textPickerUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textPickerUndefined page error:" + err);
      }
      console.info("textPickerUndefined beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.number   textPickerUndefined_static_0001
     * @tc.name     textPickerUndefined_static_0001
     * @tc.desc     test textPickerUndefined selectedIndex undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textPicker_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getArray('selecteds');
      console.info("[textPickerUndefined_static_0001] selectedIndex : " + res);
      expect(res[0].asString()).assertEqual('0');

      let changeBtn = await driver.findComponent(ON.id('selectedIndex_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textPickerUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getArray('selecteds');
      console.info("[textPickerUndefined_static_0001] selectedIndex : " + res);
      expect(res[0].asString()).assertEqual('2');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getArray('selecteds');
      console.info("[textPickerUndefined_static_0001] selectedIndex : " + res);
      expect(res[0].asString()).assertEqual('0');
      console.info('[textPickerUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   textPickerUndefined_static_0003
     * @tc.name     textPickerUndefined_static_0003
     * @tc.desc     test textPickerUndefined onChange undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0003] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('textPickerChangeFlag_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('textPickerChangeFlag_Text'));
      let textClock = await driver.findComponent(ON.id('textPicker_1'));
      await (textClock?.scrollToBottom() as Promise<void>);
      await CommonFunc.sleep(2000);

      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is onChange');
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);

      let resetBtn = await driver.findComponent(ON.id('textPickerChange_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0003] click resetBtn");
      await CommonFunc.sleep(1000);

      await (textClock?.scrollToTop() as Promise<void>);
      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is -1');
      console.info('[textPickerUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   textPickerUndefined_static_0004
     * @tc.name     textPickerUndefined_static_0004
     * @tc.desc     test textPickerUndefined digitalCrownSensitivity undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0004] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textPicker_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      console.info("[textPickerUndefined_static_0004] digitalCrownSensitivity : " + res);
      expect(res).assertEqual('1');

      let changeBtn = await driver.findComponent(ON.id('digitalCrownSensitivity_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textPickerUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      console.info("[textPickerUndefined_static_0004] digitalCrownSensitivity : " + res);
      expect(res).assertEqual('2');

      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('digitalCrownSensitivity');
      console.info("[textPickerUndefined_static_0004] digitalCrownSensitivity : " + res);
      expect(res).assertEqual('1');
      console.info('[textPickerUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   textPickerUndefined_static_0006
     * @tc.name     textPickerUndefined_static_0006
     * @tc.desc     test textPickerUndefined onEnterSelectedArea undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0006] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('onEnterSelectedAreaFlag_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('textPickerChangeFlag_Text'));
      let textClock = await driver.findComponent(ON.id('textPicker_1'));
      await (textClock?.scrollToBottom() as Promise<void>);
      await CommonFunc.sleep(2000);

      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is onEnterSelectedArea');
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);

      let resetBtn = await driver.findComponent(ON.id('textPickerChange_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0006] click resetBtn");
      await CommonFunc.sleep(2000);

      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is -1');
      console.info('[textPickerUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   textPickerUndefined_static_0007
     * @tc.name     textPickerUndefined_static_0007
     * @tc.desc     test textPickerUndefined onScrollStop undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0007] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('onScrollStopFlag_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0007] click changeBtn");
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('textPickerChangeFlag_Text'));
      let textClock = await driver.findComponent(ON.id('textPicker_1'));
      await (textClock?.scrollToBottom() as Promise<void>);
      await CommonFunc.sleep(2000);

      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is onScrollStopFlag');
      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0007] click changeBtn");
      await CommonFunc.sleep(1000);

      let resetBtn = await driver.findComponent(ON.id('textPickerChange_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0007] click resetBtn");
      await CommonFunc.sleep(1000);

      expect(await (text?.getText() as Promise<string>)).assertEqual('textPickerChange is -1');
      console.info('[textPickerUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number   textPickerUndefined_static_0008
     * @tc.name     textPickerUndefined_static_0008
     * @tc.desc     test textPickerUndefined enableHapticFeedback undefined
     * @tc.level    Level.LEVEL1
     */
    it('textPickerUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[textPickerUndefined_static_0008] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('textPicker_1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[textPickerUndefined_static_0008] enableHapticFeedback : " + res);
      expect(res).assertEqual(true);

      let changeBtn = await driver.findComponent(ON.id('enableHapticFeedbackFlag_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[textPickerUndefined_static_0008] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[textPickerUndefined_static_0008] enableHapticFeedback : " + res);
      expect(res).assertEqual(false);

      await (changeBtn?.click() as Promise<void>);
      console.info("[textPickerUndefined_static_0008] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('textPicker_1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enableHapticFeedback');
      console.info("[textPickerUndefined_static_0008] enableHapticFeedback : " + res);
      expect(res).assertEqual(true);
      console.info('[textPickerUndefined_static_0008] END');
      done();
    });
  })
}