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

export default function swiper2() {
  describe('swiper2', () => {
    beforeEach(async (done: Function) => {
      console.info("swiper2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper2 state pages:" + JSON.stringify(pages));
        if (!("swiper2" == pages.name)) {
          console.info("get  swiper2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/Swiper/swiper2"})
          await CommonFunc.sleep(2000);
          console.info("push swiper2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper2 page error:" + err);
      }
      console.info("swiper2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiper2 after each called");
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260
     * @tc.desc   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperTest2');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btLeft + width*0.5), Math.round(btTop + height/2), Math.round(btRight), Math.round(btTop + height/2));
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('swiperText2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0260] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] END');
      done();
    });

  })
}
