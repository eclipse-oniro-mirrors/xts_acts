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

export default function ForEachTest010() {
  describe('ForEachTest010', () => {
    beforeEach(async (done: Function) => {
      console.info("ForEachTest010 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/ForEach010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ForEach010" == pages.name)) {
          console.info("get ForEachTest010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ForEachTest010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ForEachTest010 page error:" + err);
      }
      console.info("ForEachTest010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ForEachTest010 after each called");
    });

    /**
     * @tc.name   ForEachTest010_001
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_010
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest010_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest010_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0103"));
      await CommonFunc.sleep(1000);
      await btn.click();
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0101"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnForEach0102"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item5'))
      expect(text == null).assertTrue()
      console.info('[ForEachTest010_001] END');
      done();
    });
    /**
     * @tc.name   ForEachTest010_002
     * @tc.number SUB_ACE_TS_COMPONENT_FOREACH_013
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ForEachTest010_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ForEachTest010_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('item3'))
      await CommonFunc.sleep(1000);
      await text.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnForEach0103"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('item50'))
      await CommonFunc.sleep(1000);
      await text1.click();
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('item3'))
      expect(text2 != null).assertTrue()
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnForEach0102"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text3 = await driver.findComponent(ON.text('item50'))
      await CommonFunc.sleep(1000);
      expect(text3 != null).assertTrue()
      console.info('[ForEachTest010_002] END');
      done();
    });
  })
}
