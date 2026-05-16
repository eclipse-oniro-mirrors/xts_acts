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

export default function persistenceV2() {
  describe('persistenceV2', () => {
    beforeEach(async (done: Function) => {
      console.info("persistenceV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/persistenceV2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get persistenceV2 state pages:" + JSON.stringify(pages));
        if (!("persistenceV2" == pages.name)) {
          console.info("get persistenceV2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push persistenceV2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push persistenceV2 page error:" + err);
      }
      console.info("persistenceV2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("persistenceV2 after each called");
    });

    /**
     * @tc.name   persistenceV2_0100
     * @tc.number persistenceV2_0100
     * @tc.desc   all keys in PersistenceV2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('persistenceV2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[persistenceV2_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('persistenceV2_keys');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[persistenceV2_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain('keys in PersistenceV2: PerSample');
      console.info('[persistenceV2_0100] END');
      done();
    });

    /**
     * @tc.name   persistenceV2_0200
     * @tc.number persistenceV2_0200
     * @tc.desc   Persistently store UI related data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('persistenceV2_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[persistenceV2_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("persistenceV2_p1"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('persistenceV2_p1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[persistenceV2_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[persistenceV2_0200] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('prop.p1: 2');

      let btn2: Component = await driver.findComponent(ON.id("router_appStorageV2"));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let btn3: Component = await driver.findComponent(ON.id("router_persistenceV2"));
      await btn3.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('persistenceV2_p1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[persistenceV2_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[persistenceV2_0200] content2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('prop.p1: 2');
      console.info('[persistenceV2_0200] END');
      done();
    });

    /**
     * @tc.name   persistenceV2_0300
     * @tc.number persistenceV2_0300
     * @tc.desc   When the tested value is not the observed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('persistenceV2_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[persistenceV2_0300] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("persistenceV2_p2"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('persistenceV2_p2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[persistenceV2_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[persistenceV2_0300] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('prop.p2: 11a: 2');

      let btn2: Component = await driver.findComponent(ON.id("persistenceV2_remove"));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("persistenceV2_connect"));
      await btn3.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('persistenceV2_p2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[persistenceV2_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[persistenceV2_0300] content2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('prop.p2: 10a: 2');
      let btn6: Component = await driver.findComponent(ON.id("btnPersistenceV2ClearKeys"));
      await CommonFunc.sleep(1000);
      await btn6.click();
      console.info('[persistenceV2_0300] END');
      done();
    });
  })
}
