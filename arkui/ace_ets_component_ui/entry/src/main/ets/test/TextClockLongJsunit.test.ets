/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function TextClockLongJsunit() {
  describe('TextClockLongJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextClock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClockLongPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextClock state pages: " + JSON.stringify(pages));
        if (!("TextClockLongPage" == pages.name)) {
          console.info("get TextClock state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push TextClock page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number TextClockLongJsunit_0100
     * @tc.name scenario testing
     * @tc.desc Does the onDateChange stop when testing pauses.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextClockLongJsunit_0100', 0, async (done: Function) => {
      // Test stop
      console.info('[TextClockLongJsunit_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let start = await driver.findComponent(ON.id('start'));
      let stop = await driver.findComponent(ON.id('stop'));
      let accumulateTime = await driver.findComponent(ON.id("accumulateTime1"));

      await start.click()
      await driver.delayMs(1000)
      let textShadowOrFontFeature = await driver.findComponent(ON.id("textShadowOrFontFeature"));
      expect(!textShadowOrFontFeature).assertEqual(false)

      await stop.click()
      let accumulateTimeTextStop = await accumulateTime.getText()
      await driver.delayMs(3000)
      let accumulateTimeTextStop2 = await accumulateTime.getText()
      expect(accumulateTimeTextStop).assertEqual(accumulateTimeTextStop2)
      await start.click()
      console.info('[TextClockLongJsunit_0100] END');
      done();
    });
    /**
     * @tc.number TextClockLongJsunit_0200
     * @tc.name scenario testing
     * @tc.desc Does the onDateChange Visible when testing pauses.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextClockLongJsunit_0200', 0, async (done: Function) => {
      // Test Visible
      console.info('[TextClockLongJsunit_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let show = await driver.findComponent(ON.id('show'));
      let hide = await driver.findComponent(ON.id('hide'));
      await hide.click()
      let accumulateTime = await driver.findComponent(ON.id("accumulateTime1"));
      let accumulateTimeTextHideStart = await accumulateTime.getText()
      await driver.delayMs(3000)
      let accumulateTimeTextHideEnd = await accumulateTime.getText()
      expect(accumulateTimeTextHideStart).assertEqual(accumulateTimeTextHideEnd)
      await show.click()
      console.info('[TextClockLongJsunit_0200] END');
      done();
    });
    /**
     * @tc.number TextClockLongJsunit_0200
     * @tc.name scenario testing
     * @tc.desc Test whether the onDateChange stops when sliding out of the field of view.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TextClockLongJsunit_0300', 0, async (done: Function) => {
      // Test sliding out screen
      console.info('[TextClockLongJsunit_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let bottom = await driver.findComponent(ON.id("TextClockLongBottom"));
      await bottom.click()
      await driver.delayMs(1000)
      let accumulateTime1 = await driver.findComponent(ON.id("accumulateTime2"));
      let accumulateTimeTextStart = await accumulateTime1.getText()
      await driver.delayMs(3000)
      let accumulateTime2 = await driver.findComponent(ON.id("accumulateTime2"));
      let accumulateTimeTextEnd = await accumulateTime2.getText()
      expect(accumulateTimeTextStart).assertEqual(accumulateTimeTextEnd)
      console.info('[TextClockLongJsunit_0300] END');
      done();
    });

  })
}
