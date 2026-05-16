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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''

export default function WebEumClassTest() {
  describe('WebEumClassTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testWebSecurityLevelStatic0001
     * @tc.number SUB_WEB_SecurityLevel_00001
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevelStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebSecurityLevel0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebSecurityLevel0001', 0, 1, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebSecurityLevelStatic0002
     * @tc.number SUB_WEB_SecurityLevel_0002
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevelStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebSecurityLevel0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebSecurityLevel0002', 1, 2, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebSecurityLevelStatic0003
     * @tc.number SUB_WEB_SecurityLevel_0003
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevelStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebSecurityLevel0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebSecurityLevel0003', 2, 3, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebSecurityLevelStatic0004
     * @tc.number SUB_WEB_SecurityLevel_0004
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSecurityLevelStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebSecurityLevel0004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebSecurityLevel0004', 3, 4, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebNavigationTypeStatic0001
     * @tc.number SUB_WEB_WebNavigationType_0001
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationTypeStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebNavigationType0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebNavigationType0001', 0, 5, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebNavigationTypeStatic0002
     * @tc.number SUB_WEB_WebNavigationType_0002
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationTypeStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebNavigationType0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebNavigationType0002', 1, 6, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebNavigationTypeStatic0003
     * @tc.number SUB_WEB_WebNavigationType_0003
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationTypeStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebNavigationType0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebNavigationType0003', 2, 7, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebNavigationTypeStatic0004
     * @tc.number SUB_WEB_WebNavigationType_0004
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationTypeStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebNavigationType0004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebNavigationType0004', 4, 8, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebNavigationTypeStatic0005
     * @tc.number SUB_WEB_WebNavigationType_0005
     * @tc.desc   test WebNavigationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebNavigationTypeStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebNavigationType0005', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebNavigationType0005', 5, 9, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebThreatTypeStatic0001
     * @tc.number SUB_WEB_ThreatType_0001
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0001', 0, 101, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebThreatTypeStatic0002
     * @tc.number SUB_WEB_ThreatType_0002
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0002', 1, 11, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebThreatTypeStatic0003
     * @tc.number SUB_WEB_ThreatType_0003
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0003', 2, 12, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebThreatTypeStatic0004
     * @tc.number SUB_WEB_ThreatType_0004
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0004', 3, 13, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   testWebThreatTypeStatic0005
     * @tc.number SUB_WEB_ThreatType_0005
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0005', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0005', 4, 14, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testWebThreatTypeStatic0006
     * @tc.number SUB_WEB_ThreatType_00061
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebThreatTypeStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebThreatType0006', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebThreatType0006', 5, 15, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testViewportFitStatic0001
     * @tc.number SUB_WEB_ThreatType_00062
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testViewportFitStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testViewportFit0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testViewportFit0001', 0, 16, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testViewportFitStatic0002
     * @tc.number SUB_WEB_ThreatType_00063
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testViewportFitStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testViewportFit0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testViewportFit0002', 2, 17, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testViewportFitStatic0003
     * @tc.number SUB_WEB_ThreatType_00064
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testViewportFitStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testViewportFit0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testViewportFit0003', 1, 18, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPdfLoadResultStatic0001
     * @tc.number SUB_WEB_ThreatType_00065
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPdfLoadResultStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPdfLoadResult0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPdfLoadResult0001', 0, 19, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPdfLoadResultStatic0002
     * @tc.number SUB_WEB_ThreatType_00066
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPdfLoadResultStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPdfLoadResult0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPdfLoadResult0002', 1, 20, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPdfLoadResultStatic0003
     * @tc.number SUB_WEB_ThreatType_00067
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPdfLoadResultStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPdfLoadResult0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPdfLoadResult0003', 2, 21, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPdfLoadResultStatic0004
     * @tc.number SUB_WEB_ThreatType_00068
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPdfLoadResultStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPdfLoadResult0004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPdfLoadResult0004', 3, 22, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPdfLoadResultStatic0005
     * @tc.number SUB_WEB_ThreatType_00069
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPdfLoadResultStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPdfLoadResult0005', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPdfLoadResult0005', 4, 23, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPinVerifyResultStatic0001
     * @tc.number SUB_WEB_ThreatType_00060
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPinVerifyResultStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPinVerifyResult0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPinVerifyResult0001', 0, 24, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testPinVerifyResultStatic0002
     * @tc.number SUB_WEB_ThreatType_000611
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPinVerifyResultStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPinVerifyResult0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testPinVerifyResult0002', 1, 25, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testCredentialTypeStatic0001
     * @tc.number SUB_WEB_ThreatType_000612
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCredentialTypeStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testCredentialType0001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testCredentialType0001', 2, 26, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testCredentialTypeStatic0002
     * @tc.number SUB_WEB_ThreatType_000613
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCredentialTypeStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testCredentialType0002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testCredentialType0002', 3, 27, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testCredentialTypeStatic0003
     * @tc.number SUB_WEB_ThreatType_000614
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCredentialTypeStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testCredentialType0003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testCredentialType0003', 4, 28, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   testProtectedResourceTypeStatic
     * @tc.number SUB_WEB_ThreatType_000615
     * @tc.desc   test ThreatType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProtectedResourceTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testProtectedResourceType', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testProtectedResourceType', 'TYPE_MIDI_SYSEX', 29, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
    * @tc.name        emitOnSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_2003871
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}
