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

export default function indexTabs() {
  describe('indexTabs', () => {
    beforeEach(async (done: Function) => {
      console.info("indexTabs beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/indexTabs",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get indexTabs state pages:" + JSON.stringify(pages));
        if (!("indexTabs" == pages.name)) {
          console.info("get indexTabs pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push indexTabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push indexTabs page error:" + err);
      }
      console.info("indexTabs beforeEach end");
      done();
    });

    /**
     * @tc.number    indexTabs_001
     * @tc.name      indexTabs_0100
     * @tc.desc      Listen for switchover events on the TabContent page.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('indexTabs_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[indexTabs_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('observer_tabs_on'));
      await btn1.click();
      await CommonFunc.sleep(1500);

      let btn2: Component = await driver.findComponent(ON.id('change_index_obs'));
      await btn2.click();
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('tabs_tabIndex');
      console.info("[indexTabs_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[indexTabs_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('index: 1');
      await CommonFunc.sleep(1000);

      let btn3: Component = await driver.findComponent(ON.id('observer_tabs_off'));
      await btn3.click();
      await CommonFunc.sleep(1500);
      console.info('[indexTabs_0100] END');
      done();
    });
  })
}
