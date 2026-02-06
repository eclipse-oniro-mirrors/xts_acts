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
import CommonFunc, {RectValue} from "../../../MainAbility/common/Common";

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

export default function swiperItemSize() {
  describe('swiperItemSizeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemSize',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSize state success " + JSON.stringify(pages));
        if (!("swiperItemSize" == pages.name)) {
          console.info("get swiperItemSize state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperItemSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemSize page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSize after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_ITEMCHANGED_0100
     * @tc.name testSwiperItemSize
     * @tc.desc Set item's  height and width   values '150*150'.
     */
    it('testSwiperItemSize', Level.LEVEL1, async (done: Function) => {
      console.info('new testSwiperItemSize START');
      let strJson = getInspectorByKey('itemSizekey');
      
      let itemSizekey = CommonFunc.getComponentRectOnScreen('itemSizekey');
      let itemSizekey01 = CommonFunc.getComponentRectOnScreen('itemSizekey01');
      let itemSizekey02 = CommonFunc.getComponentRectOnScreen('itemSizekey02');
      let itemSizekey03 = CommonFunc.getComponentRectOnScreen('itemSizekey03');
      // Before flipping the page.
      console.info("Before page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("Before page turning , the itemSizekey01.left value is " + JSON.stringify(itemSizekey01.left));
      expect(itemSizekey.left).assertEqual(itemSizekey01.left);
      expect(itemSizekey.top).assertEqual(itemSizekey01.top);
      expect(itemSizekey.right).assertEqual(itemSizekey01.right);

      // Flipping.
      let driver = Driver.create();
      //await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(2500);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('itemSizekey')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(3000);
      // After flipping the page.
      itemSizekey = CommonFunc.getComponentRectOnScreen('itemSizekey');
      itemSizekey01 = CommonFunc.getComponentRectOnScreen('itemSizekey01');
      itemSizekey02 = CommonFunc.getComponentRectOnScreen('itemSizekey02');
      itemSizekey03 = CommonFunc.getComponentRectOnScreen('itemSizekey03');
      console.info("After page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("After page turning , the itemSizekey02.left value is " + JSON.stringify(itemSizekey02.left));
      expect(itemSizekey.left).assertEqual(itemSizekey02.left);
      expect(itemSizekey.top).assertEqual(itemSizekey02.top);
      expect(itemSizekey.right).assertEqual(itemSizekey02.right);

      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperItemSize END');
      done();
    });

  })
}