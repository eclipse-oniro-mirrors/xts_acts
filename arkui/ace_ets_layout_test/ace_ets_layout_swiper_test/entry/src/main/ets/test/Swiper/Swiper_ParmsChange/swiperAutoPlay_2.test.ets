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
export default function swiperAutoPlay_2() {
  describe('swiperAutoPlayTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperAutoPlay_2',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperAutoPlay_2 state success " + JSON.stringify(pages));
        if (!("swiperAutoPlay_2" == pages.name)) {
          console.info("get swiperAutoPlay_2 state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperAutoPlay_2 page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperAutoPlay_2 page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      console.info("swiperAutoPlay_2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_VERTICALCHANGED_0200
     * @tc.name      testSwiperAutoPlaySetting_2
     * @tc.desc      Set swiper's  AutoPlay  value ' false ' and interval values '1000'.
     */
    it('testSwiperAutoPlaySetting_2', 0, async function (done) {
      console.info('new testSwiperAutoPlaySetting_2 START');
      let strJson = getInspectorByKey('autoPlay02');
      let obj = JSON.parse(strJson);
      let autoPlay02 = CommonFunc.getComponentRect('autoPlay02');
      let autoPlay02_1 = CommonFunc.getComponentRect('autoPlay02_1');
      let autoPlay02_2 = CommonFunc.getComponentRect('autoPlay02_2');
      let autoPlay02_3 = CommonFunc.getComponentRect('autoPlay02_3');
      let autoPlay02_4 = CommonFunc.getComponentRect('autoPlay02_4');
      let autoPlay02_5 = CommonFunc.getComponentRect('autoPlay02_5');
      let autoPlay02_6 = CommonFunc.getComponentRect('autoPlay02_6');
      // Automatic page flipping failed.
      console.info("Autoplay page turning , the autoPlay02.left value is " + JSON.stringify(autoPlay02.left));
      console.info("Autoplay page turning , the autoPlay02_1.left value is " + JSON.stringify(autoPlay02_1.left));
      expect(autoPlay02.left).assertEqual(autoPlay02_1.left);
      expect(autoPlay02.right).assertEqual(autoPlay02_1.right);
      expect(autoPlay02.top).assertEqual(autoPlay02_1.top);
      expect(autoPlay02.bottom).assertEqual(autoPlay02_1.bottom);
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The index value is " + JSON.stringify(obj.$attrs.index));
      console.info("The autoPlay value is " + JSON.stringify(obj.$attrs.autoPlay));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      console.info("The interval value is " + JSON.stringify(obj.$attrs.interval));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.index).assertEqual('0');
      expect(obj.$attrs.autoPlay).assertEqual('false');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
      expect(obj.$attrs.displayCount).assertEqual(1);
      expect(obj.$attrs.interval).assertEqual('1000');
      console.info('new testSwiperAutoPlaySetting_2 END');
      done();
    });
  })
}