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
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function menuTransition() {
  describe('menuTransition', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("menuTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get menuTransition state pages: " + JSON.stringify(pages));
        if (!("menuTransition" == pages.name)) {
          console.info("get menuTransition state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push menuTransition page error: " + err);
        expect().assertFail();
      }
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("menuTransition after each called");
    });

    
    
/**
     * @tc.number   menuTransition_static_0100
     * @tc.name     menuTransition_static_0100
     * @tc.desc     menuTransition_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('menuTransition_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('menuTransition_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(3000);

  console.info('menuTransition_0100 menuText = ' + ON.id('menuText'));
      let button2 = await driver.findComponent(ON.id('menuText'));
  console.info('menuTransition_0100 button2 = ' + button2);
      expect(button2 !== null).assertTrue();
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('menuTransition_0100 END');
      done();
    });
  })
}