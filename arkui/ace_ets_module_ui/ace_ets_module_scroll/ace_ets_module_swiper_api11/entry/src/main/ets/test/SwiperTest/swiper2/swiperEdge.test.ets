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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function swiperEdgeTest() {
  describe('swiperEdgeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperEdgeTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperEdgeTest state pages:" + JSON.stringify(pages));
        if (!("siwpe_leftEdge" == pages.name)) {
          console.info("get swiperEdgeTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/siwpe_leftEdge"})
          await CommonFunc.sleep(2000);
          console.info("push swiperEdgeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperEdgeTest page error:" + err);
      }
      console.info("swiperEdgeTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperEdgeTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290
     * @tc.desc      test left edge swipe
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTestWidth6');

      let btBottom = bt.bottom;
      let btTop = bt.top;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let height = btBottom - btTop;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290] swiper width " + btWidth);
      //[180.00, 87.00],[540.00,327.00]
      let driver = await Driver.create();
      
      await driver.swipe(globalThis.winLeft + Math.round(btRight), globalThis.winTop + Math.round(btTop + height/2), globalThis.winLeft + Math.round(btRight) - Math.round(vp2px(20)), globalThis.winTop + Math.round(btTop + height/2));
      await CommonFunc.sleep(3000);

      // get the component of text_10, scroll distance is to short can not slow

      let text10:Component = await driver.findComponent(ON.text('10'));
      let ttContent = await text10.getText();
      expect(ttContent).assertEqual("10")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290] END');
      done();
    });

  })
}
