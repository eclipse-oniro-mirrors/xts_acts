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
export default function swiperLoopTrue() {
  describe('swiperLoopTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperLoopTrue',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperLoopTrue state success " + JSON.stringify(pages));
        if (!("swiperLoopTrue" == pages.name)) {
          console.info("get swiperLoopTrue state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperLoopTrue page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperLoopTrue page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'swiperLoop', value: true});
      globalThis.value.message.notify({name:'index', value: 0});
      console.info("swiperVertical after each called");
    });

//    /**
//     * @tc.number    SUB_ACE_SWIPER_LOOPCHANGED_0100
//     * @tc.name      testSwiperSetLoopTrue
//     * @tc.desc      Set swiper's  Loop  value ' true '.
//     */
//    it('testSwiperSetLoopTrue', 0, async function (done) {
//      console.info('new testSwiperSetLoopTrue START');
//      await CommonFunc.sleep(1000);
//      // Page turning.
//      let driver = await Driver.create();
//      await CommonFunc.sleep(500);
//      await driver.swipe(vp2px(150), vp2px(100), vp2px(100), vp2px(100));
//      //await driver.swipe(250, 230, 200, 230);
//      await CommonFunc.sleep(1000);
//      let loopTrue = CommonFunc.getComponentRect('loopTrue');
//      let strJson = getInspectorByKey('loopTrue');
//      let obj = JSON.parse(strJson);
//      let loopTrue01 = CommonFunc.getComponentRect('loopTrue01');
//      let loopTrue02 = CommonFunc.getComponentRect('loopTrue02');
//      let loopTrue03 = CommonFunc.getComponentRect('loopTrue03');
//      let loopTrue04 = CommonFunc.getComponentRect('loopTrue04');
//      let loopTrue05 = CommonFunc.getComponentRect('loopTrue05');
//      let loopTrue06 = CommonFunc.getComponentRect('loopTrue06');
//      // After flipping the page
//      console.info("After page turning , the loopTrue.left value is " + JSON.stringify(loopTrue.left));
//      console.info("After page turning , the loopTrue02.left value is " + JSON.stringify(loopTrue02.left));
//      expect(loopTrue.left).assertEqual(loopTrue02.left);
//      expect(loopTrue.right).assertEqual(loopTrue02.right);
//      expect(loopTrue.top).assertEqual(loopTrue02.top);
//      expect(loopTrue.bottom).assertEqual(loopTrue02.bottom);
//      console.info("The type value is " + JSON.stringify(obj.$type));
//      console.info("The index value is " + JSON.stringify(obj.$attrs.index));
//      console.info("The autoPlay value is " + JSON.stringify(obj.$attrs.autoPlay));
//      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
//      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
//      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
//      expect(obj.$type).assertEqual('Swiper');
//      expect(obj.$attrs.index).assertEqual('1');
//      expect(obj.$attrs.autoPlay).assertEqual('true');
//      expect(obj.$attrs.loop).assertEqual('true');
//      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
//      expect(obj.$attrs.displayCount).assertEqual(1);
//      console.info('new testSwiperSetLoopTrue END');
//      done();
//    });
  })
}