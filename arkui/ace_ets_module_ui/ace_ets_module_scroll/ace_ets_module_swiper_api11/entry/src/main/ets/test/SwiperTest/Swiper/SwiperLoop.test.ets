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

export default function SwiperLoop() {
  describe('SwiperLoop', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperLoop beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperLoop state pages:" + JSON.stringify(pages));
        if (!("SwiperLoop" == pages.name)) {
          console.info("get  SwiperLoop pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Swiper/Swiper/SwiperLoop"})
          await CommonFunc.sleep(2000);
          console.info("push SwiperLoop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperLoop page error:" + err);
      }
      console.info("SwiperLoop foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoop after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270
     * @tc.desc      set loop to false and set autoPlay to false
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperLoop');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton1'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btRight - vp2px(10)), Math.round(btTop + height/2), Math.round(btLeft + vp2px(27)), Math.round(btTop + height/2));
      await CommonFunc.sleep(3500);

      let strJson = getInspectorByKey('SwiperLoopText10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='10').assertTrue();


      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0270] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280
     * @tc.desc      set loop to true and set autoPlay to false
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperLoop');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton2'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btLeft + width*0.3), Math.round(btTop + height/2), Math.round(btRight), Math.round(btTop + height/2));
      await CommonFunc.sleep(3500);

      let strJson = getInspectorByKey('SwiperLoopText10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='10').assertTrue();


      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0280] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340
     * @tc.desc      set loop to true and set autoPlay to false
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperLoop');
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton3'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btRight - vp2px(50)), Math.round(btTop + height/2), Math.round(btLeft + Math.round(vp2px(27))), Math.round(btTop + height/2));
      await CommonFunc.sleep(3500);

      let strJson = getInspectorByKey('SwiperLoopText6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='6').assertTrue();


      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0340] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350
     * @tc.desc      set loop to true and set autoPlay to false
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRectOnScreen('swiperLoop');
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let height = btBottom -btTop;
      let width = btRight - btLeft;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350] swiper top:" + btTop + "bottom:" + btBottom + "right:" + btRight + "left:" + btLeft );
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btLeft + width*0.3), Math.round(btTop + height/2), Math.round(btRight), Math.round(btTop + height/2));
      await CommonFunc.sleep(3500);

      let strJson = getInspectorByKey('SwiperLoopText5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='5').assertTrue();


      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0350] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480
     * @tc.desc      set loop to false and set autoPlay to true
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480] START');
      await CommonFunc.sleep(2000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton4'));
      await button_Bottom.click();
      await CommonFunc.sleep(4000);

      let strJson = getInspectorByKey('SwiperLoopText10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='10').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_0480] END');
      done();
    });

  })
}
