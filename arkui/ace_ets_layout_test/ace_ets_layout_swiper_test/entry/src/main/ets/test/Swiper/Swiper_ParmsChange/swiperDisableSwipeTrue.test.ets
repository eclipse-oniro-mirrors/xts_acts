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

export default function swiperDisableSwipeTrue() {
  describe('swiperDisableSwipeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperDisableSwipeTrue',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperDisableSwipeTrue state success " + JSON.stringify(pages));
        if (!("swiperDisableSwipeTrue" == pages.name)) {
          console.info("get swiperDisableSwipeTrue state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperDisableSwipeTrue page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperDisableSwipeTrue page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DisableSwipe after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_DISABLESWIPE_0100
     * @tc.name testSwiperDisableSwipeTrue.
     * @tc.desc Set swiper's disableSwipe values 'true'.
     */
    it('testSwiperDisableSwipeTrue', 0, async (done: Function) => {
      console.info('new testSwiperDisableSwipeTrue START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('disableTrue');

      let disableTrue = CommonFunc.getComponentRectOnScreen('disableTrue');
      let disableTrue01 = CommonFunc.getComponentRectOnScreen('disableTrue01');
      let disableTrue02 = CommonFunc.getComponentRectOnScreen('disableTrue02');
      let disableTrue03 = CommonFunc.getComponentRectOnScreen('disableTrue03');
      let disableTrue04 = CommonFunc.getComponentRectOnScreen('disableTrue04');
      let disableTrue05 = CommonFunc.getComponentRectOnScreen('disableTrue05');
      let disableTrue06 = CommonFunc.getComponentRectOnScreen('disableTrue06');
      // Before flipping the page.
      console.info("Before page turning , the disableTrue.left value is " + JSON.stringify(disableTrue.left));
      console.info("Before page turning , the disableTrue01.left value is " + JSON.stringify(disableTrue01.left));
      expect(disableTrue.left).assertEqual(disableTrue01.left);
      expect(disableTrue.right).assertEqual(disableTrue01.right);
      expect(disableTrue.top).assertEqual(disableTrue01.top);
      expect(disableTrue.bottom).assertEqual(disableTrue01.bottom);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(vp2px(150)), Math.round(vp2px(100)), Math.round(vp2px(100)), Math.round(vp2px(100)));
      //await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      disableTrue01 = CommonFunc.getComponentRectOnScreen('disableTrue01');
      disableTrue02 = CommonFunc.getComponentRectOnScreen('disableTrue02');
      disableTrue03 = CommonFunc.getComponentRectOnScreen('disableTrue03');
      disableTrue04 = CommonFunc.getComponentRectOnScreen('disableTrue04');
      disableTrue05 = CommonFunc.getComponentRectOnScreen('disableTrue05');
      disableTrue06 = CommonFunc.getComponentRectOnScreen('disableTrue06');
      // After flipping the page.
      console.info("After page turning , the disableTrue.left value is " + JSON.stringify(disableTrue.left));
      console.info("After page turning , the disableTrue01.left value is " + JSON.stringify(disableTrue01.left));
      expect(disableTrue.left).assertEqual(disableTrue01.left);
      expect(disableTrue.right).assertEqual(disableTrue01.right);
      expect(disableTrue.top).assertEqual(disableTrue01.top);
      expect(disableTrue.bottom).assertEqual(disableTrue01.bottom);
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The disableSwipe value is " + JSON.stringify(JSON.parse(strJson).$attrs.disableSwipe));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.disableSwipe).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperDisableSwipeTrue END');
      done();
    });
  })
}