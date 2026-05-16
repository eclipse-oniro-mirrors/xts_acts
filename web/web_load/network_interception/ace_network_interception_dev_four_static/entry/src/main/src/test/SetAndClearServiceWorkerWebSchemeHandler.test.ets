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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function SetAndClearServiceWorkerWebSchemeHandler() {
  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /*
    * @tc.number     : SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0100
    * @tc.name       : testSetAndClearServiceWorkerWebSchemeHandler0100
    * @tc.desc       : test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('setAndClearServiceWorkerWebSchemeHandler0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0100", 10)
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0100", "GET", 8854, done);
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0100", false, 8860, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARSERVICEWORKERWEBSCHEMEHANDLER_0200
    * @tc.name       : testSetAndClearServiceWorkerWebSchemeHandler0200
    * @tc.desc       : test setAndClearServiceWorkerWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('setAndClearServiceWorkerWebSchemeHandler0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("setAndClearServiceWorkerWebSchemeHandler0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("setAndClearServiceWorkerWebSchemeHandler0200", "lock", 8862, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setAndClearServiceWorkerWebSchemeHandler', 10, '');
      await Utils.msSleep(6000);
      done();
    })


  })
}