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

export default function Grid_ScrollAndScrollIndex() {
  describe('Grid_ScrollAndScrollIndex', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_ScrollAndScrollIndex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_scroll/Grid_ScrollAndScrollIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_ScrollAndScrollIndex state pages:" + JSON.stringify(pages));
        if (!("Grid_ScrollAndScrollIndex" == pages.name)) {
          console.info("get Grid_ScrollAndScrollIndex pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_ScrollAndScrollIndex page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_ScrollAndScrollIndex page error:" + err);
      }
      console.info("Grid_ScrollAndScrollIndex beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('scroll_Reset_bt'));
      await btn.click();
      await CommonFunc.sleep(3000);
      console.info("Grid_ScrollAndScrollIndex after each called");
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollAndScrollIndex_0100
     * @tc.name testGrid
     * @tc.desc An onScrollIndex event will be triggered during grid initialization
     */
    it('Grid_ScrollAndScrollIndex_0100', 0, async (done: Function) => {
      console.info('[Grid_ScrollAndScrollIndex_0100] START');
      let strJson1 = getInspectorByKey('Grid_ScrollAndScrollIndex_tex1')

      console.info("[Grid_ScrollAndScrollIndex_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollIndex1');

      console.info('[Grid_ScrollAndScrollIndex_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollAndScrollIndex_0200
     * @tc.name testGrid
     * @tc.desc Trigger onScroll event when grid slides
     */
    it('Grid_ScrollAndScrollIndex_0200', 0, async (done: Function) => {
      console.info('[Grid_ScrollAndScrollIndex_0200] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollAndScrollIndex_grid')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollAndScrollIndex_tex2')

      console.info("[Grid_ScrollAndScrollIndex_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScroll');

      console.info('[Grid_ScrollAndScrollIndex_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollAndScrollIndex_0300
     * @tc.name testGrid
     * @tc.desc Grid sliding triggers the onScrollIndex event when the index value of the first/last component in the display area changes
     */
    it('Grid_ScrollAndScrollIndex_0300', 0, async (done: Function) => {
      console.info('[Grid_ScrollAndScrollIndex_0300] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollAndScrollIndex_grid')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000); //grid滑到底部会再触发两次onScrollIndex事件
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollAndScrollIndex_tex1')

      console.info("[Grid_ScrollAndScrollIndex_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollIndex3');

      console.info('[Grid_ScrollAndScrollIndex_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_ScrollAndScrollIndex_0400
     * @tc.name testGrid
     * @tc.desc ScrollBar sliding triggers the onScrollIndex event when the index value of the first/last component on the grid display area changes
     */
    it('Grid_ScrollAndScrollIndex_0400', 0, async (done: Function) => {
      console.info('[Grid_ScrollAndScrollIndex_0400] START');
      let scrollBarRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollAndScrollIndex_scrollBar')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.1 + scrollBarRect.top}`),
        Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`),
        Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.9 + scrollBarRect.top}`),
        1000); //scrollBar滑到底部，会再触发两次onScrollIndex事件
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('Grid_ScrollAndScrollIndex_tex1')

      console.info("[Grid_ScrollAndScrollIndex_0400] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollIndex3');

      console.info('[Grid_ScrollAndScrollIndex_0400] END');
      done();
    });


  })
}
