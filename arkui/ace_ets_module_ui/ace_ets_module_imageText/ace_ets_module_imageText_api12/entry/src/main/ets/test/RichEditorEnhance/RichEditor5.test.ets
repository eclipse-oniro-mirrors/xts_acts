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


export default function RichEditor5() {
  describe('RichEditor5', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor5 state pages:" + JSON.stringify(pages));
        if (!("RichEditor5" == pages.name)) {
          console.info("get RichEditor5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor5 page error:" + err);
      }
      console.info("RichEditor5 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor5 after each called");
    });
    /**
     * @tc.number RichEditor5_0100
     * @tc.name   RichEditor5_0100
     * @tc.desc   Test text change callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditor5_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[RichEditor5_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditor_change = await driver.findComponent(ON.id("RichEditor_change"));
      await RichEditor_change.inputText("A")
      let RichEditor_onWillChange = await driver.findComponent(ON.id("RichEditor_onWillChange"));
      let RichEditor_onDidChange = await driver.findComponent(ON.id("RichEditor_onDidChange"));
      let RichEditor_onWillChange_text = await RichEditor_onWillChange.getText()
      let RichEditor_onDidChange_text = await RichEditor_onDidChange.getText()

      expect(RichEditor_onWillChange_text).assertEqual("onWillChange");
      expect(RichEditor_onDidChange_text).assertEqual("onDidChange");
      console.info('[RichEditor5_0100] END');
      done();
    });

  })
}
