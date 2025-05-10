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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindTabsScroll() {
  describe('bindTabsScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("bindTabsScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/bindTabsScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindTabsScroll state pages:" + JSON.stringify(pages));
        if (!("bindTabsScroll" == pages.name)) {
          console.info("get bindTabsScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push bindTabsScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindTabsScroll page error:" + err);
      }
      console.info("bindTabsScroll beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("bindTabsScroll after each called");
    });

    /**
     * @tc.number    bindTabsScroll_001
     * @tc.name      bindTabsScroll_0100
     * @tc.desc      When sliding components, it will trigger the display and hide animations of TabBar.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('bindTabsScroll_0100', 0, async (done: Function) => {
      console.info('[bindTabsScroll_0100] START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text01: Component = await driver.findComponent(ON.text("Top tab"))
      let textContent01:string = await text01.getText();
      expect(textContent01).assertEqual("Top tab");
      await CommonFunc.sleep(1000);
      let scrollTabs = CommonFunc.getComponentRectOnScreen('bind_tabsScroll');
      let top = scrollTabs.top;
      let right = scrollTabs.right;
      let left = scrollTabs.left;
      let bottom = scrollTabs.bottom;
      console.info("bindTabsScroll_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.2),Math.round(left + width/2),Math.round(top + height*0.8));
      await CommonFunc.sleep(6000);
      let text02: Component = await driver.findComponent(ON.text("nested_scroller"))
      let textContent02:string = await text02.getText();
      expect(textContent02).assertEqual("nested_scroller");
      await text02.click();
      console.info('[bindTabsScroll_0100] END');
      done();
    });
  })
}
