'use static'
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

export default function RectUndefinedTest() {
  describe('RectUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("RectUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RectUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rect/rectUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RectUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("rectUndefined" == pages.name)) {
          console.info("get rectUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push rectUndefined page error:" + err);
      }
      console.info("RectUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    RectUndefinedTest_static_0100
     * @tc.name      RectUndefinedTest_static_0100
     * @tc.desc      RectUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('RectUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[RectUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Rect');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radiusWidth')))
        .assertEqual('40');

      let changeBtn = await driver.findComponent(ON.id('Rect_radiusWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Rect');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radiusWidth')))
        .assertEqual('0');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[RectUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    RectUndefinedTest_static_0200
     * @tc.name      RectUndefinedTest_static_0200
     * @tc.desc      RectUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('RectUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[RectUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Rect');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radiusHeight')))
        .assertEqual('40');

      let changeBtn = await driver.findComponent(ON.id('Rect_radiusHeight'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Rect');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radiusHeight')))
        .assertEqual('0');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[RectUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    RectUndefinedTest_static_0300
     * @tc.name      RectUndefinedTest_static_0300
     * @tc.desc      RectUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('RectUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[RectUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Rect2');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radius')))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('Rect_radius'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Rect2');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('radius')))
        .assertEqual('true');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[RectUndefinedTest_static_0300] END');
      done();
    });

  })
}