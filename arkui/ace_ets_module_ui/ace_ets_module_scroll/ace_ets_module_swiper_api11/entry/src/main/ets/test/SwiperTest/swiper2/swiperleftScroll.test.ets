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

export default function swipeleftScrollTest() {
  describe('swipeleftScrollTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swipeleftScrollTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swipeleftScrollTest state pages:" + JSON.stringify(pages));
        if (!("siwpe_leftscroll" == pages.name)) {
          console.info("get swipeleftScrollTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/siwpe_leftscroll"})
          await CommonFunc.sleep(2000);
          console.info("push swipeleftScrollTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swipeleftScrollTest page error:" + err);
      }
      console.info("swipeleftScrollTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swipeleftScrollTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0310
     * @tc.desc      test left scroll edge swipe
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0310', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0310] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperTestWidth8');
      let btBottom = bt.bottom;
      let btTop = bt.top;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = btBottom - btTop;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0310] swiper width " + btWidth);
      // left scroll
      let driver = await Driver.create();
      await driver.swipe(Math.round(btRight - vp2px(50)), Math.round(btTop + btHeight/2), Math.round(btLeft + vp2px(27)), Math.round(btTop + btHeight/2));
      await CommonFunc.sleep(5000);

      // get the component of text_1
      let text1:Component = await driver.findComponent(ON.text('1'));
      let ttContent = await text1.getText();
      expect(ttContent).assertEqual("1")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0310] END');
      done();
    });

  })
}
