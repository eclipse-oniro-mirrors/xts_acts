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

export default function DragEventUndefinedTest() {
  describe('DragEventUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DragEventUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("DragEventUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/dragEventUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get DragEventUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("dragEventUndefined" == pages.name)) {
          console.info("get DragEventUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DragEventUndefinedTest page error:" + err);
      }
      console.info("DragEventUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   DragEventUndefinedTest_static_0100
     * @tc.name     DragEventUndefinedTest_static_0100
     * @tc.desc     DragEventUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('DragEventUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DragEventUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Common_OnDragEnd'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let image1 = await driver.findComponent(ON.id('Image1'));
      await CommonFunc.sleep(500);
      let Column1 = await driver.findComponent(ON.id('Column1')) as Component;
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Common_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDragEnd');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Common_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[DragEventUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   DragEventUndefinedTest_static_0200
     * @tc.name     DragEventUndefinedTest_static_0200
     * @tc.desc     DragEventUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('DragEventUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DragEventUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Common_OnDrop'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let image1 = await driver.findComponent(ON.id('Image1'));
      await CommonFunc.sleep(500);
      let Column1 = await driver.findComponent(ON.id('Column1')) as Component;
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Common_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDrop');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Common_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[DragEventUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   DragEventUndefinedTest_static_0300
     * @tc.name     DragEventUndefinedTest_static_0300
     * @tc.desc     DragEventUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('DragEventUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DragEventUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Common_OnDragEnter'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let image1 = await driver.findComponent(ON.id('Image1'));
      await CommonFunc.sleep(500);
      let Column2 = await driver.findComponent(ON.id('Column2')) as Component;
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column2) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Common_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDragEnter');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Common_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image1?.dragTo(Column2) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[DragEventUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   DragEventUndefinedTest_static_0400
     * @tc.name     DragEventUndefinedTest_static_0400
     * @tc.desc     DragEventUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('DragEventUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DragEventUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Common_OnDragLeave'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let image2 = await driver.findComponent(ON.id('Image2'));
      await CommonFunc.sleep(500);
      let Column1 = await driver.findComponent(ON.id('Column1')) as Component;
      await CommonFunc.sleep(500);
      await (image2?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Common_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDragLeave');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Common_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image2?.dragTo(Column1) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[DragEventUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   DragEventUndefinedTest_static_0500
     * @tc.name     DragEventUndefinedTest_static_0500
     * @tc.desc     DragEventUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('DragEventUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DragEventUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Common_OnDragMove'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let image2 = await driver.findComponent(ON.id('Image2'));
      await CommonFunc.sleep(500);
      let Column2 = await driver.findComponent(ON.id('Column2')) as Component;
      await CommonFunc.sleep(500);
      await (image2?.dragTo(Column2) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Common_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDragMove');
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Common_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image2?.dragTo(Column2) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[DragEventUndefinedTest_static_0500] END');
      done();
    });

  })
}
