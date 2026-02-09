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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{ BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;
export default function webMessagePortIsExtentionTypeTest() {

  describe('webMessagePortIsExtentionTypeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });

    /*
    * @tc.number      : SUB_WEB_WEBMESSAGEPORT_ISEXTENTIONTYPE_0100
    * @tc.name        : testIsExtentionTypeStatic001
    * @tc.desc        : test isExtentionType
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 3
    */
    it('testIsExtentionTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testIsExtentionType001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testIsExtentionType001', 401, 100100, done);
        await Utils.msSleep(4000);
        inspector.sendEventByKey('IsExtentionTypeButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

  })
}
