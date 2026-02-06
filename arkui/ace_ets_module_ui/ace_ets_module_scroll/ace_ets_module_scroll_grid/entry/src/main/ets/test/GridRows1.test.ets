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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import {UiComponent, Component, Driver, UiWindow, ON, BY, DisplayRotation, WindowMode } from '@ohos.UiTest';

export default function GridRows1() {
  describe('GridRows1', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRows1 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRows1 state pages:" + JSON.stringify(pages));
        if (!("GridRows1" == pages.name)) {
          console.info("get  GridRows1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/GridRows1"})
          await CommonFunc.sleep(2000);
          console.info("push GridRows1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRows1 page error:" + err);
      }
      console.info("GridRows1 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridRows1 after each called");
    });


    /**
     * @tc.name   GridRows1_001
     * @tc.number GridRows1_001
     * @tc.desc   GridRows1_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridRows1_001',  Level.LEVEL3, async (done: Function) => {
      console.info('[GridRows1_001] START');

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_001] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_001] END');
      done();
    });

    /**
     * @tc.name   GridRows1_002
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_CAPABILITY_0230
     * @tc.desc   set rowsGap to -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridRows1_002',  Level.LEVEL3, async (done: Function) => {
      console.info('[GridRows1_002] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt1'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_002] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_002] END');
      done();
    });

    /**
     * @tc.name   GridRows1_003
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_CAPABILITY_0250
     * @tc.desc   set rowsGap to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridRows1_003',  Level.LEVEL3, async (done: Function) => {
      console.info('[GridRows1_003] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt3'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_003] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();

      console.info('[GridRows1_003] END');
      done();
    });

    /**
     * @tc.name   GridRows1_004
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_CAPABILITY_0260
     * @tc.desc   set rowsGap to 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridRows1_004',  Level.LEVEL3, async (done: Function) => {
      console.info('[GridRows1_004] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_2');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_004] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();

      console.info('[GridRows1_004] END');
      done();
    });
  })
}
