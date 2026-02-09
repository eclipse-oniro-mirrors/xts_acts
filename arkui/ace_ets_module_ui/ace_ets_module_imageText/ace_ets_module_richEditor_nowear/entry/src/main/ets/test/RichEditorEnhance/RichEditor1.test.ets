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


export default function RichEditor1() {
  describe('RichEditor1', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor1 state pages:" + JSON.stringify(pages));
        if (!("RichEditor1" == pages.name)) {
          console.info("get RichEditor1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor1 page error:" + err);
      }
      console.info("RichEditor1 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor1 after each called");
    });
    /**
     * @tc.name   RichEditor1_0100
     * @tc.number RichEditor1_0100
     * @tc.desc   Test text drag in.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor1_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor1_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditor_textinput = await driver.findComponent(ON.id("RichEditor_textinput"));
      await RichEditor_textinput.longClick()
      const textPoint = await RichEditor_textinput.getBoundsCenter()
      let RichEditor_caretColor = await driver.findComponent(ON.id("RichEditor_caretColor"));
      const caretColorPoint = await RichEditor_caretColor.getBoundsCenter()

      await driver.drag(textPoint.x,textPoint.y,caretColorPoint.x,caretColorPoint.y);
      await driver.delayMs(3000)
      let text = await RichEditor_caretColor.getText();

      expect(Boolean(text)).assertTrue()
      console.info('[RichEditor1_0100] END');
      done();
    });

  })
}
