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

export default function swiperDelAddTest() {
  describe('swiperDelAddTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperDelAddTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperDelAddTest state pages:" + JSON.stringify(pages));
        if (!("siwper_adddelete_test" == pages.name)) {
          console.info("get swiperDelAddTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/siwper_adddelete_test"})
          await CommonFunc.sleep(2000);
          console.info("push swiperDelAddTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperDelAddTest page error:" + err);
      }
      console.info("swiperDelAddTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperDelAddTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0070
     * @tc.desc      test the swipe delete data
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0070', 0, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0070] START');
      await CommonFunc.sleep(2000);
      // click the delete button
      let driver = await Driver.create();
      let buttonDele :Component = await driver.findComponent(ON.id('deleteTT'));
      await buttonDele.click();
      await CommonFunc.sleep(2000);

      // right scroll
      let bt = CommonFunc.getComponentRect('swiperTestWidth5');
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0700] swiper width " + btWidth);
     
      await driver.swipe(globalThis.winLeft + Math.round(btLeft) + Math.round(vp2px(27)), globalThis.winTop + Math.round(btBottom/2), globalThis.winLeft + Math.round(btRight), globalThis.winTop + Math.round(btBottom/2));
      await CommonFunc.sleep(3000);


      // click the Previous button

      let buttonPrevious :Component = await driver.findComponent(ON.id('showPreviousTT'));
      await buttonPrevious.click();
      await CommonFunc.sleep(2000);

      // get the component of text_2
      let text9:Component = await driver.findComponent(ON.text('8'));
      let ttContent = await text9.getText();
      expect(ttContent).assertEqual("8")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0070] END');
      done();
      
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0080
     * @tc.desc      test the swipe add data
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0080', 0, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0080] START');
      await CommonFunc.sleep(2000);
       // click the add button
      let driver = await Driver.create();
      let buttonAdd :Component = await driver.findComponent(ON.id('addTT'));
      await buttonAdd.click();
      await CommonFunc.sleep(2000);
	  
      let changeIndex :Component = await driver.findComponent(ON.id('change_8'));
      await changeIndex.click();
      await CommonFunc.sleep(2000);

      // left scroll
      let bt = CommonFunc.getComponentRect('swiperTestWidth5');
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0700] swiper width " + btWidth);
      // right scroll
      await driver.swipe(Math.round(globalThis.winLeft + Math.round(btRight) - vp2px(10)), Math.round(globalThis.winTop + Math.round(btBottom/2)),  Math.round(globalThis.winLeft + Math.round(btLeft) + Math.round(vp2px(27))),  Math.round(globalThis.winTop + Math.round(btBottom/2)));
      await CommonFunc.sleep(5000);

      // click the next button
      let buttonNext :Component = await driver.findComponent(ON.id('showNextTT'));
      await buttonNext.click();
      await CommonFunc.sleep(2000);

      // get the component of text_10
      let text10:Component = await driver.findComponent(ON.text('10'));
      let ttContent = await text10.getText();
      expect(ttContent).assertEqual("10")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0080] END');
      done();
    });


  })
}
