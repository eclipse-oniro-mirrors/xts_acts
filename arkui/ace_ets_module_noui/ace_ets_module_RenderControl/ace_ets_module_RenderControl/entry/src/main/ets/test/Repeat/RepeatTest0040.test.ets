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

export default function RepeatTest0040() {
  describe('RepeatTest0040', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatTest0040 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/Repeat0040",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Repeat0040" == pages.name)) {
          console.info("get RepeatTest0040 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatTest0040 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatTest0040 page error:" + err);
      }
      console.info("RepeatTest0040 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatTest0040 after each called");
    });

    /**
     * @tc.name   RepeatTest0040_001
     * @tc.number RepeatTest0040_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatTest0040_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatTest0040_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnRepeat00401"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[5]
        .$children[1];
      console.info("[RepeatTest0040_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('three');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnRefreshRepeat0040"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[RepeatTest0040_001] END');
      done();
    });

    /**
     * @tc.name   RepeatTest0040_002
     * @tc.number RepeatTest0040_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatTest0040_002', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatTest0040_002] START');
      await CommonFunc.sleep(2000);
      let treeStr: string = JSON.stringify(getInspectorTree())
      let obj: ESObject = JSON.parse(treeStr).$children[0].$children[5].$children[0];
      console.info("[RepeatTest0040_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('one');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(treeStr).$children[0].$children[5].$children[1];
      console.info("[RepeatTest0040_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('two');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(treeStr).$children[0].$children[5].$children[2];
      console.info("[RepeatTest0040_002] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('three');
      console.info('[RepeatTest0040_002] END');
      done();
    });

    /**
     * @tc.name   RepeatTest0040_003
     * @tc.number RepeatTest0040_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatTest0040_003', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatTest0040_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnRepeat00402"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0].$children[5].$children[2];
      console.info("[RepeatTest0040_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('我');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnRefreshRepeat0040"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[RepeatTest0040_003] END');
      done();
    });

    /**
     * @tc.name   RepeatTest0040_004
     * @tc.number RepeatTest0040_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatTest0040_004', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatTest0040_004] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnRepeat00403"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0].$children[5].$children[2];
      console.info("[RepeatTest0040_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('six');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnRefreshRepeat0040"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[RepeatTest0040_004] END');
      done();
    });

    /**
     * @tc.name   RepeatTest0040_005
     * @tc.number RepeatTest0040_005
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatTest0040_005', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatTest0040_005] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnRepeat00404"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree())).$children[0].$children[5].$children[3];
      console.info("[RepeatTest0040_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('five');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnRefreshRepeat0040"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      console.info('[RepeatTest0040_005] END');
      done();
    });
  })
}
