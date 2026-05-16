/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { UiComponent, Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LifeCycleTest0510() {
  describe('LifeCycleTest0510', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleTest0510 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0510",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycleTest0510 state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0050" == pages.name)) {
          console.info("get LifeCycleTest0510 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycleTest0510 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycleTest0510 page error:" + err);
      }
      console.info("LifeCycleTest0510 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycleTest0510 after each called");
    });

    /**
     * @tc.name   LifeCycleTest0510_001
     * @tc.number LifeCycleTest0510_001
     * @tc.desc   Testing the lifecycle decorators of custom component V1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycleTest0510_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycleTest0510_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnGoToV1"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnChildV1Go"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvV11Init'));
      console.info("[LifeCycleTest0510_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnChildV11IsVisible"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(500);
      await btn2.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack();
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvV1Num'));
      console.info("[LifeCycleTest0510_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('5');
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("btnChildV1IsVisible"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      await CommonFunc.sleep(1000);
      let btn4: Component = await driver.findComponent(ON.id("btnChildV1Clear"));
      await CommonFunc.sleep(1000);
      await btn4.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack();
      await CommonFunc.sleep(1000);
      let btn5: Component = await driver.findComponent(ON.id("btnGoToV2"));
      await CommonFunc.sleep(1000);
      await btn5.click();
      await CommonFunc.sleep(1000);
      let btn6: Component = await driver.findComponent(ON.id("btnChildV2Go"));
      await CommonFunc.sleep(1000);
      await btn6.click();
      await CommonFunc.sleep(1000);
      let btn7: Component = await driver.findComponent(ON.id("btnChildV22IsVisible"));
      await CommonFunc.sleep(1000);
      await btn7.click();
      await CommonFunc.sleep(500);
      await btn7.click();
      await CommonFunc.sleep(1000);
      await driver.pressBack();
      await CommonFunc.sleep(2000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvV2Num'));
      console.info("[LifeCycleTest0510_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('6');
      await CommonFunc.sleep(1000);
      let btn8: Component = await driver.findComponent(ON.id("btnChildV2Clear"));
      await CommonFunc.sleep(1000);
      await btn8.click();
      console.info('[LifeCycleTest0510_001] END');
      done();
    });
  })
}