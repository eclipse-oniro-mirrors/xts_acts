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

export default function ScrollToIndexForWaterFlowJsunit01() {
  describe('ScrollToIndexForWaterFlowJsunit01', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollToIndexForWaterFlow01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForWaterFlow01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToIndexForWaterFlow01 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForWaterFlow01" == pages.name)) {
          console.info("get ScrollToIndexForWaterFlow01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForWaterFlow01 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number ScrollToIndexForWaterFlow01_0100
     * @tc.name scenario testing
     * @tc.desc set index to 30
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForWaterFlow01_0100', 0, async (done: Function) => {
      console.info('[ScrollToIndexForWaterFlow01_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("30"));
      await button.click();
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N30"));
      let currentItemID = await textItemCom.getId();
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_30");
      console.info('[ScrollToIndexForWaterFlow01_0100] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForWaterFlow02_0100
     * @tc.name scenario testing
     * @tc.desc set index to 66,set the smooth to True
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForWaterFlow02_0100', 0, async (done: Function) => {
      console.info('[ScrollToIndexForWaterFlow02_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("66-true"));
      await button.click();
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N66"));
      let currentItemID = await textItemCom.getId();

      await driver.delayMs(2000);
      let isSmoothText = await driver.findComponent(ON.id("isSmooth"));
      console.log('isSmoothText' + isSmoothText);
      console.log('isSmoothText' + JSON.stringify(isSmoothText));
      expect(isSmoothText).assertInstanceOf("Object");
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_66");

      console.info('[ScrollToIndexForWaterFlow02_0100] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForWaterFlow02_0300
     * @tc.name scenario testing
     * @tc.desc set index to 99,set the smooth to false
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForWaterFlow02_0300', 0, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit01_0100] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let moreColumnsBtn = await driver.findComponent(ON.text("moreColumns"));
      await moreColumnsBtn.click();
      await driver.delayMs(2000);
      let button = await driver.findComponent(ON.text("u-99-false"));
      await button.click();
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N99"));
      let currentItemID = await textItemCom.getId();
      await driver.delayMs(2000);
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_99");

      console.info('[ScrollToIndexForWaterFlow02_0300] END');
      done();
    });
  })
}