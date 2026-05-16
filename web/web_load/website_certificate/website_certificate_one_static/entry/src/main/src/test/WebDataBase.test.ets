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
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testSaveHttpAuthCredentialsStatic002
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0200
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentials002', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentials002', true, 30040312, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSaveHttpAuthCredentialsStatic003
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0300
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentials003', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentials003', true, 30040313, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSaveHttpAuthCredentialsStatic004
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0400
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentials004', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentials004', 401, 30040314, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSaveHttpAuthCredentialsStatic005
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0500
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentials005', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentials005', true, 30040315, done);
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
     * @tc.level  LEVEL0
     */
    it('testGetHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetHttpAuthCredentialsStatic002
     * @tc.number SUB_WEB_GETHTTPAUTHCREDENTIALS_STATIC_0200
     * @tc.desc   test getHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHttpAuthCredentialsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetHttpAuthCredentials002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testGetHttpAuthCredentials002', 401, 3004511, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testGetHttpAuthCredentialsStatic003
     * @tc.number SUB_WEB_GETHTTPAUTHCREDENTIALS_STATIC_0300
     * @tc.desc   test getHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHttpAuthCredentialsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetHttpAuthCredentials003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testGetHttpAuthCredentials003', 401, 3004512, done);
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
     * @tc.level  LEVEL0
     */
    it('testExistHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testExistHttpAuthCredentialsStatic002
     * @tc.number SUB_WEB_EXISTHTTPAUTHCREDENTIALS_STATIC_0200
     * @tc.desc   test existHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExistHttpAuthCredentialsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testExistHttpAuthCredentials002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testExistHttpAuthCredentials002', false, 300463116, done);
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
     * @tc.level  LEVEL0
     */
    it('testDeleteHttpAuthCredentialsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

    /**
     * @tc.name   testSaveHttpAuthCredentialsEmptyStatic001
     * @tc.number SUB_WEB_SAVEHTTPAUTHCREDENTIALS_STATIC_0101
     * @tc.desc   test saveHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveHttpAuthCredentialsEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSaveHttpAuthCredentialsEmpty001', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testSaveHttpAuthCredentialsEmpty001', 401, 300401, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testGetHttpAuthCredentialsEmptyStatic001
     * @tc.number SUB_WEB_GETHTTPAUTHCREDENTIALS_STATIC_0102
     * @tc.desc   test getHttpAuthCredentials
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHttpAuthCredentialsEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetHttpAuthCredentialsEmpty001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testGetHttpAuthCredentialsEmpty001', 401, 300451, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDataBaseButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
