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


export default function RichEditor9() {
  describe('RichEditor9', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor9 state pages:" + JSON.stringify(pages));
        if (!("RichEditor9" == pages.name)) {
          console.info("get RichEditor9 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor9 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor9 page error:" + err);
      }
      console.info("RichEditor9 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor9 after each called");
    });
    /**
     * @tc.number    RichEditor9_0100
     * @tc.name      RichEditor9_0100
     * @tc.desc      Test lineBreakStrategy attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor9_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor9_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let linebreak = await driver.findComponent(ON.text("linebreak"));
      await linebreak.click();
      let RichEditor9_Text = await driver.findComponent(ON.id("RichEditor9_Text"));
      let text = await RichEditor9_Text.getText();
      expect(text).assertEqual("HIGH_QUALITY")
      console.info('[RichEditor9_0100] END');
      done();
    });

  })
}
