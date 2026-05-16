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

export default function sliderUndefinedTest() {
  describe('sliderUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("sliderUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("sliderUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/sliderUndefinedOne',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get sliderUndefined state pages:" + JSON.stringify(pages));
        if (!("sliderUndefinedOne" == pages.name)) {
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
     * @tc.number   sliderUndefined_one_static_0001
     * @tc.name     sliderUndefined_one_static_0001
     * @tc.desc     test showTips
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_one_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_one_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_one_static_0001] showTips: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showTips'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showTips'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('Slider_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_one_static_0001] showTips: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('showTips'));
      console.info("[sliderUndefined_one_static_0001]: " +
      JSON.parseJsonElement(strJson).getElement('$attrs'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showTips'))
        .assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showTips'))
        .assertEqual('true');
      console.info('[sliderUndefined_one_static_0001] END');
      done();
    });


    /**
     * @tc.number   sliderUndefined_one_static_0002
     * @tc.name     sliderUndefined_one_static_0002
     * @tc.desc     test slideRange
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_one_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_one_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[slideRange_static_001] slideRange is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('slideRange')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('slideRange'))).assertEqual('{"from":"20.000000","to":"80.000000"}');

      let changeBtn = await driver.findComponent(ON.id('Slider_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[slideRange_static_001] slideRange is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('slideRange')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('slideRange'))).assertEqual('{"from":"20.000000","to":"80.000000"}');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('slideRange'))).assertEqual('{"from":"20.000000","to":"80.000000"}');
      console.info('[sliderUndefined_one_static_0002] END');
      done();
    });

    /**
     * @tc.number   sliderUndefined_one_static_0003
     * @tc.name     sliderUndefined_one_static_0003
     * @tc.desc     test selectedBorderRadius
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_one_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_one_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Slider_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[sliderUndefined_one_static_0003] selectedBorderRadius is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedBorderRadius')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedBorderRadius'))).assertContain('55');

      let changeBtn = await driver.findComponent(ON.id('Slider_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      console.info("[sliderUndefined_one_static_0003] selectedBorderRadius is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedBorderRadius')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('selectedBorderRadius'))).assertContain('55');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Slider_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBorderRadius'))
        .assertEqual('55.00vp');
      console.info('[sliderUndefined_one_static_0003] END');
      done();
    });

    /**
     * @tc.number   sliderUndefined_one_static_0004
     * @tc.name     sliderUndefined_one_static_0004
     * @tc.desc     test contentModifier
     * @tc.level    Level.LEVEL1
     */
    it('sliderUndefined_one_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[sliderUndefined_one_static_0004] START');
      let driver: Driver = Driver.create();

      let slider = inspector.getInspectorByKey('Slider_1');
      let obj = JSON.parseJsonElement(slider);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('SliderContentModifier_text1'));
      expect(text === null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Slider_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[sliderUndefined_one_static_0004] END');
      done();
    });
  })
}