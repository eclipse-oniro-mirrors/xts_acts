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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UnitTest() {
  describe('UnitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UnitTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextAPI/Unit",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UnitTest state pages:" + JSON.stringify(pages));
        if (!("Unit" == pages.name)) {
          console.info("get UnitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UnitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UnitTest page error:" + err);
      }
      console.info("UnitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UnitTest after each called");
    });

    /**
     * @tc.number    UnitTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('UnitTest_001', 0, async (done: Function) => {
      console.info('[UnitTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let unit = getInspectorByKey('unit');
      let value = getInspectorByKey('value');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(unit).$attrs.content).assertEqual('PX');
      expect(JSON.parse(value).$attrs.content).assertEqual('20');
      console.info('[UnitTest_001] END');
      done();
    });
  })
}
