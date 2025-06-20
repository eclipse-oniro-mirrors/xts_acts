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

export default function tabsCallBack5() {
  describe('tabsCallBack5', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsCallBack5 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsCallBack5",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsCallBack5 state pages:" + JSON.stringify(pages));
        if (!("tabsCallBack5" == pages.name)) {
          console.info("get tabsCallBack5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsCallBack5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsCallBack5 page error:" + err);
      }
      console.info("tabsCallBack5 beforeEach end");
      done();
    });

    /**
     * @tc.number    tabsCallBack5_001
     * @tc.name      tabsCallBack5_0100
     * @tc.desc      AnimationDuration is set to null and will not trigger a callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsCallBack5_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsCallBack5_0100] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('Yellow'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('tabs_callback_5');
      console.info("[tabsCallBack5_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsCallBack5_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('tabs: onChange-');
      console.info('[tabsCallBack5_0100] END');
      done();
    });
  })
}
