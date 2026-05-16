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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function Foreach3() {
  describe('Foreach3', () => {
    beforeEach(async (done: Function) => {
      console.info("Foreach3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/Foreach3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Foreach3 state pages:" + JSON.stringify(pages));
        if (!("Foreach3" == pages.name)) {
          console.info("get Foreach3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Foreach3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach3 page error:" + err);
      }
      console.info("Foreach3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach3 after each called");
    });

    /**
     * @tc.name   foreach3_001
     * @tc.number foreach3_001
     * @tc.desc   add a new item to the foreach component and check whether the new item is added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach3_001', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach3_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach3_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('5 100');
      console.info('[foreach3_001] END');
      done();
    });

    /**
     * @tc.name   foreach3_002
     * @tc.number foreach3_002
     * @tc.desc   exhange the order of the items in the foreach component and check whether the order is changed successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach3_002', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach3_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_2'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach3_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1 3');
      console.info('[foreach3_002] END');

      let strJson1 = getInspectorByKey('foreach2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[foreach3_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2 2');
      console.info('[foreach3_002] END');
      done();
    });
    /**
     * @tc.name   foreach3_003
     * @tc.number foreach3_003
     * @tc.desc   add a new item to the foreach component and check whether the new item is added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach3_003', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach3_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach3_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('5 100');
      console.info('[foreach3_003] END');
      done();
    });

    /**
     * @tc.name   foreach3_004
     * @tc.number foreach3_004
     * @tc.desc   delete an item from the foreach component and check whether the item is deleted successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach3_004', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach3_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_3'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach3_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2 4');
      console.info('[foreach3_004] END');
      done();
    });
  })
}
