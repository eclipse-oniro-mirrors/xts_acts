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

export default function swiper1() {
  describe('swiper1', () => {
    beforeEach(async (done: Function) => {
      console.info("swiper1 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper1 state pages:" + JSON.stringify(pages));
        if (!("swiper1" == pages.name)) {
          console.info("get  swiper1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/Swiper/swiper1"})
          await CommonFunc.sleep(2000);
          console.info("push swiper1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper1 page error:" + err);
      }
      console.info("swiper1 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiper1 after each called");
    });


    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130
     * @tc.desc   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTest1');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(globalThis.winLeft + Math.round(btLeft + width*0.3), Math.round(globalThis.winTop + btBottom - vp2px(10)), globalThis.winLeft + Math.round(btLeft + width*0.3), Math.round(globalThis.winTop + btTop + vp2px(10)));
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('swiperText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='change').assertTrue();


      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0130] END');
      done();
    });

  })
}
