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
export default function swiperPadding() {
  describe('swiperMarPadTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperPadding state success " + JSON.stringify(pages));
        if (!("swiperPadding" == pages.name)) {
          console.info("get swiperPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperPadding page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperPadding page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_MARPAD_0100
     * @tc.name      testSwiperSetPadding.
     * @tc.desc      Set swiper's padding values '20'.
     */
    it('testSwiperSetPadding', 0, async function (done) {
      console.info('new testSwiperSetPadding START');
      let strJson = getInspectorByKey('swiperPadding');
      let obj = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      let swiperPadding = CommonFunc.getComponentRect('swiperPadding');
      let swiperPadding01= CommonFunc.getComponentRect('swiperPadding01');
      let swiperPadding02 = CommonFunc.getComponentRect('swiperPadding02');
      let swiperPadding03= CommonFunc.getComponentRect('swiperPadding03');
      let swiperPadding04 = CommonFunc.getComponentRect('swiperPadding04');
      let swiperPadding05= CommonFunc.getComponentRect('swiperPadding05');
      let swiperPadding06 = CommonFunc.getComponentRect('swiperPadding06');
      // Before flipping the page
      console.info("Before page turning , swiperPadding01.left - swiperPadding.left value is " + JSON.stringify(swiperPadding01.left - swiperPadding.left));
      expect(swiperPadding01.left - swiperPadding.left).assertEqual(Math.round(vp2px(20)))
      expect(swiperPadding.right - swiperPadding01.right).assertEqual(Math.round(vp2px(20)))
      expect(swiperPadding01.top - swiperPadding.top).assertEqual(Math.round(vp2px(20)))
      expect(swiperPadding.bottom - swiperPadding01.bottom).assertEqual(Math.round(vp2px(20)))
      // Page turning.
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      //await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      swiperPadding = CommonFunc.getComponentRect('swiperPadding');
      swiperPadding01 = CommonFunc.getComponentRect('swiperPadding01');
      swiperPadding02 = CommonFunc.getComponentRect('swiperPadding02');
      swiperPadding03 = CommonFunc.getComponentRect('swiperPadding03');
      swiperPadding04 = CommonFunc.getComponentRect('swiperPadding04');
      swiperPadding05 = CommonFunc.getComponentRect('swiperPadding05');
      swiperPadding06 = CommonFunc.getComponentRect('swiperPadding06');
      // After flipping the page.
      console.info("After page turning, swiperPadding02.left - swiperPadding.left value is " + JSON.stringify(swiperPadding02.left - swiperPadding.left));
      expect(swiperPadding02.left - swiperPadding.left).assertEqual(Math.round(vp2px(20)));
      expect(swiperPadding.right - swiperPadding02.right).assertEqual(Math.round(vp2px(20)));
      expect(swiperPadding02.top - swiperPadding.top).assertEqual(Math.round(vp2px(20)));
      expect(swiperPadding.bottom - swiperPadding02.bottom).assertEqual(Math.round(vp2px(20)));
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The indicator value is " + JSON.stringify(obj.$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetPadding END');
      done();
    });
  })
}