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


export default function showToastTest () {
  describe('showToastTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ShowToastTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToast',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ShowToastTest state pages: " + JSON.stringify(pages));
        if (!("ShowToastTest" == pages.name)) {
          console.info("get ShowToastTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ShowToastTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   showToast_static_0100
     * @tc.name     showToast_static_0100
     * @tc.desc     showToast_static_0100
     * @tc.level    Level.LEVEL2
     */
it('showToast_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('showToast_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('backgroundColor')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('backgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showToast_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('backgroundColor');
      console.info('[showToast_0100] END');
      done();
    });
    
    
/**
     * @tc.number   showToast_static_0200
     * @tc.name     showToast_static_0200
     * @tc.desc     showToast_static_0200
     * @tc.level    Level.LEVEL2
     */
it('showToast_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('showToast_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('backgroundBlurStyle')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('backgroundBlurStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showToast_0200] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0200] promptAction: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('backgroundBlurStyle');
      console.info('[showToast_0200] END');
      done();
    });
     
    
/**
     * @tc.number   showToast_static_0300
     * @tc.name     showToast_static_0300
     * @tc.desc     showToast_static_0300
     * @tc.level    Level.LEVEL2
     */
it('showToast_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('showToast_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('textColor')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showToast_0300] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0300] promptAction: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('textColor');
      console.info('[showToast_0300] END');
      done();
    });
     
    
/**
     * @tc.number   showToast_static_0400
     * @tc.name     showToast_static_0400
     * @tc.desc     showToast_static_0400
     * @tc.level    Level.LEVEL2
     */
it('showToast_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('showToast_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('Shadow')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shadow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showToast_0400] component obj is: " + JSON.stringify(obj));
      console.info("[showToast_0400] promptAction: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('Shadow');
      console.info('[showToast_0400] END');
      done();
    });

  })
}