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


export default function Foreach1() {
  describe('Foreach1', () => {
    beforeEach(async (done: Function) => {
      console.info("Foreach1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/Foreach1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Foreach1 state pages:" + JSON.stringify(pages));
        if (!("Foreach1" == pages.name)) {
          console.info("get Foreach1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Foreach1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach1 page error:" + err);
      }
      console.info("Foreach1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach1 after each called");
    });

    /**
     * @tc.name   foreach1_001
     * @tc.number foreach1_001
     * @tc.desc   Modify the data in the foreach component and check whether the modification is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach1_001', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach1_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('repeat_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach1_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2 new three');
      console.info('[foreach1_001] END');
      done();
    });

    /**
     * @tc.name   foreach1_002
     * @tc.number foreach1_002
     * @tc.desc   add a new item to the foreach component and check whether the new item is added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach1_002', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach1_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach1_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3 six');
      console.info('[foreach1_002] END');
      done();
    });

    /**
     * @tc.name   foreach1_003
     * @tc.number foreach1_003
     * @tc.desc   exhange the order of the items in the foreach component and check whether the order is changed successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach1_003', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach1_003] START');
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
      console.info("[foreach1_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1 three');
      console.info('[foreach1_003] END');

      let strJson1 = getInspectorByKey('foreach2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[foreach1_003] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2 two');
      console.info('[foreach1_003] END');
      done();
    });

    /**
     * @tc.name   foreach1_004
     * @tc.number foreach1_004
     * @tc.desc   add a new item to the foreach component and check whether the new item is added successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach1_004', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach1_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach1_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3 six');
      console.info('[foreach1_004] END');
      done();
    });

    /**
     * @tc.name   foreach1_005
     * @tc.number foreach1_005
     * @tc.desc   delete an item from the foreach component and check whether the item is deleted successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach1_005', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach1_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('init_for_each'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('for_each_3'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('foreach1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach1_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1 two');
      console.info('[foreach1_005] END');
      done();
    });
  })
}
