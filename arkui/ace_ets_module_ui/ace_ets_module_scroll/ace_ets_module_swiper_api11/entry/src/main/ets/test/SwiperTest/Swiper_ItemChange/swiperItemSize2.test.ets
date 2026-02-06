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

export default function swiperItemSize2() {
  describe('swiperItemSizeTest2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemSize2',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSize2 state success " + JSON.stringify(pages));
        if (!("swiperItemSize2" == pages.name)) {
          console.info("get swiperItemSize2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperItemSize2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemSize2 page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSize2 after each called");
    });


    //    /**
    //     * @tc.number    SUB_ACE_SWIPER_ITEMCHANGED_0100
    //     * @tc.name      testSwiperItemSizeExceed.
    //     * @tc.desc      Set item's  height and width   values '350*350'.
    //     */
    //    it('testSwiperItemSizeExceed2', Level.LEVEL1, async  (done:Function)=> {
    //      console.info('new testSwiperItemSizeExceed2 START');
    //      globalThis.value.message.notify({name:'index', value: 0});
    //      globalThis.value.message.notify({name:'height', value: 350});
    //      globalThis.value.message.notify({name:'width', value: 350});
    //      await CommonFunc.sleep(1000);
    //      let strJson = getInspectorByKey('itemSizekey2');
    //
    //      let itemSizekey2:RectValue = CommonFunc.getComponentRect('itemSizekey2');
    //      let itemSizekey2_01:RectValue = CommonFunc.getComponentRect('itemSizekey2_01');
    //      let itemSizekey2_02:RectValue = CommonFunc.getComponentRect('itemSizekey2_02');
    //      let itemSizekey2_03:RectValue = CommonFunc.getComponentRect('itemSizekey2_03');
    //      // Before flipping the page.
    //      console.info("Before page turning , the itemSizekey2.left value is " + JSON.stringify(itemSizekey2.left));
    //      console.info("Before page turning , the itemSizekey2_01.left value is " + JSON.stringify(itemSizekey2_01.left));
    //      expect(itemSizekey2.left).assertEqual(itemSizekey2_01.left);
    //      expect(itemSizekey2.right).assertEqual(itemSizekey2_01.right);
    //      expect(itemSizekey2.top).assertEqual(itemSizekey2_01.top);
    //      expect(itemSizekey2.bottom).assertEqual(itemSizekey2_01.bottom);
    //      // Flipping.
    //      let driver = Driver.create();
    //      //await driver.swipe(250, 230, 200, 230);
    //      await CommonFunc.sleep(500);
    //      await driver.swipe(vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //      await CommonFunc.sleep(1000);
    //      // After flipping the page.
    //      itemSizekey2:RectValue = CommonFunc.getComponentRect('itemSizekey2');
    //      itemSizekey2_01:RectValue = CommonFunc.getComponentRect('itemSizekey2_01');
    //      itemSizekey2_02:RectValue = CommonFunc.getComponentRect('itemSizekey2_02');
    //      itemSizekey2_03:RectValue = CommonFunc.getComponentRect('itemSizekey2_03');
    //      console.info("After page turning , the itemSizekey2.left value is " + JSON.stringify(itemSizekey2.left));
    //      console.info("After page turning , the itemSizekey2_02.left value is " + JSON.stringify(itemSizekey2_02.left));
    //      expect(itemSizekey2.left).assertEqual(itemSizekey2_02.left);
    //      expect(itemSizekey2.right).assertEqual(itemSizekey2_02.right);
    //      expect(itemSizekey2.top).assertEqual(itemSizekey2_02.top);
    //      expect(itemSizekey2.bottom).assertEqual(itemSizekey2_02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwiperItemSizeExceed2 END');
    //      done();
    //    });
  })
}