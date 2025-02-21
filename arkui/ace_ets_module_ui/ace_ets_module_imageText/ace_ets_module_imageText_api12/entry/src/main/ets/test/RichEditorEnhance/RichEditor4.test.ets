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


export default function RichEditor4() {
  describe('RichEditor4', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor4 state pages:" + JSON.stringify(pages));
        if (!("RichEditor4" == pages.name)) {
          console.info("get RichEditor4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor4 page error:" + err);
      }
      console.info("RichEditor4 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor4 after each called");
    });
    /**
     * @tc.number RichEditor4_0100
     * @tc.name   RichEditor4_0100
     * @tc.desc   Test emoji deletion.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor4_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor4_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditor_supportAvoidance = await driver.findComponent(ON.id("RichEditor_emoji"));
      let text1 = await RichEditor_supportAvoidance.getText()
      await RichEditor_supportAvoidance.click()
      await driver.triggerKey(2055)
      let text2 = await RichEditor_supportAvoidance.getText()
      expect(text1.length).assertLarger(text2.length);
      expect(text2.length).assertLarger(0);
      console.info('[RichEditor4_0100] END');
      done();
    });

  })
}
