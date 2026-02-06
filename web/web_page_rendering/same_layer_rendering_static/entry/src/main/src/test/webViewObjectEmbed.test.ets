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

export default function webViewObjectEmbed() {
  describe('webViewObjectEmbed', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testWebViewObjectEmbed_static_01
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_API_0001
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewObjectEmbed_static_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewObjectEmbed01', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewObjectEmbed01', 'success', 8014, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewObjectEmbedButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testWebViewObjectEmbed_static_04
     * @tc.number SUB_ACE_WEB_OBJECTEMBED_API_0004
     * @tc.desc   test objectEmbed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewObjectEmbed_static_04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewObjectEmbed04', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitWebViewObjectEmbed04', 'success', 8017, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewObjectEmbedButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
