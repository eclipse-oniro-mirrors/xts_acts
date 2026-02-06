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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function getPosition() {
  describe('getPosition', () => {
    beforeAll(() => {
      console.info("getPosition beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("getPosition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getPosition",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getPosition state pages: " + JSON.stringify(pages));
        if (!("getPosition" == pages.name)) {
          console.info("get getPosition state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push getPosition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getPosition page error: " + err);
           expect().assertFail();
      }
      //done();
    });
    
    



    /**
     * @tc.number   getPosition_static_0100
     * @tc.name     getPosition_static_0100
     * @tc.desc     getPosition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getPosition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getPosition_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToScreen'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getWindowLeftVP'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('getPositionToScreenValue');
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('getWindowLeftVPValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[getPosition_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getPosition_static_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.getElement('$attrs').getString('content')).assertEqual(obj1.getElement('$attrs').getString('content'));
      console.info('[getPosition_static_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   getPosition_static_0200
     * @tc.name     getPosition_static_0200
     * @tc.desc     getPosition_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getPosition_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getPosition_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToParentWithTransform'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('getPositionToParentWithTransformValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getPosition_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[getPosition_static_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   getPosition_static_0300
     * @tc.name     getPosition_static_0300
     * @tc.desc     getPosition_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getPosition_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getPosition_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToWindowWithTransform'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('getPositionToWindowWithTransformValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getPosition_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[getPosition_static_0300] component obj is1: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[getPosition_static_0300] END');
      done();
    });
    
    



    /**
     * @tc.number   getPosition_static_0400
     * @tc.name     getPosition_static_0400
     * @tc.desc     getPosition_static_0400
     * @tc.level    Level.LEVEL0
     */
it('getPosition_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getPosition_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('getPositionToScreenWithTransform'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getWindowLeftVP'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('getPositionToScreenWithTransformValue');
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('getWindowLeftVPValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[getPosition_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[getPosition_static_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.getElement('$attrs').getString('content')).assertEqual(obj1.getElement('$attrs').getString('content'));
      console.info('[getPosition_static_0400] END');
      done();
    });
  })
}