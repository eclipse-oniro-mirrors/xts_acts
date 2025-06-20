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

export default function RichEditorWordBreakJsunitTest() {
  describe('RichEditorWordBreakJsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorWordBreakJsunitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorWordBreak',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorWordBreakJsunitTest state pages:" + JSON.stringify(pages));
        if (!("RichEditorWordBreakJsunitTest" == pages.name)) {
          console.info("get RichEditorWordBreakJsunitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorWordBreakJsunitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorWordBreakJsunitTest page error:" + err);
      }
      console.info("RichEditorWordBreakJsunitTest beforeEach end");
      done();
    });

    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorWordBreakJsunitTest after each called");
    });

    /**
     * @tc.number RichEditorWordBreakJsunitTest_0100
     * @tc.name   RichEditorWordBreakJsunitTest_0100
     * @tc.desc   Test the WordBreak attribute of RichEditor to BREAK_WORD.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorWordBreakJsunitTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorWordBreakJsunitTest_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let GetParagraphsButtonCon = await driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs"));
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await driver.findComponent(ON.id("RichEditorWordBreakValue_BREAK_WORD"));
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_0100] END');
      done();
    });

    /**
     * @tc.number RichEditorWordBreakJsunitTest_0200
     * @tc.name   RichEditorWordBreakJsunitTest_0200
     * @tc.desc   Test the WordBreak attribute of RichEditor to NORMAL.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorWordBreakJsunitTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorWordBreakJsunitTest_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let ButtonCon = await driver.findComponent(ON.id("RichEditorWordBreak_NORMAL"));
      await ButtonCon.click()
      await driver.delayMs(2000)

      let GetParagraphsButtonCon = await driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs"));
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await driver.findComponent(ON.id("RichEditorWordBreakValue_NORMAL"));
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_0200] END');
      done();
    });

    /**
     * @tc.number RichEditorWordBreakJsunitTest_0300
     * @tc.name   RichEditorWordBreakJsunitTest_0300
     * @tc.desc   Test the WordBreak attribute of RichEditor to BREAK_ALL.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorWordBreakJsunitTest_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[RichEditorWordBreakJsunitTest_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let ButtonCon = await driver.findComponent(ON.id("RichEditorWordBreak_BREAK_ALL"));
      await ButtonCon.click()
      await driver.delayMs(2000)

      let GetParagraphsButtonCon = await driver.findComponent(ON.id("RichEditorWordBreak_getParagraphs"));
      await GetParagraphsButtonCon.click()
      await driver.delayMs(2000)

      let RichEditorWordBreakCon = await driver.findComponent(ON.id("RichEditorWordBreakValue_BREAK_ALL"));
      expect(RichEditorWordBreakCon != null).assertTrue();

      console.info('[RichEditorWordBreakJsunitTest_0300] END');
      done();
    });
  })
}