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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
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

export default function nodeContainerTest() {
  describe('nodeContainerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeContainerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/nodeContainer",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeContainerTest state pages: " + JSON.stringify(pages));
        if (!("nodeContainer" == pages.name)) {
          console.info("get nodeContainerTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nodeContainerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeContainerTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number nodeContainer
     * @tc.name nodeContainerTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeContainerTest_0100', 0, async (done: Function) => {
      console.info('nodeContainerTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nodeContainer_6');
      let obj = JSON.parse(strJson);
      console.info("[nodeContainerTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('nodeContainer:1');
      console.info('[nodeContainerTest_0100] END');
      done();
    });
    /**
     * @tc.number nodeContainer
     * @tc.name nodeContainerTest_0200
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeContainerTest_0200', 0, async (done: Function) => {
      console.info('nodeContainerTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nodeContainer_1');
      let obj = JSON.parse(strJson);
      let strJson2 = getInspectorByKey('nodeContainer_2');
      let obj2 = JSON.parse(strJson2);
      let strJson3 = getInspectorByKey('nodeContainer_3');
      let obj3 = JSON.parse(strJson3);
      let strJson4 = getInspectorByKey('nodeContainer_4');
      let obj4 = JSON.parse(strJson4);
      let strJson5 = getInspectorByKey('nodeContainer_5');
      let obj5 = JSON.parse(strJson5);
      console.info("[nodeContainerTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('nodeContainer:getFirstChild');
      expect(obj2.$attrs.content).assertEqual('nodeContainer:getChild');
      expect(obj3.$attrs.content).assertEqual('nodeContainer:getNextSibling');
      expect(obj4.$attrs.content).assertEqual('nodeContainer:getPreviousSibling');
      expect(obj5.$attrs.content).assertEqual('nodeContainer:getParent');
      console.info('[nodeContainerTest_0200] END');
      done();
    });
    /**
     * @tc.number nodeContainer
     * @tc.name nodeContainerTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeContainerTest_0300', 0, async (done: Function) => {
      console.info('nodeContainerTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_11'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nodeContainer_9');
      let obj = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('nodeContainer_10');
      let obj1 = JSON.parse(strJson1);
      console.info("[nodeContainerTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isModifiable:true');
      expect(obj1.$attrs.content).assertEqual('isModifiable:false');
      console.info('[nodeContainerTest_0300] END');
      done();
    });
    /**
     * @tc.number nodeContainer
     * @tc.name nodeContainerTest_0400
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeContainerTest_0400', 0, async (done: Function) => {
      console.info('nodeContainerTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_13'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nodeContainer_12');
      let obj = JSON.parse(strJson);
      console.info("[nodeContainerTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('builderNode:builderNode');
      console.info('[nodeContainerTest_0400] END');
      done();
    });
    /**
     * @tc.number nodeContainer
     * @tc.name nodeContainerTest_0500
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeContainerTest_0500', 0, async (done: Function) => {
      console.info('nodeContainerTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_15'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('nodeContainer_14');
      let obj = JSON.parse(strJson);
      console.info("[nodeContainerTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('isModifiable:false');
      console.info('[nodeContainerTest_0500] END');
      done();
    });
  })
}

