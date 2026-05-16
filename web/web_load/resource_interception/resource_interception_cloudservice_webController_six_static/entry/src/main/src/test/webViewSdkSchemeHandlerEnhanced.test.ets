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
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

// @ts-nocheck
let emitKey = ''

export default function ActsAceWebViewSdkSchemeHandlerEnhanced() {
  describe('ActsAceWebViewSdkSchemeHandlerEnhanced', (): void => {

    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.resourceinterceptioncloudservicesixtest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testWebViewSdkSchemeHandler_isEof_false_Static
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_isEof_false_API_0001
     * @tc.desc   test SdkSchemeHandler_isEof_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_isEof_false_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = 'emitWebViewSdkSchemeHandler_isEof_false'
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewSdkSchemeHandler_isEof_false', true, 1537, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
      await Utils.msSleep(6000);
      done();
    })

  })
}
