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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function upDownTreeEventTest() {
  describe('upDownTreeEventTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.XNode.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("upDownTreeEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/upDownTreeEventTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        // router.clear();
        let pages = router.getState();
        console.info("get upDownTreeEventTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/FrameNode/upDownTreeEventTest" == pages.name)) {
          console.info("get upDownTreeEventTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push upDownTreeEventTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push upDownTreeEventTest page error:" + err);
      }
      console.info("upDownTreeEventTest beforeEach end");
    });
    
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("upDownTreeEventTest after each called");
    });
    


    
    
/**
     * @tc.number   nodeOnWillUnbindTest_static_0100
     * @tc.name     nodeOnWillUnbindTest_static_0100
     * @tc.desc     nodeOnWillUnbindTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('nodeOnWillUnbindTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnWillUnbindTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson1: string = inspector.getInspectorByKey('willUnbindValue_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[nodeOnWillUnbindTest_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[nodeOnWillUnbindTest_static_0100] content obj1 is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('willUnbind');
      console.info('[nodeOnWillUnbindTest_static_0600] END');
      done();
    });


    
    
/**
     * @tc.number   nodeOnUnBindTest_static_0200
     * @tc.name     nodeOnUnBindTest_static_0200
     * @tc.desc     nodeOnUnBindTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('nodeOnUnBindTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnUnBindTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('unbindValue_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[nodeOnUnBindTest_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[nodeOnUnBindTest_static_0200] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('unbind');
      console.info('[nodeOnUnBindTest_static_0500] END');
      done();
    });


    
    
/**
     * @tc.number   nodeOnDetachTest_static_0300
     * @tc.name     nodeOnDetachTest_static_0300
     * @tc.desc     nodeOnDetachTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('nodeOnDetachTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnDetachTest_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('upDownTree')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('detachValue_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[nodeOnDetachTest_static_0300] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[nodeOnDetachTest_static_0300] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('detach');
      console.info('[nodeOnDetachTest_static_0300] END');
      done();
    });


    
    
/**
     * @tc.number   nodeOnAttachTest_static_0400
     * @tc.name     nodeOnAttachTest_static_0400
     * @tc.desc     nodeOnAttachTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('nodeOnAttachTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnAttachTest_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('attachValue_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[nodeOnAttachTest_static_0400] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[nodeOnAttachTest_static_0400] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('attach');
      console.info('[nodeOnAttachTest_static_0400] END');
      done();
    });


    
    
/**
     * @tc.number   nodeOnBindTest_static_0500
     * @tc.name     nodeOnBindTest_static_0500
     * @tc.desc     nodeOnBindTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('nodeOnBindTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnBindTest_static_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('bindValue_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[nodeOnBindTest_static_0500] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[nodeOnBindTest_static_0500] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('bind');
      console.info('[nodeOnBindTest_static_0500] END');
      done();
    });


    
    
/**
     * @tc.number   nodeOnWillBindTest_static_0600
     * @tc.name     nodeOnWillBindTest_static_0600
     * @tc.desc     nodeOnWillBindTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('nodeOnWillBindTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nodeOnWillBindTest_static_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getTestValue')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('willBindValue_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[nodeOnWillBindTest_static_0600] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[nodeOnWillBindTest_static_0600] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('willBind');
      console.info('[nodeOnWillBindTest_static_0600] END');
      done();
    });
  })
}