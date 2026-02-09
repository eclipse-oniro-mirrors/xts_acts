/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webOnBeforeUnload() {
  describe('WebOnBeforeUnloadTest', (): void => {
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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacejumpbetweenwebenhancedtesttwo.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });

    /**
     * @tc.name   testOnBeforeUnloadStatic001
     * @tc.number SUB_WEB_ONBEFOREUNLOAD_0100
     * @tc.desc   test OnBeforeUnload when refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnBeforeUnloadStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnBeforeUnload001", 10)
      await Utils.msSleep(5000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('onBeforeUnloadWebView'));
      button?.click();
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnBeforeUnload001", "resource://rawfile/onBeforeUnloadTest.html", 60402, done);
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnBeforeUnload001", true, 60403, done);
      inspector.sendEventByKey('webOnBeforeUnload', 10, '');
      await Utils.msSleep(3000);
      done()
    })

    /**
     * @tc.name   testOnBeforeUnloadStatic002
     * @tc.number SUB_WEB_ONBEFOREUNLOAD_0200
     * @tc.desc   test OnBeforeUnload when loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnBeforeUnloadStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitOnBeforeUnload002", 10)
      await Utils.msSleep(5000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('onBeforeUnloadWebView'));
      button?.click();
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnBeforeUnload002", "resource://rawfile/onBeforeUnloadTest.html", 60404, done);
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnBeforeUnload002", true, 60405, done);
      inspector.sendEventByKey('webOnBeforeUnload', 10, '');
      await Utils.msSleep(3000);
      done()
    })
  })
}