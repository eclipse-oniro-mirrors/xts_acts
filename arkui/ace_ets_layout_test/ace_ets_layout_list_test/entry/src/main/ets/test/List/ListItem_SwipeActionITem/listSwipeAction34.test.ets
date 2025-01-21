/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function listSwipeAction34Jsunit() {
  describe('listSwipeAction34Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeAction34Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest34"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeAction34Test  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest29 page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeAction34Test after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset34'));
      await CommonFunc.sleep(200);
      buttonReset.click();
      await CommonFunc.sleep(2000);
      done();

    });

    /*
    * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe34Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      // swipe the listItem to right
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(300)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe34Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      expect(JSON.parse(textSwipeOffset).$attrs.content).assertEqual('160')
      // reset
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(2000)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(6500);
      let buttonReset2 = await driver.findComponent(ON.id('btreset34'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);

      // swipe to left
      await driver.swipe(
        Math.round(vp2px(240)), Math.round(vp2px(108)), Math.round(vp2px(100)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe34Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(JSON.parse(textSwipeOffset2).$attrs.content).assertEqual('-160')
      // reset init the state
      await driver.swipe(
        Math.round(vp2px(240)), Math.round(vp2px(108)), Math.round(vp2px(-1000)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0350
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0350', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0350 START');
      await CommonFunc.sleep(1000);
      let driver35 = Driver.create();
      await CommonFunc.sleep(500);
      // swipe the listItem to right
      await driver35.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(3000)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe34Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0350 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      // [15.00, 87.00][705.00,237.00]
      expect(JSON.parse(textSwipeOffset).$attrs.content).assertEqual(460 + "")
      // reset

      let buttonReset2 = await driver35.findComponent(ON.id('btreset34'));
      await CommonFunc.sleep(200);
      buttonReset2.click();
      await CommonFunc.sleep(3000);
      // swipe to left
      await driver35.swipe(
        Math.round(vp2px(300)), Math.round(vp2px(108)), Math.round(vp2px(5)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(8000);
      let textSwipeOffset2 = getInspectorByKey('swipe34Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0350 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(JSON.parse(textSwipeOffset2).$attrs.content).assertEqual(-460 + '')
      done();

    });


  })
}
