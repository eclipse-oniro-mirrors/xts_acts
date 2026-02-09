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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();
export default function nodeContainerTest() {
  describe('nodeContainerTest', () => {
    beforeAll(() => {
      console.info("nodeContainerTest beforeEach start");
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("nodeContainerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/nodeContainer",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get nodeContainerTest state pages: " + JSON.stringify(pages));
        if (!("nodeContainer" == pages.name)) {
          console.info("get nodeContainerTest state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push nodeContainerTest page error: " + err);
        expect().assertFail();
      }
    });
    


    
/**
     * @tc.number   nodeContainerTest_static_0100
     * @tc.name     nodeContainerTest_static_0100
     * @tc.desc     nodeContainerTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('nodeContainerTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('nodeContainerTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_7'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('nodeContainer_6');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[nodeContainerTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('nodeContainer:1');
      console.info('[nodeContainerTest_0100] END');
      done();
    });
    


    
/**
     * @tc.number   nodeContainerTest_static_0200
     * @tc.name     nodeContainerTest_static_0200
     * @tc.desc     nodeContainerTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('nodeContainerTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('nodeContainerTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_8'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('nodeContainer_1');
      let obj= JSON.parseJsonElement(strJson);
      let strJson2 = inspector.getInspectorByKey('nodeContainer_2');
      let obj2= JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('nodeContainer_3');
      let obj3= JSON.parseJsonElement(strJson3);
      let strJson4 = inspector.getInspectorByKey('nodeContainer_4');
      let obj4= JSON.parseJsonElement(strJson4);
      let strJson5 = inspector.getInspectorByKey('nodeContainer_5');
      let obj5= JSON.parseJsonElement(strJson5);
      console.info("[nodeContainerTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('nodeContainer:getFirstChild');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('nodeContainer:getChild');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('nodeContainer:getNextSibling');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('nodeContainer:getPreviousSibling');
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('nodeContainer:getParent');
      console.info('[nodeContainerTest_0200] END');
      done();
    });
    


    
/**
     * @tc.number   nodeContainerTest_static_0300
     * @tc.name     nodeContainerTest_static_0300
     * @tc.desc     nodeContainerTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('nodeContainerTest_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      console.info('nodeContainerTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_11'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('nodeContainer_9');
      let obj= JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('nodeContainer_10');
      let obj1= JSON.parseJsonElement(strJson1);
      console.info("[nodeContainerTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('isModifiable:true');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('isModifiable:false');
      console.info('[nodeContainerTest_0300] END');
      done();
    });
    


    
/**
     * @tc.number   nodeContainerTest_static_0400
     * @tc.name     nodeContainerTest_static_0400
     * @tc.desc     nodeContainerTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('nodeContainerTest_static_0400', Level.LEVEL0, async (done: ()=>void) => {
      console.info('nodeContainerTest_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_13'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('nodeContainer_12');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[nodeContainerTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('builderNode:builderNode');
      console.info('[nodeContainerTest_0400] END');
      done();
    });
    


    
/**
     * @tc.number   nodeContainerTest_static_0500
     * @tc.name     nodeContainerTest_static_0500
     * @tc.desc     nodeContainerTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('nodeContainerTest_static_0500', Level.LEVEL0, async (done: ()=>void) => {
      console.info('nodeContainerTest_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nodeContainer_15'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('nodeContainer_14');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[nodeContainerTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('isModifiable:false');
      console.info('[nodeContainerTest_0500] END');
      done();
    });
  })
}