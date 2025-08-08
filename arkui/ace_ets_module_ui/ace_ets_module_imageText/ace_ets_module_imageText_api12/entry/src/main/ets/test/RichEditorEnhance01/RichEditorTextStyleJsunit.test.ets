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

export default function RichEditorTextStyleJsunit() {
  describe('RichEditorTextStyleJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextStyleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditor_TextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditorTextStyleJsunit" == pages.name)) {
          console.info("get RichEditorTextStyleJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorTextStyleJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextStyleJsunit page error:" + err);
      }
      console.info("RichEditorTextStyleJsunit beforeEach end");
      done();
    });

    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorTextStyleJsunit after each called");
    });

    /**
     * @tc.number RichEditorTextStyleJsunit_0100
     * @tc.name   RichEditorTextStyleJsunit_0100
     * @tc.desc   Test the LineHeight of RichEditor.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorTextStyleJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorTextStyleJsunit_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let AddLineHeightBut = await driver.findComponent(ON.id("addLineHeightBut"));
      await AddLineHeightBut.click()
      await driver.delayMs(2000)

      let RichEditorTextStyleGetSpansBtn = await driver.findComponent(ON.id("RichEditorTextStyle_GetSpansBtn"));
      await RichEditorTextStyleGetSpansBtn.click()
      await driver.delayMs(2000)

      let StyleLineHeightValue = await driver.findComponent(ON.id("StyleLineHeight_100"));
      expect(StyleLineHeightValue == null).assertTrue();

      console.info('[RichEditorTextStyleJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RichEditorTextStyleJsunit_0200
     * @tc.name   RichEditorTextStyleJsunit_0200
     * @tc.desc   Test the LetterSpacing of RichEditor.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorTextStyleJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorTextStyleJsunit_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let AddLetterSpacingBtn = await driver.findComponent(ON.id("addLetterSpacing"));
      await AddLetterSpacingBtn.click()
      await driver.delayMs(2000)

      let RichEditorTextStyleGetSpansBtn = await driver.findComponent(ON.id("RichEditorTextStyle_GetSpansBtn"));
      await RichEditorTextStyleGetSpansBtn.click()
      await driver.delayMs(2000)

      let StyleLineHeightValue = await driver.findComponent(ON.id("StyleLetterSpacing_40"));
      expect(StyleLineHeightValue == null).assertTrue();

      console.info('[RichEditorTextStyleJsunit_0200] END');
      done();
    });
  })
}