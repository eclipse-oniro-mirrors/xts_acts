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
export default function swiperItemSpace() {
  describe('swiperItemSpaceTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperItemSpace',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSpace state success " + JSON.stringify(pages));
        if (!("swiperItemSpace" == pages.name)) {
          console.info("get swiperItemSpace state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push swiperItemSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemSpace page error " + JSON.stringify(err));
      }
        done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSpace after each called");
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_ITEMSPACECHANGED_0100
     * @tc.name      testSwiperSetItemSpace
     * @tc.desc      Set swiper's  ItemSpace  value ' 20 '.
     */
    it('testSwiperSetItemSpace', 0, async function (done) {
      console.info('new testSwiperSetItemSpace START');
      globalThis.value.message.notify({name:'itemspace', value: 20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemspacekey');
      let obj = JSON.parse(strJson);
      let itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      let itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      let itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      let itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      let itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      let itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      let itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // Before flipping the page.
      console.info("Before page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("Before page turning , the itemspacekey01.left value is " + JSON.stringify(itemspacekey01.left));
      expect(itemspacekey.left).assertEqual(itemspacekey01.left)
      expect(itemspacekey.top).assertEqual(itemspacekey01.top)
      expect(itemspacekey.bottom).assertEqual(itemspacekey01.bottom)
      // Page turning.
      expect(itemspacekey.top).assertEqual(itemspacekey02.top)
      expect(itemspacekey.bottom).assertEqual(itemspacekey02.bottom)
      expect(Math.round(itemspacekey02.left - itemspacekey01.right)).assertEqual(vp2px(20))
      expect(itemspacekey.right).assertEqual(itemspacekey02.right)

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      //await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // After flipping the page.
      console.info("After page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("After page turning , the itemspacekey02.left value is " + JSON.stringify(itemspacekey02.left));
      expect(itemspacekey.left).assertEqual(itemspacekey02.left);
      expect(itemspacekey.top).assertEqual(itemspacekey02.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey02.bottom);

      expect(itemspacekey.top).assertEqual(itemspacekey03.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey03.bottom);
      expect(Math.round(itemspacekey03.left - itemspacekey02.right)).assertEqual(Math.round(vp2px(20)));
      expect(itemspacekey.right).assertEqual(itemspacekey03.right)
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.itemSpace).assertEqual('20.00vp');
      expect(obj.$attrs.displayCount).assertEqual(2);
      console.info('new testSwiperSetItemSpace END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SWIPER_ITEMSPACECHANGED_0200
     * @tc.name      testSwiperSetItemSpaceInvalid
     * @tc.desc      Set swiper's  ItemSpace  value ' -20 '.
     */
    it('testSwiperSetItemSpaceInvalid', 0, async function (done) {
      console.info('new testSwiperSetItemSpaceInvalid START');
      globalThis.value.message.notify({name:'itemspace', value: -20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemspacekey');
      let obj = JSON.parse(strJson);
      let itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      let itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      let itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      let itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      let itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      let itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      let itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // Before flipping the page.
      console.info("Before page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("Before page turning , the itemspacekey01.left value is " + JSON.stringify(itemspacekey01.left));
      expect(itemspacekey.left).assertEqual(itemspacekey01.left);
      expect(itemspacekey.top).assertEqual(itemspacekey01.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey01.bottom);

      expect(itemspacekey.top).assertEqual(itemspacekey02.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey02.bottom);
      expect(itemspacekey02.left).assertEqual(itemspacekey01.right);
      expect(itemspacekey02.right).assertEqual(itemspacekey.right);
      // After flipping the page.
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
     // await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');

      console.info("After page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("After page turning , the itemspacekey02.left value is " + JSON.stringify(itemspacekey02.left));
      expect(itemspacekey.left).assertEqual(itemspacekey02.left);
      expect(itemspacekey.top).assertEqual(itemspacekey02.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey02.bottom);

      expect(itemspacekey.top).assertEqual(itemspacekey03.top);
      expect(itemspacekey.bottom).assertEqual(itemspacekey03.bottom);
      expect(itemspacekey03.left).assertEqual(itemspacekey02.right);
      expect(itemspacekey03.right).assertEqual(itemspacekey.right);
      console.info("The type value is " + JSON.stringify(obj.$type));
      console.info("The loop value is " + JSON.stringify(obj.$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(obj.$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(obj.$attrs.displayCount));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.loop).assertEqual('true');
      expect(obj.$attrs.itemSpace).assertEqual('0.00vp');
      expect(obj.$attrs.displayCount).assertEqual(2);
      console.info('new testSwiperSetItemSpaceInvalid END');
      done();
    });
  })
}