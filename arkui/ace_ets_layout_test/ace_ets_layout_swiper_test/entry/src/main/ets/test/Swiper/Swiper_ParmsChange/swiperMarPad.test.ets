/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../MainAbility/common/Common";
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';
export default function swiperMarPad() {
  describe('swiperMarPadTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMarPad',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMarPad state success " + JSON.stringify(pages));
        if (!("swiperMarPad" == pages.name)) {
          console.info("get swiperMarPad state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperMarPad page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperMarPad page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_MARPAD_0300
     * @tc.name      testSwiperSetPaddingMargin.
     * @tc.desc      Set swiper's  padding and margin both values '20'.
     */
    it('testSwiperSetPaddingMargin', 0, async function (done) {
      console.info('new testSwiperSetPaddingMargin START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperMarPad');
      let obj = JSON.parse(strJson);
      let swiperMarPad = CommonFunc.getComponentRect('swiperMarPad');
      let swiperMarPad01= CommonFunc.getComponentRect('swiperMarPad01');
      let swiperMarPad02 = CommonFunc.getComponentRect('swiperMarPad02');
      let swiperMarPad03= CommonFunc.getComponentRect('swiperMarPad03');
      let swiperMarPad04 = CommonFunc.getComponentRect('swiperMarPad04');
      let swiperMarPad05= CommonFunc.getComponentRect('swiperMarPad05');
      let swiperMarPad06 = CommonFunc.getComponentRect('swiperMarPad06');
      // Before flipping the page
      console.info("Before page turning , swiperMarPad01.left - swiperMarPad.left value is " + JSON.stringify(swiperMarPad01.left - swiperMarPad.left));
      expect(swiperMarPad01.left - swiperMarPad.left).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad.right - swiperMarPad01.right).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad01.top - swiperMarPad.top).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad.bottom - swiperMarPad01.bottom).assertEqual(Math.round(vp2px(20)));
      // Page turning.
      let driver = await Driver.create();
      await CommonFunc.sleep(500)
      //await driver.swipe(250, 230, 200, 230);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);
      swiperMarPad = CommonFunc.getComponentRect('swiperMarPad');
      swiperMarPad01 = CommonFunc.getComponentRect('swiperMarPad01');
      swiperMarPad02 = CommonFunc.getComponentRect('swiperMarPad02');
      swiperMarPad03 = CommonFunc.getComponentRect('swiperMarPad03');
      swiperMarPad04 = CommonFunc.getComponentRect('swiperMarPad04');
      swiperMarPad05 = CommonFunc.getComponentRect('swiperMarPad05');
      swiperMarPad06 = CommonFunc.getComponentRect('swiperMarPad06');
      // After flipping the page.
      console.info("After page turning, swiperMarPad02.left - swiperMarPad.left value is " + JSON.stringify(swiperMarPad02.left - swiperMarPad.left));
      expect(swiperMarPad02.left - swiperMarPad.left).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad.right - swiperMarPad02.right).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad02.top - swiperMarPad.top).assertEqual(Math.round(vp2px(20)));
      expect(swiperMarPad.bottom - swiperMarPad02.bottom).assertEqual(Math.round(vp2px(20)));
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The indicator value is " + JSON.stringify(obj.$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetPaddingMargin END');
      done();
    });
  })
}