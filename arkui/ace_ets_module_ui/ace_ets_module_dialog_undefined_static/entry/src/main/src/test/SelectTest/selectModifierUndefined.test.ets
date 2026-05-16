'use static';
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
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
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
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function selectModifierUndefined() {
  describe('selectModifierUndefined', () => {
    beforeAll(async ():Promise<void> => {
      console.info("selectModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/selectModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("selectModifierUndefined" == pages.name)) {
          console.info("get selectModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectModifierUndefined page error:" + err);
      }
      console.info("selectModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   selectModifierUndefined_static_0001
     * @tc.name     selectModifierUndefined_static_0001
     * @tc.desc     test selected
     * @tc.level    Level.LEVEL1
     */
    it('selectModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0001] selected: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'))
        .assertEqual('0');

      let changeBtn = await driver.findComponent(ON.id('SelectM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0001] selected: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'))
        .assertEqual('2');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SelectM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'))
        .assertEqual('0');
      console.info('[selectModifierUndefined_static_0001] END');
      done();
    });


    /**
     * @tc.number   selectModifierUndefined_static_0002
     * @tc.name     selectModifierUndefined_static_0002
     * @tc.desc     test optionFont
     * @tc.level    Level.LEVEL1
     */
    it('selectModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0002] optionFont: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFont'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFont'))
        .assertEqual('{"size":"16.00fp","weight":"FontWeight.Regular","family":"","style":"FontStyle.Normal"}');

      let changeBtn = await driver.findComponent(ON.id('SelectM_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0002] optionFont: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFont'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFont'))
        .assertEqual('{"size":"16.00fp","weight":"100","family":"","style":"FontStyle.Normal"}');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFont'))
        .assertEqual('{"size":"16.00fp","weight":"FontWeight.Regular","family":"","style":"FontStyle.Normal"}');
      console.info('[selectModifierUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   selectModifierUndefined_static_0003
     * @tc.name     selectModifierUndefined_static_0003
     * @tc.desc     test optionWidth
     * @tc.level    Level.LEVEL1
     */
    it('selectModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0003] optionWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionWidth'))
        .assertEqual('0.000000');

      let changeBtn = await driver.findComponent(ON.id('SelectM_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0003] optionWidth: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionWidth'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionWidth'))
        .assertEqual('100.000000');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionWidth'))
        .assertEqual('0.000000');
      console.info('[selectModifierUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   selectModifierUndefined_static_0004
     * @tc.name     selectModifierUndefined_static_0004
     * @tc.desc     test optionFontColor
     * @tc.level    Level.LEVEL1
     */
    it('selectModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let changeBtn = await driver.findComponent(ON.id('SelectM_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('SelectM_1');
      let optionFontColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFontColor');
      console.info("[selectModifierUndefined_static_0004] optionFontColor: " + optionFontColor);

      changeBtn = await driver.findComponent(ON.id('SelectM_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      console.info("[selectModifierUndefined_static_0004] optionFontColor: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFontColor')).assertEqual('#FFFF00FF');
  
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('SelectM_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('optionFontColor')).assertEqual(optionFontColor);
      console.info('[selectModifierUndefined_static_0004] END');
      done();
    });
  })
}