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

export default function tabsCallBack4() {
  describe('tabsCallBack4', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack4 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack4" == pages.name)) {
          console.info("get tabsCallBack4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack4 page error:" + err);
      }
      console.info("tabsCallBack4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack4 after each called");
    });

    /**
     * @tc.number    tabsCallBack4_001
     * @tc.name      tabsCallBack4_0100
     * @tc.desc      Swipe to switch pages and trigger callbacks.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack4_0100', 0, async (done: Function) => {
      console.info('[tabsCallBack4_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabs_swipe_callback');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsCallBack4_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabs_callback_4');
      console.info("[tabsCallBack4_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsCallBack4_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('tabs: onWillShow1-onContentWillChange-onWillShow2-onWillHide1-onAnimationStart-onChange-');
      console.info('[tabsCallBack4_0100] END');
      done();
    });
  })
}
