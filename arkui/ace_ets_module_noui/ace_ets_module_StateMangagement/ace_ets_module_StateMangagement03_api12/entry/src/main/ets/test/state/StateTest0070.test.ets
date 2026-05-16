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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function StateTest0070() {
  describe('StateTest0070', () => {
    beforeEach(async (done: Function) => {
      console.info("StateTest0070 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/State0070",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("State0070" == pages.name)) {
          console.info("get StateTest0070 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateTest0070 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateTest0070 page error:" + err);
      }
      console.info("StateTest0070 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateTest0070 after each called");
    });

    /**
     * @tc.name   StateTest0070_001
     * @tc.number SUB_ACE_STATUSMANAGER_PAGE_STATE_INTERFACE_0070
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StateTest0070_001', Level.LEVEL0, async (done: Function) => {
      console.info('[StateTest0070_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnAddState0070"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvState0070'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('gray');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnUpdateState0070"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvState0070'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertContain('white');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnDelState0070"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('green'))
      expect(text == null).assertTrue()
      console.info('[StateTest0070_001] END');
      done();
    });
  })
}
