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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function showActionMenuMode() {
  describe('showActionMenuMode', () => {
    beforeEach(async (done: Function) => {
      console.info("showActionMenuMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/prompt/showActionMenuMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionMenuMode state pages: " + JSON.stringify(pages));
        if (!("showActionMenuMode" == pages.name)) {
          console.info("get showActionMenuMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push showActionMenuMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuMode page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number showActionMenuMode_0100
     * @tc.name showActionMenuMode_0100
     * @tc.desc set levelMode: 0(LevelMode.OVERLAY),levelUniqueId: Normal value
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0100', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: OVERLAY'));
      await btn.click();
      console.info('[showActionMenuMode_0100] overlay click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0100] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0100] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0100] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertTrue();
      await btn4.click();
      console.info('[showActionMenuMode_0100] END');
      done();
    });

    /**
     * @tc.number showActionMenuMode_0200
     * @tc.name showActionMenuMode_0200
     * @tc.desc set levelMode: 1(LevelMode.EMBEDDED),levelUniqueId: Normal value
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0200', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[showActionMenuMode_0200] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0200] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0200] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0200] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertFalse();
      // await btn4.click();
      console.info('[showActionMenuMode_0200] END');
      done();
    });

    /**
     * @tc.number showActionMenuMode_0300
     * @tc.name showActionMenuMode_0300
     * @tc.desc set levelMode: 0(LevelMode.OVERLAY),levelUniqueId: Abnormal value,
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0300', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: OVERLAY'));
      await btn.click();
      console.info('[showActionMenuMode_0300] OVERLAY click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Abnormal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0300] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0300] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0300] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertTrue();
      await btn4.click();
      console.info('[showActionMenuMode_0300] END');
      done();
    });

    /**
     * @tc.number showActionMenuMode_0400
     * @tc.name showActionMenuMode_0400
     * @tc.desc set  set levelMode: 1(LevelMode.EMBEDDED),levelUniqueId: Abnormal value
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0400', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0400 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('levelMode: EMBEDDED'));
      await btn.click();
      console.info('[showActionMenuMode_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Abnormal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);

      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0400] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0400] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0400] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertTrue();
      await btn4.click();
      console.info('[showActionMenuMode_0400] END');
      done();
    });

    /**
     * @tc.number showActionMenuMode_0500
     * @tc.name showActionMenuMode_0500
     * @tc.desc set levelMode: undefined,levelUniqueId: Normal value
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0500', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0500 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('undefined'));
      await btn.click();
      console.info('[showActionMenuMode_0500] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0500] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0500] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0500] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertTrue();
      await btn4.click();
      console.info('[showActionMenuMode_0500] END');
      done();
    });
    /**
     * @tc.number showActionMenuMode_0600
     * @tc.name showActionMenuMode_0600
     * @tc.desc set levelMode: null,levelUniqueId: Normal value
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuMode_0600', Level.LEVEL1, async (done: Function) => {
      console.info('showActionMenuMode_0600 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('null'));
      await btn.click();
      console.info('[showActionMenuMode_0600] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = await driver.findComponent(ON.id('uniqId: Normal value'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('showAction'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_0600] showAction click');

      let btn2: Component = await driver.findComponent(ON.text('取消'));
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_0600] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('back'));
      await btn3.click();
      console.info('[showActionMenuMode_0600] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.text('取消'));
      expect(btn4 != null).assertTrue();
      await btn4.click();
      console.info('[showActionMenuMode_0600] END');
      done();
    })
  })
}