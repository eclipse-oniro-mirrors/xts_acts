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

export default function PopupOptionsTest() {
  describe('PopupOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PopupOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Popup/PopupApi/PopupApi",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PopupOptionsTest state pages:" + JSON.stringify(pages));
        if (!("PopupOptions" == pages.name)) {
          console.info("get PopupOptionsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PopupOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PopupOptionsTest page error:" + err);
      }
      console.info("PopupOptionsTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupOptionsTest after each called");
    });

    /**
     * @tc.number    PopupOptionsTest_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('PopupOptionsTest_001', 0, async (done: Function) => {
      console.info('[PopupOptionsTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btn"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let message = getInspectorByKey('message');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(message).$attrs.content).assertEqual('message');
      console.info('[PopupOptionsTest_001] END');
      done();
    });
  })
}
