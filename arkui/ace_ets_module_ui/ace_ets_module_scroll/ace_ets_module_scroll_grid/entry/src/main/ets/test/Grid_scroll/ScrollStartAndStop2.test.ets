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

export default function ScrollStartandStop2() {
  describe('ScrollStartandStop2', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ScrollStartandStop2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid_scroll/ScrollStartAndStop",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ScrollStartandStop2 state pages:" + JSON.stringify(pages));
        if (!("ScrollStartandStop" == pages.name)) {
          console.info("get Grid_ScrollStartandStop2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ScrollStartandStop2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ScrollStartandStop2 page error:" + err);
      }
      console.info("Grid_ScrollStartandStop2 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      //router.back()
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('scrollStartAndStop_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);
      console.info("Grid_ScrollStartandStop2 after each called");
    });

    /**
     * @tc.name   Grid_ScrollStartandStop2_0300
     * @tc.number SUB_ACE_Grid_ScrollStartandStop2_0300
     * @tc.desc   Trigger onScrollStart when grid sliding starts and onScrollStop when sliding stops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Grid_ScrollStartandStop2_0300',  Level.LEVEL0, async (done: Function) => {

      console.info('[Grid_ScrollStartandStop2_0300] START');
      let gridRect = CommonFunc.getComponentRectOnScreen('Grid_ScrollStartandStop_grid')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')

      console.info("[Grid_ScrollStartandStop2_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')

      console.info("[Grid_ScrollStartandStop2_0300] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)))
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop2_0300] END');
      done();
    });
  })
}
