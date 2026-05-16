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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webInitTest() {
  describe('WebInitTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError|null) : void => {
        if (err != null ) {

          console.log('-----' + err.code)
        }

        console.log('BusinessError  end')
      })
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.webPageDocumentProcessing.test.static')
        .then(result => {
          console.info('Command executed successfully:', result);
        })
        .catch(err => {
          console.error('Error executing command:', err);
        });
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testSetPrintBackgroundOneStatic
     * @tc.number SUB_WEB_SETPRINRBACKGROUNDONE_STATIC
     * @tc.desc   test deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundOneStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
	  await Utils.msSleep(4000);
      Utils.emitEvent('emitSetPrintBackgroundOne', 10)
	  await Utils.msSleep(4000);
      Utils.registerEvent('testSetPrintBackgroundOne', false, 214, done);
	  await Utils.msSleep(4000);
	  inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(4000);
      done();
      })

    /**
     * @tc.name   testSetPrintBackgroundOneStatic002
     * @tc.number SUB_WEB_SETPRINRBACKGROUNDONE_STATIC_002
     * @tc.desc   test deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundOneStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent('emitSetPrintBackgroundStatic002', 10)
      await Utils.msSleep(4000);
      Utils.registerEvent('testSetPrintBackgroundOneStatic002', true, 202603251, done);
      await Utils.msSleep(4000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testSetPrintBackgroundOneStatic03
     * @tc.number SUB_WEB_SETPRINRBACKGROUNDONE_STATIC_003
     * @tc.desc   test deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundOneStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent('emitSetPrintBackgroundStatic003', 10)
      await Utils.msSleep(4000);
      Utils.registerEvent('testSetPrintBackgroundOneStatic003', "17100001", 202603252, done);
      await Utils.msSleep(4000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /**
     * @tc.name   testOptimizeParserBudgetStatic
     * @tc.number SUB_WEB_OPTIMIZEPARSERBUDGET_STATIC_001
     * @tc.desc   test OptimizeParserBudget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOptimizeParserBudgetStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent('emitOptimizeParserBudgetStatic', 10)
      await Utils.msSleep(4000);
      Utils.registerEvent('testOptimizeParserBudgetStatic', true, 133826326, done);
      await Utils.msSleep(4000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /**
     * @tc.name   testWebViewNotRespondingReasonStatic001
     * @tc.number SUB_WEB_NAVIGATION_COMMIT_TIMEOUT_0200
     * @tc.desc   test RenderProcessNotRespondingReason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewNotRespondingReasonStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent('emitWebViewNotRespondingReason_INPUT_TIMEOUT', 10)
      await Utils.msSleep(4000);
      Utils.registerEvent('testWebViewNotRespondingReasonStatic001', 0, 133826325, done);
      await Utils.msSleep(4000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(12000);
      Utils.emitEvent("emitonSwitchNextPage", 10)
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })
  })
}
