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

export default function ScrollToIndexForGridJsunit03() {
  describe('ScrollToIndexForGridJsunit03', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollToIndexForGridJsunit03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForGrid03',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollToIndexForGrid03 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid03" == pages.name)) {
          console.info("get ScrollToIndexForGridJsunit03 state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          routerAlp.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
        }
      } catch (err) {
        console.error("push ScrollToIndexForGridJsunit03 page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit03_static_0100
     * @tc.name     ScrollToIndexForGridJsunit03_static_0100
     * @tc.desc     ScrollToIndexForGridJsunit03_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit03_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit03_static_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("22-false-center"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_22"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;
      expect(Math.abs(distanceTop - centerDistanceTop) <= 1).assertTrue();

      expect(gridItemID).assertEqual("gridIndex03_22");
      console.info('[ScrollToIndexForGridJsunit03_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit03_static_0200
     * @tc.name     ScrollToIndexForGridJsunit03_static_0200
     * @tc.desc     ScrollToIndexForGridJsunit03_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit03_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit03_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(2000);

      let ItemButton = await driver.findComponent(ON.text("98-true-Start"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_98"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03")) as Component;
      let boundsCenter = await GridCom.getBoundsCenter();
      let centerDistanceTop = boundsCenter.y;
      console.info('[ScrollToIndexForGridJsunit03_static_0200] smoothTextObj type is ' + smoothTextObj);
      expect(distanceTop).assertLess(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_98");

      expect(smoothTextObj).assertInstanceOf("Object");

      console.info('[ScrollToIndexForGridJsunit03_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit03_static_0300
     * @tc.name     ScrollToIndexForGridJsunit03_static_0300
     * @tc.desc     ScrollToIndexForGridJsunit03_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit03_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit03_static_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("128-true-end"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_128"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_128");
      expect(smoothTextObj).assertInstanceOf("Object");
      console.info('[ScrollToIndexForGridJsunit03_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit03_static_0400
     * @tc.name     ScrollToIndexForGridJsunit03_static_0400
     * @tc.desc     ScrollToIndexForGridJsunit03_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit03_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit03_static_0400] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let ItemButton = await driver.findComponent(ON.text("10-true-end"));
      await (ItemButton?.click() as Promise<void>);
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex03_10"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(1000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid03"));
      await driver.delayMs(1000);

      // 当前GridItem元素距离顶部的距离
      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid03"));
      // Grid中心距离顶部的距离
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      // 当前GridItem元素距离顶部的距离小于Grid中心距离顶部的距离
      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemID).assertEqual("gridIndex03_10");
      expect(smoothTextObj).assertInstanceOf("Object");
      console.info('[ScrollToIndexForGridJsunit03_static_0400] END');
      done();
    });
  })
}