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
export default function swiperItemMargin() {
  describe('swiperItemPadMarTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemPadMar state success " + JSON.stringify(pages));
        if (!("swiperItemPadMar" == pages.name)) {
          console.info("get swiperItemPadMar state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperItemPadMar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemPadMar page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'index', value: 0});
      globalThis.value.message.notify({name:'margin', value: 0});
      globalThis.value.message.notify({name:'padding', value: 0});
      console.info("swiperItemPadMar after each called");
    });

//    /**
//     * @tc.number    SUB_ACE_SWIPER_ITEMPADMARCHANGED_0200
//     * @tc.name      testSwiperItemSetMargin.
//     * @tc.desc      Set swiper's  first item's  margin value ' 20 '.
//     */
//    it('testSwiperItemSetMargin', 0, async function (done) {
//      console.info('new testSwiperItemSetMargin START');
//      let strJson = getInspectorByKey('swiperItemMargin');
//      let obj = JSON.parse(strJson);
//      let swiperItemMargin = CommonFunc.getComponentRect('swiperItemMargin');
//      let swiperItemMargin01 = CommonFunc.getComponentRect('swiperItemMargin01');
//      let swiperItemMargin02 = CommonFunc.getComponentRect('swiperItemMargin02');
//      let swiperItemMargin03 = CommonFunc.getComponentRect('swiperItemMargin03');
//      let swiperItemMargin04 = CommonFunc.getComponentRect('swiperItemMargin04');
//      let swiperItemMargin05 = CommonFunc.getComponentRect('swiperItemMargin05');
//      let swiperItemMargin06 = CommonFunc.getComponentRect('swiperItemMargin06');
//      // Before flipping the page
//      console.info("Before page turningsizepmkey01.left - swiperItemMargin.left value is " + JSON.stringify(swiperItemMargin01.left - swiperItemMargin.left));
//      expect(Math.round(swiperItemMargin01.left - swiperItemMargin.left)).assertEqual(vp2px(20));
//      expect(Math.round(swiperItemMargin.right - swiperItemMargin01.right)).assertEqual(vp2px(20));
//      expect(Math.round(swiperItemMargin01.top - swiperItemMargin.top)).assertEqual(vp2px(20));
//      expect(Math.round(swiperItemMargin.bottom - swiperItemMargin01.bottom)).assertEqual(vp2px(20));
//      // Page turning.
//      let driver = await Driver.create();
//      await driver.swipe(250, 230, 200, 230);
//      await CommonFunc.sleep(1000);
//      swiperItemMargin = CommonFunc.getComponentRect('swiperItemMargin');
//      swiperItemMargin01 = CommonFunc.getComponentRect('swiperItemMargin01');
//      swiperItemMargin02 = CommonFunc.getComponentRect('swiperItemMargin02');
//      swiperItemMargin03 = CommonFunc.getComponentRect('swiperItemMargin03');
//      swiperItemMargin04 = CommonFunc.getComponentRect('swiperItemMargin04');
//      swiperItemMargin05 = CommonFunc.getComponentRect('swiperItemMargin05');
//      swiperItemMargin06 = CommonFunc.getComponentRect('swiperItemMargin06');
//      // After flipping the page.
//      console.info("After page turning, the swiperItemMargin.left value is " + JSON.stringify(swiperItemMargin.left));
//      console.info("After page turning,the swiperItemMargin02.left.left value is " + JSON.stringify(swiperItemMargin02.left));
//      expect(swiperItemMargin.left).assertEqual(swiperItemMargin02.left);
//      expect(swiperItemMargin.right).assertEqual(swiperItemMargin02.right);
//      expect(swiperItemMargin.top).assertEqual(swiperItemMargin02.top);
//      expect(swiperItemMargin.bottom).assertEqual(swiperItemMargin02.bottom);
//      console.info("The type value is " + JSON.stringify(obj.$type));
//      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
//      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
//      expect(obj.$type).assertEqual('Swiper');
//      expect(obj.$attrs.loop).assertEqual('true');
//      expect(obj.$attrs.displayCount).assertEqual(1);
//      console.info('new testSwiperItemSetMargin END');
//      done();
//    });
  })
}