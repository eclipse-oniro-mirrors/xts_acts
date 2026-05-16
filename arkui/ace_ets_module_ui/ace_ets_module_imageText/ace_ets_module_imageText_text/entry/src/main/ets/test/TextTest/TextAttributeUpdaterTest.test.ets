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
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";

export default function TextAttributeUpdaterTest() {
  describe("TextAttributeUpdaterTest", () => {
    beforeEach(async (done: Function) => {
      console.info("TextAttributeUpdaterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextAttributeUpdater",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAttributeUpdater state pages:" + JSON.stringify(pages));
        if (!("TextAttributeUpdater" == pages.name)) {
          console.info("get TextAttributeUpdater pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAttributeUpdater page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAttributeUpdater page error:" + err);
      }
      console.info("TextAttributeUpdater beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAttributeUpdater after each called");
    });

    /**
     * @tc.name   AttributeUpdaterTest_001
     * @tc.number AttributeUpdaterTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("AttributeUpdaterTest_001",  Level.LEVEL0, async (done: Function) => {
      console.info("[AttributeUpdaterTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("textAttributeUpdater"));
      await btn.click();
      await CommonFunc.sleep(1500);
      let text = getInspectorByKey("textAttributeUpdater");
      await CommonFunc.sleep(1000);
      expect(JSON.parse(text).$attrs.content).assertEqual("Updated");
      console.info("[AttributeUpdaterTest_001] END");
      done();
    });
  })
}
