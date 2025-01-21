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

export default function ScrollToIndexForGridJsunit01() {
  describe('ScrollToIndexForGridJsunit01', () => {
    beforeEach(async function (done) {
      console.info("ScrollToIndexForGrid01 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/ScrollToIndex/ScrollToIndexForGrid01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToIndexForGrid01 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid01" == pages.name)) {
          console.info("get ScrollToIndexForGrid01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForGrid01 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.number ScrollToIndexForGridJsunit01_0100
     * @tc.name scenario testing
     * @tc.desc set index to 30
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0100', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("30"));
      await button.click();
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_30"));
      let gridItemID = await gridItem.getId();
      expect(gridItemID).assertEqual("gridIndex01_30");

      console.info('[ScrollToIndexForGridJsunit01_0100] END');
      done();
    });

     /**
     * @tc.number ScrollToIndexForGridJsunit01_0200
     * @tc.name scenario testing
     * @tc.desc set index to 66,set the smooth to True
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0200', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0200] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("66-true"));
      await button.click();
      await driver.delayMs(2000);
      console.log("button_page" + button);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_66"));
      let gridItemID = await gridItem.getId();
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemID).assertEqual("gridIndex01_66");

      console.info('[ScrollToIndexForGridJsunit01_0200] END');
      done();
    });

     /**
     * @tc.number ScrollToIndexForGridJsunit01_0300
     * @tc.name scenario testing
     * @tc.desc set index to 100,set the smooth to false
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0300', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0300] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("10-false"));
      await button.click();
      await driver.delayMs(2000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_10"));
      let gridItemID = await gridItem.getId();
      expect(smoothTextObj).assertNull();
      expect(gridItemID).assertEqual("gridIndex01_10");

      console.info('[ScrollToIndexForGridJsunit01_0300] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit01_0400
     * @tc.name scenario testing
     * @tc.desc set index to 99,set the smooth to True,set the align of Grid to ScrollAlign.START
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0400', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0400] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button_page = await driver.findComponent(ON.text("99-true-Start"));
      await button_page.click();
      await driver.delayMs(2000);
      console.log("button_page" + button_page);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_99"));
      let gridItemText = await gridItem.getId();
      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemText).assertEqual("gridIndex01_99");

      console.info('[ScrollToIndexForGridJsunit01_0400] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit01_0500
     * @tc.name scenario testing
     * @tc.desc set index to 128,set the smooth to True,set the align of Grid to ScrollAlign.END
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0500', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0500] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("128-true-end"));
      await button.click();
      await driver.delayMs(2000);
      console.log("button_page" + button);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_128"));
      let gridItemText = await gridItem.getId();

      // 计算元素距离顶部的距离
      let bounds = await gridItem.getBoundsCenter();
      let distanceY = bounds.y;

      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));

      // 计算元素中心距离顶部的距离
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceY = boundsCenter.y;

      // 元素距离顶部的距离小于元素中心距离顶部的距离
      expect(distanceY).assertLarger(centerDistanceY);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemText).assertEqual("gridIndex01_128");

      console.info('[ScrollToIndexForGridJsunit01_0500] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit01_0600
     * @tc.name scenario testing
     * @tc.desc set index to 22,set the smooth to false,set the align of Grid to ScrollAlign.CENTER
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0600', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0600] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("22-false-center"));
      await button.click();
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_22"));

      let gridItemText = await gridItem.getId();
      await driver.delayMs(2000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(2000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;
      await driver.delayMs(2000);

      expect(distanceTop).assertEqual(centerDistanceTop);
      expect(gridItemText).assertEqual("gridIndex01_22");

      console.info('[ScrollToIndexForGridJsunit01_0600] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit01_0700
     * @tc.name scenario testing
     * @tc.desc set index to 55,set the smooth to True,set the align of Grid to ScrollAlign.AUTO
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0700', 0, async (done) => {
      let driver = Driver.create();
      console.info('[ScrollToIndexForGridJsunit01_0700] START');

      await driver.delayMs(1000);
      let moreColButton = await driver.findComponent(ON.text("moreColumns"));
      await moreColButton.click();
      await driver.delayMs(2000);
      let button = await driver.findComponent(ON.text("55-true-auto"));
      await button.click();
      await driver.delayMs(2000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_55"));
      let gridItemText = await gridItem.getId();

      expect(gridItemText).assertEqual("gridIndex01_55");
      expect(smoothTextObj).assertInstanceOf("Object"); //[object Object]

      console.info('[ScrollToIndexForGridJsunit01_0700] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit01_0800
     * @tc.name scenario testing
     * @tc.desc set index to 128,set the smooth to True,set the align of Grid to ScrollAlign.END
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit01_0800', 0, async (done) => {
      console.info('[ScrollToIndexForGridJsunit01_0800] START');

      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("128-true-end"));
      await button.click();
      await driver.delayMs(2000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_128"));
      let gridItemText = await gridItem.getId();

      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);
      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemText).assertEqual("gridIndex01_128");
      expect(smoothTextObj).assertInstanceOf("Object");

      console.info('[ScrollToIndexForGridJsunit01_0800] END');
      done();
    });
  })
}