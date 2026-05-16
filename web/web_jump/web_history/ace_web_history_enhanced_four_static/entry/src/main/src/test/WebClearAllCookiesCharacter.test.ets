/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;


export default function webClearAllCookiesCharacter() {

  describe('webClearAllCookiesCharacterTestSuite', () => {

      beforeAll(async (): Promise<void> => {
        console.log('App start')
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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacewebhistoryenhancedfourtest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('webViewController beforeEach start');
      })

    /**
     * @tc.name   testClearAllCookiesCharacterCallbackStatic
     * @tc.number SUB_WEB_CLEARALLCOOKIES_CHARACTER_0100
     * @tc.desc   test clearAllCookies callback \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesCharacterCallbackStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClearAllCookiesCharacterCallback', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClearAllCookiesCharacterCallback', 'fail', 133360, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webClearAllCookiesCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClearAllCookiesCharacterPromiseStatic
     * @tc.number SUB_WEB_CLEARALLCOOKIES_CHARACTER_0200
     * @tc.desc   test clearAllCookies promise \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesCharacterPromiseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitClearAllCookiesCharacterPromise', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClearAllCookiesCharacterPromise', 'success', 133370, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webClearAllCookiesCharacterButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name       : SwitchNextPageStatic
     * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_03
     * @tc.desc       : test PAGE_REDIRECT
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webClearAllCookiesCharacterButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
