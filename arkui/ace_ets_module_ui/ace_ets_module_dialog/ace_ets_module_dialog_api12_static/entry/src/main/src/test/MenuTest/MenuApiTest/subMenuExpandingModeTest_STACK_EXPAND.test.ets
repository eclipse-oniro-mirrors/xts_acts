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
export default function subMenuExpandingModeTest() {
  describe('subMenuExpandingModeTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("subMenuExpandingModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/MenuApi/subMenuExpandingMode_STACK_EXPAND"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get subMenuExpandingModeTest state pages: " + JSON.stringify(pages));
        if (!("subMenuExpandingMode_STACK_EXPAND" == pages.name)) {
          console.info("get subMenuExpandingModeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push subMenuExpandingModeTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   subMenuExpandingModeTest_static_0100
     * @tc.name     subMenuExpandingModeTest_static_0100
     * @tc.desc     subMenuExpandingModeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('subMenuExpandingModeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('subMenuExpandingModeTest_0100 START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>('winLeft') == 0) {
        let driver: Driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id('btn')) as Component;
        await btn.click();
        await CommonFunc.sleep(1000);
        let menu = inspector.getInspectorByKey('menu');
        console.info("[subMenuExpandingModeTest_0100] attrs is: " + JSON.stringify(JSON.parseJsonElement(menu).getElement('$attrs')));
        expect(JSON.parseJsonElement(menu).getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.STACK');
      }
      console.info('[subMenuExpandingModeTest_0100] END');
      done();
    });
  })
}