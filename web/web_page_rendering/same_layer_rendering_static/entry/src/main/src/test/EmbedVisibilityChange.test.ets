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
let testAbilityContext:common.UIAbilityContext;

export default function EmbedVisibilityChange() {
  describe('EmbedVisibilityChange', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError| null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.samelayerrenderingtest.static')
      await Utils.msSleep(3000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   emitEmbedVisibilityChange_static_001
     * @tc.number SUB_WEB_EMBEDVISIBILITYCHANGE_0100
     * @tc.desc   test EmbedVisibilityChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitEmbedVisibilityChange_static_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('emitEmbedVisibilityChange001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitEmbedVisibilityChange001', true, 16571657, done);
      await Utils.msSleep(8000);
      inspector.sendEventByKey('WebViewEmbedVisibilityChangeButton', 10, '');
      await Utils.msSleep(10000);
      Utils.emitEvent('emitonSwitchNextPage1', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('WebViewEmbedVisibilityChangeButton', 10, '');
      await Utils.msSleep(1000);
      done();
    })
  })
}
