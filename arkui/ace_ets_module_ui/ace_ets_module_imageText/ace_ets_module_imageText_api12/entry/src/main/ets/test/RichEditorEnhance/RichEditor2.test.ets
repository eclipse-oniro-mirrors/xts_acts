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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function RichEditor2() {
  describe('RichEditor2', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor2 state pages:" + JSON.stringify(pages));
        if (!("RichEditor2" == pages.name)) {
          console.info("get RichEditor2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor2 page error:" + err);
      }
      console.info("RichEditor2 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor2 after each called");
    });
    /**
     * @tc.number RichEditor2_0100
     * @tc.name   RichEditor2_0100
     * @tc.desc   Test custom keyboard avoidance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor2_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor2_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditor_supportAvoidance = await driver.findComponent(ON.id("RichEditor_supportAvoidance"));
      let point1 = await RichEditor_supportAvoidance.getBoundsCenter();
      await RichEditor_supportAvoidance.click()
      await driver.delayMs(1000)
      let point2 = await RichEditor_supportAvoidance.getBoundsCenter();
      expect(point1.y === point2.y).assertFalse()
      console.info('[RichEditor2_0100] END');
      done();
    });

  })
}
