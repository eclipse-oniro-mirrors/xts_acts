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

export default function ClientAuthenticationHandlerTestTwo() {
  describe('ClientAuthenticationHandlerTestTwo', (): void => {
    beforeAll(async ():Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('beforeEach start');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmStatic002
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_001
     * @tc.desc   test clientAuthenticationHandler confirm string wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClientAuthenticationHandlerConfirmStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClientAuthenticationHandlerConfirm002', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('emitClientAuthenticationHandlerConfirm002', true, 25131101, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('clientAuthenticationHandlerButtonTwo', 10, '');
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SUB_WEB_SwitchNextPageStatic_25131101
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
        inspector.sendEventByKey('clientAuthenticationHandlerButtonTwo', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}