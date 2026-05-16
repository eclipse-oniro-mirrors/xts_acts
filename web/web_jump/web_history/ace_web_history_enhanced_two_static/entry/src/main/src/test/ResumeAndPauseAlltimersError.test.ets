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
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;
export default function resumeAndPauseAlltimersError() {

  describe('resumeAndPauseAlltimersErrorTestSuite', () => {

    /**
     * @tc.name   testResumeAllTimersErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RESUMEALLTIMERS_0100
     * @tc.desc   test resumeAllTimers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeAllTimersErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResumeAllTimersErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResumeAllTimersErrorCode001", 17100001, 170083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('resumeAndPauseAlltimersErrorButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPauseAllTimersErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PAUSEALLTIMERS_0100
     * @tc.desc   test pauseAllTimers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPauseAllTimersErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPauseAllTimersErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testPauseAllTimersErrorCode001", 17100001, 180083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('resumeAndPauseAlltimersErrorButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })


  })
}
