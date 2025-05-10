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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function tabIconJsunit() {
  describe('tabIconJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("tabIconJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabIcon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabIconJsunit state pages: " + JSON.stringify(pages));
        if (!("tabIcon" == pages.name)) {
          console.info("get tabIconJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabIconJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabIconJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_SCROLL_tabIconJsunit_0100
    * @tc.name: tabIconJsunit_0100
    * @tc.desc: Set the color of the Label icon when not selected and when selected.
    * @tc.level: Level 2
    * @tc.type:
    * @tc.size:
    */
    it('tabIconJsunit_0100', 0, async (done: Function) => {
      console.info('tabIconJsunit_0100 START');

      let strJson = getInspectorByKey('tabBar_iconStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tabIconJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[tabIconJsunit_0100] iconStyle: " + JSON.stringify(obj.$attrs.iconStyle));
      expect(obj.$attrs.tabBar.iconStyle.unselectedColor).assertEqual("#FFFF0000");
      expect(obj.$attrs.tabBar.iconStyle.selectedColor).assertEqual("#FF008000");
      console.info('[tabIconJsunit_0100] END');
      done();
    });
    /**
     * @tc.number: SUB_ACE_SCROLL_tabIconJsunit_0100
     * @tc.name: tabIconJsunit_0200
     * @tc.desc: Trigger onWillShow and onWillHide callbacks
     * @tc.level: Level 2
     * @tc.type:
     * @tc.size:
     */
    it('tabIconJsunit_0200', 0, async (done: Function) => {
      console.info('tabIconJsunit_0200 START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabs_iconStyle');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabIconJsunit_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('tabIcon_mess1');
      let strJson1 = getInspectorByKey('tabIcon_mess2');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabIconJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[tabIconJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual('onWillHide');
      expect(obj1.$attrs.content).assertEqual('onWillShow');
      console.info('[tabIconJsunit_0200] END');
      done();
    });
  })
}

