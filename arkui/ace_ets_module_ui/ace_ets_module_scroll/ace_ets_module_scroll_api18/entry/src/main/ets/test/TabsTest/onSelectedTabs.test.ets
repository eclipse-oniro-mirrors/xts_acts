/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function onSelectedTabs() {
  describe('onSelectedTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectedTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/onSelectedTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectedTabs state pages:" + JSON.stringify(pages));
        if (!("onSelectedTabs" == pages.name)) {
          console.info("get onSelectedTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectedTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectedTabs page error:" + err);
      }
      console.info("onSelectedTabs beforeEach end");
      done();
    });

    /**
     * @tc.number    onSelectedTabs_001
     * @tc.name      onSelectedTabs_0100
     * @tc.desc      Trigger this callback when the selected element changes,
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('onSelectedTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[onSelectedTabs_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('tabs_onSelected');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("onSelectedTabs_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('selectedIndex_tabs_text');
      console.info("[onSelectedTabs_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[onSelectedTabs_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('selectedIndex: 1');

      let strJson2 = getInspectorByKey('onUnselected_tabs_text');
      console.info("[onSelectedTabs_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[onSelectedTabs_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('index: 0');
      console.info('[onSelectedTabs_0100] END');
      done();
    });
  })
}
