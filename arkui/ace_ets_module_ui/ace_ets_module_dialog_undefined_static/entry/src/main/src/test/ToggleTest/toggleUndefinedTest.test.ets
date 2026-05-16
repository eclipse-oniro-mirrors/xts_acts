'use static'
/**
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
  PointerMatrix
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

export default function toggleUndefinedTest() {
  describe('toggleUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("toggleUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("toggleUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/toggleUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get toggleUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("toggleUndefined" == pages.name)) {
          console.info("get toggleUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push toggleUndefined page error:" + err);
      }
      console.info("toggleUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   ToggleUndefinedTest_static_0100
     * @tc.name     ToggleUndefinedTest_static_0100
     * @tc.desc     ToggleUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ToggleUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ToggleUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      let circle = await driver.findComponent(ON.id('Circle'));

      expect(circle !== null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Toggle_contentModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ToggleUndefinedTest_static_0100] click Toggle_contentModifier");

      circle = await driver.findComponent(ON.id('Circle'));
      expect(circle === null).assertTrue();
      await (changeBtn?.click() as Promise<void>);
      console.info('[ToggleUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   ToggleUndefinedTest_static_0200
     * @tc.name     ToggleUndefinedTest_static_0200
     * @tc.desc     ToggleUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ToggleUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ToggleUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      let toggle = inspector.getInspectorByKey('Toggle');

      console.info("[ToggleUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs')));
      console.info("[ToggleUndefinedTest_static_0200] switchStyle: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs').getElement('pointRadius')));
      expect(JSON.parseJsonElement(toggle).getElement('$attrs').getString('pointRadius'))
        .assertEqual('15.00vp');

      let changeBtn = await driver.findComponent(ON.id('Toggle_switchStyle'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ToggleUndefinedTest_static_0200] click Toggle_switchStyle");
      toggle = inspector.getInspectorByKey('Toggle');
      expect(JSON.parseJsonElement(toggle).getElement('$attrs').getString('pointRadius'))
        .assertEqual('8.00vp');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ToggleUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   ToggleUndefinedTest_static_0300
     * @tc.name     ToggleUndefinedTest_static_0300
     * @tc.desc     ToggleUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ToggleUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ToggleUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      let toggle = inspector.getInspectorByKey('Toggle');

      console.info("[ToggleUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs')));
      console.info("[ToggleUndefinedTest_static_0300] switchPointColor: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs').getElement('switchPointColor')));
      expect(JSON.parseJsonElement(toggle).getElement('$attrs').getString('switchPointColor'))
        .assertEqual('#FFFFA500');

      let changeBtn = await driver.findComponent(ON.id('Toggle_switchPointColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ToggleUndefinedTest_static_0300] click Toggle_switchPointColor");
      toggle = inspector.getInspectorByKey('Toggle');
      expect(JSON.parseJsonElement(toggle).getElement('$attrs').getString('switchPointColor'))
        .assertEqual('#FFFFFFFF');
      await (changeBtn?.click() as Promise<void>);
      console.info('[ToggleUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   ToggleUndefinedTest_static_0400
     * @tc.name     ToggleUndefinedTest_static_0400
     * @tc.desc     ToggleUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ToggleUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ToggleUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      let toggle = inspector.getInspectorByKey('Toggle');

      let selectedColor = JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs').getElement('selectedColor'));
      console.info("[ToggleUndefinedTest_static_0400] selectedColor: " + selectedColor);

      let changeBtn = await driver.findComponent(ON.id('Toggle_selectedColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      console.info("[ToggleUndefinedTest_static_0400] click Toggle_selectedColor");
      toggle = inspector.getInspectorByKey('Toggle');
      expect(JSON.parseJsonElement(toggle).getElement('$attrs').getString('selectedColor'))
        .assertEqual('#FF0000FF');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      toggle = inspector.getInspectorByKey('Toggle');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(toggle).getElement('$attrs').getElement('selectedColor')))
        .assertEqual(selectedColor);

      console.info('[ToggleUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   ToggleUndefinedTest_static_0500
     * @tc.name     ToggleUndefinedTest_static_0500
     * @tc.desc     ToggleUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ToggleUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ToggleUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('Toggle_resetText'));

      let text = await driver.findComponent(ON.id('Toggle_text'));
      let toggle = await driver.findComponent(ON.id('Toggle2'));
      await (toggle?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onChange');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('[ToggleUndefinedTest_static_0500] END');
      done();
    });
  })
}