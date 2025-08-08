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

export default function RichEditorFontFeatureJsunit() {
  describe('RichEditorFontFeatureJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorFontFeatureJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorFontFeature',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorFontFeatureJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditorFontFeatureJsunit" == pages.name)) {
          console.info("get RichEditorFontFeatureJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorFontFeatureJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorFontFeatureJsunit page error:" + err);
      }
      console.info("RichEditorFontFeatureJsunit beforeEach end");
      done();
    });
    
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorFontFeatureJsunit after each called");
    });

    /**
     * @tc.number RichEditorFontFeatureJsunit_0100
     * @tc.name   RichEditorFontFeatureJsunit_0100
     * @tc.desc   Test setting properties for a single fontFeature.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorFontFeatureJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[RichEditorFontFeatureJsunit_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let  RichEditorFontFeatureUpdateBtn = await driver.findComponent(ON.id("RichEditorFontFeature_UpdateBtn1"));
      await RichEditorFontFeatureUpdateBtn.click()
      await driver.delayMs(2000)

      let RichEditorFontFeatureGetSpansBtn = await driver.findComponent(ON.id("RichEditorFontFeature_GetSpansBtn"));
      await RichEditorFontFeatureGetSpansBtn.click()
      await driver.delayMs(2000)

      let FontFeatureValueCon = await driver.findComponent(ON.text("getSpansAPI"));
      console.info("StyleLineHeightValue"+ JSON.stringify(FontFeatureValueCon))
      let FontFeatureValue = await FontFeatureValueCon.getId();
      console.info("RichEditorFontFeatureValue_"+ FontFeatureValue)
      await driver.delayMs(2000)
      expect(FontFeatureValue).assertEqual("RichEditorFontFeatureValue_\"subs\" 1")
      console.info('[RichEditorFontFeatureJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RichEditorFontFeatureJsunit_0200
     * @tc.name   RichEditorFontFeatureJsunit_0200
     * @tc.desc   Test setting properties for a Multiple fontFeature.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('RichEditorFontFeatureJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      // Test stop
      console.info('[RichEditorFontFeatureJsunit_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)

      let RichEditorFontFeatureUpdateBtn = await driver.findComponent(ON.id("RichEditorFontFeature_UpdateBtn2"));
      await RichEditorFontFeatureUpdateBtn.click()
      await driver.delayMs(2000)

      let RichEditorFontFeatureGetSpansBtn = await driver.findComponent(ON.id("RichEditorFontFeature_GetSpansBtn"));
      await RichEditorFontFeatureGetSpansBtn.click()
      await driver.delayMs(2000)

      let FontFeatureValueCon = await driver.findComponent(ON.text("getSpansAPI"));
      console.info("StyleLineHeightValue"+ JSON.stringify(FontFeatureValueCon))
      let FontFeatureValue = await FontFeatureValueCon.getId();
      console.info("RichEditorFontFeatureValue_"+ FontFeatureValue)
      await driver.delayMs(2000)
      expect(FontFeatureValue.split(" ").join("")).assertEqual("RichEditorFontFeatureValue_\"subs\"1,\"liga\"0")
      console.info('[RichEditorFontFeatureJsunit_0200] END');
      done();
    });
  })
}