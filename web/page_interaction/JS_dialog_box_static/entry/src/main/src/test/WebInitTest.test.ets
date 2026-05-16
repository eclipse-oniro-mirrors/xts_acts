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

import { accessibility, config } from '@kit.AccessibilityKit';
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 177301;
let driver = Driver.create();

export default function webInitTest() {

    describe('WebInitTest', () => {
      beforeAll(async (): Promise<void> => {
        await Utils.msSleep(2000)
        console.log("App start")
      });

    /**
     * @tc.name   onPromptStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_032
     * @tc.desc   onPrompt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onPromptStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnPrompt", 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("onPrompt", "age", 177310, done);
      await Utils.msSleep(3000);
      let driver: Driver = Driver.create();
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebInitTestButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })
    /**
     * @tc.name   onAlertStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_041
     * @tc.desc   onAlert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onAlertStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitOnAlert", 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("onAlert", "alert test", 177320, done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebInitTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   onConfirmStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_0421
     * @tc.desc   onConfirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onConfirmStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitOnConfirm", 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("onConfirm", "confirm test", 177330, done);
        await Utils.msSleep(3000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebInitTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
      /**
       * @tc.name   SwitchNextPageStatic
       * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_042
       * @tc.desc   SwitchNextPageStatic
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('WebInitTestButton'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(4000)
        done()
      })
  })
}
