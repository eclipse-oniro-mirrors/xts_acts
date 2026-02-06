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
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let emitKey = ''
let testAbilityContext: common.UIAbilityContext;


export default function webViewOnSslErrorEvent() {

  describe('webViewOnSslErrorEvent', () => {
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
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.websitecertificatefourtest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')

    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_100
    * @tc.name       : testOnSslErrorEvent0100
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('OnSslErrorEvent0100', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('OnSslErrorEvent0100', 2, 400, done);
        await Utils.msSleep(4000);
        inspector.sendEventByKey('webViewOnSslErrorEvent', 10, '');
        await Utils.msSleep(10000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_200
    * @tc.name       : testOnSslErrorEvent0200
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('OnSslErrorEvent0200', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('OnSslErrorEvent0200', 2, 401, done);
        await Utils.msSleep(4000);
        inspector.sendEventByKey('webViewOnSslErrorEvent', 10, '');
        await Utils.msSleep(10000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_300
    * @tc.name       : testOnSslErrorEvent0300
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('OnSslErrorEvent0300', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('OnSslErrorEvent0300', true, 402, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewOnSslErrorEvent', 10, '');
        await Utils.msSleep(10000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_ONSSLERROREVENT_400
    * @tc.name       : testOnSslErrorEvent0400
    * @tc.desc       : test WebOnSslErrorEvent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnSslErrorEvent_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('OnSslErrorEvent0400', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('OnSslErrorEvent0400', 2, 403, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewOnSslErrorEvent', 10, '');
        await Utils.msSleep(10000);
        done()
      })
  })
}
