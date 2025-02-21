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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import { Driver, ON, On } from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';

export default function listSwipeActionEndJsunit() {
  describe('listSwipeActionEndTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("listSwipeActionEndTest beforeEach start");
      let options : router.RouterOptions = {
          url : "MainAbility/pages/List/ListItem_SwipeActionItem/listEndTest"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeActionEndTest success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(4000);
      } catch (err) {
        console.error("push listSwipeActionEndTest page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function)=> {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionEndTest after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btresetEnd'));
      await CommonFunc.sleep(200);
      buttonReset.click();
      await CommonFunc.sleep(2000);
      done();
     
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080', 0, async (done:Function)=> {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeActionEnd0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      //[15.00, 87.00][705.00,237.00]
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(240)), Math.round(globalThis.winTop + vp2px(108)), Math.round(globalThis.winLeft + vp2px(230)), Math.round(vp2px(108) + globalThis.winTop)
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0080 json is ' + JSON.stringify(JSON.parse(textSwipeState).$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content == '0').assertFalse();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090', 0, async (done:Function)=> {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeActionEnd0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem

      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(240)), Math.round(globalThis.winTop + vp2px(108)), Math.round( globalThis.winLeft + vp2px(100)), Math.round(globalThis.winTop + vp2px(108))
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0090 json is ' + JSON.stringify(JSON.parse(textSwipeState).$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('1');
      done();
    });


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100', 0, async (done:Function)=> {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipeActionEnd0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(108)), Math.round(globalThis.winLeft + vp2px(10)), Math.round(globalThis.winTop + vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipeStateEnd');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0100 json is ' + JSON.stringify(JSON.parse(textSwipeState).$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('2');
      done();
    });


  })
}
