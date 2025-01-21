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
export default function swiperItemSize() {
  describe('swiperItemSizeTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemSize',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSize state success " + JSON.stringify(pages));
        if (!("swiperItemSize" == pages.name)) {
          console.info("get swiperItemSize state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperItemSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemSize page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSize after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_ITEMCHANGED_0100
     * @tc.name      testSwiperItemSize
     * @tc.desc      Set item's  height and width   values '150*150'.
     */
    it('testSwiperItemSize', 0, async function (done) {
      console.info('new testSwiperItemSize START');
      let strJson = getInspectorByKey('itemSizekey');
      let obj = JSON.parse(strJson);
      let itemSizekey = CommonFunc.getComponentRect('itemSizekey');
      let itemSizekey01 = CommonFunc.getComponentRect('itemSizekey01');
      let itemSizekey02 = CommonFunc.getComponentRect('itemSizekey02');
      let itemSizekey03 = CommonFunc.getComponentRect('itemSizekey03');
      // Before flipping the page.
      console.info("Before page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("Before page turning , the itemSizekey01.left value is " + JSON.stringify(itemSizekey01.left));
      expect(itemSizekey.left).assertEqual(itemSizekey01.left);
      expect(itemSizekey.top).assertEqual(itemSizekey01.top);
      expect(itemSizekey.right).assertEqual(itemSizekey01.right);

      // Flipping.
      let driver = await Driver.create();
      //await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(500);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);
      // After flipping the page.
      itemSizekey = CommonFunc.getComponentRect('itemSizekey');
      itemSizekey01 = CommonFunc.getComponentRect('itemSizekey01');
      itemSizekey02 = CommonFunc.getComponentRect('itemSizekey02');
      itemSizekey03 = CommonFunc.getComponentRect('itemSizekey03');
      console.info("After page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("After page turning , the itemSizekey02.left value is " + JSON.stringify(itemSizekey02.left));
      expect(itemSizekey.left).assertEqual(itemSizekey02.left);
      expect(itemSizekey.top).assertEqual(itemSizekey02.top);
      expect(itemSizekey.right).assertEqual(itemSizekey02.right);

      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.displayCount).assertEqual(1);
      console.info('new testSwiperItemSize END');
      done();
    });

  })
}