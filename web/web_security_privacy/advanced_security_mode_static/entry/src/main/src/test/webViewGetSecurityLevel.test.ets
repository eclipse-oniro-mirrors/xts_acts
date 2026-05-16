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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext: common.UIAbilityContext;
let emitKey = '';

export default function ActsAceWebViewGetSecurityLevel() {

  describe('ActsAceWebViewGetSecurityLevel', () => {

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
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsadvancedsecuritymodetest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });


    /**
     * @tc.name   testWebViewGetSecurityLevelNoneStatic
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0001
     * @tc.desc   test getSecurityLevel NONE 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewGetSecurityLevelNoneStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewGetSecurityLevel01'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000)
        Utils.registerEvent('testWebViewGetSecurityLevelNone', 'success', 8008, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewGetSecurityLevelButton', 10, '');
        await Utils.msSleep(6000)
        done();
      })

    /**
     * @tc.name   testWebViewGetSecurityLevelNoneStatic02
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0002
     * @tc.desc   test getSecurityLevel 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetSecurityLevelNoneStatic02',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewGetSecurityLevel02'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000)
        Utils.registerEvent('testWebViewGetSecurityLevel02', 1, 80081, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewGetSecurityLevelButton', 10, '');
        await Utils.msSleep(6000)
        done();
      })

    /**
     * @tc.name   testWebViewGetSecurityLevelNoneStatic03
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0003
     * @tc.desc   test getSecurityLevel 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetSecurityLevelNoneStatic03',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewGetSecurityLevel03'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000)
        Utils.registerEvent('testWebViewGetSecurityLevel03', 2, 80082, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewGetSecurityLevelButton', 10, '');
        await Utils.msSleep(6000)
        done();
      })

    /**
     * @tc.name   testWebViewGetSecurityLevelNoneStatic04
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0004
     * @tc.desc   test getSecurityLevel 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetSecurityLevelNoneStatic04',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewGetSecurityLevel04'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000)
        Utils.registerEvent('testWebViewGetSecurityLevel04', 3, 80083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewGetSecurityLevelButton', 10, '');
        await Utils.msSleep(6000)
        done();
      })

    /**
     * @tc.name   testWebViewGetSecurityLevelNoneStatic05
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0005
     * @tc.desc   test getSecurityLevel 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetSecurityLevelNoneStatic05',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitWebViewGetSecurityLevel05'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000)
        Utils.registerEvent('testWebViewGetSecurityLevel05', "17100001", 80084, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewGetSecurityLevelButton', 10, '');
        await Utils.msSleep(6000)
        done();
      })
  })
}
