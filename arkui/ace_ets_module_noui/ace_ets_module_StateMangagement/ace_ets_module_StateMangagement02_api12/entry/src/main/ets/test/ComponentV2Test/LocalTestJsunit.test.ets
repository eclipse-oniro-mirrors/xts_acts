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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function LocalTestJsunit() {
  describe('LocalTestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalTestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/LocalTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalTestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalTest" == pages.name)) {
          console.info("get LocalTestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalTestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalTestJsunit page error:" + err);
      }
      console.info("LocalTestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalTestJsunit after each called");
    });

    /**
     * @tc.number    LocalTestJsunit_001
     * @tc.name      LocalTestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvParamMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvParamMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ARKUI');
      console.info('[LocalTestJsunit_001] END');
      done();
    });

    /**
     * @tc.number    LocalTestJsunit_002
     * @tc.name      LocalTestJsunit_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("countJoint"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('countJoint');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[LocalTestJsunit_002] END');
      done();
    });
    /**
     * @tc.number    LocalTestJsunit_003
     * @tc.name      LocalTestJsunit_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_003', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvArr"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvArr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_003] component obj arr is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvArr');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("tvDate"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvDate');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalTestJsunit_003] component obj date is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Tue Jan 02 2024');
      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id("tvMap"));
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvMap');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[LocalTestJsunit_003] component obj map is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("tvSet"));
      await CommonFunc.sleep(1000);
      await btn3.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('tvSet');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[LocalTestJsunit_003] component obj set is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('1,2,3');
      console.info('[LocalTestJsunit_003] END');
      done();
    });
    /**
     * @tc.number    LocalTestJsunit_004
     * @tc.name      LocalTestJsunit_004
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_004', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvCount"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvCount');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');
      console.info('[LocalTestJsunit_004] END');
      done();
    });
    /**
     * @tc.number    LocalTestJsunit_005
     * @tc.name      LocalTestJsunit_005
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_005', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvTraceName"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvTraceName');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvTraceName');
      console.info('[LocalTestJsunit_005] END');
      done();
    });
    /**
     * @tc.number    LocalTestJsunit_006
     * @tc.name      LocalTestJsunit_006
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTestJsunit_006', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalTestJsunit_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvAddItem"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvAddItem');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalTestJsunit_006] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3');

      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("tvRemoveItem"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvRemoveItem');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalTestJsunit_006] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2');
      console.info('[LocalTestJsunit_006] END');
      done();
    });
  })
}
