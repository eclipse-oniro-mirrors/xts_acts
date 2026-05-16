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
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webOnHttpErrorReceiveTest() {
  describe('WebOnHttpErrorReceiveTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceloadstatusenhancedtesttwo.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0200
    * @tc.name        : testOnHttpErrorReceiveStatic002
    * @tc.desc        : test onHttpErrorReceive not callback when returned error code is 204
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testOnHttpErrorReceiveStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testOnHttpErrorReceive002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testOnHttpErrorReceive002', 0, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0300
    * @tc.name        : testOnHttpErrorReceiveStatic003
    * @tc.desc        : test onHttpErrorReceive not callback when returned error code is 301
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testOnHttpErrorReceiveStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testOnHttpErrorReceive003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testOnHttpErrorReceive003', 0, 60602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0400
    * @tc.name        : testOnHttpErrorReceiveStatic004
    * @tc.desc        : test onHttpErrorReceive callback when returned error code is 500
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testOnHttpErrorReceiveStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testOnHttpErrorReceive004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testOnHttpErrorReceive004', 404, 60604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
      await Utils.msSleep(8000);
      done()
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0500
    * @tc.name        : testOnHttpErrorReceiveStatic005
    * @tc.desc        : test onHttpErrorReceive callback when returned error code is 500
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })

  })
}