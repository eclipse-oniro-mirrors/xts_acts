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

export default function ImageAnimatorUndefinedTest() {
  describe('ImageAnimatorUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageAnimatorUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAnimatorUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimatorUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ImageAnimatorUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("imageAnimatorUndefined" == pages.name)) {
          console.info("get imageAnimatorUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageAnimatorUndefined page error:" + err);
      }
      console.info("ImageAnimatorUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0100
     * @tc.name      ImageAnimatorUndefinedTest_static_0100
     * @tc.desc      ImageAnimatorUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('iterations')))
        .assertEqual('\"2\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_iterations'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('iterations')))
        .assertEqual('\"1\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0200
     * @tc.name      ImageAnimatorUndefinedTest_static_0200
     * @tc.desc      ImageAnimatorUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fillMode')))
        .assertEqual('\"FillMode.Backwards\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_fillMode'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fillMode')))
        .assertEqual('\"FillMode.Forwards\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0300
     * @tc.name      ImageAnimatorUndefinedTest_static_0300
     * @tc.desc      ImageAnimatorUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fixedSize')))
        .assertEqual('\"false\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_fixedSize'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fixedSize')))
        .assertEqual('\"true\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0400
     * @tc.name      ImageAnimatorUndefinedTest_static_0400
     * @tc.desc      ImageAnimatorUndefinedTest_static_0400
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('monitorInvisibleArea')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_monitorInvisibleArea'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('monitorInvisibleArea')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0500
     * @tc.name      ImageAnimatorUndefinedTest_static_0500
     * @tc.desc      ImageAnimatorUndefinedTest_static_0500
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('reverse')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_reverse'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('reverse')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0600
     * @tc.name      ImageAnimatorUndefinedTest_static_0600
     * @tc.desc      ImageAnimatorUndefinedTest_static_0600
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('state')))
        .assertEqual('\"AnimationStatus.Running\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_state'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('state')))
        .assertEqual('\"AnimationStatus.Initial\"');
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0700
     * @tc.name      ImageAnimatorUndefinedTest_static_0700
     * @tc.desc      ImageAnimatorUndefinedTest_static_0700
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('images')))
        .assertContain('resource:///16777249.png');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_images'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('images')))
        .assertEqual('\"[]\"');
      await CommonFunc.sleep(1000);
      console.info('[ImageAnimatorUndefinedTest_static_0700] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorUndefinedTest_static_0800
     * @tc.name      ImageAnimatorUndefinedTest_static_0800
     * @tc.desc      ImageAnimatorUndefinedTest_static_0800
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('duration')))
        .assertEqual('\"5000\"');

      let changeBtn = await driver.findComponent(ON.id('ImageAnimator_duration'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('ImageAnimator');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('duration')))
        .assertEqual('\"1000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ImageAnimatorUndefinedTest_static_0800] END');
      done();
    });

  })
}