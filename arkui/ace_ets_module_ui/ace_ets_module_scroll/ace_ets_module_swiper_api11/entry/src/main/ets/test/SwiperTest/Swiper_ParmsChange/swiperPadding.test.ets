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

export default function swiperPadding() {
  describe('swiperMarPadTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperPadding',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperPadding state success " + JSON.stringify(pages));
        if (!("swiperPadding" == pages.name)) {
          console.info("get swiperPadding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperPadding page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperPadding page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });

    /**
     * @tc.name   testSwiperSetPadding
     * @tc.number SUB_ACE_SWIPER_MARPAD_0100
     * @tc.desc   Set swiper's padding values '20'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperSetPadding', Level.LEVEL1, async (done: Function) => {
      console.info('new testSwiperSetPadding START');
      let strJson = getInspectorByKey('swiperPadding');

      await CommonFunc.sleep(1000);
      let swiperPadding: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding');
      let swiperPadding01: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding01');
      let swiperPadding02: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding02');
      let swiperPadding03: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding03');
      let swiperPadding04: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding04');
      let swiperPadding05: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding05');
      let swiperPadding06: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding06');
      // Before flipping the page
      console.info("Before page turning , swiperPadding01.left - swiperPadding.left value is " + JSON.stringify(swiperPadding01.left - swiperPadding.left));
      expect(Math.abs(Math.round(swiperPadding01.left - swiperPadding.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding.right - swiperPadding01.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding01.top - swiperPadding.top) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding.bottom - swiperPadding01.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // //await driver.swipe(250, 230, 200, 230);
      // await CommonFunc.sleep(1000);
      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(3000);
      swiperPadding = CommonFunc.getComponentRectOnScreen('swiperPadding');
      swiperPadding01 = CommonFunc.getComponentRectOnScreen('swiperPadding01');
      swiperPadding02 = CommonFunc.getComponentRectOnScreen('swiperPadding02');
      swiperPadding03 = CommonFunc.getComponentRectOnScreen('swiperPadding03');
      swiperPadding04 = CommonFunc.getComponentRectOnScreen('swiperPadding04');
      swiperPadding05 = CommonFunc.getComponentRectOnScreen('swiperPadding05');
      swiperPadding06 = CommonFunc.getComponentRectOnScreen('swiperPadding06');
      // After flipping the page.
      console.info("After page turning, swiperPadding02.left - swiperPadding.left value is " + JSON.stringify(swiperPadding02.left - swiperPadding.left));
      expect(Math.abs(Math.round(swiperPadding02.left - swiperPadding.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding.right - swiperPadding02.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding02.top - swiperPadding.top) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(swiperPadding.bottom - swiperPadding02.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The indicator value is " + JSON.stringify(JSON.parse(strJson).$attrs.indicator));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperSetPadding END');
      done();
    });
  })
}