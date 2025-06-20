/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LazyForEachTest0470() {
  describe('LazyForEachTest0470', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachTest0470 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/LazyForEach0470",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("LazyForEach0470" == pages.name)) {
          console.info("get LazyForEachTest0470 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachTest0470 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachTest0470 page error:" + err);
      }
      console.info("LazyForEachTest0470 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachTest0470 after each called");
    });

    /**
     * @tc.number    SUB_ACE_RENDERINGCONTROL_LAZYFOREACH_0470
     * @tc.name      LazyForEachTest0470_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('LazyForEachTest0470_001', 0, async (done: Function) => {
      console.info('[LazyForEachTest0470_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnDelTwo49"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('TwoItem49'))
      expect(text == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnDelOne0"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('OneItem0'))
      expect(text1 == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.id("btnDelOne9"));
      await CommonFunc.sleep(1000);
      await btn4.click();
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('OneItem10'))
      expect(text2 == null).assertTrue()
      console.info('[LazyForEachTest0470_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RENDERINGCONTROL_LAZYFOREACH_0470
     * @tc.name      LazyForEachTest0470_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('LazyForEachTest0470_002', 0, async (done: Function) => {
      console.info('[LazyForEachTest0470_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnInsertTwo49"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnInsertOne0"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.id("btnInsertOne9"));
      await CommonFunc.sleep(1000);
      await btn4.click();
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloOne9'))
      expect(text2 != null).assertTrue()
      console.info('[LazyForEachTest0470_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RENDERINGCONTROL_LAZYFOREACH_0470
     * @tc.name      LazyForEachTest0470_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('LazyForEachTest0470_003', 0, async (done: Function) => {
      console.info('[LazyForEachTest0470_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnMakeTwo49"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnSwipeBottom"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloWorldTwo49'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnMakeOne0"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnSwipeTop"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('HelloWorldOne0'))
      expect(text1 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.id("btnMakeOne9"));
      await CommonFunc.sleep(1000);
      await btn4.click();
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('HelloWorldOne9'))
      expect(text2 != null).assertTrue()
      console.info('[LazyForEachTest0470_001] END');
      done();
    });
  })
}
