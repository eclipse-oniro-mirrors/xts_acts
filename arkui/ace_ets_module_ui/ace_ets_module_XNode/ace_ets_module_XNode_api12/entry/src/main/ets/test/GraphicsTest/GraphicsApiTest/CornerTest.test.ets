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
export default function CornerTest() {
  describe("CornerTest", () => {
    beforeEach(async (done: Function) => {
      console.info("CornerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/GraphicsApi/Corner",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CornerTest state pages:" + JSON.stringify(pages));
        if (!("Corner" == pages.name)) {
          console.info("get CornerTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CornerTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CornerTest page error:" + err);
      }
      console.info("CornerTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CornerTest after each called");
    });
    /**
     * @tc.number    CornerTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it("CornerTest_001", Level.LEVEL0, async (done: Function) => {
      console.info("[CornerTest_001] START");
      await CommonFunc.sleep(1000);
      let corners_x = getInspectorByKey("corners_x");
      let corners_y = getInspectorByKey("corners_y");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(corners_x).$attrs.content).assertEqual("32");
      expect(JSON.parse(corners_y).$attrs.content).assertEqual("32");
      console.info("[CornerTest_001] END");
      done();
    });
  })
}