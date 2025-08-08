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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function popupDirectionTest() {
  describe('popupDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("popupDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupDirection',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get popupDirectionTest state pages: " + JSON.stringify(pages));
        if (!('PopupDirection' == pages.name)) {
          console.info("get popupDirectionTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push popupDirectionTest page result successful");
        }
      }
      catch (err) {
        console.error("push popupDirectionTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('popupDirectionTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('popupDirectionTest after each called');
    });

    /**
     * @tc.number title direction
     * @tc.name testPopupDirectionTest_0100
     * @tc.desc Test Popup page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testPopupDirectionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("testPopupDirectionTest_0100 ", "START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("testPopupDirectionTest_0100 ", "click Auto");
      const title1 = await driver.findComponent(ON.text("Title"));
      const rect1 = await title1.getBounds();
      console.log("testPopupDirectionTest_0100 ", " title1 rect:" + JSON.stringify(rect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("testPopupDirectionTest_0100 ", "click Rtl");
      await driver.delayMs(1000);
      let title2 = await driver.findComponent(ON.text("Title"));
      const rect2 = await title2.getBounds();
      console.log("testPopupDirectionTest_0100 ", " title2: rect" + JSON.stringify(rect2));
      expect(rect1.left == rect2.left).assertFalse();
      console.log("testPopupDirectionTest_0100 ", "END");
      done();
    });

    /**
     * @tc.number button direction
     * @tc.name testPopupDirectionTest_0200
     * @tc.desc Test Popup page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testPopupDirectionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("testPopupDirectionTest_0100 ", "START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("testPopupDirectionTest_0100 ", "click Auto");
      const confirm1 = await driver.findComponent(ON.text("confirm"));
      const confirmRect1 = await confirm1.getBounds();
      console.log("testPopupDirectionTest_0100 ", " confirm1 rect:" + JSON.stringify(confirmRect1));
      const cancel1 = await driver.findComponent(ON.text("cancel"));
      const cancelRect1 = await cancel1.getBounds();
      console.log("testPopupDirectionTest_0100 ", " cancelRect1 rect:" + JSON.stringify(cancelRect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("testPopupDirectionTest_0100 ", "click Rtl");
      await driver.delayMs(1000);
      const confirm2 = await driver.findComponent(ON.text("confirm"));
      const confirmRect2 = await confirm2.getBounds();
      console.log("testPopupDirectionTest_0100 ", " confirmRect2 rect:" + JSON.stringify(confirmRect2));
      const cancel2 = await driver.findComponent(ON.text("cancel"));
      const cancelRect2 = await cancel2.getBounds();
      console.log("testPopupDirectionTest_0100 ", " cancelRect2 rect:" + JSON.stringify(cancelRect2));
      expect(confirmRect1.left == confirmRect2.left).assertFalse();
      expect(cancelRect1.left == cancelRect2.left).assertFalse();
      console.log("testPopupDirectionTest_0100 ", "END");
      done();
    });
  })
}