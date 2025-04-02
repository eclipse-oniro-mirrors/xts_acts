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


export default function RichEditor10() {
  describe('RichEditor10', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor10 state pages:" + JSON.stringify(pages));
        if (!("RichEditor10" == pages.name)) {
          console.info("get RichEditor10 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor10 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor10 page error:" + err);
      }
      console.info("RichEditor10 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor10 after each called");
    });
    /**
     * @tc.number    RichEditor10_0100
     * @tc.name      RichEditor10_0100
     * @tc.desc      Test lineBreakStrategy attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor10_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor10_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let linebreak = await driver.findComponent(ON.text("linebreak"));
      await linebreak.click();
      let RichEditor10_Text = await driver.findComponent(ON.id("RichEditor10_Text"));
      let text = await RichEditor10_Text.getText();
      expect(text).assertEqual("BALANCED")
      console.info('[RichEditor10_0100] END');
      done();
    });

  })
}
