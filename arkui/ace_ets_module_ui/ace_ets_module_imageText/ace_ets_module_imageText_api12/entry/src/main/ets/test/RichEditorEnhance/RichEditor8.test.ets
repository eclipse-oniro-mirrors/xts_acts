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
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function RichEditor8() {
  describe('RichEditor8', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor8',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor8 state pages:" + JSON.stringify(pages));
        if (!("RichEditor8" == pages.name)) {
          console.info("get RichEditor8 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor8 page error:" + err);
      }
      console.info("RichEditor8 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor8 after each called");
    });
    /**
     * @tc.number    RichEditor8_0100
     * @tc.name      RichEditor8_0100
     * @tc.desc      Test lineBreakStrategy attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor8_0100',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor8_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let linebreak = await driver.findComponent(ON.text("linebreak"));
      await linebreak.click();
      let RichEditor8_Text = await driver.findComponent(ON.id("RichEditor8_Text"));
      let text = await RichEditor8_Text.getText();
      expect(text).assertEqual("GREEDY")
      console.info('[RichEditor8_0100] END');
      done();
    });

  })
}
