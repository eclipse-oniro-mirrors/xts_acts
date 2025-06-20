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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function ScrollSizeMode_APITest() {
  describe('ScrollSizeMode_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollSizeMode_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BindSheet/BindSheet_API/ScrollSizeMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSizeMode_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ScrollSizeMode_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollSizeMode_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollSizeMode_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    ScrollSizeMode
     * @tc.name      ScrollSizeMode_APITest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSizeMode_APITest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSizeMode_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let change1: Component = await driver.findComponent(ON.id('change1'));
      await change1.click();
      await CommonFunc.sleep(1000);
      let close: Component = await driver.findComponent(ON.id('close'));
      await close.click();
      await CommonFunc.sleep(1000);
      let ScrollSizeMode_1 = getInspectorByKey('ScrollSizeMode_1');
      console.info("[ScrollSizeMode_APITest_0100] Tabs animationMode attrs is: " + JSON.stringify(JSON.parse(ScrollSizeMode_1).$attrs));
      expect(JSON.parse(ScrollSizeMode_1).$attrs.content).assertEqual('0');
      console.info('[ScrollSizeMode_APITest_0100] END');
      done();
    });

    /**
     * @tc.number    ScrollSizeMode
     * @tc.name      ScrollSizeMode_APITest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSizeMode_APITest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSizeMode_APITest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let change: Component = await driver.findComponent(ON.id('change'));
      await change.click();
      await CommonFunc.sleep(1000);
      let change2: Component = await driver.findComponent(ON.id('change2'));
      await change2.click();
      await CommonFunc.sleep(1000);
      let close: Component = await driver.findComponent(ON.id('close'));
      await close.click();
      await CommonFunc.sleep(1000);
      let ScrollSizeMode_1 = getInspectorByKey('ScrollSizeMode_1');
      console.info("[ScrollSizeMode_APITest_0200] Tabs animationMode attrs is: " + JSON.stringify(JSON.parse(ScrollSizeMode_1).$attrs));
      expect(JSON.parse(ScrollSizeMode_1).$attrs.content).assertEqual('0');
      console.info('[ScrollSizeMode_APITest_0200] END');
      done();
    });
  })
}