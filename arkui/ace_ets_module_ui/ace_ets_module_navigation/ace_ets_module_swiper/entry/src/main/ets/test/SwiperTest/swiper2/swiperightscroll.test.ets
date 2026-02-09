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

export default function swiperRightScrollTest() {
  describe('swiperRightScrollTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperRightScrollTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperRightScrollTest state pages:" + JSON.stringify(pages));
        if (!("siwpe_rightscroll" == pages.name)) {
          console.info("swiperRightScrollTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/siwpe_rightscroll"})
          await CommonFunc.sleep(2000);
          console.info("push swiperRightScrollTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperRightScrollTest page error:" + err);
      }
      console.info("swiperRightScrollTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperRightScrollTest after each called");
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300
     * @tc.desc   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperTestWidth7');
      let btBottom = bt.bottom;
      let btTop = bt.top;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = btBottom - btTop;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0300] swiper width " + btWidth);
      // right scroll
      let driver = await Driver.create();
      await driver.swipe(Math.round(btLeft + btWidth*0.3),Math.round(btTop + btHeight/2), Math.round(btRight), Math.round(btTop + btHeight/2));
      await CommonFunc.sleep(3000);
      // get the component of text_10
      let text10:Component = await driver.findComponent(ON.text('10'));
      let ttContent = await text10.getText();
      expect(ttContent).assertEqual("10")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0290] END');
      done();
    });

  })
}
