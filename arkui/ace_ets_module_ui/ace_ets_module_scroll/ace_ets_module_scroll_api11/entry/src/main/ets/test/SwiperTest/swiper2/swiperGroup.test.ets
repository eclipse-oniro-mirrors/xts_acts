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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function swiperGroupTest() {
  describe('swiperGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperGroupTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperGroupTest state pages:" + JSON.stringify(pages));
        if (!("siwper_group_test" == pages.name)) {
          console.info("get swiperPageTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/siwper_group_test"})
          await CommonFunc.sleep(2000);
          console.info("push swiperGroupTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperGroupTest page error:" + err);
      }
      console.info("swiperGroupTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperGroupTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0040
     * @tc.desc      test the swipe to next group
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0040', 0, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0040] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTestWidth3');

      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = Math.round(btTop -btBottom);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0040] swiper width " + btWidth + "----" + btHeight);

      // swipe the component of swiper to right by  group
      let driver = await Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + Math.round(btRight) - Math.round(vp2px(100))), Math.round(globalThis.winTop + Math.round(btBottom/2)), Math.round(globalThis.winLeft + Math.round(btLeft) +  Math.round(vp2px(10))), Math.round(globalThis.winTop + Math.round(btBottom/2)));
      await CommonFunc.sleep(4800);
      // get the component of text_6
      let text3:Component = await driver.findComponent(ON.text('6'));
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("6")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0040] END');
      done();
    });

  })
}
