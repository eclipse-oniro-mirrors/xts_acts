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
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function ActsWebRunJavaScriptOnDocumentEndTest() {
  describe('ActsWebRunJavaScriptOnDocumentEndTest', (): void => {
    beforeAll(async (): Promise<void> => {
        console.log(' App start')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0001
    * @tc.name       : testWebRunJavaScriptOnDocumentEndStatic001
    * @tc.desc       : test runJavaScriptOnDocumentEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testWebRunJavaScriptOnDocumentEndStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebRunJavaScriptOnDocumentEnd001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebRunJavaScriptOnDocumentEnd001', '"runJavaScriptOnDocumentEnd"', 2025022101, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
      await Utils.msSleep(10000);
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0001
    * @tc.name       : testWebRunJavaScriptOnDocumentEndStatic001
    * @tc.desc       : test runJavaScriptOnDocumentEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

  })
}

