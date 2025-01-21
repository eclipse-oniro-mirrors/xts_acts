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

export default function swiperLoopTrue() {
  describe('swiperLoopTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperLoopTrue',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperLoopTrue state success " + JSON.stringify(pages));
        if (!("swiperLoopTrue" == pages.name)) {
          console.info("get swiperLoopTrue state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperLoopTrue page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperLoopTrue page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'swiperLoop', value: true
      });
      globalThis.value.message.notify({
        name: 'index', value: 0
      });
      console.info("swiperVertical after each called");
    });

    //    /**
    //     * @tc.number    SUB_ACE_SWIPER_LOOPCHANGED_0100
    //     * @tc.name      testSwiperSetLoopTrue
    //     * @tc.desc      Set swiper's  Loop  value ' true '.
    //     */
    //    it('testSwiperSetLoopTrue', 0, async  (done:Function)=> {
    //      console.info('new testSwiperSetLoopTrue START');
    //      await CommonFunc.sleep(1000);
    //      // Page turning.
    //      let driver = Driver.create();
    //      await CommonFunc.sleep(500);
    //      await driver.swipe(vp2px(150), vp2px(100), vp2px(100), vp2px(100));
    //      //await driver.swipe(250, 230, 200, 230);
    //      await CommonFunc.sleep(1000);
    //      let loopTrue:RectValue = CommonFunc.getComponentRect('loopTrue');
    //      let strJson = getInspectorByKey('loopTrue');
    //
    //      let loopTrue01:RectValue = CommonFunc.getComponentRect('loopTrue01');
    //      let loopTrue02:RectValue = CommonFunc.getComponentRect('loopTrue02');
    //      let loopTrue03:RectValue = CommonFunc.getComponentRect('loopTrue03');
    //      let loopTrue04:RectValue = CommonFunc.getComponentRect('loopTrue04');
    //      let loopTrue05:RectValue = CommonFunc.getComponentRect('loopTrue05');
    //      let loopTrue06:RectValue = CommonFunc.getComponentRect('loopTrue06');
    //      // After flipping the page
    //      console.info("After page turning , the loopTrue.left value is " + JSON.stringify(loopTrue.left));
    //      console.info("After page turning , the loopTrue02.left value is " + JSON.stringify(loopTrue02.left));
    //      expect(loopTrue.left).assertEqual(loopTrue02.left);
    //      expect(loopTrue.right).assertEqual(loopTrue02.right);
    //      expect(loopTrue.top).assertEqual(loopTrue02.top);
    //      expect(loopTrue.bottom).assertEqual(loopTrue02.bottom);
    //      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
    //      console.info("The index value is " + JSON.stringify(JSON.parse(strJson).$attrs.index));
    //      console.info("The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
    //      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
    //      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
    //      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
    //      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
    //      expect(JSON.parse(strJson).$attrs.index).assertEqual('1');
    //      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
    //      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
    //      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(1);
    //      console.info('new testSwiperSetLoopTrue END');
    //      done();
    //    });
  })
}