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

export default function listSwipeAction43Jsunit() {
  describe('listSwipeAction43Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeAction43Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListItem_SwipeActionItem/listTest43"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeAction43Test  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest15 page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionTest15 after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset43'));
      await driverReset.delayMs(300);
      buttonReset.click();
      await CommonFunc.sleep(2000);
      done();

    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0430
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0430', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0430 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipe43Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0430] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(108)), Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // trigger the onFinish
      let driver2 = Driver.create();
      await CommonFunc.sleep(500);
      let button2 = await driver2.findComponent(ON.id('bt43'));
      await CommonFunc.sleep(300);
      button2.click();
      await CommonFunc.sleep(1500);

      // judge the onfinish
      let textSwipeState = getInspectorByKey('swipe43Finish');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0430 json is ' + JSON.stringify(JSON.parse(textSwipeState)
        .$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('value is 1');
      done();
    });


  })
}
