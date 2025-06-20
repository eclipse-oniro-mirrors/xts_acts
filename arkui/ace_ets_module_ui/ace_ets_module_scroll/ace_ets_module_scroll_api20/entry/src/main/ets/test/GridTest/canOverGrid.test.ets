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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function canOverGrid() {
  describe('canOverGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("canOverGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/canOverGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canOverGrid state pages:" + JSON.stringify(pages));
        if (!("canOverGrid" == pages.name)) {
          console.info("get canOverGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push canOverGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canOverGrid page error:" + err);
      }
      console.info("canOverGrid beforeEach end");
      done();
    });

    /**
     * @tc.number    canOverGrid_001
     * @tc.name      canOverGrid_0100
     * @tc.desc      Set the canOverscroll property value to true.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverGrid_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverGrid_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_true'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      await CommonFunc.sleep(5000);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_0100] gridItem0.top=
        ${gridItem0.top}`);
      console.info(`[canOverGrid_0100] gridItem0.top - vp2px(30)=
        ${gridItem0.top - vp2px(30)}`);
      expect(Math.floor(Math.abs(gridItem0.top - vp2px(30) - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_0100] END');
      done();
    });

    /**
     * @tc.number    canOverGrid_002
     * @tc.name      canOverGrid_0200
     * @tc.desc      Set the canOverscroll property value to false.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverGrid_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverGrid_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_false'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_0200] END');
      done();
    });

    /**
     * @tc.number    canOverGrid_003
     * @tc.name      canOverGrid_0300
     * @tc.desc      Set the canOverscroll property value to null.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverGrid_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverGrid_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_null'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_0300] END');
      done();
    });

    /**
     * @tc.number    canOverGrid_004
     * @tc.name      canOverGrid_0400
     * @tc.desc      Set the canOverscroll property value to undefined.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('canOverGrid_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverGrid_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_ude'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_0400] END');
      done();
    });
  })
}
