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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webJavaScriptOnDocumentStartTest() {
  describe('WebJavaScriptOnDocumentStartTest', (): void => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.injectjavascriptonetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /*
    * @tc.number     : SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0100
    * @tc.name       : testJavaScriptOnDocumentStartStatic001
    * @tc.desc       : test javaScriptOnDocumentStart
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJavaScriptOnDocumentStartStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testJavaScriptOnDocumentStart001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testJavaScriptOnDocumentStart001", '"Red"', 4500, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentStartTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /*
   * @tc.number     : SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0200
   * @tc.name       : testJavaScriptOnDocumentStartStatic002
   * @tc.desc       : test javaScriptOnDocumentStart
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentStartTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
