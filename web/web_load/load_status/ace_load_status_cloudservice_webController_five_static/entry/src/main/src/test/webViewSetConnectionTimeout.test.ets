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
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import webview from '@ohos.web.webview'

let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebViewSetConnectionTimeout() {

  describe('ActsAceWebViewSetConnectionTimeout', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsaceloadstatuscloudservicewebcontrollerfivetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });



    /**
     * @tc.name   testWebViewSetConnectionTimeoutZeroSecondsStatic
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0001
     * @tc.desc   test setConnectionTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSetConnectionTimeoutZeroSecondsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitWebViewSetConnectionTimeoutZeroSeconds", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSetConnectionTimeoutZeroSeconds", "Error", 8001, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })



    /**
     * @tc.name   testWebViewSetConnectionTimeoutNegativeOneSecondsStatic
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0003
     * @tc.desc   test setConnectionTimeout_negative_one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSetConnectionTimeoutNegativeOneSecondsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitWebViewSetConnectionTimeoutNegativeOneSeconds", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSetConnectionTimeoutNegativeOneSeconds", "Error", 8003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })


  })
}
