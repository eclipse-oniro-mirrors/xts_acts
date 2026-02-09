'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
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
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function buttonEnabledJsunit() {
  describe('buttonEnabledJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("buttonEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonEnabled',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get buttonEnabledJsunit state pages:" + JSON.stringify(pages));
        if (!("buttonEnabled" == pages.name)) {
          console.info("get buttonEnabledJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push buttonEnabledJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push buttonEnabledJsunit page error: " + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0100
     * @tc.name     buttonEnabledJsunit_static_0100
     * @tc.desc     buttonEnabledJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0100] button1: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("点击事件已触发");
      console.info('[buttonEnabledJsunit_static_0100] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0200
     * @tc.name     buttonEnabledJsunit_static_0200
     * @tc.desc     buttonEnabledJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0200] button1: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("onClick-禁用");
      console.info('[buttonEnabledJsunit_static_0200] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0300
     * @tc.name     buttonEnabledJsunit_static_0300
     * @tc.desc     buttonEnabledJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0300] button2: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("onTouch-禁用");
      console.info('[buttonEnabledJsunit_static_0300] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0400
     * @tc.name     buttonEnabledJsunit_static_0400
     * @tc.desc     buttonEnabledJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0400] button3: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("onKeyEvent-禁用");
      console.info('[buttonEnabledJsunit_static_0400] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0500
     * @tc.name     buttonEnabledJsunit_static_0500
     * @tc.desc     buttonEnabledJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0500] button4: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("鼠标事件onHover-禁用");
      console.info('[buttonEnabledJsunit_static_0500] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0600
     * @tc.name     buttonEnabledJsunit_static_0600
     * @tc.desc     buttonEnabledJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0600] button5: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("鼠标事件onMouse-禁用");
      console.info('[buttonEnabledJsunit_static_0600] END');
      done();
    });

    
/**
     * @tc.number   buttonEnabledJsunit_static_0700
     * @tc.name     buttonEnabledJsunit_static_0700
     * @tc.desc     buttonEnabledJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('buttonEnabledJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('buttonEnabledJsunit_static_0700 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btnEnd6'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('btnEnd6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonEnabledJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      console.info("[buttonEnabledJsunit_static_0700] button6: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("label")).assertEqual("焦点事件-禁用");
      console.info('[buttonEnabledJsunit_static_0700] END');
      done();
    });
  })
}

