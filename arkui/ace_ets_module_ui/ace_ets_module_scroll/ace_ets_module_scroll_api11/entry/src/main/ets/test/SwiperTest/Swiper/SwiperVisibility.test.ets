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

export default function SwiperVisibility() {
  describe('SwiperVisibility', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperVisibility beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperVisibility state pages:" + JSON.stringify(pages));
        if (!("SwiperVisibility" == pages.name)) {
          console.info("get  SwiperVisibility pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/Swiper/SwiperVisibility"})
          await CommonFunc.sleep(2000);
          console.info("push SwiperVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperVisibility page error:" + err);
      }
      console.info("SwiperVisibility foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoop after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0520
     * @tc.desc      set loop to false and set autoPlay to false
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0520', 0, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0520] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperVisibility');

      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0520] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(globalThis.winLeft + Math.round(btRight) - Math.round(vp2px(20)), globalThis.winTop + Math.round(btBottom/2), globalThis.winLeft + Math.round(btLeft) + Math.round(vp2px(10)), globalThis.winTop + Math.round(btBottom/2));
      await CommonFunc.sleep(4800);


      let strJson = getInspectorByKey('SwiperVisibilityText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='2').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0520] END');
      done();
    });



  })
}
