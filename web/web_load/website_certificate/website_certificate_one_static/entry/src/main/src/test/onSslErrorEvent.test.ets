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
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
let driver: Driver = Driver.create();

let emitKey = ''
let testAbilityContext:common.UIAbilityContext;

export default function onCreateNativeMediaPlayer() {
  describe('onCreateNativeMediaPlayer', () => {
    beforeAll(async (): Promise<void> => {
      console.log('[App start')
    })


    /**
     * @tc.name   testonSslErrorEventStatic001
     * @tc.number testonSslErrorEventStatic001
     * @tc.desc   testonSslErrorEventStatic001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testonSslErrorEventStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('onCreateNativeMediaPlayer', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testonSslErrorEvent001', 1, 2025321, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebonSslErrorEventButton', 10, '');
      await Utils.msSleep(5000);
      Utils.emitEvent('emitonSwitchNextPage1', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('WebonSslErrorEventButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })
  })
}
