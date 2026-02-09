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
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webJsunitTwo() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });


    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('componentLifeCycleTestOne beforeEach start');

    })

    /**
     * @tc.name   getLineNumberStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_076
     * @tc.desc   return the number of console message lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getLineNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let emitKey = 'emitOnConsoleTwo';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('getLineNumber', '45', 420, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey ('webcomponent', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   getSourceIdStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_077
     * @tc.desc   return the source url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getSourceIdStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let emitKey = 'getSourceIdStatic';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('getSourceId', 'resource://rawfile/index.html', 422, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey ('webcomponent', 10, '');
      await Utils.msSleep(6000);
      done();
    })


  })
}
