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
import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;

let emitKey = ""

export default function ActsAceWebViewOnNavigationEntryCommitted() {

  describe('ActsAceWebViewOnNavigationEntryCommitted', () => {

    beforeAll(async (): Promise<void> => {
	  await Utils.msSleep(3000);
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /*
     *@tc.number SUB_ACE_WEB_ONNAVIAGTIONENTRYCOMMITTED_API_0001
     *@tc.name testWebViewOnNavigationEntryCommittedStatic01
     *@tc.desc test onNavigationEntryCommitted
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 3
     */
    it('testWebViewOnNavigationEntryCommittedStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
	  await Utils.msSleep(3000);
      emitKey = "emitWebViewOnNavigationEntryCommitted01"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewOnNavigationEntryCommitted01", 'success', 8009, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewOnNavigationEntryCommittedButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
  })
}
