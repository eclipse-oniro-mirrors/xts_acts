/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function ReachStartAndEnd() {
  describe('ReachStartAndEnd', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ReachStartAndEnd beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid_scroll/ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd state pages:" + JSON.stringify(pages));
        if (!("ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);

      // init the state 
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('grid_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);

      console.info("Grid_ReachStartAndEnd after each called");
    });

    /**
     * @tc.name   Grid_ReachStartAndEnd_0100
     * @tc.number SUB_ACE_Grid_ReachStartAndEnd_0100
     * @tc.desc   Sliding the grid to the end position triggers the onReachEnd event, and sliding to the start position triggers the onReachStart event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Grid_ReachStartAndEnd_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[Grid_ReachStartAndEnd_0100] START');
      let gridRect = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_grid')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')

      console.info("[Grid_ReachStartAndEnd_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onReachEnd');

      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')

      console.info("[Grid_ReachStartAndEnd_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)))
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd_0100] END');
      done();
    });

    /**
     * @tc.name   Grid_ReachStartAndEnd_0600
     * @tc.number SUB_ACE_Grid_ReachStartAndEnd_0600
     * @tc.desc   Quickly sliding the grid to the end position triggers the onReachEnd event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Grid_ReachStartAndEnd_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('[Grid_ReachStartAndEnd_0600] START');
      let gridRect = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_grid')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`)
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`)
        }, 5, 4000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')

      console.info("[Grid_ReachStartAndEnd_0600] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onReachEnd');

      console.info('[Grid_ReachStartAndEnd_0600] END');
      done();
    });
  })
}
