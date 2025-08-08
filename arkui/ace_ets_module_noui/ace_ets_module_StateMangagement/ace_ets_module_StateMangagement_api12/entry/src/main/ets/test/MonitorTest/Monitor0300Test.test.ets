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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function Monitor0300Test() {
  describe('Monitor0300Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Monitor0300Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Monitor/Monitor0300",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Monitor0300Test state pages:" + JSON.stringify(pages));
        if (!("Monitor0300" == pages.name)) {
          console.info("get Monitor0300Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Monitor0300Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Monitor0300Test page error:" + err);
      }
      console.info("Monitor0300Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Monitor0300Test after each called");
    });

    /**
     * @tc.number    Monitor0300Test_001
     * @tc.name      Monitor0300Test_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('Monitor0300Test_001', 0, async (done: Function) => {
      console.info('[Monitor0300Test_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnMonitor03001"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvMonitor03001'));
      console.info("[Monitor0300Test_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Jack');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvMonitor03002'));
      console.info("[Monitor0300Test_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('23');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnMonitor03002"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvMonitor03001'));
      console.info("[Monitor0300Test_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Jack');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvMonitor03002'));
      console.info("[Monitor0300Test_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('18');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnMonitor03003"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvMonitor03001'));
      console.info("[Monitor0300Test_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('Lucy');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvMonitor03002'));
      console.info("[Monitor0300Test_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('30');
      console.info('[Monitor0300Test_001] END');
      done();
    });
  })
}
