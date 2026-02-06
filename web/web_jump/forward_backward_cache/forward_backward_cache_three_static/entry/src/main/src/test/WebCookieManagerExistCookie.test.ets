/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector';


let testAbilityContext: common.UIAbilityContext;
let emitKey = "";

export default function webCookieManagerExistCookie() {

  describe('WebCookieManagerExistCookie', () => {

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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.forwardbackwardcachethreetest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name        testExistCookie002
     * @tc.number      SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0200
     * @tc.desc        test existCookie
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testExistCookie002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testExistCookie002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie002", true, 100302, done);
        await Utils.msSleep(4000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0300
    * @tc.name       : testExistCookie003
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie003", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie003", true, 100303, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0400
    * @tc.name       : testExistCookie004
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie004", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie004", true, 100304, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0500
    * @tc.name       : testExistCookie005
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie005", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie005", false, 100305, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0600
    * @tc.name       : testExistCookie006
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie006", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie006", false, 100306, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0700
    * @tc.name       : testExistCookie007
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie007", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie007", false, 100307, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0800
    * @tc.name       : testExistCookie008
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie008", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie008", false, 100308, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_0900
    * @tc.name       : testExistCookie009
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie009", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie009", false, 100309, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1000
    * @tc.name       : testExistCookie010
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie010", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie010", false, 100310, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1100
    * @tc.name       : testExistCookie011
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie011", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie011", false, 100311, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })


    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1200
    * @tc.name       : testExistCookie012
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie012", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie012", false, 100312, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1300
    * @tc.name       : testExistCookie013
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie013", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie013", false, 100313, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1400
    * @tc.name       : testExistCookie014
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie014", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie014", false, 100314, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1500
    * @tc.name       : testExistCookie015
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie015", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie015", false, 100315, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1600
    * @tc.name       : testExistCookie016
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie016", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie016", false, 100316, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1700
    * @tc.name       : testExistCookie017
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie017", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie017", false, 100317, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_EXISTCOOKIE_1800
    * @tc.name       : testExistCookie018
    * @tc.desc       : test existCookie
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testExistCookie018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testExistCookie018", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExistCookie018", false, 100318, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })


    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerExistCookieTestButton', 10, '');
        await Utils.msSleep(6000);
        done()
      })
  })
}
