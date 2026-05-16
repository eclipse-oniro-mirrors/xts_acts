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

export default function ForEachTest003() {
  describe('ForEachTest003', () => {
    beforeEach(async (done: Function) => {
      console.info("ForEachTest003 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/foreach/ForEach003",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ForEach003" == pages.name)) {
          console.info("get ForEachTest003 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ForEachTest003 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ForEachTest003 page error:" + err);
      }
      console.info("ForEachTest003 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ForEachTest003 after each called");
    });

    /**
     * @tc.name   ForEachTest003_001
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0101"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('No.x'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      console.info('[ForEachTest003_001] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_002
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0103"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item5'))
      expect(text == null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[ForEachTest003_002] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_003
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0105"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0101"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnForEach0104"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('No.x'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      console.info('[ForEachTest003_003] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_004
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_004] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0105"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item50'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      console.info('[ForEachTest003_004] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_005
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_005
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_005', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_005] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0107"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0105"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('No.50'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnForEach0104"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      console.info('[ForEachTest003_005] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_006
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_006
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_006', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_006] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0108"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('No.10'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[ForEachTest003_006] END');
      done();
    });
    /**
     * @tc.name   ForEachTest003_007
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_007
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest003_007', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest003_007] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0105"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0108"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnForEach0104"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('No.10'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnForEach0106"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      console.info('[ForEachTest003_007] END');
      done();
    });
  })
}
