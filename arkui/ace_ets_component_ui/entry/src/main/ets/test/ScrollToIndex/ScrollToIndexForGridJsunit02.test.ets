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

export default function ScrollToIndexForGridJsunit02() {
  describe('ScrollToIndexForGridJsunit02', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollToIndexForGrid02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollToIndex/ScrollToIndexForGrid02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToIndexForGrid02 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid02" == pages.name)) {
          console.info("get ScrollToIndexForGrid02 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForGrid02 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number ScrollToIndexForGridJsunit02_0100
     * @tc.name scenario testing
     * @tc.desc set index to 66,set the smooth to True,set the align of Grid to ScrollAlign.START.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit02_0100', 0, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit02_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("grid-66-true-center"));
      await button.click();
      await driver.delayMs(1000);
      let ItemButton = await driver.findComponent(ON.text("item-66-true-start"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_66"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid02"));
      await driver.delayMs(1000);
      // 当前GridItem元素距离顶部的距离
      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      // Grid中心距离顶部的距离
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemID).assertEqual("gridIndex02_66");

      console.info('[ScrollToIndexForGridJsunit02_0100] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit02_0200
     * @tc.name scenario testing
     * @tc.desc set index to 108,set the smooth to false,set the align of Grid to ScrollAlign.END
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit02_0200', 0, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit02_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let ItemButton = await driver.findComponent(ON.text("item-108-false-end"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_108"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex02_108");

      console.info('[ScrollToIndexForGridJsunit02_0200] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit02_0300
     * @tc.name scenario testing
     * @tc.desc set index to 100,set the smooth to True,set the align of Grid to ScrollAlign.CENTER
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit02_0300', 0, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit02_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("moreColumns"));
      await button.click();
      await driver.delayMs(1000);
      let ItemButton = await driver.findComponent(ON.text("item-100-false-center"));
      await ItemButton.click();
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_100"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;
      let isTrue = (Math.abs(Math.round(distanceTop) - Math.round(centerDistanceTop)) <= 1) ? true : false;
      expect(isTrue).assertTrue();
      expect(gridItemID).assertEqual("gridIndex02_100");

      console.info('[ScrollToIndexForGridJsunit02_0300] END');
      done();
    });

    /**
     * @tc.number ScrollToIndexForGridJsunit02_0400
     * @tc.name scenario testing
     * @tc.desc set index to 178,set the smooth to True,set the align of Grid to ScrollAlign.START
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level   2
     */
    it('ScrollToIndexForGridJsunit02_0400', 0, async (done: Function) => {
      console.info('[ScrollToIndexForGridJsunit02_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);

      let ItemButton = await driver.findComponent(ON.text("item-178-true-start"));
      await ItemButton.click();
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_178"));
      let gridItemID = await gridItem.getId();
      await driver.delayMs(1000);

      let bounds = await gridItem.getBoundsCenter();
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex02_178");

      console.info('[ScrollToIndexForGridJsunit02_0400] END');
      done();
    });
  })
}