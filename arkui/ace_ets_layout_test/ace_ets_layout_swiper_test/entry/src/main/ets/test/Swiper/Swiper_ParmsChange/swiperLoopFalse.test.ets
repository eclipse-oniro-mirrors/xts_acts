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
export default function swiperLoopFalse() {
  describe('swiperLoopTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperLoopFalse',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperLoopFalse state success " + JSON.stringify(pages));
        if (!("swiperLoopFalse" == pages.name)) {
          console.info("get swiperLoopFalse state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperLoopFalse page success " + JSON.stringify(result));
        }


      } catch (err) {
        console.error("push swiperLoopFalse page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_LOOPCHANGED_0200
     * @tc.name      testSwiperSetLoopFalse
     * @tc.desc      Set swiper's  Loop  value ' false '.
     */
    it('testSwiperSetLoopFalse', 0, async function (done) {
      console.info('new testSwiperSetLoopFalse START');
      await CommonFunc.sleep(2000);
      // Page turning.
      let driver = await Driver.create();
      await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      let loopFalse = CommonFunc.getComponentRect('loopFalse');
      let strJson = getInspectorByKey('loopFalse');
      let obj = JSON.parse(strJson);
      let loopFalse01 = CommonFunc.getComponentRect('loopFalse01');
      let loopFalse02 = CommonFunc.getComponentRect('loopFalse02');
      let loopFalse03 = CommonFunc.getComponentRect('loopFalse03');
      let loopFalse04 = CommonFunc.getComponentRect('loopFalse04');
      let loopFalse05 = CommonFunc.getComponentRect('loopFalse05');
      let loopFalse06 = CommonFunc.getComponentRect('loopFalse06');
      // After flipping the page
      console.info("After page turning , the loopFalse.left value is " + JSON.stringify(loopFalse.left));
      console.info("After page turning , the loopFalse06.left value is " + JSON.stringify(loopFalse06.left));
      expect(loopFalse.left).assertEqual(loopFalse06.left);
      expect(loopFalse.right).assertEqual(loopFalse06.right);
      expect(loopFalse.top).assertEqual(loopFalse06.top);
      expect(loopFalse.bottom).assertEqual(loopFalse06.bottom);
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The index value is " + JSON.stringify(obj.$attrs.index));
      console.info("The autoPlay value is " + JSON.stringify(obj.$attrs.autoPlay));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.index).assertEqual('5');
      expect(obj.$attrs.autoPlay).assertEqual('true');
      expect(obj.$attrs.loop).assertEqual('false');
      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
      expect(obj.$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetLoopFalse END');
      done();
    });
  })
}