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


import router from '@ohos.router';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON, On } from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';

export default function listSwipeAction29Jsunit() {
  describe('listSwipeAction29Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeAction29Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest29"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeAction29Test  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error("push listTest29 page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeAction29Test after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset29'));
      await CommonFunc.sleep(300);
      buttonReset.click();
      await CommonFunc.sleep(3000);
      done();
    });


    /*
   * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290
   * @tc.name   : when swipe,then return the init position
   * @tc.desc   : test the onStateChange function parameter state
   */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipe29Action0');
      let Swipe29Action: RectValue = CommonFunc.getComponentRect('lSwipe29Action0');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      let right: number = Swipe29Action.right;
      let left: number = Swipe29Action.left;
      let top: number = Swipe29Action.top;
      let bottom: number = Swipe29Action.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 value is" + left + " --" + right + "--" + top + "--" + bottom);
      // swipe the listItem to right
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(50)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(62)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset).$attrs.content)))<=1).assertTrue();
      await CommonFunc.sleep(5000);
      let buttonReset = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset.click();
      await CommonFunc.sleep(3000);
      // swipe to left
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(100)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(88)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(4000);
      let textSwipeOffset2 = getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset2).$attrs.content)))<=1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe29Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      let Swipe29Action: RectValue = CommonFunc.getComponentRect('lSwipe29Action0');
      let right: number = Swipe29Action.right;
      let left: number = Swipe29Action.left;
      let top: number = Swipe29Action.top;
      let bottom: number = Swipe29Action.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let strJsonR = getInspectorByKey('lSwipe29Row');
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310R] current component obj is: " + JSON.stringify(JSON.parse(strJsonR)
        .$attrs
        .width));

      // swipe the listItem to right
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(5)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(100)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs.content));
      let Swipe29Action_swipe: RectValue = CommonFunc.getComponentRect('lSwipe29Row');
      let swipe_width = Swipe29Action_swipe.right - Swipe29Action_swipe.left;
      console.info('29 0310 json' + Math.round(px2vp(swipe_width)));
      
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset).$attrs.content))-Math.round(px2vp(swipe_width)))<=1).assertTrue();
      // reset
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(2)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(230)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(5000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(4000);

      // swipe to left
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(100)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(5)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe29Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs.content));
      console.info('29 0310 json' + Math.round(px2vp(swipe_width)));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset2).$attrs.content))-(-Math.round(px2vp(swipe_width))))<=1).assertTrue();
      // init reset the state
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(230)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(2)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(5000);
      done();
    });


  })
}
