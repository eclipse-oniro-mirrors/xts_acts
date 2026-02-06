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

export default function iconTabs() {
  describe('iconTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("iconTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/iconTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get iconTabs state pages:" + JSON.stringify(pages));
        if (!("iconTabs" == pages.name)) {
          console.info("get iconTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push iconTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push iconTabs page error:" + err);
      }
      console.info("iconTabs beforeEach end");
      done();
    });

    /**
     * @tc.name   iconTabs_0100
     * @tc.number iconTabs_001
     * @tc.desc   Set the image and text content in the Tabs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('iconTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[iconTabs_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('tabs_icon_text');
      console.info("[iconTabs_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[iconTabs_0100] Tabs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[iconTabs_0100] cachedMaxCount2: " + JSON.stringify(JSON.parse(strJson).$attrs.cachedMaxCount));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.cachedMaxCount.count).assertEqual(2);
      expect(JSON.parse(strJson).$attrs.cachedMaxCount.mode).assertEqual("TabsCacheMode.CACHE_BOTH_SIDE");

      let strJson2 = getInspectorByKey('green_icon_text');
      console.info("[iconTabs_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[iconTabs_0100] TabContent: " + JSON.stringify(JSON.parse(strJson2).$attrs));
      console.info("[iconTabs_0100] text: " + JSON.stringify(JSON.parse(strJson2).$attrs.text));
      console.info("[iconTabs_0100] tabBar: " + JSON.stringify(JSON.parse(strJson2).$attrs.tabBar));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson2).$type).assertEqual('TabContent');
      expect(JSON.parse(strJson2).$attrs.text).assertEqual('green');

      let btn: Component = await driver.findComponent(ON.id('cachedMaxCount_tabs_switched'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('tabs_icon_text');
      console.info("[iconTabs_0100] component obj3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs));
      console.info("[iconTabs_0100] cachedMaxCount2: " + JSON.stringify(JSON.parse(strJson3).$attrs.cachedMaxCount));
      expect(JSON.parse(strJson3).$attrs.cachedMaxCount.count).assertEqual(2);
      expect(JSON.parse(strJson3).$attrs.cachedMaxCount.mode).assertEqual("TabsCacheMode.CACHE_LATEST_SWITCHED");

      console.info('[iconTabs_0100] END');
      done();
    });
  })
}
