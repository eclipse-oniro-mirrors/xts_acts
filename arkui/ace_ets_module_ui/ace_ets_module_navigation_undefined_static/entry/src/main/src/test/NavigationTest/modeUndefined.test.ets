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
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function ModeUndefinedTest() {
  describe('ModeUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ModeUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ModeUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/modeUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ModeUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("modeUndefined" == pages.name)) {
          console.info("get ModeUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push ModeUndefinedTest page error:" + err);
      }
      console.info("ModeUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   ModeUndefinedTest_static_0001
     * @tc.name     ModeUndefinedTest_static_0001
     * @tc.desc     ModeUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('ModeUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ModeUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);

      console.info("[ModeUndefinedTest_static_0001] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ModeUndefinedTest_static_0001] mode: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mode')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('mode')))
        .assertEqual('\"NavigationMode.SPLIT\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_mode'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ModeUndefinedTest_static_0001] click Navigation_mode");
      strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('mode')))
        .assertEqual('\"NavigationMode.AUTO\"');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[ModeUndefinedTest_static_0001] END');
      done();
    });

    /**
     * @tc.number   ModeUndefinedTest_static_0002
     * @tc.name     ModeUndefinedTest_static_0002
     * @tc.desc     ModeUndefinedTest_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('ModeUndefinedTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ModeUndefinedTest_static_0002] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);

      console.info("[ModeUndefinedTest_static_0002] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ModeUndefinedTest_static_0002] minContentWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minContentWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"150.00vp\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_minContentWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ModeUndefinedTest_static_0002] click Navigation_minContentWidth");
      strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"360.00vp\"');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[ModeUndefinedTest_static_0002] END');
      done();
    });

    /**
     * @tc.number   ModeUndefinedTest_static_0003
     * @tc.name     ModeUndefinedTest_static_0003
     * @tc.desc     ModeUndefinedTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('ModeUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ModeUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);

      console.info("[ModeUndefinedTest_static_0003] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ModeUndefinedTest_static_0003] navBarWidthRange: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('navBarWidthRange')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"10.00vp, 500.00vp\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_navBarWidthRange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[ModeUndefinedTest_static_0003] click Navigation_navBarWidthRange");
      strJson = inspector.getInspectorByKey('MyNavigation3');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"240.00vp, 432.00vp\"');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[ModeUndefinedTest_static_0003] END');
      done();
    });

  })
}