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

export default function swiperVertical() {
  describe('swiperVerticalTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperVertical',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperVertical state success " + JSON.stringify(pages));
        if (!("swiperVertical" == pages.name)) {
          console.info("get swiperVertical state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperVertical page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperVertical page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'swiperVertical', value: false
      });
      console.info("swiperVertical after each called");
    });

    //    /**
    //     * @tc.number    SUB_ACE_SWIPER_VERTICALCHANGED_0100
    //     * @tc.name      testSwipeSetVerticalFalse
    //     * @tc.desc      Set swiper's  vertical  value ' false '.
    //     */
    //    it('testSwipeSetVerticalFalse', 0, async  (done:Function)=> {
    //      console.info('new testSwipeSetVerticalFalse START');
    //      let strJson = getInspectorByKey('verticalkey');
    //
    //      let verticalkey:RectValue = CommonFunc.getComponentRect('verticalkey');
    //      let verticalkey01:RectValue = CommonFunc.getComponentRect('verticalkey01');
    //      let verticalkey02:RectValue = CommonFunc.getComponentRect('verticalkey02');
    //      // Before flipping the page.
    //      console.info("Before page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //      console.info("Before page turning , the verticalkey01.left value is " + JSON.stringify(verticalkey01.left));
    //      expect(verticalkey.left).assertEqual(verticalkey01.left);
    //      expect(verticalkey.right).assertEqual(verticalkey01.right);
    //      expect(verticalkey.top).assertEqual(verticalkey01.top);
    //      expect(verticalkey.bottom).assertEqual(verticalkey01.bottom);
    //      // Page turning.
    //      let driver = Driver.create();
    //      await CommonFunc.sleep(500);
    //      await driver.swipe(vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //      //await driver.swipe(250, 230, 200, 230);
    //      await CommonFunc.sleep(1000);
    //      verticalkey01:RectValue = CommonFunc.getComponentRect('verticalkey01');
    //      verticalkey02:RectValue = CommonFunc.getComponentRect('verticalkey02');
    //      // After flipping the page.
    //      console.info("After page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //      console.info("After page turning , the verticalkey02.left value is " + JSON.stringify(verticalkey02.left));
    //      expect(verticalkey.left).assertEqual(verticalkey02.left);
    //      expect(verticalkey.right).assertEqual(verticalkey02.right);
    //      expect(verticalkey.top).assertEqual(verticalkey02.top);
    //      expect(verticalkey.bottom).assertEqual(verticalkey02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The index value is " + JSON.stringify(JSON.parse(strJson).$attrs.index));
    //      console.info("The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
    //      console.info("The vertical value is " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.index).assertEqual('0');
    //      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('false');
    //      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('false');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwipeSetVerticalFalse END');
    //      done();
    //    });
    //
    //    /**
    //     * @tc.number    SUB_ACE_SWIPER_VERTICALCHANGED_0200
    //     * @tc.name      testSwipeSetVerticalTrue
    //     * @tc.desc      Set swiper's  vertical  value ' true '.
    //     */
    //    it('testSwipeSetVerticalTrue', 0, async  (done:Function)=> {
    //      console.info('new testSwipeSetVerticalTrue START');
    //      globalThis.value.message.notify({name:'swiperVertical', value: true});
    //      await CommonFunc.sleep(1000);
    //      let strJson = getInspectorByKey('verticalkey');
    //
    //      let verticalkey:RectValue = CommonFunc.getComponentRect('verticalkey');
    //      let verticalkey01:RectValue = CommonFunc.getComponentRect('verticalkey01');
    //      let verticalkey02:RectValue = CommonFunc.getComponentRect('verticalkey02');
    //      // Before flipping the page.
    //      console.info("Before page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //      console.info("Before page turning , the verticalkey01.left value is " + JSON.stringify(verticalkey01.left));
    //      expect(verticalkey.left).assertEqual(verticalkey01.left);
    //      expect(verticalkey.right).assertEqual(verticalkey01.right);
    //      expect(verticalkey.top).assertEqual(verticalkey01.top);
    //      expect(verticalkey.bottom).assertEqual(verticalkey01.bottom);
    //      // Page turning.
    //      let driver = Driver.create();
    //      await CommonFunc.sleep(500);
    //      await driver.swipe(vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //      //await driver.swipe(230, 250, 230, 200);
    //      await CommonFunc.sleep(1000);
    //      verticalkey01:RectValue = CommonFunc.getComponentRect('verticalkey01');
    //      verticalkey02:RectValue = CommonFunc.getComponentRect('verticalkey02');
    //      // After flipping the page.
    //      console.info("After page turning , the verticalkey.left value is " + JSON.stringify(verticalkey.left));
    //      console.info("After page turning , the verticalkey02.left value is " + JSON.stringify(verticalkey02.left));
    //      expect(verticalkey.left).assertEqual(verticalkey02.left);
    //      expect(verticalkey.right).assertEqual(verticalkey02.right);
    //      expect(verticalkey.top).assertEqual(verticalkey02.top);
    //      expect(verticalkey.bottom).assertEqual(verticalkey02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The index value is " + JSON.stringify(JSON.parse(strJson).$attrs.index));
    //      console.info("The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
    //      console.info("The vertical value is " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.index).assertEqual('0');
    //      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('false');
    //      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwipeSetVerticalTrue END');
    //      done();
    //    });
  })
}