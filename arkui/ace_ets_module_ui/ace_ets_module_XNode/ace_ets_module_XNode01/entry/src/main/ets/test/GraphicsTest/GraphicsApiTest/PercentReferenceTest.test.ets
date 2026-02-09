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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium";
import router from "@ohos.router";
import CommonFunc from "../../../MainAbility/utils/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";
export default function PercentReferenceTest() {
  describe("PercentReferenceTest", () => {
    beforeEach(async (done: Function) => {
      console.info("PercentReferenceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/PercentReference"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PercentReferenceTest state pages:" + JSON.stringify(pages));
        if (!("PercentReference" == pages.name)) {
          console.info("get PercentReferenceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PercentReferenceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PercentReferenceTest page error:" + err);
      }
      console.info("PercentReferenceTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PercentReferenceTest after each called");
    });
    /**
     * @tc.name   PercentReferenceTest_001
     * @tc.number PercentReferenceTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("PercentReferenceTest_001", Level.LEVEL0, async (done: Function) => {
      console.info("[PercentReferenceTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let show: Component = await driver.findComponent(ON.id("show"));
      await show.click();
      await CommonFunc.sleep(1000);
      let percentReference = getInspectorByKey("percentReference");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(percentReference).$attrs.content).assertEqual("percentReference");
      console.info("[PercentReferenceTest_001] END");
      done();
    });
  })
}