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

export default function MakeObservedTest0090() {
  describe('MakeObservedTest0090', () => {
    beforeEach(async (done: Function) => {
      console.info("MakeObservedTest0090 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/makeObserved/MakeObserved0090",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("MakeObserved0090" == pages.name)) {
          console.info("get MakeObservedTest0090 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MakeObservedTest0090 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MakeObservedTest0090 page error:" + err);
      }
      console.info("MakeObservedTest0090 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MakeObservedTest0090 after each called");
    });

    /**
     * @tc.name   MakeObservedTest0090_001
     * @tc.number SUB_ACE_TS_STATUSMANAGER_MAKEOBSERVED_0090
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedTest0090_001', Level.LEVEL0, async (done: Function) => {
      console.info('[MakeObservedTest0090_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnMakeObserved0090"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvMakeObserved0090'));
      console.info("[MakeObservedTest0090_001] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Tom');
      console.info('[MakeObservedTest0090_001] END');
      done();
    });
  })
}
