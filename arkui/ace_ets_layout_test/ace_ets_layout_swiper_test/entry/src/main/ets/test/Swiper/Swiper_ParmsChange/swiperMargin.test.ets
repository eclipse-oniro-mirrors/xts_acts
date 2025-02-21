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

export default function swiperMargin() {
  describe('swiperMarPadTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMargin',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMargin state success " + JSON.stringify(pages));
        if (!("swiperMargin" == pages.name)) {
          console.info("get swiperMargin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperMargin page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperMargin page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_MARPAD_0200
     * @tc.name testSwiperSetMargin.
     * @tc.desc Set swiper's margin values '20'.
     */
    it('testSwiperSetMargin', 0, async (done: Function) => {
      console.info('new testSwiperSetMargin START');
      let strJson = getInspectorByKey('swiperMargin');

      await CommonFunc.sleep(1000);
      let swiperMargin: RectValue = CommonFunc.getComponentRect('swiperMargin');
      let swiperMargin01: RectValue = CommonFunc.getComponentRect('swiperMargin01');
      let swiperMargin02: RectValue = CommonFunc.getComponentRect('swiperMargin02');
      let swiperMargin03: RectValue = CommonFunc.getComponentRect('swiperMargin03');
      let swiperMargin04: RectValue = CommonFunc.getComponentRect('swiperMargin04');
      let swiperMargin05: RectValue = CommonFunc.getComponentRect('swiperMargin05');
      let swiperMargin06: RectValue = CommonFunc.getComponentRect('swiperMargin06');
      // Before flipping the page
      console.info("Before page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("Before page turning , the swiperMargin01.left value is " + JSON.stringify(swiperMargin01.left));
      expect(swiperMargin.left).assertEqual(swiperMargin01.left);
      expect(swiperMargin.right).assertEqual(swiperMargin01.right);
      expect(swiperMargin.top).assertEqual(swiperMargin01.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin01.bottom);
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      // //await driver.swipe(250, 230, 200, 230);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);
      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('swiperMargin')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(3000);
      swiperMargin = CommonFunc.getComponentRectOnScreen('swiperMargin');
      swiperMargin01 = CommonFunc.getComponentRectOnScreen('swiperMargin01');
      swiperMargin02 = CommonFunc.getComponentRectOnScreen('swiperMargin02');
      swiperMargin03 = CommonFunc.getComponentRectOnScreen('swiperMargin03');
      swiperMargin04 = CommonFunc.getComponentRectOnScreen('swiperMargin04');
      swiperMargin05 = CommonFunc.getComponentRectOnScreen('swiperMargin05');
      swiperMargin06 = CommonFunc.getComponentRectOnScreen('swiperMargin06');
      // After flipping the page.
      console.info("After page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("After page turning , the swiperMargin02.left value is " + JSON.stringify(swiperMargin02.left));
      expect(swiperMargin.left).assertEqual(swiperMargin02.left);
      expect(swiperMargin.right).assertEqual(swiperMargin02.right);
      expect(swiperMargin.top).assertEqual(swiperMargin02.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin02.bottom);
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The indicator value is " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetMargin END');
      done();
    });
  })
}