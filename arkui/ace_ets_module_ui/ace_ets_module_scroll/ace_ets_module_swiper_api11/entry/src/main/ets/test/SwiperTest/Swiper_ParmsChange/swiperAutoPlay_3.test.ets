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

export default function swiperAutoPlay_3() {
  describe('swiperAutoPlayTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperAutoPlay_3',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperAutoPlay_3 state success " + JSON.stringify(pages));
        if (!("swiperAutoPlay_3" == pages.name)) {
          console.info("get swiperAutoPlay_3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperAutoPlay_3 page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperAutoPlay_3 page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      console.info("swiperAutoPlay_3 after each called");
    });

    /**
     * @tc.name   testSwiperAutoPlaySetting_3
     * @tc.number SUB_ACE_SWIPER_VERTICALCHANGED_0300
     * @tc.desc   Set swiper's  AutoPlay  value ' true '.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperAutoPlaySetting_3', Level.LEVEL1, async (done: Function) => {
      console.info('new testSwiperAutoPlaySetting_3 START');
      let strJson = getInspectorByKey('autoPlay03');

      let autoPlay03: RectValue = CommonFunc.getComponentRect('autoPlay03');
      let autoPlay03_1: RectValue = CommonFunc.getComponentRect('autoPlay03_1');
      let autoPlay03_2: RectValue = CommonFunc.getComponentRect('autoPlay03_2');
      let autoPlay03_3: RectValue = CommonFunc.getComponentRect('autoPlay03_3');
      let autoPlay03_4: RectValue = CommonFunc.getComponentRect('autoPlay03_4');
      let autoPlay03_5: RectValue = CommonFunc.getComponentRect('autoPlay03_5');
      let autoPlay03_6: RectValue = CommonFunc.getComponentRect('autoPlay03_6');
      // Automatically flip to the second page.
      console.info("Autoplay page turning , the autoPlay03.left value is " + JSON.stringify(autoPlay03.left));
      console.info("Autoplay page turning , the autoPlay03_2.left value is " + JSON.stringify(autoPlay03_2.left));
      expect(autoPlay03.left).assertEqual(autoPlay03_2.left);
      expect(autoPlay03.right).assertEqual(autoPlay03_2.right);
      expect(autoPlay03.top).assertEqual(autoPlay03_2.top);
      expect(autoPlay03.bottom).assertEqual(autoPlay03_2.bottom);
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The index value is " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      console.info("The interval value is " + JSON.stringify(JSON.parse(strJson).$attrs.interval));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.index).assertEqual('1');
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      expect(JSON.parse(strJson).$attrs.interval).assertEqual('3000');
      console.info('new testSwiperAutoPlaySetting_3 END');
      done();
    });
  })
}