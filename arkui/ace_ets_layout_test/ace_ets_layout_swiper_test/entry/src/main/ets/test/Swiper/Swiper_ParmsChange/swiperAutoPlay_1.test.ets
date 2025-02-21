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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../MainAbility/common/Common";
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function swiperAutoPlay_1() {
  describe('swiperAutoPlayTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperAutoPlay_1',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperAutoPlay_1 state success " + JSON.stringify(pages));
        if (!("swiperAutoPlay_1" == pages.name)) {
          console.info("get swiperAutoPlay_1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperAutoPlay_1 page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperAutoPlay_1 page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      console.info("swiperAutoPlay_1 after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_AUTOPLAYCHANGED_0100
     * @tc.name testSwiperAutoPlaySetting_1
     * @tc.desc Set swiper's  AutoPlay  value ' true ' and interval values '1000'.
     */
    it('testSwiperAutoPlaySetting_1', 0, async (done: Function) => {
      console.info('new testSwiperAutoPlaySetting_1 START');
      let strJson = getInspectorByKey('autoPlay01');

      let autoPlay01: RectValue = CommonFunc.getComponentRect('autoPlay01');
      let autoPlay01_1: RectValue = CommonFunc.getComponentRect('autoPlay01_1');
      let autoPlay01_2: RectValue = CommonFunc.getComponentRect('autoPlay01_2');
      let autoPlay01_3: RectValue = CommonFunc.getComponentRect('autoPlay01_3');
      let autoPlay01_4: RectValue = CommonFunc.getComponentRect('autoPlay01_4');
      let autoPlay01_5: RectValue = CommonFunc.getComponentRect('autoPlay01_5');
      let autoPlay01_6: RectValue = CommonFunc.getComponentRect('autoPlay01_6');
      // Automatically flip to page six.
      console.info("Autoplay page turning , the autoPlay01.left value is " + JSON.stringify(autoPlay01.left));
      console.info("Autoplay page turning , the autoPlay01_4.left value is " + JSON.stringify(autoPlay01_4.left));
      expect(autoPlay01.left).assertEqual(autoPlay01_4.left);
      expect(autoPlay01.right).assertEqual(autoPlay01_4.right);
      expect(autoPlay01.top).assertEqual(autoPlay01_4.top);
      expect(autoPlay01.bottom).assertEqual(autoPlay01_4.bottom);
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The index value is " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
      console.info("The indicator value is " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      console.info("The interval value is " + JSON.stringify(JSON.parse(strJson).$attrs.interval));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.index).assertEqual('3');
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.interval).assertEqual('1000');
      console.info('new testSwiperAutoPlaySetting_1 END');
      done();
    });
  })
}