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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;

export default function webViewRegisterNativeEmbedRule() {
  describe('ActsAceRegisterNativeEmbedRule', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      try {
        let backEvent : events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent);
      } catch (err) {
        console.error('emit emitKey error:' + err);
      }
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testWebViewRegisterNativeEmbedRule_static_001
     * @tc.number SUB_ACE_WEB_REGISTERNATIVEEMBEDRULE_API_0500
     * @tc.desc   test registerNativeEmbedRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewRegisterNativeEmbedRule_static_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewRegisterNativeEmbedRule', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewRegisterNativeEmbedRule', true, 10003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewRegisterNativeEmbedRule', 10, '');
      await Utils.msSleep(8000);
      Utils.emitEvent('emitonSwitchNextPage2', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webViewRegisterNativeEmbedRule', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
