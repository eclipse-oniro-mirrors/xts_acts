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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function swiper2() {
  describe('swiper2', function () {
    beforeEach(async function (done) {
      console.info("swiper2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper2 state pages:" + JSON.stringify(pages));
        if (!("swiper2" == pages.name)) {
          console.info("get  swiper2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/swiper2"})
          await CommonFunc.sleep(2000);
          console.info("push swiper2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper2 page error:" + err);
      }
      console.info("swiper2 foreEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiper2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260
     * @tc.desc      set loop to false and set autoPlay to false and set EdgeEffect to None
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260', 0, async function (done) {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTest2');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      driver.swipe(Math.round(btLeft), Math.round(btBottom/2), Math.round(btRight)+40, Math.round(btBottom/2));
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('swiperText2');
      let obj = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] END');
      done();
    });

  })
}
