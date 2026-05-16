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

export default function webViewControllerJsunit2() {
  describe('ActsAceWebDevWebViewControllerTest2',  () => {
    beforeAll(async (): Promise<void> => {
      try {
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
     * @tc.name   emitWebBypassVsyncCondition001
     * @tc.number testBypassVsyncCondition001
     * @tc.desc   testBypassVsyncCondition001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebBypassVsyncCondition001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey = 'emitWebBypassVsyncCondition001';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitWebBypassVsyncCondition001", 1, 20251209, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(3000);
      done();
    });

    /**
     * @tc.name   testSetScrollbarModeStatic002
     * @tc.number testSetScrollbarMode0002
     * @tc.desc   testSetScrollbarMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollbarModeStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey = 'emitSetScrollbarMode002';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("emitSetScrollbarMode002", 0, 202512091, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    });

    /**
     * @tc.name   emitSetSocketIdleTimeoutStatic001
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0001
     * @tc.desc   test setSocketIdleTimeout 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetSocketIdleTimeoutStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey = 'emitSetSocketIdleTimeout001';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("emitSetSocketIdleTimeout001", 'success', 1749101, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    });

    /**
     * @tc.name   testClearSessionCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2400
     * @tc.desc   test for ClearSessionCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSessionCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitClearSessionCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearSessionCookiePromise","",148,done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testClearSessionCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2300
     * @tc.desc   test for ClearSessionCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSessionCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
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
     * @tc.name   testClearSessionCookieSyncStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2200
     * @tc.desc   test for ClearSessionCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSessionCookieSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitClearSessionCookieSync";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testClearSessionCookieSync","",144,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testClearAllCookiesPromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2100
     * @tc.desc   test for ClearAllCookiesPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesPromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitClearAllCookiesPromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testClearAllCookiesPromise","",142,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testClearAllCookiesCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_2000
     * @tc.desc   test for ClearAllCookiesCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitClearAllCookiesCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearAllCookiesCallback","",140,done);
      await Utils.msSleep(2000);
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
     * @tc.level  LEVEL0
     */
    it('testClearAllCookiesSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
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
     * @tc.name   testConfigCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1800
     * @tc.desc   test for ConfigCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitConfigCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testConfigCookiePromise","a=g",136,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSyncStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1600
     * @tc.desc   test for ConfigCookieSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitConfigCookieSync";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testConfigCookieSync","a=e",112,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testFetchCookieIncognitoErrorStatic007
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0700
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoErrorStatic007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieIncognitoError007", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieIncognitoError007', 'no error happened', 123216, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic003
     * @tc.number SUB_ACE_BASIC_ETS_API_1300
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookiePromise003";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitFetchCookiePromise003","17100002URL error. No valid cookie found for the specified URL.",133,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })
  })
}
