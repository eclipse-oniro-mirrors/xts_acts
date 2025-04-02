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

export default function listSwipeAction36Jsunit() {
  describe('listSwipeAction36Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeAction36Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest36"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeAction36Test  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error("push listTest36 page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeAction36Test after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset36'));
      await CommonFunc.sleep(200);
      buttonReset.click();
      await CommonFunc.sleep(3000);
      done();

    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      // swipe the listItem to bottom
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(100)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(120))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      expect(JSON.parse(textSwipeOffset).$attrs.content).assertEqual('0');
      // reset
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);

      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(200)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(180))
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(JSON.parse(textSwipeOffset2).$attrs.content).assertEqual('0')
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      // swipe the listItem to bottom

      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(100)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(200))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      // [15.00, 87.00][360.00,387.00]
      expect(JSON.parse(textSwipeOffset).$attrs.content).assertEqual('50')
      // reset
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(200)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + 0)
      );
      await CommonFunc.sleep(5000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);
      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(200)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(100))
      );
      await CommonFunc.sleep(4000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(JSON.parse(textSwipeOffset2).$attrs.content).assertEqual('-50')
      done();

    });

    /*
    * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      // swipe the listItem to bottom
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(100)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(450))
      );
      await CommonFunc.sleep(6000);

      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      // [15.00, 87.00][360.00,387.00]
      expect(JSON.parse(textSwipeOffset).$attrs.content).assertEqual(200 + "")
      // reset
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);
      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + vp2px(220)), Math.round(globalThis.winLeft + vp2px(115)), Math.round(globalThis.winTop + 0)
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(JSON.parse(textSwipeOffset2).$attrs.content).assertEqual(-200 + "");
      done();

    });


  })
}
