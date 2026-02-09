'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import pasteboard from '@ohos.pasteboard'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function frameNodeTest() {
  describe('frameNodeTest', () => {
    beforeAll(() => {
      console.info("frameNodeTest beforeEach start");
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("frameNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/frameNode",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTest state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get frameNodeTest state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push frameNodeTest page error: " + err);
        expect().assertFail();
      }
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0100
     * @tc.name     frameNodeTest_static_0100
     * @tc.desc     frameNodeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ChildrenCount:11');
      console.info('[frameNodeTest_static_0100] END');
      done();
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0200
     * @tc.name     frameNodeTest_static_0200
     * @tc.desc     frameNodeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ChildrenCount:12');
      console.info('[frameNodeTest_static_0200] END');
      done();
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0300
     * @tc.name     frameNodeTest_static_0300
     * @tc.desc     frameNodeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ChildrenCount:11');
      console.info('[frameNodeTest_static_0100] END');
      done();
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0400
     * @tc.name     frameNodeTest_static_0400
     * @tc.desc     frameNodeTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0400', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ChildrenCount:0');
      console.info('[frameNodeTest_static_0400] END');
      done();
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0500
     * @tc.name     frameNodeTest_static_0500
     * @tc.desc     frameNodeTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0500', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_13'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_10');
      let obj= JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('frameNode_11');
      let obj1= JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('frameNode_12');
      let obj2= JSON.parseJsonElement(strJson2);
      console.info("[frameNodeTest_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('getRenderNode:getRenderNode1');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('getRenderNode:getRenderNode2');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('getRenderNode:getRenderNode3');
      console.info('[frameNodeTest_static_0500] END');
      done();
    });
    


    
/**
     * @tc.number   frameNodeTest_static_0600
     * @tc.name     frameNodeTest_static_0600
     * @tc.desc     frameNodeTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('frameNodeTest_static_0600', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeTest_static_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_15'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('frameNode_14');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeTest_static_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('builderNode:1');
      console.info('[frameNodeTest_static_0600] END');
      done();
    });
  })
}