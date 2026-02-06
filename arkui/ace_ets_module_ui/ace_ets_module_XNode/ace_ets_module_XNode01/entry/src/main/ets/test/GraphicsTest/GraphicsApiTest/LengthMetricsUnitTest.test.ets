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
export default function LengthMetricsUnitTest() {
  describe("LengthMetricsUnitTest", () => {
    beforeEach(async (done: Function) => {
      console.info("LengthMetricsUnitTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/LengthMetricsUnit",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LengthMetricsUnitTest state pages:" + JSON.stringify(pages));
        if (!("LengthMetricsUnit" == pages.name)) {
          console.info("get LengthMetricsUnitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LengthMetricsUnitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LengthMetricsUnitTest page error:" + err);
      }
      console.info("LengthMetricsUnitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LengthMetricsUnitTest after each called");
    });
    /**
     * @tc.name   LengthMetricsUnitTest_001
     * @tc.number LengthMetricsUnitTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("LengthMetricsUnitTest_001", Level.LEVEL0, async (done: Function) => {
      console.info("[LengthMetricsUnitTest_001] START");
      await CommonFunc.sleep(1000);
      let LengthMetricsUnit = getInspectorByKey("LengthMetricsUnit");
      console.info("LengthMetricsUnit--" + JSON.stringify(JSON.parse(LengthMetricsUnit).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(LengthMetricsUnit).$attrs.content).assertEqual("1");
      console.info("[LengthMetricsUnitTest_001] END");
      done();
    });
  })
}