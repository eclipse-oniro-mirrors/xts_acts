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

export default function ComponentV2TestJsunit() {
  describe('ComponentV2TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ComponentV2TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/ComponentV2Test",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComponentV2TestJsunit state pages:" + JSON.stringify(pages));
        if (!("ComponentV2Test" == pages.name)) {
          console.info("get ComponentV2TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ComponentV2TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComponentV2TestJsunit page error:" + err);
      }
      console.info("ComponentV2TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ComponentV2TestJsunit after each called");
    });

    /**
     * @tc.name   ComponentV2TestJsunit_001
     * @tc.number ComponentV2TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentV2TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ComponentV2TestJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComponentV2TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ARKUI');
      console.info('[ComponentV2TestJsunit_001] END');
      done();
    });

    /**
     * @tc.name   ComponentV2TestJsunit_002
     * @tc.number ComponentV2TestJsunit_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentV2TestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ComponentV2TestJsunit_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvAge"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvAge');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComponentV2TestJsunit_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('11');
      console.info('[ComponentV2TestJsunit_002] END');
      done();
    });

    /**
     * @tc.name   ComponentV2TestJsunit_003
     * @tc.number ComponentV2TestJsunit_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentV2TestJsunit_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ComponentV2TestJsunit_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvHelloMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvHelloMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComponentV2TestJsunit_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ARKUI');
      console.info('[ComponentV2TestJsunit_003] END');
      done();
    });

    /**
     * @tc.name   ComponentV2TestJsunit_004
     * @tc.number ComponentV2TestJsunit_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentV2TestJsunit_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ComponentV2TestJsunit_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvChildMsg"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvChildMsg');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComponentV2TestJsunit_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('changeChildMsg');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvChildMsg');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ComponentV2TestJsunit_004] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('changeChildMsg');
      console.info('[ComponentV2TestJsunit_004] END');
      done();
    });

    /**
     * @tc.name   ComponentV2TestJsunit_005
     * @tc.number ComponentV2TestJsunit_005
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentV2TestJsunit_005', Level.LEVEL0, async (done: Function) => {
      console.info('[ComponentV2TestJsunit_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("tvParentNoFun"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tvParentNoFun');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComponentV2TestJsunit_005] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('tvParentNoFun');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('tvParentNoFun');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[ComponentV2TestJsunit_005] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('tvParentNoFun');
      console.info('[ComponentV2TestJsunit_005] END');
      done();
    });
  })
}