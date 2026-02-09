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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function Grid_ReachStartAndEnd2() {
  describe('Grid_ReachStartAndEnd2', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ReachStartAndEnd2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ReachStartAndEnd2 state pages:" + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ReachStartAndEnd2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd2 page error:" + err);
      }
      console.info("Grid_ReachStartAndEnd2 beforeEach end");
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
     * @tc.name   Grid_ReachStartAndEnd2_0200
     * @tc.number SUB_ACE_Grid_ReachStartAndEnd2_0200
     * @tc.desc   Sliding the scrollBar to the end position triggers the onReachEnd event, and sliding to the start position triggers the onReachStart event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Grid_ReachStartAndEnd2_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[Grid_ReachStartAndEnd2_0200] START');
      let scrollBarRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_scrollBar')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.1 + scrollBarRect.top}`),
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.5 + scrollBarRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ReachStartAndEnd_tex2')

      console.info("[Grid_ReachStartAndEnd2_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onReachEnd');

      await driver.swipe(
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.5 + scrollBarRect.top}`),
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.1 + scrollBarRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('Grid_ReachStartAndEnd_tex1')

      console.info("[Grid_ReachStartAndEnd2_0200] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)))
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd2_0200] END');
      done();
    });


  })
}
