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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function symbolTabs() {
  describe('symbolTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("symbolTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/symbolTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolTabs state pages:" + JSON.stringify(pages));
        if (!("symbolTabs" == pages.name)) {
          console.info("get symbolTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolTabs page error:" + err);
      }
      console.info("symbolTabs beforeEach end");
      done();
    });

    /**
     * @tc.number    symbolTabs_001
     * @tc.name      symbolTabs_0100
     * @tc.desc      The tab style of the tabs component
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('symbolTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[symbolTabs_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('tabs_normal_id');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("symbolTabs_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabs_symbol_mess');
      console.info("[symbolTabs_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[symbolTabs_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('symbol: Pink onWillHide');
      console.info('[symbolTabs_0100] END');
      done();
    });
  })
}
