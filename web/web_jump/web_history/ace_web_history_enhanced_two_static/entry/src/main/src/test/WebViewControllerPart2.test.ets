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
export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {


    /**
     * @tc.name   testClearHistoryStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARHISTORY_0100
     * @tc.desc   test clearHistory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearHistoryStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testClearHistory001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testClearHistory001", false, 37000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
        await Utils.msSleep(4000);
        done();
      })

  })
}
