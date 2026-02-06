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

export default function ParamTestJsunit1() {
  describe('ParamTestJsunit1', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamTestJsunit1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/ParamTest1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParamTestJsunit1 state pages:" + JSON.stringify(pages));
        if (!("ParamTest1" == pages.name)) {
          console.info("get ParamTestJsunit1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamTestJsunit1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamTestJsunit1 page error:" + err);
      }
      console.info("ParamTestJsunit1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParamTestJsunit1 after each called");
    });

    /**
     * @tc.name   ParamTestJsunit1_001
     * @tc.number ParamTestJsunit1_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnChangeArrParam"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvChildSet');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('5');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildMap');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('value0');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvChildDate');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ParamTestJsunit1_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('00:00:01 GMT+0800');
      console.info('[ParamTestJsunit1_001] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit1_002
     * @tc.number ParamTestJsunit1_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvUnionType"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvUnionType');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('100');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildUnionType');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('100');
      console.info('[ParamTestJsunit1_002] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit1_003
     * @tc.number ParamTestJsunit1_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvUnionType"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvUnionType');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('100');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildUnionType');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_003] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('100');
      console.info('[ParamTestJsunit1_003] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit1_004
     * @tc.number ParamTestJsunit1_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvChildMsgEvent"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvMsgEvent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ARKUI');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildMsgEvent');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_004] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('ARKUI');
      console.info('[ParamTestJsunit1_004] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit1_005
     * @tc.number ParamTestJsunit1_005
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_005', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvNestGrandpa"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvNestGrandpa');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvNestGrandpa');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvNestChild');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_005] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('tvNestGrandpa');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvChildRequireMsg');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ParamTestJsunit1_005] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('tvNestGrandpa');
      console.info('[ParamTestJsunit1_005] END');
      done();
    });
    /**
     * @tc.name   ParamTestJsunit1_006
     * @tc.number ParamTestJsunit1_006
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_006', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnChangeArrParam"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvArr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_006] component obj is: " + JSON.stringify(obj));
      console.info("[ParamTestJsunit1_006] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('[0,true,{"gender":"girl"}]');
      await CommonFunc.sleep(1000);
      console.info('[ParamTestJsunit1_006] END');
      done();
    });
    /**
     * @tc.name   ParamTestJsunit1_007
     * @tc.number ParamTestJsunit1_007
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit1_007', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit1_007] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvArr"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvArr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit1_007] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('[0,true,{"gender":"girl"}]');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildArr');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit1_007] component obj1 is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('[0,true,{"gender":"girl"}]');
      console.info('[ParamTestJsunit1_007] END');
      done();
    });
  })
}
