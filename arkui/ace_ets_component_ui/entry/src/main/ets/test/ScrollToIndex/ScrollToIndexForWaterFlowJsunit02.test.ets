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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ScrollToIndexForWaterFlowJsunit02() {
  describe('ScrollToIndexForWaterFlowJsunit02', () => {
    beforeEach(async function (done) {
      console.info("ScrollToIndexForWaterFlow02 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/ScrollToIndex/ScrollToIndexForWaterFlow02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToIndexForWaterFlow02 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForWaterFlow02" == pages.name)) {
          console.info("get ScrollToIndexForWaterFlow02 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForWaterFlow02 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    
    /**
     * @tc.number ScrollToIndexForWaterFlow02_0100
     * @tc.name scenario testing
     * @tc.desc set index to Item 99,set the smooth to True
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForWaterFlow02_0100', 0, async (done)=> {
      console.info('[ScrollToIndexForWaterFlow02_0100] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("Grid-66-true"));
      await button.click();
      await driver.delayMs(2000);
      let button_Item = await driver.findComponent(ON.text("Item-99-true"));
      await button_Item.click();
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("NN99"));
      let currentItemID = await textItemCom.getId();
      await driver.delayMs(2000);
      let isSmoothObj = await driver.findComponent(ON.id("isHaveSmooth_WaterFlow02"));
      console.log('isSmoothText' + isSmoothObj);
      console.log('isSmoothText' + JSON.stringify(isSmoothObj));
      expect(isSmoothObj).assertInstanceOf("Object");
      expect(currentItemID).assertEqual("ItemTextWaterFlow02_99");

      console.info('[ScrollToIndexForWaterFlow02_0100] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForWaterFlow02_0200
     * @tc.name scenario testing
     * @tc.desc set index to Item 10,set the smooth to false
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForWaterFlow02_0200', 0, async (done)=> {
      console.info('[ScrollToIndexForWaterFlow02_0200] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let button_Item = await driver.findComponent(ON.text("Item-10-false"));
      await button_Item.click();
      await driver.delayMs(3000);
      let textItemCom = await driver.findComponent(ON.text("NN10"));
      let currentItemID = await textItemCom.getId();
      await driver.delayMs(3000);
      expect(currentItemID).assertEqual("ItemTextWaterFlow02_10");

      console.info('[ScrollToIndexForWaterFlow02_0200] END');
      done();
    });
  })
}