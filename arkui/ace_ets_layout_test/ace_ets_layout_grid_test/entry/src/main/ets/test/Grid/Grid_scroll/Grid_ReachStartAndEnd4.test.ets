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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function Grid_ReachStartAndEnd4() {
  describe('Grid_ReachStartAndEnd4', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ReachStartAndEnd4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd4 state pages:" + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd4 page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      //router.back()
      // init the state
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('grid_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);

      console.info("Grid_ReachStartAndEnd2 after each called");
    });

    /**
     * @tc.number SUB_ACE_Grid_ReachStartAndEnd4_0500
     * @tc.name testGrid
     * @tc.desc Dynamically changing the padding attribute value of the grid and sliding it to the starting position triggers the onReachStart event
     */
    it('Grid_ReachStartAndEnd4_0500', 0, async (done: Function) => {
      console.info('[Grid_ReachStartAndEnd4_0500] START');

      let driver = Driver.create()
      let button1 = await driver.findComponent(ON.id('Grid_ReachStartAndEnd_changePadding'))
      await button1.click()

      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_grid')
      await driver.swipe(
        Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`),
        Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`}`),
        Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`),
        Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`}`),
        1000);
      await CommonFunc.sleep(2000);

      await driver.swipe(
        Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`),
        Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`}`),
        Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`),
        Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('Grid_ReachStartAndEnd_tex1');
      console.info("[Grid_ReachStartAndEnd4_0500] component obj is: " + JSON.stringify(JSON.parse(strJson)))
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd4_0500] END');
      done();
    });


  })
}
