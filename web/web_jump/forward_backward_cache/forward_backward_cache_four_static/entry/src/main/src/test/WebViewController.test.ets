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
     * @tc.name   testFetchCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1500
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey="emitFetchCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookiePromise","a=d",130,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testFetchCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1400
     * @tc.desc   test for FetchCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookieCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookieSync","a=c",111,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testConfigCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1700
     * @tc.desc   test for ConfigCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey="emitConfigCookieCallback";
      await Utils.msSleep(1000);
      Utils.emitEvent(emitKey,10)
      Utils.registerEvent("testConfigCookieCallback","a=f",134,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSaveCookieAsyncStatic002
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0200
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveCookieAsyncStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent('testSaveCookieAsync002', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testSaveCookieAsync002', 'done', 134761, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testSaveCookieAsyncStatic001
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0100
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveCookieAsyncStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="testSaveCookieAsync001";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testSaveCookieAsync001', 'done', 134760, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testFetchCookieIncognitoErrorStatic008
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0800
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoErrorStatic008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieIncognitoError008", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieIncognitoError008', 'no error happened', 123217, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic001
     * @tc.number SUB_ACE_BASIC_ETS_API_1200
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookiePromise001";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitFetchCookiePromise001","17100002URL error. No valid cookie found for the specified URL.",131,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic002
     * @tc.number SUB_ACE_BASIC_ETS_API_1100
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookiePromise002";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitFetchCookiePromise002","a=d",132,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      testWebViewWindowFeatures00900
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done()
      })
  })
}
