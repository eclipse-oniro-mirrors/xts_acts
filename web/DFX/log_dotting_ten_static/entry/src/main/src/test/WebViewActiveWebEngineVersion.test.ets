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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
export default function WebEngineVersion() {

  describe('WebEngineVersion', () => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.com.open.harmony.logdottingtentest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
    * @tc.name        testActiveWebEngineVersionStatic001
    * @tc.number      SUB_WEB_ACTIVE_WEB_ENGINE_VERSION_001
    * @tc.desc        test ArkWebEngineVersion
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testActiveWebEngineVersionStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("emitActiveWebEngineVersion001", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("testActiveWebEngineVersion001", 0, 2026030911, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('ArkWebEngineVersion', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testActiveWebEngineVersionStatic002
    * @tc.number      SUB_WEB_ACTIVE_WEB_ENGINE_VERSION_002
    * @tc.desc        test ArkWebEngineVersion
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testActiveWebEngineVersionStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("emitActiveWebEngineVersion002", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("testActiveWebEngineVersion002", 1, 2026030922, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('ArkWebEngineVersion', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testActiveWebEngineVersionStatic003
    * @tc.number      SUB_WEB_ACTIVE_WEB_ENGINE_VERSION_003
    * @tc.desc        test ArkWebEngineVersion
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testActiveWebEngineVersionStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("emitActiveWebEngineVersion003", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("testActiveWebEngineVersion003", 2, 2026030933, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('ArkWebEngineVersion', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        testActiveWebEngineVersionStatic004
    * @tc.number      SUB_WEB_ACTIVE_WEB_ENGINE_VERSION_004
    * @tc.desc        test ArkWebEngineVersion
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('testActiveWebEngineVersionStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("emitActiveWebEngineVersion004", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("testActiveWebEngineVersion004", 99999, 2026030934, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('ArkWebEngineVersion', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
