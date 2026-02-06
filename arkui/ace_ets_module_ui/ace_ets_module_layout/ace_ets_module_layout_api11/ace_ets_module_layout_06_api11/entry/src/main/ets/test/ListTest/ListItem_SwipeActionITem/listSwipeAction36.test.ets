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
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360 value is" + left + " --" + right + "--" + top + "--" + bottom);
      // swipe the listItem to bottom
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(10)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(20))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0340 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset).$attrs.content)))<=1).assertTrue();
      // reset
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);

      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(100)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(90))
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0360 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset2).$attrs.content)))<=1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 value is" + left + " --" + right + "--" + top + "--" + bottom);
      // swipe the listItem to bottom

      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(10)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(50))
      );
      await CommonFunc.sleep(5000);
      // judge the swipeActionOffset
      let textSwipeOffset = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' + JSON.stringify(JSON.parse(textSwipeOffset)
        .$attrs.content));
      let Swipe36Action_swipe: RectValue = CommonFunc.getComponentRect('lSwipe36Row');
      let swipe_height = Swipe36Action_swipe.bottom - Swipe36Action_swipe.top;
      console.info('36 0380 json' + Math.round(px2vp(swipe_height)));
      // [15.00, 87.00][360.00,387.00]
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset).$attrs.content))-Math.round(px2vp(swipe_height)))<=1).assertTrue();
      // reset
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(50)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(10))
      );
      await CommonFunc.sleep(5000);
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);
      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(50)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(10))
      );
      await CommonFunc.sleep(4000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0380 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs.content));
      let Swipe36Action_swipe2: RectValue = CommonFunc.getComponentRect('lSwipe36Row2');
      let swipe_height2 = Swipe36Action_swipe2.bottom - Swipe36Action_swipe2.top;
      console.info('36 0380 json' + Math.round(px2vp(swipe_height2)));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset2).$attrs.content))-(-Math.round(px2vp(swipe_height2))))<=1).assertTrue();
      // reset
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(10)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(50))
      );
      await CommonFunc.sleep(2000);
      done();

    });

    /*
    * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390
    * @tc.name   : when swipe,then return the init position
    * @tc.desc   : test the onStateChange function parameter state
    */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lSwipe36Action0');

      console.info("[SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390] current component obj is: " + JSON.stringify(JSON.parse(strJson)));

      let ListItem_00: RectValue = CommonFunc.getComponentRect('lSwipe36Action0');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 value is" + left + " --" + right + "--" + top + "--" + bottom);
      // swipe to collapse state
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(10)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(20))
      );
      await CommonFunc.sleep(4000);
      // judge the swipeActionOffset
      let textSwipeOffset0 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' + JSON.stringify(JSON.parse(textSwipeOffset0)
        .$attrs));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset0).$attrs.content)))<=1).assertTrue();

      // swipe the listItem to bottom
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + top + vp2px(2)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + bottom - vp2px(2))
      );
      await CommonFunc.sleep(6000);

      // judge the swipeActionOffset
      let textSwipeOffset1 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' + JSON.stringify(JSON.parse(textSwipeOffset1)
        .$attrs.content));
      console.info('36 0380 json' + Math.round(px2vp(height)));
      // [15.00, 87.00][360.00,387.00]
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset1).$attrs.content))-Math.round(px2vp(height)))<=1).assertTrue();
      // reset
      let buttonReset2 = await driver.findComponent(ON.id('btreset36'));
      await driver.delayMs(300);
      buttonReset2.click();
      await CommonFunc.sleep(3000);
      // swipe to up
      await driver.swipe(
        Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop + bottom - vp2px(2)), Math.round(globalThis.winLeft + left + width/2), Math.round(globalThis.winTop  + top + vp2px(2))
      );
      await CommonFunc.sleep(5000);
      let textSwipeOffset2 = getInspectorByKey('swipe36Offset');
      console.info('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_STATECHAGE_0390 json is ' + JSON.stringify(JSON.parse(textSwipeOffset2)
        .$attrs.content));
      console.info('36 0380 json' + Math.round(px2vp(height)));
      expect(Math.abs(Math.round(Number(JSON.parse(textSwipeOffset2).$attrs.content))-(-Math.round(px2vp(height))))<=1).assertTrue();
      done();

    });


  })
}
