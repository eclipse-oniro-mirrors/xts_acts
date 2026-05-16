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

export default function ActsAceWebSafeBrowsing() {

  describe('ActsAceWebSafeBrowsing', () => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.safeloadingonetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testEnableSafeBrowsingTrueStatic
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0001
     * @tc.desc   test EnableSafeBrowsingTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableSafeBrowsingTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitEnableSafeBrowsingTrue", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testEnableSafeBrowsingTrue", true, 2001, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testEnableSafeBrowsingFalseStatic
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0002
     * @tc.desc   test EnableSafeBrowsingFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnableSafeBrowsingFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitEnableSafeBrowsingFalse", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testEnableSafeBrowsingFalse", true, 2002, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsSafeBrowsingEnabledTrueStatic
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0003
     * @tc.desc   test IsSafeBrowsingEnabledTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsSafeBrowsingEnabledTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitIsSafeBrowsingEnabledTrue", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsSafeBrowsingEnabledTrue", true, 2003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsSafeBrowsingEnabledFalseStatic
     * @tc.number SUB_ACE_WEB_SAFEBROWSING_API_0004
     * @tc.desc   test IsSafeBrowsingEnabledFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsSafeBrowsingEnabledFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitIsSafeBrowsingEnabledFalse", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsSafeBrowsingEnabledFalse", true, 2004, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
