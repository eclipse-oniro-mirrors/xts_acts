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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function PromptActionTest() {
  describe('PromptActionTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("PromptActionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PromptAction/KeyboardAvoidMode/PromptAction",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get PromptActionTest state pages: " + JSON.stringify(pages));
        if (!("PromptAction" == pages.name)) {
          console.info("get PromptActionTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PromptActionTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   PromptActionTest_static_0100
     * @tc.name     PromptActionTest_static_0100
     * @tc.desc     PromptActionTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('PromptActionTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('btn1')) as Component;
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(2000);
      let text1 = inspector.getInspectorByKey('text1');
      await CommonFunc.sleep(1000);
      console.info("[PromptActionTest_0100] getText is: " + JSON.stringify(text1));
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[PromptActionTest_0100] END');
      done();
    });

    
    
/**
     * @tc.number   PromptActionTest_static_0200
     * @tc.name     PromptActionTest_static_0200
     * @tc.desc     PromptActionTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('PromptActionTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('PromptActionTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn2: Component = await driver.findComponent(ON.id('btn2')) as Component;
      await CommonFunc.sleep(1000);
      await btn2.click();
      await CommonFunc.sleep(2000);
      let text2 = inspector.getInspectorByKey('text2');
      await CommonFunc.sleep(1000);
      console.info("[PromptActionTest_0200] getText is: " + JSON.stringify(text2));
      expect(JSON.parseJsonElement(text2).getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[PromptActionTest_0200] END');
      done();
    });
  })
}