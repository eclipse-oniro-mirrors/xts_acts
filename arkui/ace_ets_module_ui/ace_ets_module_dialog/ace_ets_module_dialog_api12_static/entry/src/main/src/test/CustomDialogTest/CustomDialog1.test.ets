'use static';
/**
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import window from '@ohos.window';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function CustomDialog1() {
  describe('CustomDialog1', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("CustomDialog1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/CustomDialog1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get CustomDialog1 state pages: " + JSON.stringify(pages));
        if (!("CustomDialog1" == pages.name)) {
          console.info("get CustomDialog1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let Column:Component = await driver.findComponent(ON.id('CustomDialog1Reset')) as Component;
        await CommonFunc.sleep(1000);
        await Column.click();
      } catch (err) {
        console.error("push CustomDialog1 page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   CustomDialog1_static_0100
     * @tc.name     CustomDialog1_static_0100
     * @tc.desc     CustomDialog1_static_0100
     * @tc.level    Level.LEVEL2
     */
it('CustomDialog1_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomDialog1_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column:Component = await driver.findComponent(ON.id('CustomDialog1')) as Component;
      await Column.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

  let context = AppStorage.get<common.UIAbilityContext>('abilityContext');
  let windowClass: window.Window | undefined = undefined;
  windowClass = await window.getLastWindow(context!)
  let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomDialog1_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)

      let button1:Component = await driver.findComponent(ON.text('confirm')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('CustomDialog1Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CustomDialog1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[CustomDialog1_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("reason=0");
      console.info('[CustomDialog1_0100] END');
      done();
    });
    
    
/**
     * @tc.number   CustomDialog1_static_0200
     * @tc.name     CustomDialog1_static_0200
     * @tc.desc     CustomDialog1_static_0200
     * @tc.level    Level.LEVEL2
     */
it('CustomDialog1_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomDialog1_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('CustomDialog1')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.click((Math.round((AppStorage.get<number>('winLeft') as number)+20)).toInt(), (Math.round((AppStorage.get<number>('winTop') as number)+200)).toInt());
      await CommonFunc.sleep(1000);

  let context = AppStorage.get<common.UIAbilityContext>('abilityContext');
  let windowClass: window.Window | undefined = undefined;
  windowClass = await window.getLastWindow(context!)
  let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomDialog1_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)

      let button1:Component = await driver.findComponent(ON.text('confirm')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('CustomDialog1Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CustomDialog1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[CustomDialog1_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("reason=1");
      console.info('[CustomDialog1_0200] END');
      done();
    });


  })
}

