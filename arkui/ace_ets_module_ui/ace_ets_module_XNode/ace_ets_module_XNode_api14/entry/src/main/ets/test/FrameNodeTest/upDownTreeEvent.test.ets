/*
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function upDownTreeEventTest() {
  describe('upDownTreeEventTest', () => {
    beforeEach(async (done: Function) => {
      console.info("upDownTreeEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/upDownTreeEventTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get upDownTreeEventTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get upDownTreeEventTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push upDownTreeEventTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push upDownTreeEventTest page error:" + err);
      }
      console.info("upDownTreeEventTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("upDownTreeEventTest after each called");
    });

    /**
     * @tc.number    nodeOnWillUnbindTest_0100
     * @tc.name      nodeOnWillUnbindTest_0100
     * @tc.desc      frameNode: nodeOnWillUnbindTest_0100
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnWillUnbindTest_0100', 0, async (done: Function) => {
      console.info('nodeOnWillUnbindTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson1: string = getInspectorByKey('willUnbindValue_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[nodeOnWillUnbindTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[nodeOnWillUnbindTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('willUnbind');
      console.info('[nodeOnWillUnbindTest_0600] END');
      done();
    });

    /**
     * @tc.number    nodeOnUnBindTest_0200
     * @tc.name      nodeOnUnBindTest_0200
     * @tc.desc      frameNode: nodeOnUnBindTest_0200
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnUnBindTest_0200', 0, async (done: Function) => {
      console.info('nodeOnUnBindTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('unbindValue_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[nodeOnUnBindTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[nodeOnUnBindTest_0200] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('unbind');
      console.info('[nodeOnUnBindTest_0500] END');
      done();
    });

    /**
     * @tc.number    nodeOnDetachTest_0300
     * @tc.name      nodeOnDetachTest_0300
     * @tc.desc      frameNode: nodeOnDetachTest_0300
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnDetachTest_0300', 0, async (done: Function) => {
      console.info('nodeOnDetachTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('detachValue_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[nodeOnDetachTest_0300] component obj is: " + JSON.stringify(obj));
      console.info("[nodeOnDetachTest_0300] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('detach');
      console.info('[nodeOnDetachTest_0300] END');
      done();
    });

    /**
     * @tc.number    nodeOnAttachTest_0400
     * @tc.name      nodeOnAttachTest_0400
     * @tc.desc      frameNode: nodeOnAttachTest_0400
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnAttachTest_0400', 0, async (done: Function) => {
      console.info('nodeOnAttachTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('attachValue_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[nodeOnAttachTest_0400] component obj is: " + JSON.stringify(obj));
      console.info("[nodeOnAttachTest_0400] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('attach');
      console.info('[nodeOnAttachTest_0400] END');
      done();
    });


    /**
     * @tc.number    nodeOnBindTest_0500
     * @tc.name      nodeOnBindTest_0500
     * @tc.desc      frameNode: nodeOnBindTest_0500
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnBindTest_0500', 0, async (done: Function) => {
      console.info('nodeOnBindTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('bindValue_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[nodeOnBindTest_0500] component obj is: " + JSON.stringify(obj));
      console.info("[nodeOnBindTest_0500] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('bind');
      console.info('[nodeOnBindTest_0500] END');
      done();
    });


    /**
     * @tc.number    nodeOnWillBindTest_0600
     * @tc.name      nodeOnWillBindTest_0600
     * @tc.desc      frameNode: nodeOnWillBindTest_0600
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('nodeOnWillBindTest_0600', 0, async (done: Function) => {
      console.info('nodeOnWillBindTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('willBindValue_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[nodeOnWillBindTest_0600] component obj is: " + JSON.stringify(obj));
      console.info("[nodeOnWillBindTest_0600] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('willBind');
      console.info('[nodeOnWillBindTest_0600] END');
      done();
    });


  })
}