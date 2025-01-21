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
export default function swiperAutoPlay_4() {
  describe('swiperAutoPlayTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperAutoPlay_4',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperAutoPlay_4 state success " + JSON.stringify(pages));
        if (!("swiperAutoPlay_4" == pages.name)) {
          console.info("get swiperAutoPlay_4 state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperAutoPlay_4 page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperAutoPlay_4 page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      console.info("swiperAutoPlay_4 after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_VERTICALCHANGED_0400
     * @tc.name      testSwiperAutoPlaySetting_4
     * @tc.desc      Set swiper's  AutoPlay  value ' false ' and interval values '-1000'.
     */
    it('testSwiperAutoPlaySetting_4', 0, async function (done) {
      console.info('new testSwiperAutoPlaySetting_4 START');
      let strJson = getInspectorByKey('autoPlay04');
      let obj = JSON.parse(strJson);
      let autoPlay04 = CommonFunc.getComponentRect('autoPlay04');
      let autoPlay04_1 = CommonFunc.getComponentRect('autoPlay04_1');
      let autoPlay04_2 = CommonFunc.getComponentRect('autoPlay04_2');
      let autoPlay04_3 = CommonFunc.getComponentRect('autoPlay04_3');
      let autoPlay04_4 = CommonFunc.getComponentRect('autoPlay04_4');
      let autoPlay04_5 = CommonFunc.getComponentRect('autoPlay04_5');
      let autoPlay04_6 = CommonFunc.getComponentRect('autoPlay04_6');
      // Automatically flip to the second page.
      console.info("Autoplay page turning , the autoPlay04.left value is " + JSON.stringify(autoPlay04.left));
      console.info("Autoplay page turning , the autoPlay04_2.left value is " + JSON.stringify(autoPlay04_2.left));
      expect(autoPlay04.left).assertEqual(autoPlay04_2.left);
      expect(autoPlay04.right).assertEqual(autoPlay04_2.right);
      expect(autoPlay04.top).assertEqual(autoPlay04_2.top);
      expect(autoPlay04.bottom).assertEqual(autoPlay04_2.bottom);
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The index value is " + JSON.stringify(obj.$attrs.index));
      console.info("The autoPlay value is " + JSON.stringify(obj.$attrs.autoPlay));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      console.info("The interval value is " + JSON.stringify(obj.$attrs.interval));
      expect(obj.$type).assertEqual('Swiper')
      expect(obj.$attrs.index).assertEqual('1')
      expect(obj.$attrs.autoPlay).assertEqual('true');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
      expect(obj.$attrs.displayCount).assertEqual(1);
      expect(obj.$attrs.interval).assertEqual('3000');
      console.info('new testSwiperAutoPlaySetting_4 END');
      done();
    });
  })
}