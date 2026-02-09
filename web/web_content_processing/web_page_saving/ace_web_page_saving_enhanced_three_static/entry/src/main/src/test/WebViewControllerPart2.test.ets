/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {
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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacewebpagesavingenhancedtestthree.static')
        await Utils.msSleep(5000)
        console.log('beforeAll end,%s', 'Succeed!')
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testSearchAllAsyncStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_0100
     * @tc.desc   test searchAllAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSearchAllAsyncStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('testSearchAllAsync001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testSearchAllAsync001', 2, 37012, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(10000);
      done();
    })

     /**
      * @tc.name   testSearchNextStatic001
      * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0100
      * @tc.desc   test searchNext
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('testSearchNextStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
       await Utils.msSleep(2000);
       Utils.emitEvent('testSearchNext001', 10)
       await Utils.msSleep(2000);
       Utils.registerEvent('testSearchNext002', true, 100080, done);
       await Utils.msSleep(2000);
       inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
       await Utils.msSleep(6000);
       done();
     })

    /**
     * @tc.name   testSetCustomUserAgentStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETCUSTOMUSERAGENT_0100
     * @tc.desc   test setCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetCustomUserAgentStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testSetCustomUserAgent001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testSetCustomUserAgent001', 'userAgent', 37019, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerPart2Button', 10, '');
      await Utils.msSleep(6000);
      done()
    })


  })
}
