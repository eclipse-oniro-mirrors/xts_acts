/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitFetchCookieSync";

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.forwardbackwardcachefourtest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })
    
    /**
     * @tc.name   testConfigCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1700
     * @tc.desc   test for ConfigCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConfigCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitConfigCookieCallback";
      await Utils.msSleep(3000);
      Utils.emitEvent(emitKey,10)
      Utils.registerEvent("testConfigCookieCallback","a=f",134,done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1400
     * @tc.desc   test for FetchCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFetchCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey="emitFetchCookieCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testFetchCookieSync","a=c",128,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testFetchCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1500
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFetchCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitFetchCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testFetchCookiePromise","a=d",130,done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })
    /**
     * @tc.name   testConfigCookieSyncStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1600
     * @tc.desc   test for ConfigCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConfigCookieSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      emitKey="emitConfigCookieSync";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testConfigCookieSync","a=e",132,done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(3000);
      done();
    })
    /**
     * @tc.name   testConfigCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1800
     * @tc.desc   test for ConfigCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConfigCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      emitKey="emitConfigCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testConfigCookiePromise","a=g",136,done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })
    /**
     * @tc.name   testClearAllCookiesSyncStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1900
     * @tc.desc   test for ClearAllCookiesSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearAllCookiesSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearAllCookiesSync";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearAllCookiesSync","",138,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClearAllCookiesCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2000
     * @tc.desc   test for ClearAllCookiesCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearAllCookiesCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearAllCookiesCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearAllCookiesCallback","",140,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClearAllCookiesPromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2100
     * @tc.desc   test for ClearAllCookiesPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearAllCookiesPromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearAllCookiesPromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testClearAllCookiesPromise","",142,done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })
    /**
     * @tc.name   testClearSessionCookieSyncStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2200
     * @tc.desc   test for ClearSessionCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearSessionCookieSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearSessionCookieSync";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearSessionCookieSync","",144,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testClearSessionCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2300
     * @tc.desc   test for ClearSessionCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearSessionCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearSessionCookieCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearSessionCookieCallback","",146,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })
    /**
     * @tc.name   testClearSessionCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2400
     * @tc.desc   test for ClearSessionCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearSessionCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey="emitClearSessionCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearSessionCookiePromise","",148,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })
  })
}
