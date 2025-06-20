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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from "@ohos.router";
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";

export default function TextClockApiTest() {
  describe("TextClockApiTest", () => {
    beforeEach(async (done: Function) => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextClock/TextClockApi/TextClockApi",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextClockApiTest after each called");
    });

    /**
     * @tc.number    TextClockApiTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it("TextClockApiTest_001", 0, async (done: Function) => {
      console.info("[TextClockApiTest_001] START");
      await CommonFunc.sleep(1000);
      let started = getInspectorByKey("started");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(started).$attrs.content).assertEqual("true");
      console.info("[TextClockApiTest_001] END");
      done();
    });

    /**
     * @tc.number    TextClockApiTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it("TextClockApiTest_002", 0, async (done: Function) => {
      console.info("[TextClockApiTest_002] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let stop: Component = await driver.findComponent(ON.id("stop"));
      await stop.click();
      await CommonFunc.sleep(1000);
      let TimeValue = getInspectorByKey("TimeValue");
      console.info("TimeValue11--" + JSON.parse(TimeValue).$attrs.content);
      let time1: number = Number(JSON.parse(TimeValue).$attrs.content)
      console.info("time1--" + time1);
      await CommonFunc.sleep(1000);
      let start: Component = await driver.findComponent(ON.id("start"));
      await start.click();
      let TimeValue2 = getInspectorByKey("TimeValue2");
      console.info("TimeValue22--" + JSON.parse(TimeValue2).$attrs.content);
      await CommonFunc.sleep(1000);
      let time2: number = Number(JSON.parse(TimeValue).$attrs.content)
      console.info("time2--" + time2);
      await CommonFunc.sleep(1000);
      expect(Math.abs(time2 - time1) <= 3).assertTrue();
      console.info("[TextClockApiTest_002] END");
      done();
    });

  })
}
