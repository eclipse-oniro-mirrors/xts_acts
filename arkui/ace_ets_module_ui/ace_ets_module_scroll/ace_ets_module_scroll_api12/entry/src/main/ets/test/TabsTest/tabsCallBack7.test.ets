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

export default function tabsCallBack7() {
  describe('tabsCallBack7', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack7 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack7",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack7 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack7" == pages.name)) {
          console.info("get tabsCallBack7 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack7 page error:" + err);
      }
      console.info("tabsCallBack7 beforeEach end");
      done();
    });

    /**
     * @tc.number    tabsCallBack7_001
     * @tc.name      tabsCallBack7_0100
     * @tc.desc      Set scrollable to false, sliding the page will not trigger a callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack7_0100', 0, async (done: Function) => {
      console.info('[tabsCallBack7_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('callback_gestureSwipe_7');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsCallBack7_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('tabs_onGestureSwipe_7');
      console.info("[tabsCallBack7_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[tabsCallBack7_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('111');
      let strJson2 = getInspectorByKey('tabs_callback_7');
      console.info("[tabsCallBack7_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[tabsCallBack7_0100] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('tabs: onWillShow1-');
      console.info('[tabsCallBack7_0100] END');
      done();
    });
  })
}
