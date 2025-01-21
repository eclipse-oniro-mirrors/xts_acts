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
export default function swiperMargin() {
  describe('swiperMarPadTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMargin state success " + JSON.stringify(pages));
        if (!("swiperMargin" == pages.name)) {
          console.info("get swiperMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperMargin page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperMargin page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_MARPAD_0200
     * @tc.name      testSwiperSetMargin.
     * @tc.desc      Set swiper's margin values '20'.
     */
    it('testSwiperSetMargin', 0, async function (done) {
      console.info('new testSwiperSetMargin START');
      let strJson = getInspectorByKey('swiperMargin');
      let obj = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      let swiperMargin = CommonFunc.getComponentRect('swiperMargin');
      let swiperMargin01= CommonFunc.getComponentRect('swiperMargin01');
      let swiperMargin02 = CommonFunc.getComponentRect('swiperMargin02');
      let swiperMargin03= CommonFunc.getComponentRect('swiperMargin03');
      let swiperMargin04 = CommonFunc.getComponentRect('swiperMargin04');
      let swiperMargin05= CommonFunc.getComponentRect('swiperMargin05');
      let swiperMargin06 = CommonFunc.getComponentRect('swiperMargin06');
      // Before flipping the page
      console.info("Before page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("Before page turning , the swiperMargin01.left value is " + JSON.stringify(swiperMargin01.left));
      expect(swiperMargin.left).assertEqual(swiperMargin01.left);
      expect(swiperMargin.right).assertEqual(swiperMargin01.right);
      expect(swiperMargin.top).assertEqual(swiperMargin01.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin01.bottom);
      // Page turning.
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      //await driver.swipe(250, 230, 200, 230);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);
      swiperMargin = CommonFunc.getComponentRect('swiperMargin');
      swiperMargin01 = CommonFunc.getComponentRect('swiperMargin01');
      swiperMargin02 = CommonFunc.getComponentRect('swiperMargin02');
      swiperMargin03 = CommonFunc.getComponentRect('swiperMargin03');
      swiperMargin04 = CommonFunc.getComponentRect('swiperMargin04');
      swiperMargin05 = CommonFunc.getComponentRect('swiperMargin05');
      swiperMargin06 = CommonFunc.getComponentRect('swiperMargin06');
      // After flipping the page.
      console.info("After page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("After page turning , the swiperMargin02.left value is " + JSON.stringify(swiperMargin02.left));
      expect(swiperMargin.left).assertEqual(swiperMargin02.left);
      expect(swiperMargin.right).assertEqual(swiperMargin02.right);
      expect(swiperMargin.top).assertEqual(swiperMargin02.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin02.bottom);
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The indicator value is " + JSON.stringify(obj.$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetMargin END');
      done();
    });
  })
}