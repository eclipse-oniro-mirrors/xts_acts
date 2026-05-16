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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ScrollToIndexForGridJsunit03() {
  describe('ScrollToIndexForGridJsunit03', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollToIndexForGridJsunit03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollToIndex/ScrollToIndexForGrid03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToIndexForGrid03 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid03" == pages.name)) {
          console.info("get ScrollToIndexForGridJsunit03 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForGridJsunit03 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ScrollToIndexForGridJsunit03_0100
     * @tc.number ScrollToIndexForGridJsunit03_0100
     * @tc.desc   set index to 22,set the smooth to false,set the align of Grid to ScrollAlign.CENTER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToIndexForGridJsunit03_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit03_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("22-false-center"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_22"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;
      expect(Math.abs(distanceTop - centerDistanceTop) <=1 ).assertTrue();
  
      expect(gridItemID).assertEqual("gridIndex03_22");
      console.info('[ScrollToIndexForGridJsunit03_0100] END');
      done();
    });

    /**
     * @tc.name   ScrollToIndexForGridJsunit03_0200
     * @tc.number ScrollToIndexForGridJsunit03_0200
     * @tc.desc   set index to 98,set the smooth to True,set the align of Grid to ScrollAlign.START.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToIndexForGridJsunit03_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit03_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);

      let ItemButton = await driver.findComponent(ON.text("98-true-Start"));
      await ItemButton.click();
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_98"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_98");
      expect(smoothTextObj).assertInstanceOf("Object");

      console.info('[ScrollToIndexForGridJsunit03_0200] END');
      done();
    });

    /**
     * @tc.name   ScrollToIndexForGridJsunit03_0300
     * @tc.number ScrollToIndexForGridJsunit03_0300
     * @tc.desc   set index to 128,set the smooth to True,set the align of Grid to ScrollAlign.END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToIndexForGridJsunit03_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit03_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("128-true-end"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_128"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_128");
      expect(smoothTextObj).assertInstanceOf("Object");
      console.info('[ScrollToIndexForGridJsunit03_0300] END');
      done();
    });

    /**
     * @tc.name   ScrollToIndexForGridJsunit03_0400
     * @tc.number ScrollToIndexForGridJsunit03_0400
     * @tc.desc   set index to 10,set the smooth to True,set the align of Grid to ScrollAlign.END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToIndexForGridJsunit03_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit03_0400] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("10-true-end"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_10"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      // 当前GridItem元素距离顶部的距离
      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      // Grid中心距离顶部的距离
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      // 当前GridItem元素距离顶部的距离小于Grid中心距离顶部的距离
      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_10");
      expect(smoothTextObj).assertInstanceOf("Object");
      console.info('[ScrollToIndexForGridJsunit03_0400] END');
      done();
    });
  })
}