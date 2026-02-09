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

export default function webTwoJsunit() {

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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacejumpbetweenwebenhancedtestthreetest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error: Error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testBackOrForward_static_002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0200
     * @tc.desc   test backOrForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBackOrForward_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testBackOrForward002", 10)
      Utils.registerEvent("testBackOrForward002", "index", 37006, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(10000);
      done()

    /**
     * @tc.name   testBackOrForward_static_003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0300
     * @tc.desc   test backOrForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBackOrForward_static_003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testBackOrForward003", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testBackOrForward003", "index", 37007, done);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(10000);
      done()
      })

    /**
     * @tc.name   testBackOrForward_static_004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0400
     * @tc.desc   test backOrForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBackOrForward_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
	  await Utils.msSleep(2000);
      Utils.emitEvent("testBackOrForward004", 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testBackOrForward004", "index", 37008, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(10000);
      done()
      })
    })
  })
}
