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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function MakeObservedTest0300() {
  describe('MakeObservedTest0300', () => {
    beforeEach(async (done: Function) => {
      console.info("MakeObservedTest0300 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/makeObserved/MakeObserved0300",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("MakeObserved0300" == pages.name)) {
          console.info("get MakeObservedTest0300 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MakeObservedTest0300 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MakeObservedTest0300 page error:" + err);
      }
      console.info("MakeObservedTest0300 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MakeObservedTest0300 after each called");
    });

    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_MAKEOBSERVED_0300
     * @tc.name      MakeObservedTest0300_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('MakeObservedTest0300_001', 0, async (done: Function) => {
      console.info('[MakeObservedTest0300_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnMakeObserved0300"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvMakeObserved03001'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvMakeObserved03002'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('3');
      console.info('[MakeObservedTest0300_001] END');
      done();
    });
  })
}
