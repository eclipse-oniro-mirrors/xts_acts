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

export default function swiperDisableSwipeFalse() {
  describe('swiperDisableSwipeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperDisableSwipeFalse',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get DisableSwipe state success " + JSON.stringify(pages));
        if (!("DisableSwipe" == pages.name)) {
          console.info("get DisableSwipe state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push DisableSwipe page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DisableSwipe page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DisableSwipe after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_DISABLESWIPE_0200
     * @tc.name testSwiperDisableSwipeFalse.
     * @tc.desc Set swiper's disableSwipe values 'false'.
     */
    it('testSwiperDisableSwipeFalse', 0, async (done: Function) => {
      console.info('new testSwiperDisableSwipeFalse START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('disableFalse');

      let disableFalse = CommonFunc.getComponentRectOnScreen('disableFalse');
      let disableFalse01 = CommonFunc.getComponentRectOnScreen('disableFalse01');
      let disableFalse02 = CommonFunc.getComponentRectOnScreen('disableFalse02');
      let disableFalse03 = CommonFunc.getComponentRectOnScreen('disableFalse03');
      let disableFalse04 = CommonFunc.getComponentRectOnScreen('disableFalse04');
      let disableFalse05 = CommonFunc.getComponentRectOnScreen('disableFalse05');
      let disableFalse06 = CommonFunc.getComponentRectOnScreen('disableFalse06');
      // Before flipping the page.
      console.info("Before page turning , the disableFalse.left value is " + JSON.stringify(disableFalse.left));
      console.info("Before page turning , the disableFalse01.left value is " + JSON.stringify(disableFalse01.left));
      expect(disableFalse.left).assertEqual(disableFalse01.left);
      expect(disableFalse.right).assertEqual(disableFalse01.right);
      expect(disableFalse.top).assertEqual(disableFalse01.top);
      expect(disableFalse.bottom).assertEqual(disableFalse01.bottom);
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // //await driver.swipe(250, 230, 200, 230);
      // await CommonFunc.sleep(1000);
      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('disableFalse')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(3000);
      // After flipping the page.
      disableFalse = CommonFunc.getComponentRectOnScreen('disableFalse');
      disableFalse01 = CommonFunc.getComponentRectOnScreen('disableFalse01');
      disableFalse02 = CommonFunc.getComponentRectOnScreen('disableFalse02');
      disableFalse03 = CommonFunc.getComponentRectOnScreen('disableFalse03');
      disableFalse04 = CommonFunc.getComponentRectOnScreen('disableFalse04');
      disableFalse05 = CommonFunc.getComponentRectOnScreen('disableFalse05');
      disableFalse06 = CommonFunc.getComponentRectOnScreen('disableFalse06');
      console.info("After page turning , the disableFalse.left value is " + JSON.stringify(disableFalse.left));
      console.info("After page turning , the disableFalse02.left value is " + JSON.stringify(disableFalse02.left));
      expect(disableFalse.left).assertEqual(disableFalse02.left);
      expect(disableFalse.right).assertEqual(disableFalse02.right);
      expect(disableFalse.top).assertEqual(disableFalse02.top);
      expect(disableFalse.bottom).assertEqual(disableFalse02.bottom);
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The disableSwipe value is " + JSON.stringify(JSON.parse(strJson).$attrs.disableSwipe));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.disableSwipe).assertEqual('false');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperDisableSwipeFalse END');
      done();
    });
  })
}