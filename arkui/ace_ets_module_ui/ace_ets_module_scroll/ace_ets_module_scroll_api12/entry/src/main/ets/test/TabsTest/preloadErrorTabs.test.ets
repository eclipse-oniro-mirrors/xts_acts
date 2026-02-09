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

export default function preloadErrorTabs() {
  describe('preloadErrorTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("preloadErrorTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/preloadErrorTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get preloadErrorTabs state pages:" + JSON.stringify(pages));
        if (!("preloadErrorTabs" == pages.name)) {
          console.info("get preloadErrorTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push preloadErrorTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push preloadErrorTabs page error:" + err);
      }
      console.info("preloadErrorTabs beforeEach end");
      done();
    });

    /**
     * @tc.name   preloadErrorTabs_0100
     * @tc.number preloadErrorTabs_001
     * @tc.desc   Controls the error code of the specified child node preloaded by tabs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('preloadErrorTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[preloadErrorTabs_0100] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('preloadItems_btn_401'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('preloadItems_tabs_401');
      console.info("[preloadErrorTabs_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[preloadErrorTabs_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('preloadItemsError: "401"');
      console.info('[preloadErrorTabs_0100] END');
      done();
    });
  })
}
