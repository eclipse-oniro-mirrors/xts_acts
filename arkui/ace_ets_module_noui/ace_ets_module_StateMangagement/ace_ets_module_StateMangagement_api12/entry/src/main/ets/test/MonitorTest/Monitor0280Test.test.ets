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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function Monitor0280Test() {
  describe('Monitor0280Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor0280Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/Monitor0280",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor0280Test state pages:" + JSON.stringify(pages));
        if (!("Monitor0280" == pages.name)) {
          console.info("get Monitor0280Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor0280Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor0280Test page error:" + err);
      }
      console.info("Monitor0280Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor0280Test after each called");
    });

    /**
     * @tc.number    Monitor0280Test_001
     * @tc.name      Monitor0280Test_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('Monitor0280Test_001', Level.LEVEL0, async (done: Function) => {
      console.info('[Monitor0280Test_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnMonitor0280"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildMonitor0280'));
      console.info("[Monitor0280Test_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld');
      console.info('[Monitor0280Test_001] END');
      done();
    });
  })
}
