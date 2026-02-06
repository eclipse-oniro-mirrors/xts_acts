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

export default function ParamTestJsunit() {
  describe('ParamTestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamTestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/ParamTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParamTestJsunit state pages:" + JSON.stringify(pages));
        if (!("ParamTest" == pages.name)) {
          console.info("get ParamTestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamTestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamTestJsunit page error:" + err);
      }
      console.info("ParamTestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParamTestJsunit after each called");
    });

    /**
     * @tc.name   ParamTestJsunit_001
     * @tc.number ParamTestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnChangeOnce"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvChildOnceMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('message');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildCount');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');
      console.info('[ParamTestJsunit_001] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit_002
     * @tc.number ParamTestJsunit_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvClassACount"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvClassACount');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildClassACount');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');
      console.info('[ParamTestJsunit_002] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit_003
     * @tc.number ParamTestJsunit_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvRequireMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvRequireMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvRequireMsg');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildRequireMsg');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit_003] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('tvRequireMsg');
      console.info('[ParamTestJsunit_003] END');
      done();
    });

    /**
     * @tc.name   ParamTestJsunit_004
     * @tc.number ParamTestJsunit_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamTestJsunit_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ParamTestJsunit_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnChangeParam"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvChildMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTestJsunit_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvParamMsg');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildSingleCount');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ParamTestJsunit_004] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('tvIsChildState');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ParamTestJsunit_004] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('true');
      console.info('[ParamTestJsunit_004] END');
      done();
    });
  })
}
