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
import router from "@ohos.router";
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";

export default function IconApiTest() {
  describe("IconApiTest", () => {
    beforeEach(async (done: Function) => {
      console.info("IconApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/MenuApi/IconApi",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IconApiTest state pages:" + JSON.stringify(pages));
        if (!("IconApi" == pages.name)) {
          console.info("get IconApiTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push IconApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IconApiTest page error:" + err);
      }
      console.info("IconApiTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IconApiTest after each called");
    });

    /**
     * @tc.name   IconApiTest_001
     * @tc.number IconApiTest_001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("IconApiTest_001", Level.LEVEL2, async (done: Function) => {
      console.info("[IconApiTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let symbolStartIcon = getInspectorByKey("symbolStartIcon");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(symbolStartIcon).$attrs.content).assertEqual("symbolStartIcon");
      console.info("[IconApiTest_001] END");
      done();
    });

    /**
     * @tc.name   IconApiTest_002
     * @tc.number IconApiTest_002
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("IconApiTest_002", Level.LEVEL2, async (done: Function) => {
      console.info("[IconApiTest_002] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let symbolEndIcon = getInspectorByKey("symbolEndIcon");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(symbolEndIcon).$attrs.content).assertEqual("symbolEndIcon");
      console.info("[IconApiTest_002] END");
      done();
    });

  })
}
