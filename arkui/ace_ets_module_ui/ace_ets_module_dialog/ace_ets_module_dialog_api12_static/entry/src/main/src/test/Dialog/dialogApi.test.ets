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

export default function dialogApi() {
  describe('dialogApi', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("dialogApi beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get dialogApi state pages:" + JSON.stringify(pages));
        if (!("dialogApi" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({url:"MainAbility/pages/Dialog/dialogApi"})
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dialogApi page error:" + err);
      }
      console.info("dialogApi foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dialogApi after each called");
    });

    

    
/**
     * @tc.number   dialogApi_static_0100
     * @tc.name     dialogApi_static_0100
     * @tc.desc     dialogApi_static_0100
     * @tc.level    Level.LEVEL2
     */
it('dialogApi_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('dialogApi_0100 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('dialogApiBt'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dialogApiBt');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[dialogApi_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("dialogApi");
      console.info('[dialogApi_0100] END');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
