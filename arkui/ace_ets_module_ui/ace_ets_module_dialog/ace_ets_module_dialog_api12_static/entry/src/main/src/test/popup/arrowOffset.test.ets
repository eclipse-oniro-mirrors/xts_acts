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


export default function arrowOffset() {
  describe('arrowOffset', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("arrowOffset beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/arrowOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get arrowOffset state pages: " + JSON.stringify(pages));
        if (!("arrowOffset" == pages.name)) {
          console.info("get arrowOffset state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push arrowOffset page error: " + err);
        expect().assertFail();
      }
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arrowOffset after each called");
    });

    
    
/**
     * @tc.number   arrowOffset_static_0100
     * @tc.name     arrowOffset_static_0100
     * @tc.desc     arrowOffset_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('arrowOffset_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('arrowOffset_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('CustomPopup')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let text:Component = await driver.findComponent(ON.id('customText')) as Component;
      expect(text != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('arrowOffset_0100 END');
      done();
    });

    
    
/**
     * @tc.number   arrowOffset_static_0200
     * @tc.name     arrowOffset_static_0200
     * @tc.desc     arrowOffset_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('arrowOffset_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('arrowOffset_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('CustomPopup1')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('customText')) as Component;
      expect(text != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('arrowOffset_0200 END');
      done();
    });
  })
}