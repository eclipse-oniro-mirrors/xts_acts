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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsTransition() {
  describe('tabsTransition', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsTransition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsTransition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsTransition state pages:" + JSON.stringify(pages));
        if (!("tabsTransition" == pages.name)) {
          console.info("get tabsTransition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsTransition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsTransition page error:" + err);
      }
      console.info("tabsTransition beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack3 after each called");
    });

    /**
     * @tc.number    tabsTransition_001
     * @tc.name      tabsTransition_0100
     * @tc.desc      Finger sliding can not trigger customContentTransition.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsTransition_0100', 0, async (done: Function) => {
      console.info('[tabsTransition_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('callback_tabs_tran');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsTransition_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabs_callback_tran');
      console.info("[tabsTransition_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsTransition_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('111');
      console.info('[tabsTransition_0100] END');
      done();
    });

    /**
     * @tc.number    tabsTransition_0200
     * @tc.name      tabsTransition_0200
     * @tc.desc      Clicking on the index to trigger the onTabBarClick event.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsTransition_0200', 0, async (done: Function) => {
      console.info('[tabsTransition_0200] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('3'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('tabs_tran_mes');
      console.info("[tabsTransition_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsTransition_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('tabs: onTabBarClick-');
      console.info('[tabsTransition_0200] END');
      done();
    });

  })
}
