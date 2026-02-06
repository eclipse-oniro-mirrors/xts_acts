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
export default function uiCloseCustomDialogTest() {
  describe('uiCloseCustomDialogTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("uiCloseCustomDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/closeCustomDialog",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get uiCloseCustomDialogTest state pages: " + JSON.stringify(pages));
        if (!("closeCustomDialog" == pages.name)) {
          console.info("get uiCloseCustomDialogTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push uiCloseCustomDialogTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   uiCloseCustomDialogTest_static_0100
     * @tc.name     uiCloseCustomDialogTest_static_0100
     * @tc.desc     uiCloseCustomDialogTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('uiCloseCustomDialogTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('uiCloseCustomDialogTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn')) as Component;
      await btn.click();
      await CommonFunc.sleep(3500);
      let closeCustomDialog = inspector.getInspectorByKey('closeCustomDialog');
      console.info("[uiCloseCustomDialogTest_0100] attrs is: " + JSON.stringify(JSON.parseJsonElement(closeCustomDialog).getElement('$attrs')));
      expect(JSON.parseJsonElement(closeCustomDialog).getElement('$attrs').getString('content')).assertEqual('closeCustomDialog');
      console.info('[uiCloseCustomDialogTest_0100] END');
      done();
    });
  })
}