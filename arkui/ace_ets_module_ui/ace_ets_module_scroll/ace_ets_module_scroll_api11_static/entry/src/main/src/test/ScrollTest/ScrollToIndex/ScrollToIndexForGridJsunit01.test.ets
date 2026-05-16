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

export default function ScrollToIndexForGridJsunit01() {
  describe('ScrollToIndexForGridJsunit01', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollToIndexForGrid01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForGrid01',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        let pages = routerAlp.getState();
        console.info("get ScrollToIndexForGrid01 state pages: " + JSON.stringify(pages));
        if (!("ScrollToIndexForGrid01" == pages.name)) {
          console.info("get ScrollToIndexForGrid01 state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
        }
      } catch (err) {
        console.error("push ScrollToIndexForGrid01 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0100
     * @tc.name     ScrollToIndexForGridJsunit01_static_0100
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0100] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("30"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_30"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      expect(gridItemID).assertEqual("gridIndex01_30");

      console.info('[ScrollToIndexForGridJsunit01_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0200
     * @tc.name     ScrollToIndexForGridJsunit01_static_0200
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0200] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("66-true"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      console.log("button_page" + button);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_66"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemID).assertEqual("gridIndex01_66");

      console.info('[ScrollToIndexForGridJsunit01_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0300
     * @tc.name     ScrollToIndexForGridJsunit01_static_0300
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0300] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("10-false"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_10"));
      let gridItemID = await (gridItem?.getId() as Promise<string>);
      expect(smoothTextObj).assertNull();
      expect(gridItemID).assertEqual("gridIndex01_10");

      console.info('[ScrollToIndexForGridJsunit01_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0400
     * @tc.name     ScrollToIndexForGridJsunit01_static_0400
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0400] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button_page = await driver.findComponent(ON.text("99-true-Start"));
      await (button_page?.click() as Promise<void>);
      await driver.delayMs(2000);
      console.log("button_page" + button_page);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_99"));
      let gridItemText = await (gridItem?.getId() as Promise<string>);
      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y

      expect(distanceTop).assertLess(centerDistanceTop);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemText).assertEqual("gridIndex01_99");

      console.info('[ScrollToIndexForGridJsunit01_static_0400] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0500
     * @tc.name     ScrollToIndexForGridJsunit01_static_0500
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0500] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("128-true-end"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      console.log("button_page" + button);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_128"));
      let gridItemText = await (gridItem?.getId() as Promise<string>);

      // 计算元素距离顶部的距离
      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceY = bounds.y;

      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));

      // 计算元素中心距离顶部的距离
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceY = boundsCenter.y;

      // 元素距离顶部的距离小于元素中心距离顶部的距离
      expect(distanceY).assertLarger(centerDistanceY);
      expect(smoothTextObj).assertInstanceOf("Object");
      expect(gridItemText).assertEqual("gridIndex01_128");

      console.info('[ScrollToIndexForGridJsunit01_0500] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0600
     * @tc.name     ScrollToIndexForGridJsunit01_static_0600
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0600] START');

      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text("22-false-center"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_22"));

      let gridItemText = await (gridItem?.getId() as Promise<string>);
      await driver.delayMs(2000);

      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(2000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;
      await driver.delayMs(2000);
      expect(Math.abs(distanceTop - centerDistanceTop) <= 1).assertTrue();

      expect(gridItemText).assertEqual("gridIndex01_22");

      console.info('[ScrollToIndexForGridJsunit01_static_0600] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0700
     * @tc.name     ScrollToIndexForGridJsunit01_static_0700
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('[ScrollToIndexForGridJsunit01_static_0700] START');

      await driver.delayMs(1000);
      let moreColButton = await driver.findComponent(ON.text("moreColumns"));
      await (moreColButton?.click() as Promise<void>);
      await driver.delayMs(2000);
      let button = await driver.findComponent(ON.text("55-true-auto"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);
      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);
      let gridItem = await driver.findComponent(ON.id("gridIndex01_55"));
      let gridItemText = await (gridItem?.getId() as Promise<string>);

      expect(gridItemText).assertEqual("gridIndex01_55");
      expect(smoothTextObj).assertInstanceOf("Object"); //[object Object]

      console.info('[ScrollToIndexForGridJsunit01_static_0700] END');
      done();
    });


    
    /**
     * @tc.number   ScrollToIndexForGridJsunit01_static_0800
     * @tc.name     ScrollToIndexForGridJsunit01_static_0800
     * @tc.desc     ScrollToIndexForGridJsunit01_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ScrollToIndexForGridJsunit01_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForGridJsunit01_static_0800] START');

      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("128-true-end"));
      await (button?.click() as Promise<void>);
      await driver.delayMs(2000);

      let gridItem = await driver.findComponent(ON.id("gridIndex01_128"));
      let gridItemText = await (gridItem?.getId() as Promise<string>);

      let smoothTextObj = await driver.findComponent(ON.id("isHaveSmooth_Grid01"));
      await driver.delayMs(1000);
      let bounds = await (gridItem?.getBoundsCenter() as Promise<Point>);
      let distanceTop = bounds.y;
      await driver.delayMs(1000);
      let GridCom = await driver.findComponent(ON.id("GridID_Grid01"));
      let boundsCenter = await (GridCom?.getBoundsCenter() as Promise<Point>);
      let centerDistanceTop = boundsCenter.y;

      expect(distanceTop).assertLarger(centerDistanceTop);
      expect(gridItemText).assertEqual("gridIndex01_128");
      expect(smoothTextObj).assertInstanceOf("Object");

      console.info('[ScrollToIndexForGridJsunit01_static_0800] END');
      done();
    });
  })
}