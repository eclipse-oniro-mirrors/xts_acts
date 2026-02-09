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

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptionenhancedtesttwo.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testSetNetworkAvailableStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0100
     * @tc.desc   test setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetNetworkAvailableStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailable001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetNetworkAvailable001", 'false', 100055, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetNetworkAvailableStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0200
     * @tc.desc   test setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetNetworkAvailableStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailable002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetNetworkAvailable002", 'true', 100056, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}
