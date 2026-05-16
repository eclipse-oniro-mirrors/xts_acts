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
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function webJsunit() {

  describe('ActsAceWebDevTest', () => {
    beforeAll(async (): Promise<void> => {

    });

    /**
     * @tc.name   StoreWebArchiveStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_029
     * @tc.desc   test StoreWebArchive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StoreWebArchiveStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitStoreWebArchive", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("StoreWebArchive", true, 29, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(2000);
        done();
    })

    /**
     * @tc.name   StoreWebArchiveStatic02
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_029_2
     * @tc.desc   test StoreWebArchive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StoreWebArchiveStatic02',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitStoreWebArchive02", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("StoreWebArchive02", false, 202603183, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   StoreWebArchiveStatic03
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_029_3
     * @tc.desc   test StoreWebArchive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StoreWebArchiveStatic03',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitStoreWebArchive03", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("StoreWebArchive03", false, 202603184, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitonSwitchNextStaticPage
     * @tc.number emitonSwitchNextStaticPage003
     * @tc.desc   test emitonSwitchNextStaticPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextStaticPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(5000)
        done();
      })
  })
}
