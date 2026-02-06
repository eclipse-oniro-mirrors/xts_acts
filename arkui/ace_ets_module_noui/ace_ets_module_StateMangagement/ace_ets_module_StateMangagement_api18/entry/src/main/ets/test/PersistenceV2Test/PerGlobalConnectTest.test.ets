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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';
export default function PerGlobalConnectTest() {
  describe('PerGlobalConnectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PerGlobalConnectTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PerGlobalConnect",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PerGlobalConnect" == pages.name)) {
          console.info("get PerGlobalConnectTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PerGlobalConnectTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PerGlobalConnectTest page error:" + err);
      }
      console.info("PerGlobalConnectTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PerGlobalConnectTest after each called");
    });

    /**
     * @tc.number    PerGlobalConnectTest
     * @tc.name      PerGlobalConnectTest_001
     * @tc.desc      Persistently store UI related data
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('PerGlobalConnectTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[PerGlobalConnectTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvKeys'));
      console.info("[PerGlobalConnectTest_001] component obj is: " + JSON.stringify(obj));
      console.info("[PerGlobalConnectTest_001] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('keys:key_1,key_2,PerSample');
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnClear"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("tvKeys"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvKeys'));
      console.info("[PerGlobalConnectTest_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[PerGlobalConnectTest_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('keys:');
      console.info('[PerGlobalConnectTest_001] END');
      done();
    });
  })
}
