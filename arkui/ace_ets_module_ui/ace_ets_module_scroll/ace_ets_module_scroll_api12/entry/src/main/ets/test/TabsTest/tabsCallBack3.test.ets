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

export default function tabsCallBack3() {
  describe('tabsCallBack3', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack3 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack3" == pages.name)) {
          console.info("get tabsCallBack3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack3 page error:" + err);
      }
      console.info("tabsCallBack3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack3 after each called");
    });

    /**
     * @tc.number    tabsCallBack3_001
     * @tc.name      tabsCallBack3_0100
     * @tc.desc      Switch pages and trigger callbacks through the changeIndex interface.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack3_0100', 0, async (done: Function) => {
      console.info('[tabsCallBack3_0100] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_callback_index_3'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('tabs_callback_3');
      console.info("[tabsCallBack3_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsCallBack3_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('tabs: onWillShow1-onContentWillChange-onWillShow2-onWillHide1-onChange-');
      console.info('[tabsCallBack3_0100] END');
      done();
    });
  })
}
