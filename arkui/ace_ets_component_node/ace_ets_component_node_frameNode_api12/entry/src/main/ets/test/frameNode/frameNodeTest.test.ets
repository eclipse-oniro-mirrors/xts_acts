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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function frameNodeTest() {
  describe('frameNodeTest', function () {
    beforeEach(async function (done) {
      console.info("frameNodeTest beforeEach start");
      let options = {
        uri: "MainAbility/pages/frameNode/frameNode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTest state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get frameNodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push frameNodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0100', 0, async function (done) {
      console.info('frameNodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_1');
      let obj = JSON.parse(strJson);
      console.info("[frameNodeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ChildrenCount:11');
      console.info('[frameNodeTest_0100] END');
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0200', 0, async function (done) {
      console.info('frameNodeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_1');
      let obj = JSON.parse(strJson);
      console.info("[frameNodeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ChildrenCount:12');
      console.info('[frameNodeTest_0200] END');
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0300', 0, async function (done) {
      console.info('frameNodeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_1');
      let obj = JSON.parse(strJson);
      console.info("[frameNodeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ChildrenCount:11');
      console.info('[frameNodeTest_0100] END');
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0400', 0, async function (done) {
      console.info('frameNodeTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_1');
      let obj = JSON.parse(strJson);
      console.info("[frameNodeTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ChildrenCount:0');
      console.info('[frameNodeTest_0400] END');
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0600
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0500', 0, async function (done) {
      console.info('frameNodeTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_13'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_10');
      let obj = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('frameNode_11');
      let obj1 = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('frameNode_12');
      let obj2 = JSON.parse(strJson2);
      console.info("[frameNodeTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('getRenderNode:getRenderNode1');
      expect(obj1.$attrs.content).assertEqual('getRenderNode:getRenderNode2');
      expect(obj2.$attrs.content).assertEqual('getRenderNode:getRenderNode3');
      console.info('[frameNodeTest_0500] END');
      done();
    });
    /**
     * @tc.number    frameNode
     * @tc.name      frameNodeTest_0700
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeTest_0600', 0, async function (done) {
      console.info('frameNodeTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_15'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_14');
      let obj = JSON.parse(strJson);
      console.info("[frameNodeTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('builderNode:1');
      console.info('[frameNodeTest_0600] END');
      done();
    });
  })
}

