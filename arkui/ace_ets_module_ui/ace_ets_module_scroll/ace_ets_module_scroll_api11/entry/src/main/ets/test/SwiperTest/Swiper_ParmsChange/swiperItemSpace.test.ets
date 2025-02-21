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

import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function swiperItemSpace() {
  describe('swiperItemSpaceTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperItemSpace',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSpace state success " + JSON.stringify(pages));
        if (!("swiperItemSpace" == pages.name)) {
          console.info("get swiperItemSpace state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push swiperItemSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperItemSpace page error " + JSON.stringify(err));
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSpace after each called");
    });

    /**
     * @tc.number SUB_ACE_SWIPER_ITEMSPACECHANGED_0100
     * @tc.name testSwiperSetItemSpace
     * @tc.desc Set swiper's  ItemSpace  value ' 20 '.
     */
    it('testSwiperSetItemSpace', 0, async (done: Function) => {
      console.info('new testSwiperSetItemSpace START');
      globalThis.value.message.notify({
        name: 'itemspace', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemspacekey');

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
      expect(Math.abs(itemspacekey.left - itemspacekey01.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey01.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey01.bottom) <= 1).assertTrue();
      // Page turning.
      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(itemspacekey02.left - itemspacekey01.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.right - itemspacekey02.right) <= 1).assertTrue();

      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      // await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);

      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('itemspacekey')
      const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let x1 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`);
      let y1 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`);
      let x2 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`);
      let y2 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`);
      let time = (x1 - x2) / 0.5;
      let cmd = 'uinput -T -m ' + JSON.stringify(x1) + ' ' + JSON.stringify(y1) + ' ' + JSON.stringify(x2) + ' ' + JSON.stringify(y2) + ' ' + JSON.stringify(time);
      await delegator.executeShellCommand(cmd);

      await CommonFunc.sleep(3000);
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
      expect(Math.abs(itemspacekey.left - itemspacekey02.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();

      expect(Math.abs(itemspacekey.top - itemspacekey03.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey03.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(itemspacekey03.left - itemspacekey02.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.right - itemspacekey03.right) <= 1).assertTrue();
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('20.00vp');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(2);
      console.info('new testSwiperSetItemSpace END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SWIPER_ITEMSPACECHANGED_0200
     * @tc.name testSwiperSetItemSpaceInvalid
     * @tc.desc Set swiper's  ItemSpace  value ' -20 '.
     */
    it('testSwiperSetItemSpaceInvalid', 0, async (done: Function) => {
      console.info('new testSwiperSetItemSpaceInvalid START');
      globalThis.value.message.notify({
        name: 'itemspace', value: -20
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('itemspacekey');

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
      let driver = Driver.create();
     //  await CommonFunc.sleep(500);
     //  await driver.swipe(vp2px(180), vp2px(100), vp2px(20), vp2px(100));
     // // await driver.swipe(250, 230, 200, 230);
     //  await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);

      let gridRect:RectValue = CommonFunc.getComponentRectOnScreen('itemspacekey')
      const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let x1 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`);
      let y1 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`);
      let x2 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`);
      let y2 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`);
      let time = (x1 - x2) / 0.5;
      let cmd = 'uinput -T -m ' + JSON.stringify(x1) + ' ' + JSON.stringify(y1) + ' ' + JSON.stringify(x2) + ' ' + JSON.stringify(y2) + ' ' + JSON.stringify(time);
      await delegator.executeShellCommand(cmd);

      await CommonFunc.sleep(3000);
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
      console.info("The type value is " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      console.info("The itemSpace value is " + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace));
      console.info("The displayCount value is " + JSON.stringify(JSON.parse(strJson).$attrs.displayCount));
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.displayCount).assertEqual(2);
      console.info('new testSwiperSetItemSpaceInvalid END');
      done();
    });
  })
}