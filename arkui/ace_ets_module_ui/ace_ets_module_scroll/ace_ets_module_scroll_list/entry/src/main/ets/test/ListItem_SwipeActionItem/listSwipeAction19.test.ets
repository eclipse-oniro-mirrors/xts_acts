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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import { Driver, ON, On } from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function listSwipeAction19Jsunit() {
  describe('listSwipeAction19Test', () => {
    beforeAll(async (done: Function) => {
      console.info("listSwipeAction19Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItem_SwipeActionItem/listTest19"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("listSwipeAction19Test  success pages " + JSON.stringify(pages));
        router.pushUrl(options)
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.error("push listTest19 page error: " + err);
      }
      done();
    });

    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("listSwipeActionTest19 after each called");
      // reset the init state
      let driverReset = Driver.create();
      await CommonFunc.sleep(500);
      let buttonReset = await driverReset.findComponent(ON.id('btreset19'));
      await CommonFunc.sleep(300);
      buttonReset.click();
      await CommonFunc.sleep(2000);
      done();

    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190
     * @tc.desc   test the onStateChange function parameter state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190',  Level.LEVEL3, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190 driver' + driver);
      await CommonFunc.sleep(500);
      // get the rect of listItem
      let strJson = getInspectorByKey('lSwipe19Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
      // swipe the listItem
      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe19Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190 value is" + left + " --" + right + "--" + top + "--" + bottom);
      // swipe the listItem
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(50)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(150))
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionState
      let textSwipeState = getInspectorByKey('swipe19State');

      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0190 json is ' + JSON.stringify(JSON.parse(textSwipeState)
        .$attrs));
      expect(JSON.parse(textSwipeState).$attrs.content).assertEqual('1')
      done();
    });

  })
}
