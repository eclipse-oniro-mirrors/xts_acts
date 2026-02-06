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

export default function swiperMarPad() {
  describe('swiperMarPadTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMarPad',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMarPad state success " + JSON.stringify(pages));
        if (!("swiperMarPad" == pages.name)) {
          console.info("get swiperMarPad state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperMarPad page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperMarPad page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_MARPAD_0300
     * @tc.name testSwiperSetPaddingMargin.
     * @tc.desc Set swiper's  padding and margin both values '20'.
     */
    it('testSwiperSetPaddingMargin', Level.LEVEL1, async (done: Function) => {
      console.info('new testSwiperSetPaddingMargin START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperMarPad');
      
      let swiperMarPad = CommonFunc.getComponentRectOnScreen('swiperMarPad');
      let swiperMarPad01= CommonFunc.getComponentRectOnScreen('swiperMarPad01');
      let swiperMarPad02 = CommonFunc.getComponentRectOnScreen('swiperMarPad02');
      let swiperMarPad03= CommonFunc.getComponentRectOnScreen('swiperMarPad03');
      let swiperMarPad04 = CommonFunc.getComponentRectOnScreen('swiperMarPad04');
      let swiperMarPad05= CommonFunc.getComponentRectOnScreen('swiperMarPad05');
      let swiperMarPad06 = CommonFunc.getComponentRectOnScreen('swiperMarPad06');
      // Before flipping the page
      console.info("Before page turning , swiperMarPad01.left - swiperMarPad.left value is " + JSON.stringify(swiperMarPad01.left - swiperMarPad.left));
      expect(Math.abs(Math.round(swiperMarPad01.left - swiperMarPad.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.right - swiperMarPad01.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad01.top - swiperMarPad.top) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.bottom - swiperMarPad01.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500)
      // //await driver.swipe(250, 230, 200, 230);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // await CommonFunc.sleep(1000);
      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('swiperMarPad')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(3000);
      swiperMarPad = CommonFunc.getComponentRectOnScreen('swiperMarPad');
      swiperMarPad01 = CommonFunc.getComponentRectOnScreen('swiperMarPad01');
      swiperMarPad02 = CommonFunc.getComponentRectOnScreen('swiperMarPad02');
      swiperMarPad03 = CommonFunc.getComponentRectOnScreen('swiperMarPad03');
      swiperMarPad04 = CommonFunc.getComponentRectOnScreen('swiperMarPad04');
      swiperMarPad05 = CommonFunc.getComponentRectOnScreen('swiperMarPad05');
      swiperMarPad06 = CommonFunc.getComponentRectOnScreen('swiperMarPad06');
      // After flipping the page.
      console.info("After page turning, swiperMarPad02.left - swiperMarPad.left value is " + JSON.stringify(swiperMarPad02.left - swiperMarPad.left));
      expect(Math.abs(Math.round(swiperMarPad02.left - swiperMarPad.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.right - swiperMarPad02.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad02.top - swiperMarPad.top) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.bottom - swiperMarPad02.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The indicator value is " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetPaddingMargin END');
      done();
    });
  })
}