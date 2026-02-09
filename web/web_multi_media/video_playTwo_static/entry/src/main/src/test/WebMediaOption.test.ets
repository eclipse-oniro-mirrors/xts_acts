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
import Utils from './Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
export default function webMediaOption(){
  describe('WebMediaOptionTest', () => {
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
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.videoplaybackTwotest.static')
      await Utils.msSleep(5000);
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testMediaOptionsStatic001
     * @tc.number SUB_WEB_MEDIAOPTIONS_0100
     * @tc.desc   test mediaOptions single instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMediaOptionsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent('emitMediaOptions001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testMediaOptions001', true, 415, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewMediaOptionTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SUB_WEB_MEDIAOPTIONS_0200
     * @tc.desc   test mediaOptions single instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webViewMediaOptionTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
