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

export default function swiperItemPadMar() {
  describe('swiperItemPadMarTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemPadMar',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemPadMar state success " + JSON.stringify(pages));
        if (!("swiperItemPadMar" == pages.name)) {
          console.info("get swiperItemPadMar state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperItemPadMar page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push swiperItemPadMar page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'index', value: 0
      });
      globalThis.value.message.notify({
        name: 'margin', value: 0
      });
      globalThis.value.message.notify({
        name: 'padding', value: 0
      });
      console.info("swiperItemPadMar after each called");
    });

    //    /**
    //     * @tc.number    SUB_ACE_SWIPER_ITEMPADMARCHANGED_0300
    //     * @tc.name      testSwiperItemSetPaddingMargin.
    //     * @tc.desc      Set swiper's  first item's  margin and padding both values ' 20 '.
    //     */
    //    it('testSwiperItemSetPaddingMargin', 0, async  (done:Function)=> {
    //      console.info('new testSwiperItemSetPaddingMargin START');
    //      await CommonFunc.sleep(1000);
    //      let strJson = getInspectorByKey('swiperItemPadMar');
    //
    //      let swiperItemPadMar:RectValue = CommonFunc.getComponentRect('swiperItemPadMar');
    //      let swiperItemPadMar01:RectValue = CommonFunc.getComponentRect('swiperItemPadMar01');
    //      let swiperItemPadMar02:RectValue = CommonFunc.getComponentRect('swiperItemPadMar02');
    //      let swiperItemPadMar03:RectValue = CommonFunc.getComponentRect('swiperItemPadMar03');
    //      let swiperItemPadMar04:RectValue = CommonFunc.getComponentRect('swiperItemPadMar04');
    //      let swiperItemPadMar05:RectValue = CommonFunc.getComponentRect('swiperItemPadMar05');
    //      let swiperItemPadMar06:RectValue = CommonFunc.getComponentRect('swiperItemPadMar06');
    //      // Before flipping the page
    //      console.info("Before page turning , swiperItemPadMar01.left - swiperItemPadMar.left value is " + JSON.stringify(swiperItemPadMar01.left - swiperItemPadMar.left));
    //      expect(Math.round(swiperItemPadMar01.left - swiperItemPadMar.left)).assertEqual(vp2px(20));
    //      expect(Math.round(swiperItemPadMar.right - swiperItemPadMar01.right)).assertEqual(vp2px(20));
    //      expect(Math.round(swiperItemPadMar01.top - swiperItemPadMar.top)).assertEqual(vp2px(20));
    //      expect(Math.round(swiperItemPadMar.bottom - swiperItemPadMar01.bottom)).assertEqual(vp2px(20));
    //      // Page turning.
    //      let driver = Driver.create();
    //      await driver.swipe(250, 230, 200, 230);
    //      await CommonFunc.sleep(1000);
    //      swiperItemPadMar:RectValue = CommonFunc.getComponentRect('swiperItemPadMar');
    //      swiperItemPadMar01:RectValue = CommonFunc.getComponentRect('swiperItemPadMar01');
    //      swiperItemPadMar02:RectValue = CommonFunc.getComponentRect('swiperItemPadMar02');
    //      swiperItemPadMar03:RectValue = CommonFunc.getComponentRect('swiperItemPadMar03');
    //      swiperItemPadMar04:RectValue = CommonFunc.getComponentRect('swiperItemPadMar04');
    //      swiperItemPadMar05:RectValue = CommonFunc.getComponentRect('swiperItemPadMar05');
    //      swiperItemPadMar06:RectValue = CommonFunc.getComponentRect('swiperItemPadMar06');
    //      // After flipping the page.
    //      console.info("After page turning, the swiperItemPadMar.left value is " + JSON.stringify(swiperItemPadMar.left));
    //      console.info("After page turning,the swiperItemPadMar02.left.left value is " + JSON.stringify(swiperItemPadMar02.left));
    //      expect(swiperItemPadMar.left).assertEqual(swiperItemPadMar02.left);
    //      expect(swiperItemPadMar.right).assertEqual(swiperItemPadMar02.right);
    //      expect(swiperItemPadMar.top).assertEqual(swiperItemPadMar02.top);
    //      expect(swiperItemPadMar.bottom).assertEqual(swiperItemPadMar02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwiperItemSetPaddingMargin END');
    //      done();
    //    });
  })
}