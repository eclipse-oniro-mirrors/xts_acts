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

export default function webJsunit() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('componentLifeCycleTestOne beforeEach start');
    })



    /**
     * @tc.name   javaScriptAccessStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_060
     * @tc.desc   test runJavaScriptAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('javaScriptAccessStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let emitKey = 'emitJavaScriptAccess';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('javaScriptAccess', '1', 88, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_070
     * @tc.desc   test runJavaScriptAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(6000);
        done();
      })


  })
}
