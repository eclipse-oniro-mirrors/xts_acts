/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;
const driver = Driver.create();

export default function ClientAuthenticationHandlerTest() {
  describe('ClientAuthenticationHandlerTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.websitecertificatefivetest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmStatic001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_25121101
     * @tc.desc   test clientAuthenticationHandler confirm string wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmType001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClientAuthenticationHandlerConfirmType001', true, 25121101, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClientAuthenticationHandlerCancelStatic001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCANCEL_001
     * @tc.desc   test clientAuthenticationHandler confirm string wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerCancelStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClientAuthenticationHandlerCancel001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitClientAuthenticationHandlerCancel001', true, 25121102, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClientAuthenticationHandlerIgnoreStatic001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATION_Ignore_001
     * @tc.desc   test clientAuthenticationHandler confirm string wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerIgnoreStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClientAuthenticationHandlerIgnore001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitClientAuthenticationHandlerIgnore001', true, 25121103, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnClientAuthenticationEventStatic001
     * @tc.number SUB_ACE_WEB_ONCLIENTAUTHENTICATIONEVENT_001
     * @tc.desc   test OnClientAuthenticationEvent host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnClientAuthenticationEventStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnClientAuthenticationEvent001', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitOnClientAuthenticationEvent001', "client.badssl.com", 25121104, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnClientAuthenticationEventStatic002
     * @tc.number SUB_ACE_WEB_ONCLIENTAUTHENTICATIONEVENT_002
     * @tc.desc   test OnClientAuthenticationEvent port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnClientAuthenticationEventStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnClientAuthenticationEvent002', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitOnClientAuthenticationEvent003', 443, 25121105, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnClientAuthenticationEventStatic003
     * @tc.number SUB_ACE_WEB_ONCLIENTAUTHENTICATIONEVENT_003
     * @tc.desc   test OnClientAuthenticationEvent handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnClientAuthenticationEventStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnClientAuthenticationEvent003', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitOnClientAuthenticationEvent003', 117, 25121106, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnClientAuthenticationEventStatic004
     * @tc.number SUB_ACE_WEB_ONCLIENTAUTHENTICATIONEVENT_004
     * @tc.desc   test OnClientAuthenticationEvent issuers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnClientAuthenticationEventStatic004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnClientAuthenticationEvent004', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitOnClientAuthenticationEvent004', 277, 25121107, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOnClientAuthenticationEventStatic005
     * @tc.number SUB_ACE_WEB_ONCLIENTAUTHENTICATIONEVENT_005
     * @tc.desc   test OnClientAuthenticationEvent keyTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnClientAuthenticationEventStatic005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitOnClientAuthenticationEvent005', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitOnClientAuthenticationEvent005', 57, 25121108, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
    * @tc.name        SwitchNextPageStatic
    * @tc.number      SUB_WEB_SwitchNextPageStatic_57
    * @tc.desc        test PAGE_REDIRECT
    * @tc.size        MEDIUM
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('clientAuthenticationHandlerButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}