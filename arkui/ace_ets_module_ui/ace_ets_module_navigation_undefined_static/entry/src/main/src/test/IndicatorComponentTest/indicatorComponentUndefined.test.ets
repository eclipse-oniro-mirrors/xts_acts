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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
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


export default function indicatorComponentUndefined() {
  describe('indicatorComponentUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("indicatorComponentUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("indicatorComponentUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IndicatorComponent/indicatorComponentUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get indicatorComponentUndefined state pages:" + JSON.stringify(pages));
        if (!("indicatorComponentUndefined" == pages.name)) {
          console.info("get indicatorComponentUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push indicatorComponentUndefined page error:" + err);
      }
      console.info("indicatorComponentUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   indicatorComponentUndefined_static_0001
     * @tc.name     indicatorComponentUndefined_static_0001
     * @tc.desc     test initialIndex
     * @tc.level    Level.LEVEL1
     */
    it('indicatorComponentUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[indicatorComponentUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0001] initialIndex: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('initialIndex'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('initialIndex'))
        .assertEqual(0);

      let changeBtn = await driver.findComponent(ON.id('IndicatorComponent_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0001] initialIndex: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('initialIndex'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('initialIndex'))
        .assertEqual(1);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('initialIndex'))
        .assertEqual(0);
      console.info('[indicatorComponentUndefined_static_0001] END');
      done();
    });


    /**
     * @tc.number   indicatorComponentUndefined_static_0002
     * @tc.name     indicatorComponentUndefined_static_0002
     * @tc.desc     test loop
     * @tc.level    Level.LEVEL1
     */
    it('indicatorComponentUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[indicatorComponentUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0002] loop: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('IndicatorComponent_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0002] loop: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'))
        .assertEqual('true');
      console.info('[indicatorComponentUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   indicatorComponentUndefined_static_0003
     * @tc.name     indicatorComponentUndefined_static_0003
     * @tc.desc     test count
     * @tc.level    Level.LEVEL1
     */
    it('indicatorComponentUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[indicatorComponentUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0003] count: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('count'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('count'))
        .assertEqual(0);

      let changeBtn = await driver.findComponent(ON.id('IndicatorComponent_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0003] count: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('count'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('count'))
        .assertEqual(3);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('count'))
        .assertEqual(0);
      console.info('[indicatorComponentUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   indicatorComponentUndefined_static_0004
     * @tc.name     indicatorComponentUndefined_static_0004
     * @tc.desc     test vertical
     * @tc.level    Level.LEVEL1
     */
    it('indicatorComponentUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[indicatorComponentUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0004] vertical: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical'))
        .assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('IndicatorComponent_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[indicatorComponentUndefined_static_0004] vertical: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical'))
        .assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical'))
        .assertEqual('false');
      console.info('[indicatorComponentUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   indicatorComponentUndefined_static_0005
     * @tc.name     indicatorComponentUndefined_static_0005
     * @tc.desc     test onChange
     * @tc.level    Level.LEVEL1
     */
    it('indicatorComponentUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[indicatorComponentUndefined_static_0005] START');
      let driver: Driver = Driver.create();

      let nextBtn = await driver.findComponent(ON.id('IndicatorComponent_next'));
      await (nextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('IndicatorComponent_text'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('next:0');

      let changeBtn = await driver.findComponent(ON.id('IndicatorComponent_btn6'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (nextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('next:1');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (nextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('next:1');
      console.info('[indicatorComponentUndefined_static_0005] END');
      done();
    });
  })
}