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

export default function Grid_ScrollStartandStop4() {
  describe('Grid_ScrollStartandStop4', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ScrollStartandStop4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ScrollStartAndStop",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ScrollStartandStop4 state pages:" + JSON.stringify(pages));
        if (!("Grid_ScrollStartandStop" == pages.name)) {
          console.info("get Grid_ScrollStartandStop4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ScrollStartandStop4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ScrollStartandStop4 page error:" + err);
      }
      console.info("Grid_ScrollStartandStop4 beforeEach end");
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
     * @tc.number SUB_ACE_Grid_ScrollStartandStop4_0500
     * @tc.name testGrid
     * @tc.desc Trigger onScrollStart when the grid quickly slides, and onScrollStop when the slide stops
     */
    it('Grid_ScrollStartandStop4_0500', 0, async (done: Function) => {

      console.info('[Grid_ScrollStartandStop4_0500] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollStartandStop_grid')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`)
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollStartandStop_tex1')

      console.info("[Grid_ScrollStartandStop4_0500] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('Grid_ScrollStartandStop_tex2')

      console.info("[Grid_ScrollStartandStop4_0500] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)))
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onScrollStop');

      console.info('[Grid_ScrollStartandStop4_0500] END');
      done();
    });


  })
}
