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

export default function ImageAnimatorCallbackModifierUndefinedTest() {
  describe('ImageAnimatorCallbackModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageAnimatorCallbackModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAnimatorCallbackModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimatorCallbackModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get imageAnimatorCallbackModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("imageAnimatorCallbackModifierUndefined" == pages.name)) {
          console.info("get imageAnimatorCallbackModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageAnimatorCallbackModifierUndefinedTest page error:" + err);
      }
      console.info("ImageAnimatorCallbackModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    ImageAnimatorCallbackModifierUndefinedTest_static_0100
     * @tc.name      ImageAnimatorCallbackModifierUndefinedTest_static_0100
     * @tc.desc      ImageAnimatorCallbackModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorCallbackModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('ImageAnimatorM_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let imageAnimator = await driver.findComponent(ON.type('ImageAnimatorM'));
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('ImageAnimatorM_start'));
      let changeBtn_onFinish = await driver.findComponent(ON.id('ImageAnimatorM_onFinish'));
      await (changeBtn_onFinish?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('ImageAnimatorM_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onStart');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('ImageAnimatorM_onStart'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorCallbackModifierUndefinedTest_static_0200
     * @tc.name      ImageAnimatorCallbackModifierUndefinedTest_static_0200
     * @tc.desc      ImageAnimatorCallbackModifierUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorCallbackModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('ImageAnimatorM_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let imageAnimator = await driver.findComponent(ON.type('ImageAnimatorM'));
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('ImageAnimatorM_start'));
      let changeBtn_pause = await driver.findComponent(ON.id('ImageAnimatorM_pause'));
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_pause?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('ImageAnimatorM_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onPause');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('ImageAnimatorM_onPause'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_pause?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorCallbackModifierUndefinedTest_static_0300
     * @tc.name      ImageAnimatorCallbackModifierUndefinedTest_static_0300
     * @tc.desc      ImageAnimatorCallbackModifierUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorCallbackModifierUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('ImageAnimatorM_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let imageAnimator = await driver.findComponent(ON.type('ImageAnimatorM'));
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('ImageAnimatorM_start'));
      let changeBtn_cancel = await driver.findComponent(ON.id('ImageAnimatorM_cancel'));
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_cancel?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('ImageAnimatorM_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onCancel');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('ImageAnimatorM_onCancel'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_cancel?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorCallbackModifierUndefinedTest_static_0400
     * @tc.name      ImageAnimatorCallbackModifierUndefinedTest_static_0400
     * @tc.desc      ImageAnimatorCallbackModifierUndefinedTest_static_0400
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorCallbackModifierUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('ImageAnimatorM_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let imageAnimator = await driver.findComponent(ON.type('ImageAnimatorM'));
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('ImageAnimatorM_start'));
      let changeBtn_pause = await driver.findComponent(ON.id('ImageAnimatorM_pause'));
      let changeBtn = await driver.findComponent(ON.id('ImageAnimatorM_onFinish'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_pause?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('ImageAnimatorM_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onFinish');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_pause?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    ImageAnimatorCallbackModifierUndefinedTest_static_0500
     * @tc.name      ImageAnimatorCallbackModifierUndefinedTest_static_0500
     * @tc.desc      ImageAnimatorCallbackModifierUndefinedTest_static_0500
     * @tc.level     Level.LEVEL1
     */
    it('ImageAnimatorCallbackModifierUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let resetTextBtn = await driver.findComponent(ON.id('ImageAnimatorM_resetText'));
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let imageAnimator = await driver.findComponent(ON.type('ImageAnimatorM'));
      await CommonFunc.sleep(1000);

      let changeBtn_start = await driver.findComponent(ON.id('ImageAnimatorM_start'));
      let changeBtn_iterations = await driver.findComponent(ON.id('ImageAnimatorM_iterations'));
      await (changeBtn_iterations?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_start?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('ImageAnimatorM_text'));
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onRepeat');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('ImageAnimatorM_onRepeat'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ImageAnimatorCallbackModifierUndefinedTest_static_0500] END');
      done();
    });

  })
}