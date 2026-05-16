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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.customdnsonetest.static")
      await Utils.msSleep(3000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name        testSecureDnsModeAUTOStatic0001
     * @tc.number      SUB_WEB_SECUREDNSMODE_AUTO_0100
     * @tc.desc        test SecureDnsMode AUTO
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testSecureDnsModeAUTOStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent("testSecureDnsModeAUTO001", 10);
      await Utils.msSleep(3000);
      Utils.registerEvent("testSecureDnsModeAUTO001", "Example Domain", 31036, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name        testSecureDnsModeAUTOStatic004
     * @tc.number      SUB_WEB_SECUREDNSMODE_AUTO_0400
     * @tc.desc        test SecureDnsMode AUTO
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testSecureDnsModeAUTOStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent("testSecureDnsModeAUTO004", 10);
        await Utils.msSleep(3000);
        Utils.registerEvent("testSecureDnsModeAUTO004", 401, 310364, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name        testSecureDnsModeOFFStatic0001
     * @tc.number      SUB_WEB_SECUREDNSMODE_OFF_0100
     * @tc.desc        test SecureDnsMode OFF
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testSecureDnsModeOFFStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent("testSecureDnsModeOFF0001", 10);
        await Utils.msSleep(3000);
        Utils.registerEvent("testSecureDnsModeOFF0001", "Example Domain", 310365, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name        testSecureDnsModeSECURE_ONLYStatic001
     * @tc.number      SUB_WEB_SECUREDNSMODE_SECURE_ONLY_0100
     * @tc.desc        test SecureDnsMode SECURE_ONLY
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testSecureDnsModeAUTOStaticO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent("testSecureDnsModeSECURE_ONLY0001", 10);
        await Utils.msSleep(3000);
        Utils.registerEvent("testSecureDnsModeSECURE_ONLY0001", "Example Domain", 310366, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
