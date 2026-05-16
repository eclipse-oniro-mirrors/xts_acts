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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';


export default function gridEventModifierUndefinedTest() {
  describe('gridEventModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("gridEventModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("gridEventModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/gridEventModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridEventModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gridEventModifierUndefined" == pages.name)) {
          console.info("get gridEventModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gridEventModifierUndefinedTest page error:" + err);
      }
      console.info("gridEventModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   gridEventModifierUndefinedTest_static_0001
     * @tc.name     gridEventModifierUndefinedTest_static_0001
     * @tc.desc     test onScrollFrameBegin
     * @tc.level    Level.LEVEL1
     */
    it('gridEventModifierUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onScrollFrameBeginValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollFrameBegin');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0001] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0002
    * @tc.name     gridEventModifierUndefinedTest_static_0002
    * @tc.desc     test onDidScroll
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0002] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onDidScrollValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);

      expect(await (text?.getText() as Promise<String>)).assertEqual('onDidScroll');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0002] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0003
    * @tc.name     gridEventModifierUndefinedTest_static_0003
    * @tc.desc     test onScrollStart
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onScrollStartValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollStart');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0003] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0004
    * @tc.name     gridEventModifierUndefinedTest_static_0004
    * @tc.desc     test onScrollStop
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0004] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onScrollStopValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);

      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollStop');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0004] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0005
    * @tc.name     gridEventModifierUndefinedTest_static_0005
    * @tc.desc     test onScrollBarUpdate
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0005] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onScrollBarUpdateValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);

      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollBarUpdate');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0005] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0006
    * @tc.name     gridEventModifierUndefinedTest_static_0006
    * @tc.desc     test onScrollIndex
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gridEventModifierUndefinedTest_static_0006] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onScrollIndexValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);

      expect(await (text?.getText() as Promise<String>)).assertEqual('onScrollIndex');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[gridEventModifierUndefinedTest_static_0006] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0007
    * @tc.name     gridEventModifierUndefinedTest_static_0007
    * @tc.desc     test onReachStart
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ gridEventModifierUndefinedTest_static_0007] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onReachStartValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachStart');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ gridEventModifierUndefinedTest_static_0007] END');
      done();
    });

    /**
    * @tc.number   gridEventModifierUndefinedTest_static_0008
    * @tc.name     gridEventModifierUndefinedTest_static_0008
    * @tc.desc     test onReachEnd
    * @tc.level    Level.LEVEL1
    */
    it('gridEventModifierUndefinedTest_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ gridEventModifierUndefinedTest_static_0008] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('GridM_onReachEndValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let toBottomBtn = await driver.findComponent(ON.id('GridM_flingBottom'));
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      let toTopBtn = await driver.findComponent(ON.id('GridM_flingTop'));
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('GridM_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onReachEnd');
      
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('GridM_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (toBottomBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (toTopBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[ gridEventModifierUndefinedTest_static_0008] END');
      done();
    });
  })
}