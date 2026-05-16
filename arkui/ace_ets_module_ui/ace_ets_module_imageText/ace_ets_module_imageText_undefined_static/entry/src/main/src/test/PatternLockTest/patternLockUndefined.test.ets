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

export default function PatternLockUndefinedTest() {
  describe('PatternLockUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PatternLockUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("PatternLockUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/patternLockUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("patternLockUndefined" == pages.name)) {
          console.info("get patternLockUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push patternLockUndefined page error:" + err);
      }
      console.info("PatternLockUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0100
     * @tc.name      PatternLockUndefinedTest_static_0100
     * @tc.desc      PatternLockUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('skipUnselectedPoint')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_skipUnselectedPoint'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('skipUnselectedPoint')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0200
     * @tc.name      PatternLockUndefinedTest_static_0200
     * @tc.desc      PatternLockUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoReset')))
        .assertEqual('\"false\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_autoReset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoReset')))
        .assertEqual('\"true\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0300
     * @tc.name      PatternLockUndefinedTest_static_0300
     * @tc.desc      PatternLockUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pathStrokeWidth')))
        .assertEqual('\"5.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_pathStrokeWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pathStrokeWidth')))
        .assertEqual('\"12.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0400
     * @tc.name      PatternLockUndefinedTest_static_0400
     * @tc.desc      PatternLockUndefinedTest_static_0400
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      let strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pathColor')))
        .assertEqual('\"#FFDD3636\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_pathColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      let pathColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson_test).getElement('$attrs').getElement('pathColor'));
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('pathColor')))
        .assertEqual(pathColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0500
     * @tc.name      PatternLockUndefinedTest_static_0500
     * @tc.desc      PatternLockUndefinedTest_static_0500
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      let strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('activeColor')))
        .assertEqual('\"#FF11EE5C\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_activeColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      let activeColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson_test).getElement('$attrs').getElement('activeColor'));
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('activeColor')))
        .assertEqual(activeColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0600
     * @tc.name      PatternLockUndefinedTest_static_0600
     * @tc.desc      PatternLockUndefinedTest_static_0600
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      let strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedColor')))
        .assertEqual('\"#FA41C8EA\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_selectedColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      let selectedColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson_test).getElement('$attrs').getElement('selectedColor'));
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedColor')))
        .assertEqual(selectedColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0700
     * @tc.name      PatternLockUndefinedTest_static_0700
     * @tc.desc      PatternLockUndefinedTest_static_0700
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      let strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('regularColor')))
        .assertEqual('\"#FFD19CE0\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_regularColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      let regularColor = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson_test).getElement('$attrs').getElement('regularColor'));
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('regularColor')))
        .assertEqual(regularColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0700] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0800
     * @tc.name      PatternLockUndefinedTest_static_0800
     * @tc.desc      PatternLockUndefinedTest_static_0800
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor')))
        .assertEqual('\"#FFF5F5F5\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_backgroundColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor')))
        .assertEqual('\"#00000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0800] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_0900
     * @tc.name      PatternLockUndefinedTest_static_0900
     * @tc.desc      PatternLockUndefinedTest_static_0900
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_0900] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('circleRadius')))
        .assertEqual('\"9.00px\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_circleRadius'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('circleRadius')))
        .assertEqual('\"6.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_0900] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_1000
     * @tc.name      PatternLockUndefinedTest_static_1000
     * @tc.desc      PatternLockUndefinedTest_static_1000
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_1000] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sideLength')))
        .assertEqual('\"180.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_sideLength'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sideLength')))
        .assertEqual('\"288.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_1000] END');
      done();
    });

    /**
     * @tc.number    PatternLockUndefinedTest_static_1100
     * @tc.name      PatternLockUndefinedTest_static_1100
     * @tc.desc      PatternLockUndefinedTest_static_1100
     * @tc.level     Level.LEVEL1
     */
    it('PatternLockUndefinedTest_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PatternLockUndefinedTest_static_1100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PatternLock');
      await CommonFunc.sleep(1000);
      let strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('activeCircleColor'))
        .assertEqual('#FFD53EFF');

      let changeBtn = await driver.findComponent(ON.id('PatternLock_activateCircleStyle'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('PatternLock');
      strJson_test = inspector.getInspectorByKey('PatternLock_Test');
      let activeCircleColor = JSON.parseJsonElement(strJson_test).getElement('$attrs').getString('activeCircleColor');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('activeCircleColor'))
        .assertEqual(activeCircleColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PatternLockUndefinedTest_static_1100] END');
      done();
    });

  })
}