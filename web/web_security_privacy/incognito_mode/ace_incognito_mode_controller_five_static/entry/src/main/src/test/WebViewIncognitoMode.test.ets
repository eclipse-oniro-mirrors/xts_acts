/*
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';

let emitKey = ''
let testAbilityContext: common.UIAbilityContext;

export default function ActsAceWebViewIncognitoMode() {

  describe('ActsAceWebViewIncognitoMode', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError|null) : void => {
        if (err != null ) {

          console.log('-----' + err.code)
        }

        console.log('BusinessError  end')
      })
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceincognitomodecontrollerfivetest.static')
        .then(result => {
          console.info('Command executed successfully:', result);
        })
        .catch(err => {
          console.error('Error executing command:', err);
        });
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebViewIncognitoModeStatic13
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0013
     * @tc.desc   test getStoredGeolocation(promise) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewIncognitoModeStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebViewIncognitoMode13', 10)
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode13', 'success', 8031, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic14
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0014
     * @tc.desc   test getStoredGeolocation(callback) incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitWebViewIncognitoMode14', 10)
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode14', 'success', 8032, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic15
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0015
     * @tc.desc   test getStoredGeolocation(promise) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode15'
        await Utils.msSleep(9000);
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode15', 'success', 8033, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic16
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0016
     * @tc.desc   test getStoredGeolocation(callback) normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode16'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode16', 'success', 8034, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic17
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0017
     * @tc.desc   test deleteGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode17'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode17', 'success', 8035, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic18
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0018
     * @tc.desc   test deleteGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode18'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(9000);
        Utils.registerEvent('testWebViewIncognitoMode18', 'success', 8036, done);
        await Utils.msSleep(9000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic19
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0019
     * @tc.desc   test deleteAllGeolocation incognito
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode19'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(18000);
        Utils.registerEvent('testWebViewIncognitoMode19', 'success', 8037, done);
        await Utils.msSleep(18000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name   testWebViewIncognitoModeStatic20
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_STATIC_0020
     * @tc.desc   test deleteAllGeolocation normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoModeStatic20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewIncognitoMode20'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(18000);
        Utils.registerEvent('testWebViewIncognitoMode20', 'success', 8038, done);
        await Utils.msSleep(18000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webViewIncognitoModeButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
    /**
     * @tc.name testWebViewIncognitoMode01
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0001
     * @tc.desc test isIncognitoMode true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewIncognitoMode_static_01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(6000)
      emitKey = 'emitWebViewIncognitoMode01'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('testWebViewIncognitoMode01', 'success', 8019, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('webViewIncognitoModeButton', 10, '');
      await Utils.msSleep(6000)
      done()
    })
  })
}