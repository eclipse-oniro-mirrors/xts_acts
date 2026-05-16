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

export default function sliderUndefined() {
  describe('sliderUndefined', () => {
    beforeAll(async ():Promise<void> => {
      console.info("sliderUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("sliderUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/sliderUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get sliderUndefined state pages:" + JSON.stringify(pages));
        if (!("sliderUndefined" == pages.name)) {
          console.info("get sliderUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sliderUndefined page error:" + err);
      }
      console.info("sliderUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   sliderUndefined_static_0001
     * @tc.name     sliderUndefined_static_0001
     * @tc.desc     test stepColor
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      let stepColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepColor');
      console.info("[sliderUndefined_static_0001] stepColor: " + stepColor);

      let changeBtn = await driver.findComponent(ON.id('Slider_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0001] stepColor: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepColor'))
        .assertEqual('#FFFF0000');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepColor'))
        .assertEqual(stepColor);
      console.info('[sliderUndefined_static_0001] END');
      done();
    });


    /**
     * @tc.number   sliderUndefined_static_0002
     * @tc.name     sliderUndefined_static_0002
     * @tc.desc     test stepSize
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0002] stepSize: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize'))
        .assertEqual('4.00vp');

      let changeBtn = await driver.findComponent(ON.id('Slider_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0002] stepSize: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize'))
        .assertEqual('8.00vp');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize'))
        .assertEqual('4.00vp');
      console.info('[sliderUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   sliderUndefined_static_0003
     * @tc.name     sliderUndefined_static_0003
     * @tc.desc     test trackBorderRadius
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      expect(strJson.indexOf('trackBorderRadius'))
        .assertEqual(-1)

      let changeBtn = await driver.findComponent(ON.id('Slider_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0003] trackBorderRadius: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackBorderRadius'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackBorderRadius'))
        .assertEqual('1.00vp');
      
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(strJson.indexOf('trackBorderRadius'))
        .assertEqual(-1)
      console.info('[sliderUndefined_static_0003] END');
      done();
    });


    /**
     * @tc.number   sliderUndefined_static_0004
     * @tc.name     sliderUndefined_static_0004
     * @tc.desc     test trackColor
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      let trackColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor');
      console.info("[sliderUndefined_static_0004] trackColor: " + trackColor);

      let changeBtn = await driver.findComponent(ON.id('Slider_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0004] trackColor: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor'))
        .assertEqual('#FFFFCC00');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackColor'))
        .assertEqual(trackColor);
      console.info('[sliderUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   sliderUndefined_static_0005
     * @tc.name     sliderUndefined_static_0005
     * @tc.desc     test trackThickness
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_static_0005] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0005] trackThickness: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackThickness'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackThickness'))
        .assertEqual('20.00vp');

      let changeBtn = await driver.findComponent(ON.id('Slider_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_static_0005] trackThickness: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackThickness'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackThickness'))
        .assertEqual('25.00vp');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('trackThickness'))
        .assertEqual('20.00vp');
      console.info('[sliderUndefined_static_0005] END');
      done();
    });
  })
}