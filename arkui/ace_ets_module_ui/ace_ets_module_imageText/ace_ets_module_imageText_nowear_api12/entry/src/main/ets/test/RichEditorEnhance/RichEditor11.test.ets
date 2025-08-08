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


export default function RichEditor11() {
  describe('RichEditor11', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor11 state pages:" + JSON.stringify(pages));
        if (!("RichEditor11" == pages.name)) {
          console.info("get RichEditor11 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor11 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor11 page error:" + err);
      }
      console.info("RichEditor11 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor11 after each called");
    });
    /**
     * @tc.number    RichEditor11_0100
     * @tc.name      RichEditor11_0100
     * @tc.desc      Test double-click Function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor11_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor11_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let RichEditor11_double = await driver.findComponent(ON.id("RichEditor11_double"));
      await RichEditor11_double.longClick()
      let getSelection = await driver.findComponent(ON.text("getSelection"));
      await getSelection.click();
      let RichEditor11_Text = await driver.findComponent(ON.id("RichEditor11_Text"));
      let text = await RichEditor11_Text.getText();
      expect(Number(text)).assertLarger(0)
      console.info('[RichEditor11_0100] END');
      done();
    });

  })
}
