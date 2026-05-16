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
import {UiComponent, Driver, Component, UiWindow, ON, } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ASV20010Test() {
  describe('ASV20010Test', () => {
    beforeEach(async (done: Function) => {
      console.info("ASV20010Test setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/appstoragev2/AppStorageV20010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ASV20010Test state pages:" + JSON.stringify(pages));
        if (!("AppStorageV20010" == pages.name)) {
          console.info("get ASV20010Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ASV20010Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ASV20010Test page error:" + err);
      }
      console.info("ASV20010Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ASV20010Test after each called");
    });

    /**
     * @tc.name   ASV20010Test_001
     * @tc.number ASV20010Test_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASV20010Test_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ASV20010Test_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvPage1Age"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvPage1Age'))
      console.info("[ASV20010Test_001] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("tvPage1Width"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvPage1Width'))
      console.info("[ASV20010Test_001] component obj1 is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("btnGotoPage2"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvPage2Age'))
      console.info("[ASV20010Test_001] component obj2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvPage2Width'))
      console.info("[ASV20010Test_001] component obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(1000);
      await driver.pressBack();
      let btn4: Component = await driver.findComponent(ON.id("btnPage1Remove"));
      await CommonFunc.sleep(1000);
      await btn4.click();
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvKeys'))
      console.info("[ASV20010Test_001] component obj4 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('keys: ');
      let btn5: Component = await driver.findComponent(ON.id("btnPage1Connect"));
      await CommonFunc.sleep(1000);
      await btn5.click();
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvKeys'))
      console.info("[ASV20010Test_001] component obj5 is: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertContain('keys: AppStorageV2Sample');
      let btn6: Component = await driver.findComponent(ON.id("btnPage1ClearKeys"));
      await CommonFunc.sleep(1000);
      await btn6.click();
      console.info('[ASV20010Test_001] END');
      done();
    });
  })
}
