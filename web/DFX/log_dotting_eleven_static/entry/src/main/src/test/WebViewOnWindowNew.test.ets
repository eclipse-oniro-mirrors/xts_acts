/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();

let testAbilityContext: common.UIAbilityContext;

export default function WebViewOnWindowTest() {

    describe('WebViewOnWindowTestSuit', (): void => {
        beforeAll(async (): Promise<void> => {
          await Utils.msSleep(2000)
          console.log("App start")
        });

        beforeEach(async () => {
          await Utils.msSleep(3000);
          console.info("web beforeEach start");
        })

    /**
     * @tc.name       testWebViewOnwindowNewStatic001
     * @tc.number     SUB_WEB_ONWINDOWNEW_0100
     * @tc.desc       onWindowNew isAlert
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewOnwindowNewStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewOnWindowNew001', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewOnwindowNewStatic001', true, 20260313, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewOnWindowNewButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewOnwindowNewStatic002
     * @tc.number     SUB_WEB_ONWINDOWNEW_0200
     * @tc.desc       onWindowNew isUserTrigger
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewOnwindowNewStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewOnWindowNew002', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewOnwindowNewStatic002', true, 20260314, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewOnWindowNewButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewOnwindowNewStatic003
     * @tc.number     SUB_WEB_ONWINDOWNEW_0300
     * @tc.desc       onWindowNew targetUrl
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewOnwindowNewStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewOnWindowNew003', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewOnwindowNewStatic003', "https://www.baidu.com/", 20260315, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewOnWindowNewButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewOnwindowNewStatic004
     * @tc.number     SUB_WEB_ONWINDOWNEW_0400
     * @tc.desc       onWindowNew navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewOnwindowNewStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewOnWindowNew004', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewOnwindowNewStatic004', 117, 20260316, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewOnWindowNewButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })
  })
}
