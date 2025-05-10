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

export default function frameNodeGetInterfaceTest() {
  describe('frameNodeGetInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/frameNodeTestGetInterface",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTestGetInterface state pages: " + JSON.stringify(pages));
        if (!("frameNodeTestGetInterface" == pages.name)) {
          console.info("get frameNodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
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
     * @tc.number frameNodeGetNodeType
     * @tc.name frameNodeGetInterfaceTest_0100
     * @tc.desc getNodeType Test
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0100', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke getNodeType interface
      let button = await driver.findComponent(ON.id('getNodeTypeKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('result CustomFrameNode');
      console.info('[frameNodeGetInterfaceTest_0100] END');
      done();
    });
    /**
     * @tc.number frameNodeGetOpacity
     * @tc.name frameNodeGetInterfaceTest_0200
     * @tc.desc getOpacity test
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0200', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0200  START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke getOpacity interface
      let button = await driver.findComponent(ON.id('getOpacityKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('result 1');
      console.info('[frameNodeGetInterfaceTest_0200] END');
      done();
    });

    /**
     * @tc.number frameNodeGetVisible
     * @tc.name frameNodeGetInterfaceTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0300', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke isVisible interface
      let button = await driver.findComponent(ON.id('isVisibleKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('result true');
      console.info('[frameNodeGetInterfaceTest_0300] END');
      done();
    });

    /**
     * @tc.number frameNodeIsClipToFrame
     * @tc.name frameNodeGetInterfaceTest_0400
     * @tc.desc testIsClipToFrame
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0400', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke isCliptoFrame interface
      let button = await driver.findComponent(ON.id('isCliptoFrameKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('result false');
      console.info('[frameNodeGetInterfaceTest_0400] END');
      done();
    });

    /**
     * @tc.number frameNodeIsAttached
     * @tc.name frameNodeGetInterfaceTest_0500
     * @tc.desc testIsIsAttached
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0500', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke IsAttached interface
      let button = await driver.findComponent(ON.id('isAttachedKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('result true');
      console.info('[frameNodeGetInterfaceTest_0500] END');
      done();
    });


    /**
     * @tc.number frameNodeGetInspectorInfo
     * @tc.name frameNodeGetInterfaceTest_0600
     * @tc.desc testGetInspectorInfo
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeGetInterfaceTest_0600', 0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      // invoke GetInspectorInfo interface
      let button = await driver.findComponent(ON.id('getInspectorInfoKey'));
      await button.click();
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = getInspectorByKey('resultKey');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeGetInterfaceTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertContain("$attrs")
      console.info('[frameNodeGetInterfaceTest_0600] END');
      done();
    });

  })
}

