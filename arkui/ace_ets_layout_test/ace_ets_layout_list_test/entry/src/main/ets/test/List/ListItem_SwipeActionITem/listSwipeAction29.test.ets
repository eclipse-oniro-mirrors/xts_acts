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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import { Driver, ON, On } from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';

export default function listSwipeAction29Jsunit() {
  describe('listSwipeAction29Test', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("listSwipeAction29Test beforeEach start");
      let options : router.RouterOptions = {
          url : "MainAbility/pages/List/ListItem_SwipeActionItem/listTest29"
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

    afterEach(async function(done) {
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
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290', 0, async (done:Function)=> {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipe29Action0');
      let obj = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290] current component obj is: " + JSON.stringify(obj));
      // swipe the listItem to right
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(60)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe29Offset');
      let textString = JSON.parse(textSwipeOffset);
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 json is ' + JSON.stringify(textString.$attrs));
      expect(textString.$attrs.content).assertEqual('0');
      // reset
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(500)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      let buttonReset = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset.click();
      await CommonFunc.sleep(3000);

      // swipe to left
      await driver.swipe(
        Math.round(vp2px(240)), Math.round(vp2px(108)), Math.round(vp2px(230)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(4000);
      let textSwipeOffset2 = getInspectorByKey('swipe29Offset');
      let textString2 = JSON.parse(textSwipeOffset2);
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0290 json is ' + JSON.stringify(textString.$attrs));
      expect(textString2.$attrs.content).assertEqual('0');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310
     * @tc.name   : when swipe,then return the init position
     * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310', 0, async (done:Function)=> {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe29Action0');
      let obj = JSON.parse(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310] current component obj is: " + JSON.stringify(obj));

      let strJsonR = getInspectorByKey('lSwipe29Row');
      let objR = JSON.parse(strJsonR );
      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310R] current component obj is: " + JSON.stringify(objR.$attrs.width));

      // swipe the listItem to right
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(300)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe29Offset');
      let textString = JSON.parse(textSwipeOffset);
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.stringify(textString.$attrs));
      expect(textString.$attrs.content).assertEqual('160')
      // reset
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(108)), Math.round(vp2px(500)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset29'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(4000);

      // swipe to left
      await driver.swipe(
        Math.round(vp2px(300)), Math.round(vp2px(108)), Math.round(vp2px(100)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe29Offset');
      let textString2 = JSON.parse(textSwipeOffset2);
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0310 json is ' + JSON.stringify(textString2.$attrs));
      expect(textString2.$attrs.content).assertEqual('-160');
      // init reset the state
      await driver.swipe(
        Math.round(vp2px(240)), Math.round(vp2px(108)), Math.round(vp2px(-1000)), Math.round(vp2px(108))
      );
      await CommonFunc.sleep(5000);
      done();
    });

    
  })
}
