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

export default function swiperItemPadding() {
  describe('swiperItemPadMarTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemPadding',
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
    //     * @tc.number    SUB_ACE_SWIPER_ITEMPADMARCHANGED_0100
    //     * @tc.name      testSwiperItemSetPadding.
    //     * @tc.desc      Set swiper's  first item's  padding value ' 20 '.
    //     */
    //    it('testSwiperItemSetPadding', 0, async  (done:Function)=> {
    //      console.info('new testSwiperItemSetPadding START');
    //      let strJson = getInspectorByKey('swiperItemPadding');
    //
    //      let swiperItemPadding:RectValue = CommonFunc.getComponentRect('swiperItemPadding');
    //      let swiperItemPadding01:RectValue = CommonFunc.getComponentRect('swiperItemPadding01');
    //      let swiperItemPadding02:RectValue = CommonFunc.getComponentRect('swiperItemPadding02');
    //      let swiperItemPadding03:RectValue = CommonFunc.getComponentRect('swiperItemPadding03');
    //      let swiperItemPadding04:RectValue = CommonFunc.getComponentRect('swiperItemPadding04');
    //      let swiperItemPadding05:RectValue = CommonFunc.getComponentRect('swiperItemPadding05');
    //      let swiperItemPadding06:RectValue = CommonFunc.getComponentRect('swiperItemPadding06');
    //      // Before flipping the page
    //      console.info("Before page turning, the swiperItemPadding.left value is " + JSON.stringify(swiperItemPadding.left));
    //      console.info("Before page turning,the swiperItemPadding01.left.left value is " + JSON.stringify(swiperItemPadding01.left));
    //      expect(swiperItemPadding.left).assertEqual(swiperItemPadding01.left);
    //      expect(swiperItemPadding.right).assertEqual(swiperItemPadding01.right);
    //      expect(swiperItemPadding.top).assertEqual(swiperItemPadding01.top);
    //      expect(swiperItemPadding.bottom).assertEqual(swiperItemPadding01.bottom);
    //      // Page turning.
    //      let driver = Driver.create();
    //      await driver.swipe(250, 230, 200, 230);
    //      await CommonFunc.sleep(1000);
    //      swiperItemPadding:RectValue = CommonFunc.getComponentRect('swiperItemPadding');
    //      swiperItemPadding01:RectValue = CommonFunc.getComponentRect('swiperItemPadding01');
    //      swiperItemPadding02:RectValue = CommonFunc.getComponentRect('swiperItemPadding02');
    //      swiperItemPadding03:RectValue = CommonFunc.getComponentRect('swiperItemPadding03');
    //      swiperItemPadding04:RectValue = CommonFunc.getComponentRect('swiperItemPadding04');
    //      swiperItemPadding05:RectValue = CommonFunc.getComponentRect('swiperItemPadding05');
    //      swiperItemPadding06:RectValue = CommonFunc.getComponentRect('swiperItemPadding06');
    //      // After flipping the page.
    //      console.info("After page turning, the swiperItemPadding.left value is " + JSON.stringify(swiperItemPadding.left));
    //      console.info("After page turning,the swiperItemPadding02.left.left value is " + JSON.stringify(swiperItemPadding02.left));
    //      expect(swiperItemPadding.left).assertEqual(swiperItemPadding02.left);
    //      expect(swiperItemPadding.right).assertEqual(swiperItemPadding02.right);
    //      expect(swiperItemPadding.top).assertEqual(swiperItemPadding02.top);
    //      expect(swiperItemPadding.bottom).assertEqual(swiperItemPadding02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwiperItemSetPadding END');
    //      done();
    //    });
  })
}