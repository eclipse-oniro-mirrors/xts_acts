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
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;


export default function httpAuthHandler() {

  describe('HttpAuthHandlerTestSuite', () => {

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptionenhancedtest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });


    /**
     * @tc.name   testHttpAuthHandlerConfirmStatic001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_0100
     * @tc.desc   test HttpAuthHandler confirm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpAuthHandlerConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testHttpAuthHandlerConfirm001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHttpAuthHandlerConfirm001", true, 32040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })


    /**
     * @tc.name   testHttpAuthHandlerCancelStatic001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CANCEL_0100
     * @tc.desc   test HttpAuthHandler cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpAuthHandlerCancelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testHttpAuthHandlerCancel001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHttpAuthHandlerCancel001", 404, 32041, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })



    /**
     * @tc.name   testHttpAuthHandlerIsHttpAuthInfoSavedStatic001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_ISHTTPAUTHINFOSAVED_0100
     * @tc.desc   test HttpAuthHandler isHttpAuthInfoSaved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpAuthHandlerIsHttpAuthInfoSavedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", false, 32042, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })
    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_WEB_EMITONSWITCHNEXTPAGE_0100
     * @tc.desc   test emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HttpAuthHandlerButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })


  })
}
