'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ScrollToIndexForGridJsunit02() {
  describe('ScrollToIndexForGridJsunit02', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollToIndexForGrid02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForGrid02',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollToIndexForGrid02 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid02" == pages.name)) {
          console.info("get ScrollToIndexForGrid02 state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          routerAlp.pushUrl(options);
          
        }
      } catch (err) {
        console.error("push ScrollToIndexForGrid02 page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit02_static_0100
     * @tc.name     ScrollToIndexForGridJsunit02_static_0100
     * @tc.desc     ScrollToIndexForGridJsunit02_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit02_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit02_static_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("grid-66-true-center"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);
      let ItemButton = await driver.findComponent(ON.text("item-66-true-start"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_66"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid02"));
      await driver.delayMs(1000);
      // 当前GridItem元素距离顶部的距离
      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      // Grid中心距离顶部的距离
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemID).assertEqual("gridIndex02_66");

      console.info('[ScrollToIndexForGridJsunit02_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit02_static_0200
     * @tc.name     ScrollToIndexForGridJsunit02_static_0200
     * @tc.desc     ScrollToIndexForGridJsunit02_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit02_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit02_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let ItemButton = await driver.findComponent(ON.text("item-108-false-end"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_108"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex02_108");

      console.info('[ScrollToIndexForGridJsunit02_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit02_static_0300
     * @tc.name     ScrollToIndexForGridJsunit02_static_0300
     * @tc.desc     ScrollToIndexForGridJsunit02_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit02_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit02_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("moreColumns"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(1000);
      let ItemButton = await driver.findComponent(ON.text("item-100-false-center"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_100"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;
      let isTrue = (Math.abs(Math.round(distanceTop) - Math.round(centerDistanceTop)) <= 1) ? true : false;
      expect(isTrue).assertTrue();
      expect(gridItemID).assertEqual("gridIndex02_100");

      console.info('[ScrollToIndexForGridJsunit02_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit02_static_0400
     * @tc.name     ScrollToIndexForGridJsunit02_static_0400
     * @tc.desc     ScrollToIndexForGridJsunit02_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit02_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit02_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(2000);

      let ItemButton = await driver.findComponent(ON.text("item-178-true-start"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex02_178"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid02"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex02_178");

      console.info('[ScrollToIndexForGridJsunit02_static_0400] END');
      done();
    });
  })
}