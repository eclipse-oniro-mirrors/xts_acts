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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function tabContentState() {
  describe('tabContentState', () => {
    beforeEach(async (done: Function) => {
      console.info("tabContentState beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/tabContentState",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabContentState state pages:" + JSON.stringify(pages));
        if (!("tabContentState" == pages.name)) {
          console.info("get tabContentState pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabContentState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabContentState page error:" + err);
      }
      console.info("tabContentState beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabContentState after each called");
    });

    /**
     * @tc.number    tabContentState_001
     * @tc.name      tabContentState_001
     * @tc.desc      TabContent state.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('tabContentState_001', Level.LEVEL0, async (done: Function) => {
      console.info('[tabContentState_001] START');
      await CommonFunc.sleep(1000);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabsId');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabContentState_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let btn: Component = await driver.findComponent(ON.id('observer_getState'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('tabs_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[tabContentState_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HideShow');
      console.info('[tabContentState_001] END');
      done();
    });
  })
}
