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

export default function listSwipeActionJsunit() {
  describe('listSwipeActionTest', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeActionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeActionTest  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionTest after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset'));
      await CommonFunc.sleep(500);
      buttonReset.click();
      await CommonFunc.sleep(2000);
      done();

    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeAction0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(53)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeState');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0010 json is ' + JSON.stringify(JSON.parse(textSwipeState)
        .$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content == '0').assertFalse();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0020
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0020', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0020 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeAction0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0020] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(50)), Math.round(vp2px(108) + globalThis.winTop), Math.round(globalThis.winLeft + vp2px(300)), Math.round(vp2px(108) + globalThis.winTop)
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeState');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0020 json is ' + JSON.stringify(JSON.parse(textSwipeState)
        .$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('1');
      done();
    });


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0030
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0030', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0030 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeAction0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0030] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(50)), Math.round(vp2px(108) + globalThis.winTop), Math.round(globalThis.winLeft + vp2px(500)), Math.round(vp2px(108) + globalThis.winTop)
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeState');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0030 json is ' + JSON.stringify(JSON.parse(textSwipeState)
        .$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('2');
      done();
    });


  })
}
