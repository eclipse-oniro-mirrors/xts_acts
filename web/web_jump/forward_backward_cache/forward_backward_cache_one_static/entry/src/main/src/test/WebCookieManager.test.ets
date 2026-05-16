/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webCookieManagerTest() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.forwardbackwardcacheonetest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testIsCookieAllowedStatic001
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0100
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsCookieAllowedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testIsCookieAllowed001", 10)
        Utils.registerEvent("testIsCookieAllowed001", true, 30015, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsCookieAllowedStatic002
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0200
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsCookieAllowedStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsCookieAllowed002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testIsCookieAllowed002", false, 30016, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsThirdPartyCookieAllowedStatic001
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0100
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsThirdPartyCookieAllowedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsThirdPartyCookieAllowed001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testIsThirdPartyCookieAllowed001", true, 30025, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsThirdPartyCookieAllowedStatic002
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0200
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsThirdPartyCookieAllowedStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsThirdPartyCookieAllowed002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testIsThirdPartyCookieAllowed002", false, 30026, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledStatic001
     * @tc.number SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0100
     * @tc.desc   test putAcceptThirdPartyCookieEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPutAcceptThirdPartyCookieEnabledStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptThirdPartyCookieEnabled001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPutAcceptThirdPartyCookieEnabled001", false, 30033, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })
  })
}
