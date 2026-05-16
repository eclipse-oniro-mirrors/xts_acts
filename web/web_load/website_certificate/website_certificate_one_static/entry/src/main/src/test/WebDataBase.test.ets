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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index'
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function WebDataBaseTest() {
  describe('WebDataBaseTestSuite', (): void => {
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
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.websitecertificateonetest.static')
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
     * @tc.name   testSaveHttpAuthCredentialsStatic001
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0100
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSaveHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentials001', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentials001', true, 30040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testGetHttpAuthCredentialsStatic001
     * @tc.number SUB_WEB_GETHTTPAUTHCREDENTIALS_STATIC_0100
     * @tc.desc   test getHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetHttpAuthCredentials001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testGetHttpAuthCredentials001', 'StrOmgGol', 30045, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testExistHttpAuthCredentialsStatic001
     * @tc.number SUB_WEB_EXISTHTTPAUTHCREDENTIALS_STATIC_0100
     * @tc.desc   test existHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExistHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testExistHttpAuthCredentials001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testExistHttpAuthCredentials001', true, 30046, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testDeleteHttpAuthCredentialsStatic001
     * @tc.number SUB_WEB_DELETEHTTPAUTHCREDENTIALS_STATIC_0100
     * @tc.desc   test deleteHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testDeleteHttpAuthCredentials001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testDeleteHttpAuthCredentials001', false, 30050, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(8000);
        Utils.emitEvent('emitonSwitchNextPage1', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(1000);
        done();
      })
  })
}
