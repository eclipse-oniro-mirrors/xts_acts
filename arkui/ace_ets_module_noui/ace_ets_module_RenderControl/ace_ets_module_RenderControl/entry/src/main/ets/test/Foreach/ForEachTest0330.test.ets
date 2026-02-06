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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ForEachTest0330() {
  describe('ForEachTest0330', () => {
    beforeEach(async (done: Function) => {
      console.info("ForEachTest0330 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/ForEach0330",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ForEach0330" == pages.name)) {
          console.info("get ForEachTest0330 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ForEachTest0330 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ForEachTest0330 page error:" + err);
      }
      console.info("ForEachTest0330 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ForEachTest0330 after each called");
    });

    /**
     * @tc.name   ForEachTest0330_001
     * @tc.number ForEachTest0330_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest0330_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest0330_001] START');
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
      console.info('[ForEachTest0330_001] END');
      done();
    });

    /**
     * @tc.name   ForEachTest0330_002
     * @tc.number ForEachTest0330_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest0330_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest0330_001] START');
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
      console.info('[ForEachTest0330_001] END');
      done();
    });

    /**
     * @tc.name   ForEachTest0330_003
     * @tc.number ForEachTest0330_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest0330_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest0330_001] START');
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
      console.info('[ForEachTest0330_001] END');
      done();
    });
  })
}
