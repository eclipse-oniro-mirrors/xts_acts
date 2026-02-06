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

export default function swiperWidthTest() {
  describe('swiperWidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperWidthTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperWidthTest state pages:" + JSON.stringify(pages));
        if (!("swiper_stretch_test_width" == pages.name)) {
          console.info("get  swiperWidthTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2/swiper_stretch_test_width"})
          await CommonFunc.sleep(2000);
          console.info("push swiperWidthTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperWidthTest page error:" + err);
      }
      console.info("swiperWidthTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperWidthTest after each called");
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020
     * @tc.desc   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTestWidth');
      //180,87,540,327
      let btTop = bt.top; //327
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft); //360
      let btHeight = Math.round(btTop -btBottom); //240
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020] swiper width " + btWidth + "----" + btHeight);
    
      // swipe the component of swiper to right
      let driver = await Driver.create();
      await driver.swipe( globalThis.winLeft + Math.round(btRight - vp2px(10)), Math.round(btTop - btHeight/2) + globalThis.winTop,  globalThis.winLeft + Math.round(btLeft + vp2px(10)), Math.round(btTop - btHeight/2) + globalThis.winTop);
      await CommonFunc.sleep(5000);
      // get the component of text_3
      let text3:Component = await driver.findComponent(ON.text('3'));
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("3")
      let tt = CommonFunc.getComponentRect('itemS3');
      let ttWidth = Math.round(tt.right - tt.left);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020] text_3 width " + ttWidth);
      // judge the text component
      expect(Math.abs(ttWidth - btWidth) <=1 ).assertTrue();
     
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0020] END');
      done();
    });

  })
}
