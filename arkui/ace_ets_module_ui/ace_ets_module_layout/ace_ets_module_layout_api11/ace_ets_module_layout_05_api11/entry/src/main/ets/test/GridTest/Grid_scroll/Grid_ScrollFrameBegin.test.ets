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

export default function Grid_ScrollFrameBegin() {
  describe('Grid_ScrollFrameBegin', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ScrollFrameBegin beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ScrollFrameBegin",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ScrollFrameBegin state pages:" + JSON.stringify(pages));
        if (!("Grid_ScrollFrameBegin" == pages.name)) {
          console.info("get Grid_ScrollFrameBegin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ScrollFrameBegin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ScrollFrameBegin page error:" + err);
      }
      console.info("Grid_ScrollFrameBegin beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);


      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('scrollFrame_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);
      console.info("Grid_ScrollFrameBegin after each called");
    });


    /**
     * @tc.number SUB_ACE_Grid_ScrollFrameBegin_0100
     * @tc.name testGrid
     * @tc.desc Grid using scroller scrolling will not trigger the onScrollFrameBegin event
     */
    it('Grid_ScrollFrameBegin_0100',  Level.LEVEL0, async (done: Function) => {

      console.info('[Grid_ScrollFrameBegin_0100] START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('Grid_ScrollFrameBegin_scrollTo'))
      await button.click()
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollFrameBegin_text')

      console.info("[Grid_ScrollFrameBegin_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('');

      console.info('[Grid_ScrollFrameBegin_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollFrameBegin_0200
     * @tc.name testGrid
     * @tc.desc Grid sliding triggers the onScrollFrameBegin event
     */
    it('Grid_ScrollFrameBegin_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[Grid_ScrollFrameBegin_0200] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollFrameBegin_grid')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollFrameBegin_text')

      console.info("[Grid_ScrollFrameBegin_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollFrameBegin');

      console.info('[Grid_ScrollFrameBegin_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollFrameBegin_0300
     * @tc.name testGrid
     * @tc.desc Grid quick sliding triggers onScrollFrameBegin event
     */
    it('Grid_ScrollFrameBegin_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[Grid_ScrollFrameBegin_0300] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollFrameBegin_grid')
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

      let strJson1 = getInspectorByKey('Grid_ScrollFrameBegin_text')

      console.info("[Grid_ScrollFrameBegin_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollFrameBegin');

      console.info('[Grid_ScrollFrameBegin_0300] END');
      done();
    });


  })
}
